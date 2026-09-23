package com.ol1n.audio_scanner

import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioFormat
import android.media.AudioManager
import android.media.AudioRecord
import android.media.MediaRecorder
import android.media.audiofx.AcousticEchoCanceler
import android.media.audiofx.AutomaticGainControl
import android.media.audiofx.NoiseSuppressor
import android.os.Handler
import android.os.Looper
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.atomic.AtomicBoolean

/// Raw PCM capture with the platform's signal conditioning switched off.
///
/// Android's counterpart of `.measurement` mode is the `UNPROCESSED` audio
/// source, and unlike iOS it is not guaranteed: the platform only *offers* it
/// where the OEM has implemented the path, and `PROPERTY_SUPPORT_AUDIO_SOURCE_UNPROCESSED`
/// is the one honest way to find out. On a phone without it the fallback is
/// `VOICE_RECOGNITION`, which turns off most of the voice-call processing but
/// not all — and the Dart side is told so, because a measurement taken through
/// AGC is a measurement of the AGC.
class AudioCapture(private val context: Context) : EventChannel.StreamHandler {
    private var record: AudioRecord? = null
    private var reader: Thread? = null
    private val running = AtomicBoolean(false)
    private var eventSink: EventChannel.EventSink? = null
    private val main = Handler(Looper.getMainLooper())

    private var unprocessedGranted = false
    private var effectsDisabled = true
    private var actualSampleRate = 0

    // MARK: - Session

    fun start(sampleRate: Int): Map<String, Any> {
        stop()

        val audioManager = context.getSystemService(Context.AUDIO_SERVICE) as AudioManager
        // The property is a string "true"/"false" — Android's API, not ours.
        unprocessedGranted = audioManager
            .getProperty(AudioManager.PROPERTY_SUPPORT_AUDIO_SOURCE_UNPROCESSED) == "true"
        val source = if (unprocessedGranted)
            MediaRecorder.AudioSource.UNPROCESSED
        else
            MediaRecorder.AudioSource.VOICE_RECOGNITION

        val channel = AudioFormat.CHANNEL_IN_MONO
        val encoding = AudioFormat.ENCODING_PCM_FLOAT
        val minBuffer = AudioRecord.getMinBufferSize(sampleRate, channel, encoding)
        if (minBuffer <= 0) {
            throw IllegalStateException("AudioRecord: sample rate $sampleRate not supported")
        }

        val rec = AudioRecord.Builder()
            .setAudioSource(source)
            .setAudioFormat(
                AudioFormat.Builder()
                    .setEncoding(encoding)
                    .setSampleRate(sampleRate)
                    .setChannelMask(channel)
                    .build()
            )
            // Four minimum buffers: enough slack that a GC pause on the Dart
            // side does not drop samples, small enough that the RTA still
            // feels live.
            .setBufferSizeInBytes(minBuffer * 4)
            .build()

        if (rec.state != AudioRecord.STATE_INITIALIZED) {
            rec.release()
            throw IllegalStateException("AudioRecord failed to initialise")
        }

        // Even on UNPROCESSED some OEM builds leave the effects attached. Ask
        // for each by name and turn it off; record whether every one obeyed.
        effectsDisabled = disableEffects(rec.audioSessionId)
        actualSampleRate = rec.sampleRate
        record = rec

        rec.startRecording()
        running.set(true)
        reader = Thread({ readLoop(rec) }, "audioscanner-capture").apply {
            priority = Thread.MAX_PRIORITY
            start()
        }

        return status()
    }

    fun stop() {
        running.set(false)
        reader?.join(500)
        reader = null
        record?.let {
            try {
                it.stop()
            } catch (_: IllegalStateException) {
            }
            it.release()
        }
        record = null
    }

    /// What the device is actually doing, as opposed to what was asked.
    fun status(): Map<String, Any> {
        val rec = record
        val device: AudioDeviceInfo? = rec?.routedDevice
        val bluetooth = device?.type == AudioDeviceInfo.TYPE_BLUETOOTH_SCO
            || device?.type == AudioDeviceInfo.TYPE_BLUETOOTH_A2DP
            || device?.type == AudioDeviceInfo.TYPE_BLE_HEADSET

        return mapOf(
            "sampleRate" to (if (actualSampleRate > 0) actualSampleRate else 48000).toDouble(),
            // Dart's "measurementMode" is iOS vocabulary; here it means the
            // UNPROCESSED source was granted, which is the same promise.
            "measurementMode" to unprocessedGranted,
            "processingDisabled" to (unprocessedGranted && effectsDisabled),
            "route" to (device?.productName?.toString() ?: "built-in microphone"),
            "isBluetooth" to bluetooth,
        )
    }

    private fun disableEffects(sessionId: Int): Boolean {
        var allOff = true
        if (AutomaticGainControl.isAvailable()) {
            AutomaticGainControl.create(sessionId)?.let {
                it.enabled = false
                if (it.enabled) allOff = false
            }
        }
        if (NoiseSuppressor.isAvailable()) {
            NoiseSuppressor.create(sessionId)?.let {
                it.enabled = false
                if (it.enabled) allOff = false
            }
        }
        if (AcousticEchoCanceler.isAvailable()) {
            AcousticEchoCanceler.create(sessionId)?.let {
                it.enabled = false
                if (it.enabled) allOff = false
            }
        }
        return allOff
    }

    // MARK: - Delivery

    private fun readLoop(rec: AudioRecord) {
        val buffer = FloatArray(2048)
        while (running.get()) {
            val n = rec.read(buffer, 0, buffer.size, AudioRecord.READ_BLOCKING)
            if (n <= 0) continue
            val sink = eventSink ?: continue
            val chunk = buffer.copyOf(n)
            // Flutter's standard codec maps FloatArray to Float32List directly.
            main.post { sink.success(chunk) }
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }

    // MARK: - Flutter plumbing

    fun register(messenger: BinaryMessenger, permissions: PermissionBridge) {
        EventChannel(messenger, "audioscanner/capture/pcm").setStreamHandler(this)
        MethodChannel(messenger, "audioscanner/capture").setMethodCallHandler { call, result ->
            when (call.method) {
                "requestPermission" ->
                    permissions.request(android.Manifest.permission.RECORD_AUDIO) { result.success(it) }
                "start" -> {
                    val rate = (call.argument<Number>("sampleRate") ?: 48000).toInt()
                    try {
                        result.success(start(rate))
                    } catch (e: Exception) {
                        result.error("start_failed", e.message, null)
                    }
                }
                "stop" -> {
                    stop(); result.success(null)
                }
                "status" -> result.success(status())
                else -> result.notImplemented()
            }
        }
    }
}
