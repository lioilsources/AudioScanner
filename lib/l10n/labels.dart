import '../ar/ar_tracking.dart';
import '../audio/audio_capture.dart';
import '../model/session.dart';
import '../room/room_modes.dart';
import 'app_localizations.dart';

/// Localized labels for model enums and states. The model classes keep their
/// own Czech getters for the design report and tests; the UI goes through
/// these.
extension ModelLabels on AppLocalizations {
  String trackingQuality(TrackingQuality q) => switch (q) {
        TrackingQuality.normal => trackingOk,
        TrackingQuality.limited => trackingLimited,
        TrackingQuality.unavailable => trackingUnavailable,
      };

  String? poseHint(String? reason) => switch (reason) {
        'insufficientFeatures' => poseHintFeatures,
        'excessiveMotion' => poseHintMotion,
        'insufficientLight' => poseHintLight,
        'initializing' => poseHintInitializing,
        'relocalizing' => poseHintRelocalizing,
        _ => null,
      };

  String excitationSignal(ExcitationSignal s) => switch (s) {
        ExcitationSignal.phonePinkNoise => signalPhonePink,
        ExcitationSignal.externalPinkNoise => signalExternalPink,
        ExcitationSignal.externalSweep => signalExternalSweep,
      };

  String? captureWarning(CaptureStatus? status) {
    if (status == null) return null;
    if (status.isBluetooth) return captureWarningBluetooth;
    if (!status.processingDisabled) return captureWarningProcessing;
    if (!status.measurementMode) return captureWarningMeasurementMode;
    return null;
  }

  String captureRoute(CaptureStatus status) =>
      status.route == 'neznámý' ? captureRouteUnknown : status.route;

  String? modeAxis(RoomMode m) {
    if (m.type != ModeType.axial) return null;
    if (m.nx > 0) return axisLength;
    if (m.ny > 0) return axisWidth;
    return axisHeight;
  }
}
