import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  /// Held for the lifetime of the app: both own OS sessions (audio, ARKit) and
  /// are the sole owners of their Flutter channels, so letting either go would
  /// silently stop the stream the UI is listening to.
  private let audioCapture = AudioCapture()
  private let arTracker = ARTracker()

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
  }
}
