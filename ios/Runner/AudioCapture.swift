import AVFoundation
import Flutter

/// Raw PCM capture with every piece of iOS signal conditioning switched off.
///
/// The whole app rests on this file. iOS will happily hand over microphone
/// audio that has been through automatic gain control, noise suppression and a
/// voice-tuned frequency correction — all of which make a room measurement
/// measure the processing instead of the room. `.measurement` mode is the only
/// supported way to ask for none of it, and the flags it does not cover are
/// asked for separately below.
final class AudioCapture: NSObject {
    private let engine = AVAudioEngine()
    private var eventSink: FlutterEventSink?
    private var converter: AVAudioConverter?
    private var targetFormat: AVAudioFormat?
    private var running = false

    // MARK: - Session

    /// Configures the audio session for measurement and starts the tap.
    /// Returns what was actually granted, which the Dart side surfaces to the
    /// user rather than assuming success.
    func start(sampleRate: Double) throws -> [String: Any] {
        let session = AVAudioSession.sharedInstance()

        // .measurement is the mode that disables the input EQ and AGC. Mixing
        // .record with it (rather than .playAndRecord) keeps the output path
        // out of the way — the sweep comes from the speakers being measured,
        // not from the phone.
        try session.setCategory(.playAndRecord,
                                mode: .measurement,
                                options: [.defaultToSpeaker])
        try session.setPreferredSampleRate(sampleRate)
        try session.setPreferredInputNumberOfChannels(1)
        // Small buffers keep the RTA responsive; the assembler on the Dart side
        // reframes whatever size actually arrives.
        try session.setPreferredIOBufferDuration(0.010)
        try session.setActive(true, options: .notifyOthersOnDeactivation)

        var processingDisabled = true
        // Not covered by .measurement: pin the input gain so the OS cannot
        // ride it between two measurement points, which would show up as a
        // level difference that is not in the room.
        if session.isInputGainSettable {
            try? session.setInputGain(1.0)
        }
        if #available(iOS 14.5, *) {
            // Non-fatal: an alert mid-sweep interrupts the measurement rather
            // than biasing it, so a refusal here is not worth failing over.
            try? session.setPrefersNoInterruptionsFromSystemAlerts(true)
        }

        let input = engine.inputNode
        // Voice processing is echo cancellation plus AGC. If it cannot be
        // turned off, the measurement is not trustworthy and we say so instead
        // of failing silently.
        if input.isVoiceProcessingEnabled {
            do {
                try input.setVoiceProcessingEnabled(false)
            } catch {
                processingDisabled = false
            }
        }

        let hwFormat = input.outputFormat(forBus: 0)
        guard hwFormat.sampleRate > 0 else {
            throw NSError(domain: "AudioCapture", code: 1,
                          userInfo: [NSLocalizedDescriptionKey: "No input available"])
        }

        // Deliver mono float32 at the hardware rate. Resampling to a nominal
        // 48 kHz here would add a filter of our own to every measurement; the
        // real rate is reported instead and the analysis uses it.
        guard let mono = AVAudioFormat(commonFormat: .pcmFormatFloat32,
                                       sampleRate: hwFormat.sampleRate,
                                       channels: 1,
                                       interleaved: false) else {
            throw NSError(domain: "AudioCapture", code: 2,
                          userInfo: [NSLocalizedDescriptionKey: "Cannot build mono format"])
        }
        targetFormat = mono
        converter = hwFormat.channelCount == 1 ? nil : AVAudioConverter(from: hwFormat, to: mono)

        input.removeTap(onBus: 0)
        input.installTap(onBus: 0, bufferSize: 2048, format: hwFormat) { [weak self] buffer, _ in
            self?.emit(buffer)
        }

        engine.prepare()
        try engine.start()
        running = true

        return status()
    }

    func stop() {
        guard running else { return }
        engine.inputNode.removeTap(onBus: 0)
        engine.stop()
        running = false
        try? AVAudioSession.sharedInstance().setActive(false,
                                                       options: .notifyOthersOnDeactivation)
    }

    /// What the session is actually doing right now.
    func status() -> [String: Any] {
        let session = AVAudioSession.sharedInstance()
        let route = session.currentRoute.inputs.first
        let portType = route?.portType
        let bluetooth = portType == .bluetoothHFP
            || portType == .bluetoothA2DP
            || portType == .bluetoothLE

        return [
            "sampleRate": session.sampleRate,
            "measurementMode": session.mode == .measurement,
            "processingDisabled": !engine.inputNode.isVoiceProcessingEnabled,
            "route": route?.portName ?? "unknown",
            "isBluetooth": bluetooth,
        ]
    }

    func requestPermission(completion: @escaping (Bool) -> Void) {
        if #available(iOS 17.0, *) {
            AVAudioApplication.requestRecordPermission { granted in
                DispatchQueue.main.async { completion(granted) }
            }
        } else {
            AVAudioSession.sharedInstance().requestRecordPermission { granted in
                DispatchQueue.main.async { completion(granted) }
            }
        }
    }

    // MARK: - Delivery

    private func emit(_ buffer: AVAudioPCMBuffer) {
        guard let sink = eventSink else { return }
        guard let samples = monoSamples(from: buffer) else { return }
        // Flutter's standard codec maps Float32List to a typed array without
        // copying element by element, so the audio thread stays cheap.
        let data = samples.withUnsafeBufferPointer { Data(buffer: $0) }
        DispatchQueue.main.async {
            sink(FlutterStandardTypedData(float32: data))
        }
    }

    private func monoSamples(from buffer: AVAudioPCMBuffer) -> [Float]? {
        if let converter, let target = targetFormat {
            let capacity = AVAudioFrameCount(buffer.frameLength)
            guard let out = AVAudioPCMBuffer(pcmFormat: target, frameCapacity: capacity) else {
                return nil
            }
            var consumed = false
            var error: NSError?
            converter.convert(to: out, error: &error) { _, status in
                if consumed {
                    status.pointee = .noDataNow
                    return nil
                }
                consumed = true
                status.pointee = .haveData
                return buffer
            }
            if error != nil { return nil }
            guard let ch = out.floatChannelData else { return nil }
            return Array(UnsafeBufferPointer(start: ch[0], count: Int(out.frameLength)))
        }

        guard let ch = buffer.floatChannelData else { return nil }
        return Array(UnsafeBufferPointer(start: ch[0], count: Int(buffer.frameLength)))
    }
}

// MARK: - Flutter plumbing

extension AudioCapture: FlutterStreamHandler {
    func onListen(withArguments arguments: Any?,
                  eventSink events: @escaping FlutterEventSink) -> FlutterError? {
        eventSink = events
        return nil
    }

    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        eventSink = nil
        return nil
    }
}

extension AudioCapture {
    func register(with registrar: FlutterPluginRegistrar) {
        let method = FlutterMethodChannel(name: "audioscanner/capture",
                                          binaryMessenger: registrar.messenger())
        let events = FlutterEventChannel(name: "audioscanner/capture/pcm",
                                         binaryMessenger: registrar.messenger())
        events.setStreamHandler(self)

        method.setMethodCallHandler { [weak self] call, result in
            guard let self else { return }
            switch call.method {
            case "requestPermission":
                self.requestPermission { result($0) }
            case "start":
                let args = call.arguments as? [String: Any]
                let rate = args?["sampleRate"] as? Double ?? 48000
                do {
                    result(try self.start(sampleRate: rate))
                } catch {
                    result(FlutterError(code: "start_failed",
                                        message: error.localizedDescription,
                                        details: nil))
                }
            case "stop":
                self.stop()
                result(nil)
            case "status":
                result(self.status())
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }
}
