package com.ol1n.audio_scanner

import android.content.pm.PackageManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

/// Runtime permissions, routed back to whoever asked.
///
/// Android answers permission requests through the Activity, not through the
/// caller, so the request and its answer have to be matched up by hand. One
/// outstanding callback per permission is enough — nobody asks for the
/// microphone twice at once.
class PermissionBridge(private val activity: FlutterActivity) {
    private val pending = HashMap<Int, (Boolean) -> Unit>()
    private var nextCode = 4000

    fun request(permission: String, onResult: (Boolean) -> Unit) {
        // minSdk is 24, so the platform calls are enough — no androidx.core.
        if (activity.checkSelfPermission(permission) == PackageManager.PERMISSION_GRANTED) {
            onResult(true)
            return
        }
        val code = nextCode++
        pending[code] = onResult
        activity.requestPermissions(arrayOf(permission), code)
    }

    fun onResult(requestCode: Int, grantResults: IntArray) {
        pending.remove(requestCode)?.invoke(
            grantResults.isNotEmpty() && grantResults[0] == PackageManager.PERMISSION_GRANTED
        )
    }
}

class MainActivity : FlutterActivity() {
    /// Held for the Activity's lifetime: each owns a platform session and is
    /// the sole owner of its Flutter channels, so letting one go would
    /// silently stop the stream the UI is listening to.
    private lateinit var permissions: PermissionBridge
    private lateinit var audioCapture: AudioCapture
    private lateinit var arTracker: ArTracker

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        permissions = PermissionBridge(this)
        audioCapture = AudioCapture(applicationContext)
        arTracker = ArTracker(applicationContext)

        val messenger = flutterEngine.dartExecutor.binaryMessenger
        audioCapture.register(messenger, permissions)
        arTracker.register(messenger, this, permissions)
    }

    override fun onRequestPermissionsResult(
        requestCode: Int,
        permissions: Array<out String>,
        grantResults: IntArray,
    ) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)
        this.permissions.onResult(requestCode, grantResults)
    }

    override fun onDestroy() {
        audioCapture.stop()
        arTracker.stop()
        super.onDestroy()
    }
}
