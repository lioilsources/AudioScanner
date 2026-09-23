import ARKit
import Flutter
#if canImport(RoomPlan)
import RoomPlan
#endif

/// Room geometry from the LiDAR scanner, via RoomPlan.
///
/// This is the half of the design that measurement cannot supply. A sweep says
/// there is a 9 dB hole at 58 Hz; it cannot say whether that is the length mode,
/// a cancellation off the wall behind the left speaker, or a speaker running
/// below what it can do. Knowing where the walls are tells all three apart —
/// and a cause is the difference between "cut 6 dB" and "move the sofa".
///
/// RoomPlan gives parametric walls rather than a mesh, which is what makes it
/// usable: a triangle soup would have to be plane-fitted before any of it meant
/// anything. Requires a LiDAR device (iPhone 12 Pro / iPad Pro 2020 and later);
/// `isSupported` is the one thing to check before offering the feature.
@available(iOS 16.0, *)
final class RoomScanner: NSObject {
    private var eventSink: FlutterEventSink?

    #if canImport(RoomPlan)
    private var session: RoomCaptureSession?
    #endif

    static var isSupported: Bool {
        #if canImport(RoomPlan)
        if #available(iOS 16.0, *) {
            return RoomCaptureSession.isSupported
        }
        #endif
        return false
    }

    func start() {
        #if canImport(RoomPlan)
        guard RoomCaptureSession.isSupported else { return }
        let session = RoomCaptureSession()
        session.delegate = self
        self.session = session
        session.run(configuration: RoomCaptureSession.Configuration())
        #endif
    }

    func stop() {
        #if canImport(RoomPlan)
        session?.stop()
        session = nil
        #endif
    }

    #if canImport(RoomPlan)
    /// Reduces a captured room to what the acoustics needs.
    ///
    /// Walls come back as oriented boxes. Their extents give the shoebox fit the
    /// modal maths needs; how badly that fit misses is reported alongside, so
    /// an L-shaped room can be labelled as one instead of having its mode
    /// frequencies quoted to a tenth of a hertz.
    private func payload(for room: CapturedRoom) -> [String: Any] {
        var minX = Float.greatestFiniteMagnitude
        var maxX = -Float.greatestFiniteMagnitude
        var minZ = Float.greatestFiniteMagnitude
        var maxZ = -Float.greatestFiniteMagnitude
        var maxY: Float = 0
        var wallArea: Float = 0

        var walls: [[String: Any]] = []
        for wall in room.walls {
            let t = wall.transform
            let c = t.columns.3
            minX = min(minX, c.x); maxX = max(maxX, c.x)
            minZ = min(minZ, c.z); maxZ = max(maxZ, c.z)
            maxY = max(maxY, wall.dimensions.y)
            wallArea += wall.dimensions.x * wall.dimensions.y

            // The wall's outward normal is its local +z in world space; the
            // reflection maths needs it, so it is sent rather than re-derived
            // from a corner ordering that RoomPlan does not promise.
            let n = t.columns.2
            walls.append([
                "cx": c.x, "cy": c.y, "cz": c.z,
                "width": wall.dimensions.x,
                "height": wall.dimensions.y,
                "nx": n.x, "ny": n.y, "nz": n.z,
                "confidence": confidenceName(wall.confidence),
            ])
        }

        let length = max(maxX - minX, 0)
        let width = max(maxZ - minZ, 0)
        let height = maxY > 0 ? maxY : 2.6

        // How much of the bounding box the walls do not actually enclose. A true
        // rectangle gives roughly 0; an alcove or an open-plan side pushes it up.
        let boxPerimeterArea = 2 * (length + width) * height
        let irregularity = boxPerimeterArea > 0
            ? min(1, abs(Double(boxPerimeterArea - wallArea)) / Double(boxPerimeterArea))
            : 1

        var openings: [[String: Any]] = []
        for opening in room.openings + room.windows + room.doors {
            let c = opening.transform.columns.3
            openings.append([
                "cx": c.x, "cy": c.y, "cz": c.z,
                "width": opening.dimensions.x,
                "height": opening.dimensions.y,
            ])
        }

        return [
            "length": length,
            "width": width,
            "height": height,
            "originX": minX,
            "originZ": minZ,
            "irregularity": irregularity,
            "walls": walls,
            "openings": openings,
            "wallCount": room.walls.count,
        ]
    }

    private func confidenceName(_ c: CapturedRoom.Confidence) -> String {
        switch c {
        case .high: return "high"
        case .medium: return "medium"
        case .low: return "low"
        @unknown default: return "unknown"
        }
    }
    #endif
}

#if canImport(RoomPlan)
@available(iOS 16.0, *)
extension RoomScanner: RoomCaptureSessionDelegate {
    func captureSession(_ session: RoomCaptureSession,
                        didUpdate room: CapturedRoom) {
        guard let sink = eventSink else { return }
        let data = payload(for: room)
        DispatchQueue.main.async { sink(data) }
    }

    func captureSession(_ session: RoomCaptureSession,
                        didEndWith data: CapturedRoomData,
                        error: Error?) {
        guard let sink = eventSink else { return }
        if let error {
            DispatchQueue.main.async {
                sink(FlutterError(code: "roomplan_failed",
                                  message: error.localizedDescription,
                                  details: nil))
            }
        }
    }
}
#endif

@available(iOS 16.0, *)
extension RoomScanner: FlutterStreamHandler {
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

@available(iOS 16.0, *)
extension RoomScanner {
    func register(with registrar: FlutterPluginRegistrar) {
        let method = FlutterMethodChannel(name: "audioscanner/room",
                                          binaryMessenger: registrar.messenger())
        let events = FlutterEventChannel(name: "audioscanner/room/geometry",
                                         binaryMessenger: registrar.messenger())
        events.setStreamHandler(self)

        method.setMethodCallHandler { [weak self] call, result in
            guard let self else { return }
            switch call.method {
            case "isSupported":
                result(RoomScanner.isSupported)
            case "start":
                self.start()
                result(nil)
            case "stop":
                self.stop()
                result(nil)
            default:
                result(FlutterMethodNotImplemented)
            }
        }
    }
}
