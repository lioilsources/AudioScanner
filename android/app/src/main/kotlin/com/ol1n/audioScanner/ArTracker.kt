package com.ol1n.audioScanner

import android.app.Activity
import android.content.Context
import android.opengl.EGL14
import android.opengl.EGLConfig
import android.opengl.EGLContext
import android.opengl.EGLDisplay
import android.opengl.EGLSurface
import android.opengl.GLES11Ext
import android.opengl.GLES20
import android.os.Handler
import android.os.Looper
import android.view.Surface
import com.google.ar.core.ArCoreApk
import com.google.ar.core.Camera
import com.google.ar.core.Config
import com.google.ar.core.Plane
import com.google.ar.core.Pose
import com.google.ar.core.Session
import com.google.ar.core.TrackingFailureReason
import com.google.ar.core.TrackingState
import com.google.ar.core.exceptions.CameraNotAvailableException
import com.google.ar.core.exceptions.UnavailableException
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.atomic.AtomicBoolean
import kotlin.math.abs
import kotlin.math.asin
import kotlin.math.max
import kotlin.math.min

/// Phone position from ARCore — and, from the same session, a rough room.
///
/// One ARCore session serves two Flutter channels. Pose goes out on
/// `audioscanner/ar/pose`, exactly as ARKit's does on iOS. Detected planes go
/// out on `audioscanner/room/geometry`, standing in for RoomPlan, which
/// Android does not have: vertical planes are walls, their extents give a
/// bounding box, and how much of that box's perimeter the walls actually cover
/// is reported as the irregularity. It is an estimate and says so — but it is
/// enough to name which mode a measured peak belongs to, which is the question
/// the design report needs answered.
///
/// ARCore will not run headless: `Session.update()` refuses until a camera
/// texture exists in a current GL context. There is no view to draw into here
/// and none is wanted (a preview costs battery on a long walk), so the session
/// lives on its own thread with a 1×1 pbuffer that nothing ever reads.
class ArTracker(private val context: Context) {
    private var session: Session? = null
    private var thread: Thread? = null
    private val running = AtomicBoolean(false)
    private val main = Handler(Looper.getMainLooper())

    private var poseSink: EventChannel.EventSink? = null
    private var roomSink: EventChannel.EventSink? = null

    /// Inverse of the pose the user called "origin". Volatile: written from the
    /// Flutter thread, read on the AR thread.
    @Volatile private var originInverse: Pose? = null
    @Volatile private var lastPose: Pose? = null

    // MARK: - Lifecycle

    fun isSupported(): Boolean =
        ArCoreApk.getInstance().checkAvailability(context).isSupported

    /// Creates the session and starts the update loop. The camera permission
    /// and the ARCore install prompt both need the Activity, so this is called
    /// only after [PermissionBridge] has granted CAMERA.
    fun start(activity: Activity): String? {
        if (running.get()) return null
        try {
            // Prompts the Play Store install if ARCore is missing; returns
            // INSTALL_REQUESTED in that case and the user comes back later.
            if (ArCoreApk.getInstance().requestInstall(activity, true)
                == ArCoreApk.InstallStatus.INSTALL_REQUESTED) {
                return "ARCore se instaluje — spusť sledování znovu, až doběhne."
            }
            val s = Session(context)
            s.configure(Config(s).apply {
                // Never block on the camera: the pose stream must stay live
                // even when the phone is pointed at a blank wall.
                updateMode = Config.UpdateMode.LATEST_CAMERA_IMAGE
                planeFindingMode = Config.PlaneFindingMode.HORIZONTAL_AND_VERTICAL
                lightEstimationMode = Config.LightEstimationMode.DISABLED
                depthMode = Config.DepthMode.DISABLED
                focusMode = Config.FocusMode.AUTO
            })
            session = s
        } catch (e: UnavailableException) {
            return "ARCore: ${e.message ?: e.javaClass.simpleName}"
        }

        running.set(true)
        thread = Thread({ loop() }, "audioscanner-ar").apply { start() }
        return null
    }

    fun stop() {
        running.set(false)
        thread?.join(1000)
        thread = null
        originInverse = null
        lastPose = null
    }

    fun setOrigin() {
        lastPose?.let { originInverse = it.inverse() }
    }

    // MARK: - AR thread

    private fun loop() {
        val gl = OffscreenGl()
        val s = session ?: return
        try {
            gl.makeCurrent()
            s.setCameraTextureName(gl.cameraTexture)
            // Any geometry will do — nothing is displayed. A sane aspect keeps
            // ARCore's internal projection well-conditioned.
            s.setDisplayGeometry(Surface.ROTATION_0, 640, 480)
            s.resume()

            var frameCount = 0L
            while (running.get()) {
                val frame = try {
                    s.update()
                } catch (e: CameraNotAvailableException) {
                    emitError("ar_failed", "Kamera není k dispozici: ${e.message}")
                    break
                }
                val camera = frame.camera
                lastPose = camera.pose
                emitPose(camera)

                // Planes change slowly; every 15th frame is plenty and keeps
                // the room-estimate cost off the pose cadence.
                if (frameCount++ % 15L == 0L) emitRoom(s)

                // ~30 Hz is enough for a walk; ARKit's 60 buys nothing here.
                Thread.sleep(33)
            }
        } catch (e: Exception) {
            emitError("ar_failed", e.message ?: e.javaClass.simpleName)
        } finally {
            try {
                s.pause()
            } catch (_: Exception) {
            }
            s.close()
            session = null
            gl.release()
        }
    }

    private fun emitPose(camera: Camera) {
        val sink = poseSink ?: return
        val pose = camera.pose
        val relative = originInverse?.compose(pose) ?: pose
        val t = relative.translation

        val quality: String
        var reason: String? = null
        when (camera.trackingState) {
            TrackingState.TRACKING -> quality = "normal"
            TrackingState.PAUSED -> {
                quality = "limited"
                reason = when (camera.trackingFailureReason) {
                    TrackingFailureReason.NONE -> "initializing"
                    TrackingFailureReason.EXCESSIVE_MOTION -> "excessiveMotion"
                    TrackingFailureReason.INSUFFICIENT_FEATURES -> "insufficientFeatures"
                    TrackingFailureReason.INSUFFICIENT_LIGHT -> "insufficientLight"
                    else -> "unknown"
                }
            }
            else -> quality = "unavailable"
        }

        // Pitch of the camera's line of sight above the horizon: 0 upright,
        // +90 flat with the screen to the ceiling. For the "you are shading the
        // microphone" warning only — never stored, never a sound direction.
        val forward = pose.rotateVector(floatArrayOf(0f, 0f, -1f))
        val pitch = asin(forward[1].coerceIn(-1f, 1f)) * 180.0 / Math.PI

        val payload = hashMapOf<String, Any?>(
            "x" to t[0].toDouble(),
            "y" to t[1].toDouble(),
            "z" to t[2].toDouble(),
            "quality" to quality,
            "reason" to reason,
            "pitch" to pitch,
            "hasOrigin" to (originInverse != null),
        )
        main.post { sink.success(payload) }
    }

    /// Bounding box over the tracked vertical planes.
    private fun emitRoom(s: Session) {
        val sink = roomSink ?: return
        val planes = s.getAllTrackables(Plane::class.java)
            .filter { it.trackingState == TrackingState.TRACKING && it.subsumedBy == null }
        val walls = planes.filter { it.type == Plane.Type.VERTICAL }
        if (walls.isEmpty()) return

        var minX = Float.MAX_VALUE; var maxX = -Float.MAX_VALUE
        var minZ = Float.MAX_VALUE; var maxZ = -Float.MAX_VALUE
        var top = -Float.MAX_VALUE
        var coveredWidth = 0f
        val wallMaps = ArrayList<Map<String, Any>>()

        for (w in walls) {
            val c = w.centerPose
            val ex = w.extentX / 2
            val ez = w.extentZ / 2
            // Corners of the plane's rectangle, in world space.
            for (sx in floatArrayOf(-ex, ex)) for (sz in floatArrayOf(-ez, ez)) {
                val p = c.transformPoint(floatArrayOf(sx, 0f, sz))
                minX = min(minX, p[0]); maxX = max(maxX, p[0])
                minZ = min(minZ, p[2]); maxZ = max(maxZ, p[2])
                top = max(top, p[1])
            }
            // A vertical plane's Y axis is its normal; whichever of X/Z is more
            // horizontal is the wall's run.
            val xAxis = c.rotateVector(floatArrayOf(1f, 0f, 0f))
            val horizontalExtent = if (abs(xAxis[1]) < 0.5f) w.extentX else w.extentZ
            coveredWidth += horizontalExtent
            val n = c.rotateVector(floatArrayOf(0f, 1f, 0f))
            wallMaps.add(mapOf(
                "cx" to c.tx().toDouble(), "cy" to c.ty().toDouble(), "cz" to c.tz().toDouble(),
                "width" to horizontalExtent.toDouble(),
                "height" to (if (abs(xAxis[1]) < 0.5f) w.extentZ else w.extentX).toDouble(),
                "nx" to n[0].toDouble(), "ny" to n[1].toDouble(), "nz" to n[2].toDouble(),
                "confidence" to "medium",
            ))
        }

        val floorY = planes
            .filter { it.type == Plane.Type.HORIZONTAL_UPWARD_FACING }
            .minOfOrNull { it.centerPose.ty() }
        val ceilingY = planes
            .filter { it.type == Plane.Type.HORIZONTAL_DOWNWARD_FACING }
            .maxOfOrNull { it.centerPose.ty() }

        val length = (maxX - minX).toDouble()
        val width = (maxZ - minZ).toDouble()
        val height = when {
            floorY != null && ceilingY != null -> (ceilingY - floorY).toDouble()
            floorY != null && top > floorY -> (top - floorY).toDouble()
            else -> 0.0 // Dart substitutes a default and says it did
        }
        // What fraction of the box's perimeter no detected wall accounts for.
        val perimeter = 2 * (length + width)
        val irregularity = if (perimeter > 0)
            (1 - coveredWidth / perimeter).coerceIn(0.0, 1.0) else 1.0

        val payload = hashMapOf<String, Any?>(
            "source" to "arPlanes",
            "length" to length,
            "width" to width,
            "height" to height,
            "originX" to minX.toDouble(),
            "originZ" to minZ.toDouble(),
            "irregularity" to irregularity,
            "walls" to wallMaps,
            "openings" to emptyList<Any>(),
            "wallCount" to walls.size,
        )
        main.post { sink.success(payload) }
    }

    private fun emitError(code: String, message: String) {
        main.post {
            poseSink?.error(code, message, null)
            roomSink?.error(code, message, null)
        }
    }

    // MARK: - Flutter plumbing

    fun register(messenger: BinaryMessenger, activity: Activity, permissions: PermissionBridge) {
        EventChannel(messenger, "audioscanner/ar/pose").setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) { poseSink = events }
            override fun onCancel(arguments: Any?) { poseSink = null }
        })
        EventChannel(messenger, "audioscanner/room/geometry").setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) { roomSink = events }
            override fun onCancel(arguments: Any?) { roomSink = null }
        })

        val startWithCamera: (MethodChannel.Result) -> Unit = { result ->
            permissions.request(android.Manifest.permission.CAMERA) { granted ->
                if (!granted) {
                    result.error("camera_denied", "Bez kamery ARCore nemá z čeho počítat polohu.", null)
                } else {
                    val err = start(activity)
                    if (err == null) result.success(null) else result.error("ar_unavailable", err, null)
                }
            }
        }

        MethodChannel(messenger, "audioscanner/ar").setMethodCallHandler { call, result ->
            when (call.method) {
                "isSupported" -> result.success(isSupported())
                "start" -> startWithCamera(result)
                "stop" -> { stop(); result.success(null) }
                "setOrigin" -> { setOrigin(); result.success(null) }
                else -> result.notImplemented()
            }
        }
        // The room channel shares the session: "start" here just makes sure
        // it is running, since plane detection is always on in the config.
        MethodChannel(messenger, "audioscanner/room").setMethodCallHandler { call, result ->
            when (call.method) {
                "isSupported" -> result.success(isSupported())
                "start" -> if (running.get()) result.success(null) else startWithCamera(result)
                "stop" -> result.success(null) // the pose channel owns shutdown
                else -> result.notImplemented()
            }
        }
    }
}

/// A 1×1 pbuffer GL ES 2 context with one external texture — the minimum
/// ARCore accepts as "somewhere to put the camera".
private class OffscreenGl {
    private var display: EGLDisplay = EGL14.EGL_NO_DISPLAY
    private var eglContext: EGLContext = EGL14.EGL_NO_CONTEXT
    private var surface: EGLSurface = EGL14.EGL_NO_SURFACE
    var cameraTexture = 0
        private set

    fun makeCurrent() {
        display = EGL14.eglGetDisplay(EGL14.EGL_DEFAULT_DISPLAY)
        val version = IntArray(2)
        check(EGL14.eglInitialize(display, version, 0, version, 1)) { "eglInitialize" }

        val attribs = intArrayOf(
            EGL14.EGL_RENDERABLE_TYPE, EGL14.EGL_OPENGL_ES2_BIT,
            EGL14.EGL_SURFACE_TYPE, EGL14.EGL_PBUFFER_BIT,
            EGL14.EGL_RED_SIZE, 8, EGL14.EGL_GREEN_SIZE, 8, EGL14.EGL_BLUE_SIZE, 8,
            EGL14.EGL_NONE,
        )
        val configs = arrayOfNulls<EGLConfig>(1)
        val count = IntArray(1)
        check(EGL14.eglChooseConfig(display, attribs, 0, configs, 0, 1, count, 0) && count[0] > 0) {
            "eglChooseConfig"
        }
        val config = configs[0]!!
        eglContext = EGL14.eglCreateContext(
            display, config, EGL14.EGL_NO_CONTEXT,
            intArrayOf(EGL14.EGL_CONTEXT_CLIENT_VERSION, 2, EGL14.EGL_NONE), 0,
        )
        surface = EGL14.eglCreatePbufferSurface(
            display, config, intArrayOf(EGL14.EGL_WIDTH, 1, EGL14.EGL_HEIGHT, 1, EGL14.EGL_NONE), 0,
        )
        check(EGL14.eglMakeCurrent(display, surface, surface, eglContext)) { "eglMakeCurrent" }

        val tex = IntArray(1)
        GLES20.glGenTextures(1, tex, 0)
        GLES20.glBindTexture(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, tex[0])
        GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, GLES20.GL_TEXTURE_MIN_FILTER, GLES20.GL_LINEAR)
        GLES20.glTexParameteri(GLES11Ext.GL_TEXTURE_EXTERNAL_OES, GLES20.GL_TEXTURE_MAG_FILTER, GLES20.GL_LINEAR)
        cameraTexture = tex[0]
    }

    fun release() {
        if (display == EGL14.EGL_NO_DISPLAY) return
        EGL14.eglMakeCurrent(display, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_SURFACE, EGL14.EGL_NO_CONTEXT)
        if (surface != EGL14.EGL_NO_SURFACE) EGL14.eglDestroySurface(display, surface)
        if (eglContext != EGL14.EGL_NO_CONTEXT) EGL14.eglDestroyContext(display, eglContext)
        EGL14.eglTerminate(display)
        display = EGL14.EGL_NO_DISPLAY
    }
}
