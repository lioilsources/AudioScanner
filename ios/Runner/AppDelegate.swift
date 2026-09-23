import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  /// Held for the lifetime of the app: both own OS sessions (audio, ARKit) and
  /// are the sole owners of their Flutter channels, so letting either go would
  /// silently stop the stream the UI is listening to.
  private let audioCapture = AudioCapture()
  private let arTracker = ARTracker()

  /// RoomPlan needs iOS 16; on anything older the channel is simply never
  /// registered and Dart's `isSupported` returns false through the missing-plugin
  /// path, which is the answer it wants anyway.
  private var roomScanner: AnyObject?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)

    let registry = engineBridge.pluginRegistry
    if let audioRegistrar = registry.registrar(forPlugin: "AudioScannerCapture") {
      audioCapture.register(with: audioRegistrar)
    }
    if let arRegistrar = registry.registrar(forPlugin: "AudioScannerAR") {
      arTracker.register(with: arRegistrar)
    }
    if #available(iOS 16.0, *) {
      let scanner = RoomScanner()
      roomScanner = scanner
      if let roomRegistrar = registry.registrar(forPlugin: "AudioScannerRoom") {
        scanner.register(with: roomRegistrar)
      }
    }
  }
}
