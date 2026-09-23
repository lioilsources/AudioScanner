import ARKit
import Flutter

/// Phone position from ARKit world tracking.
///
/// This is the only reason the app has any idea where a measurement was taken.
/// One microphone cannot localise a sound source, so the three-dimensional part
/// of a "3D acoustic map" comes entirely from knowing where the phone was —
/// which makes tracking quality a measurement parameter, not a UI detail. Every
/// pose therefore carries its own quality, and the recording flow refuses points
/// taken while tracking is limited.
///
/// The session runs without any rendering: no ARSCNView, no camera preview.
/// Pose is all that is wanted, and skipping the renderer keeps the phone cool
/// through a long walk.
final class ARTracker: NSObject {
    private let session = ARSession()
    private var eventSink: FlutterEventSink?

    /// Set when the user taps "origin". Stored as the inverse transform so a
    /// pose can be turned into origin-relative coordinates with one multiply.
    private var originInverse: simd_float4x4?

    private var running = false

    static var isSupported: Bool { ARWorldTrackingConfiguration.isSupported }

    func start() {
        guard ARTracker.isSupported, !running else { return }
        let config = ARWorldTrackingConfiguration()
        // Planes are not needed for position, and detecting them costs power
        // on a walk that may last several minutes.
        config.planeDetection = []
        config.isLightEstimationEnabled = false
        config.worldAlignment = .gravity

        session.delegate = self
        session.run(config, options: [.resetTracking, .removeExistingAnchors])
        running = true
    }

    func stop() {
        guard running else { return }
        session.pause()
        running = false
        originInverse = nil
    }

    /// Makes the phone's current position the origin of the session.
    func setOrigin() {
        guard let frame = session.currentFrame else { return }
        originInverse = simd_inverse(frame.camera.transform)
    }

    // MARK: - Pose

    private func payload(for frame: ARFrame) -> [String: Any] {
        let transform = frame.camera.transform
        let relative = originInverse.map { simd_mul($0, transform) } ?? transform
        let t = relative.columns.3

        var quality = "unavailable"
        var reason: String?
        switch frame.camera.trackingState {
        case .normal:
            quality = "normal"
        case .limited(let why):
            quality = "limited"
            switch why {
            case .initializing: reason = "initializing"
            case .excessiveMotion: reason = "excessiveMotion"
            case .insufficientFeatures: reason = "insufficientFeatures"
            case .relocalizing: reason = "relocalizing"
            @unknown default: reason = "unknown"
            }
        case .notAvailable:
            quality = "unavailable"
        }

        // Pitch, for the "you are shading the microphone" warning only. It is
        // never stored with a measurement and never treated as a sound
        // direction.
        let pitch = asin(max(-1, min(1, -transform.columns.2.y))) * 180 / .pi

        return [
            "x": t.x,
            "y": t.y,
            "z": t.z,
            "quality": quality,
            "reason": reason as Any,
            "pitch": pitch,
            "hasOrigin": originInverse != nil,
        ]
    }
}

extension ARTracker: ARSessionDelegate {
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        guard let sink = eventSink else { return }
        let data = payload(for: frame)
        DispatchQueue.main.async { sink(data) }
    }

    func session(_ session: ARSession, didFailWithError error: Error) {
        guard let sink = eventSink else { return }
        DispatchQueue.main.async {
            sink(FlutterError(code: "ar_failed",
                              message: error.localizedDescription,
                              details: nil))
        }
    }
}

extension ARTracker: FlutterStreamHandler {
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

extension ARTracker {
    func register(with registrar: FlutterPluginRegistrar) {
        let method = FlutterMethodChannel(name: "audioscanner/ar",
                                          binaryMessenger: registrar.messenger())
        let events = FlutterEventChannel(name: "audioscanner/ar/pose",
                                         binaryMessenger: registrar.messenger())
        events.setStreamHandler(self)

        method.setMethodCallHandler { [weak self] call, result in
            guard let self else { return }
            switch call.method {
            case "isSupported":
                result(ARTracker.isSupported)
            case "start":
                self.start()
                result(nil)
            case "stop":
                self.stop()
                result(nil)
            case "setOrigin":
                self.setOrigin()
                result(nil)
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }
}
