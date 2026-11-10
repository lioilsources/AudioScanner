// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Kannada (`kn`).
class AppLocalizationsKn extends AppLocalizations {
  AppLocalizationsKn([String locale = 'kn']) : super(locale);

  @override
  String get tabScan => 'ಸ್ಕ್ಯಾನ್';

  @override
  String get tabMap => 'ನಕ್ಷೆ';

  @override
  String get tabResponse => 'ಪ್ರತಿಕ್ರಿಯೆ';

  @override
  String get tabDesign => 'ವಿನ್ಯಾಸ';

  @override
  String get tabSignals => 'ಸಂಕೇತಗಳು';

  @override
  String get rtaSnapshotFailed => 'ಸ್ನ್ಯಾಪ್‌ಶಾಟ್ ಉಳಿಸಲಾಗಲಿಲ್ಲ.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'ಬಿಂದು $id ಆಗಿ ಉಳಿಸಲಾಗಿದೆ.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'ಬಿಂದು $id ಆಗಿ ಉಳಿಸಲಾಗಿದೆ (ಸ್ಥಾನವಿಲ್ಲದೆ).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಬಿಂದುಗಳು',
      one: '1 ಬಿಂದು',
    );
    return 'ಮಾಪನಾಂಕ $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'ಫೈಲ್ ಓದಲಾಗುತ್ತಿಲ್ಲ: $message';
  }

  @override
  String get rtaOffsetTitle => 'ಆಫ್‌ಸೆಟ್ dB SPL';

  @override
  String get rtaOffsetHelp =>
      '1 kHz ಸ್ವರ ಪ್ಲೇ ಮಾಡಿ, SPL ಮೀಟರ್‌ನಲ್ಲಿ ಮಟ್ಟ ಓದಿ, ವಿಶ್ಲೇಷಕ ತೋರಿಸುವುದಕ್ಕೂ ಅದಕ್ಕೂ ಇರುವ ವ್ಯತ್ಯಾಸ ನಮೂದಿಸಿ. ಆಫ್‌ಸೆಟ್ ಶೂನ್ಯವಲ್ಲದಿದ್ದರೆ ಮಟ್ಟಗಳು ಅಂದಾಜು SPL ಎಂದು ಗುರುತಿಸಲ್ಪಡುತ್ತವೆ; ಇಲ್ಲದಿದ್ದರೆ dBFS ಆಗಿಯೇ ಇರುತ್ತವೆ.';

  @override
  String get commonReset => 'ಮರುಹೊಂದಿಸಿ';

  @override
  String get commonCancel => 'ರದ್ದುಮಾಡಿ';

  @override
  String get commonSave => 'ಉಳಿಸಿ';

  @override
  String get commonStop => 'ನಿಲ್ಲಿಸಿ';

  @override
  String get commonStartMic => 'ಮೈಕ್ರೊಫೋನ್ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get tabAnalyzer => 'ವಿಶ್ಲೇಷಕ';

  @override
  String get rtaUnfreeze => 'ಫ್ರೀಜ್ ತೆಗೆಯಿರಿ';

  @override
  String get rtaFreeze => 'ಫ್ರೀಜ್ ಮಾಡಿ';

  @override
  String get rtaPeakHold => 'ಪೀಕ್ ಹೋಲ್ಡ್';

  @override
  String get rtaMaxMinTraces => 'ಗರಿಷ್ಠ / ಕನಿಷ್ಠ ರೇಖೆಗಳು';

  @override
  String get rtaResetTraces => 'ರೇಖೆಗಳನ್ನು ಮರುಹೊಂದಿಸಿ';

  @override
  String get rtaSaveAsPoint => 'ಬಿಂದುವಾಗಿ ಉಳಿಸಿ (3 ಸೆ)';

  @override
  String get rtaMicCalibration => 'ಮೈಕ್ರೊಫೋನ್ ಮಾಪನಾಂಕ…';

  @override
  String get rtaRemoveCalibration => 'ಮಾಪನಾಂಕ ತೆಗೆಯಿರಿ';

  @override
  String get rtaOffsetMenu => 'ಆಫ್‌ಸೆಟ್ dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · ಸಂಕೇತ ಸಂಸ್ಕರಣೆ ಇಲ್ಲ';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ಬಿಂದುಗಳು',
      one: '1 ಬಿಂದು',
    );
    return 'ಮಾಪನಾಂಕ $name: $_temp0, ತಿದ್ದುಪಡಿ $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (ಅಂದಾಜು)';

  @override
  String get rtaFrozenHint =>
      'ಫ್ರೀಜ್ ಆಗಿದೆ — ಮೈಕ್ರೊಫೋನ್ ಚಾಲನೆಯಲ್ಲೇ ಇದೆ, ಚಿತ್ರಣ ಮಾತ್ರ ನಿಂತಿದೆ.';

  @override
  String get rtaRelativeHint =>
      'ಮಟ್ಟಗಳು ಸಾಪೇಕ್ಷ (dBFS). ಮೊದಲ ಬಿಂದು ಉಳಿಸಿದಾಗ ರೂಪರೇಖೆ ಕಾಣಿಸುತ್ತದೆ — ಅದೇ ಇತರರಿಗೆ ಉಲ್ಲೇಖ.';

  @override
  String get rtaReferenceHint =>
      'ತುಂಬಿದ ಪಟ್ಟಿಗಳು = ಇಲ್ಲಿ. ರೂಪರೇಖೆ = ಉಲ್ಲೇಖ ಬಿಂದು.';

  @override
  String get rtaEnvelopeHint =>
      'ಕೆಂಪು = ಗರಿಷ್ಠ, ಹಸಿರು = ಮರುಹೊಂದಿಸಿದ ನಂತರದ ಕನಿಷ್ಠ.';

  @override
  String get rtaMicStopped => 'ಮೈಕ್ರೊಫೋನ್ ನಿಂತಿದೆ';

  @override
  String get rtaSilence => 'ನಿಶ್ಶಬ್ದ — ಸಂಕೇತ ಪ್ಲೇ ಆಗುತ್ತಿದೆಯೇ?';

  @override
  String get rtaPlaceholder => 'ಮೈಕ್ರೊಫೋನ್ ಪ್ರಾರಂಭಿಸಿ ಕೋಣೆಗೆ ಸಂಕೇತ ಪ್ಲೇ ಮಾಡಿ.';

  @override
  String rtaBandsInfo(int count) {
    return '$count ಮೂರನೇ-ಒಂದು ಆಕ್ಟೇವ್ ಬ್ಯಾಂಡ್‌ಗಳು, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'ಕೋಣೆ ಸ್ಕ್ಯಾನ್';

  @override
  String scanPointCount(int count) {
    return '$count ಬಿಂ.';
  }

  @override
  String get commonMicNotRunning => 'ಮೈಕ್ರೊಫೋನ್ ಚಾಲನೆಯಲ್ಲಿಲ್ಲ';

  @override
  String get scanMicNeeded =>
      'ಅದಿಲ್ಲದಿದ್ದರೆ ಸ್ಥಾನ ಮಾತ್ರ ಅಳೆಯಲಾಗುತ್ತದೆ, ಧ್ವನಿ ಅಲ್ಲ.';

  @override
  String get scanContinuous => 'ನಿರಂತರ ಮಾಪನ';

  @override
  String get scanContinuousHint => '0.5 ಮೀ ನಡೆದಾಗಲೆಲ್ಲ ಬಿಂದು ತಾನಾಗಿ';

  @override
  String get scanMeasuring => 'ಅಳೆಯುತ್ತಿದೆ…';

  @override
  String get scanMeasureHere => 'ಇಲ್ಲಿ ಅಳೆಯಿರಿ';

  @override
  String scanPointSaved(String id, String position) {
    return 'ಬಿಂದು $id ಅನ್ನು $position ನಲ್ಲಿ ಉಳಿಸಲಾಗಿದೆ';
  }

  @override
  String get scanStartTracking => 'ಸ್ಥಾನ ಟ್ರ್ಯಾಕಿಂಗ್ ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get scanStartTrackingHint =>
      'ARKit — ಇದರಿಂದ ನೀವು ಕೋಣೆಯಲ್ಲಿ ಎಲ್ಲಿ ನಿಂತಿದ್ದೀರಿ ಎಂದು ಆ್ಯಪ್‌ಗೆ ತಿಳಿಯುತ್ತದೆ.';

  @override
  String scanPosition(String position) {
    return 'ಸ್ಥಾನ: ಮೂಲದಿಂದ $position ಮೀ';
  }

  @override
  String get scanSetOriginHint => 'ಕೇಳುವ ಸ್ಥಳದಲ್ಲಿ ನಿಂತು ಮೂಲ ಬಿಂದು ನಿಗದಿಪಡಿಸಿ.';

  @override
  String get scanOriginHere => 'ಇಲ್ಲಿ ಮೂಲ ಬಿಂದು';

  @override
  String get scanNoPoints => 'ಇನ್ನೂ ಯಾವುದೇ ಬಿಂದು ಇಲ್ಲ.';

  @override
  String scanPointStats(String variation, String rms) {
    return '40–300 Hz ಹರಡುವಿಕೆ: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'ಲಿವಿಂಗ್ ರೂಮ್';

  @override
  String get scanNewMeasurement => 'ಹೊಸ ಮಾಪನ';

  @override
  String get scanRoomName => 'ಕೋಣೆಯ ಹೆಸರು';

  @override
  String get scanExcitation => 'ಕೋಣೆಯನ್ನು ಯಾವುದರಿಂದ ಉದ್ದೀಪಿಸುವಿರಿ';

  @override
  String get scanPhoneNoiseHint =>
      'ಕೇವಲ ಸೂಚನೆಗಾಗಿ — ಫೋನ್ ಸ್ಪೀಕರ್ ಬಾಸ್ ಅನ್ನು ಬಹುತೇಕ ಹೊರಡಿಸುವುದೇ ಇಲ್ಲ.';

  @override
  String get scanStart => 'ಪ್ರಾರಂಭಿಸಿ';

  @override
  String get mapExportTooltip => 'FRD + JSON ರಫ್ತು';

  @override
  String get mapNeedsTwoPoints =>
      'ನಕ್ಷೆಗೆ ಕನಿಷ್ಠ ಎರಡು ಬಿಂದು ಬೇಕು. ಕೋಣೆಯಲ್ಲಿ ನಡೆದು ಅಳೆಯುತ್ತಿರಿ.';

  @override
  String get mapShareText =>
      'ಬಿಂದುವಾರು FRD (REW / VituixCAD ಗೆ ಆಮದು) ಮತ್ತು ಪೂರ್ಣ ಸೆಷನ್ JSON ರೂಪದಲ್ಲಿ.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'ಅತ್ಯಂತ ಸಮತಟ್ಟಾದ ಸ್ಥಳ: $position ಮೀ ನಲ್ಲಿ $id (40–300 Hz ನಲ್ಲಿ ಹರಡುವಿಕೆ $variation dB)';
  }

  @override
  String get signalsSweepHelp =>
      'ಇಂಪಲ್ಸ್ ಪ್ರತಿಕ್ರಿಯೆ, ಪ್ರತಿಧ್ವನಿ ಸಮಯ ಮತ್ತು ಮೊದಲ ಪ್ರತಿಫಲನಗಳನ್ನು ಲೆಕ್ಕಹಾಕಬಹುದಾದ ಏಕೈಕ ಸಂಕೇತ. ಕಂಪ್ಯೂಟರ್ ಅಥವಾ DAC ಯಿಂದ ಸ್ಪೀಕರ್‌ಗಳಿಗೆ ಪ್ಲೇ ಮಾಡಿ, ಫೋನ್ ರೆಕಾರ್ಡ್ ಮಾಡಲಿ.';

  @override
  String get signalsLength => 'ಅವಧಿ';

  @override
  String get signalsFrom => 'ಇಂದ';

  @override
  String get signalsTo => 'ವರೆಗೆ';

  @override
  String get signalsMonoNoChannel => 'ಮೊನೊ (ಚಾನೆಲ್ ಇಲ್ಲ)';

  @override
  String get signalsExportWav => 'WAV ರಫ್ತು';

  @override
  String get signalsPinkNoise => 'ಪಿಂಕ್ ನಾಯ್ಸ್';

  @override
  String get signalsPinkHelp =>
      'ಪ್ರತಿ ಆಕ್ಟೇವ್‌ನಲ್ಲೂ ಸಮಾನ ಶಕ್ತಿ. ಆವರ್ತನ ಪ್ರತಿಕ್ರಿಯೆ ಮಾತ್ರ ಸಿಗುತ್ತದೆ, ಸಮಯ ಅಥವಾ ಪ್ರತಿಫಲನಗಳಿಲ್ಲ — \"ಇಲ್ಲಿ ಏನಾದರೂ ಬದಲಾಗುತ್ತಿದೆಯೇ?\" ಎಂಬ ತ್ವರಿತ ಪರೀಕ್ಷೆಗೆ ಸಾಕು.';

  @override
  String get signalsExportPink => '30 ಸೆ WAV ರಫ್ತು';

  @override
  String get signalsHowTo => 'ಅಳೆಯುವುದು ಹೇಗೆ';

  @override
  String get signalsStep1 =>
      'ಸಂಕೇತವನ್ನು ಕಂಪ್ಯೂಟರ್‌ನಿಂದ ಸ್ಪೀಕರ್‌ಗಳಿಗೆ ಪ್ಲೇ ಮಾಡಿ, ಫೋನ್‌ನಿಂದ ಅಲ್ಲ.';

  @override
  String get signalsStep2 =>
      'ವಿಶ್ಲೇಷಕ ಸುಮಾರು −20 dBFS ತೋರಿಸುವಂತೆ ವಾಲ್ಯೂಮ್ ಹೊಂದಿಸಿ. ಓವರ್‌ಲೋಡ್ ಪ್ರತಿಫಲನದಂತೆ ಕಾಣುತ್ತದೆ.';

  @override
  String get signalsStep3 =>
      'ಫೋನ್ ಅನ್ನು ಲಂಬವಾಗಿ, ಕೈ ಚಾಚಿ, ಮೈಕ್ರೊಫೋನ್ ಸ್ಪೀಕರ್‌ಗಳ ಕಡೆಗೆ ಹಿಡಿಯಿರಿ.';

  @override
  String get signalsStep4 =>
      'ಬ್ಲೂಟೂತ್ ಹೆಡ್‌ಫೋನ್ ಸಂಪರ್ಕ ಕಡಿಯಿರಿ — ಸಂಕುಚನ ಮತ್ತು ವಿಳಂಬ ಮಾಪನವನ್ನು ಹಾಳುಮಾಡುತ್ತವೆ.';

  @override
  String get signalsNoteMono =>
      'ಮೊನೊವನ್ನು ಎರಡೂ ಸ್ಪೀಕರ್‌ಗಳಿಗೆ ಒಟ್ಟಿಗೆ ಕಳುಹಿಸಿದರೆ L ಮತ್ತು R ಕೂಡುತ್ತವೆ ಮತ್ತು ಅವುಗಳ ವ್ಯತ್ಯಾಸ ಮೊತ್ತದಲ್ಲಿ ಕಳೆದುಹೋಗುತ್ತದೆ. ಚಾನೆಲ್‌ಗಳನ್ನು ಅಳೆಯಲು ಚಾನೆಲ್ ಆಯ್ಕೆಮಾಡಿ.';

  @override
  String get signalsNoteStereo =>
      'ಸಂಕೇತ ಒಂದೇ ಚಾನೆಲ್‌ನಲ್ಲಿರುವ ಸ್ಟೀರಿಯೊ ಫೈಲ್ — ಸ್ಟೀರಿಯೊ ಪ್ಲೇ ಮಾಡುವ ಯಾವುದೇ ಸಾಧನ ಇದನ್ನು ಪ್ಲೇ ಮಾಡುತ್ತದೆ.';

  @override
  String get signalsNoteChannel =>
      'ಚಾನೆಲ್ ಹೆಸರಿನ ಮೊನೊ ಫೈಲ್. DAW ಅಥವಾ ಬಹು-ಚಾನೆಲ್ ಇನ್‌ಪುಟ್ ಮೂಲಕ ರಿಸೀವರ್‌ನ ಸರಿಯಾದ ಇನ್‌ಪುಟ್‌ಗೆ ಕಳುಹಿಸಿ; ಸ್ಟೀರಿಯೊ ಔಟ್‌ಪುಟ್ ಇರುವ ಲ್ಯಾಪ್‌ಟಾಪ್ ಇದನ್ನು ಈ ಚಾನೆಲ್‌ಗೆ ತಲುಪಿಸಲಾರದು.';

  @override
  String get channelsTitle => 'ಚಾನೆಲ್ ಮಾಪನ';

  @override
  String get channelsHelp =>
      'ಕೇಳುವ ಸ್ಥಳದಲ್ಲಿ ನಿಲ್ಲಿ. ಪ್ರತಿ ಚಾನೆಲ್‌ಗೆ: ರೆಕಾರ್ಡಿಂಗ್ ಪ್ರಾರಂಭಿಸಿ, ಸಂಕೇತ ಟ್ಯಾಬ್‌ನ ಸ್ವೀಪ್ ಅದಕ್ಕೆ ಪ್ಲೇ ಮಾಡಿ, ಮುಗಿದಿದೆ ಒತ್ತಿ. ಈ ಬಿಂದುಗಳಿಲ್ಲದೆ ವಿನ್ಯಾಸಕ್ಕೆ EQ ಮತ್ತು ವಾಲ್ಯೂಮ್ ಮಾಡಲು ಆಧಾರವೇ ಇರುವುದಿಲ್ಲ.';

  @override
  String channelsSweepLength(int seconds) {
    return 'ಸ್ವೀಪ್ $seconds ಸೆ';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ ನಮೂದಿಸಿದ ನಂತರ ಪರಿಶೀಲನೆ';

  @override
  String get channelsVerifyAfterEqHint =>
      'ಬಿಂದು \"EQ ನಂತರ\" ಎಂದು ಉಳಿಯುತ್ತದೆ ಮತ್ತು EQ ಲೆಕ್ಕಹಾಕಿದ ಬಿಂದುವನ್ನು ಬದಲಾಯಿಸುವುದಿಲ್ಲ.';

  @override
  String channelsRecording(String seconds) {
    return '$seconds ಸೆ ರೆಕಾರ್ಡ್ ಆಗುತ್ತಿದೆ — ಈಗ ಸ್ವೀಪ್ ಪ್ಲೇ ಮಾಡಿ';
  }

  @override
  String get channelsNotMeasured => 'ಅಳೆದಿಲ್ಲ';

  @override
  String get channelsMeasuredNoise => 'ನಾಯ್ಸ್‌ನಿಂದ ಅಳೆಯಲಾಗಿದೆ';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · ನೇರ ಧ್ವನಿ $ms ms ನಲ್ಲಿ';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · ನೇರ ಧ್ವನಿ $ms ms ನಲ್ಲಿ, T20 $t20 ಸೆ';
  }

  @override
  String get commonDone => 'ಮುಗಿದಿದೆ';

  @override
  String get channelsMeasure => 'ಅಳೆಯಿರಿ';

  @override
  String get channelsAdd => 'ಸೇರಿಸಿ';

  @override
  String get channelsAgain => 'ಮತ್ತೆ';

  @override
  String get compareTitle => 'ಹೋಲಿಕೆ';

  @override
  String get compareNeedsTwoPoints => 'ಹೋಲಿಕೆಗೆ ಕನಿಷ್ಠ ಎರಡು ಬಿಂದು ಬೇಕು.';

  @override
  String get commonWithRoom => 'ಕೋಣೆಯೊಂದಿಗೆ';

  @override
  String get commonDirectSound => 'ನೇರ ಧ್ವನಿ';

  @override
  String get compareAfterEq => 'EQ ನಂತರ';

  @override
  String get compareBandsA => 'A (ಬ್ಯಾಂಡ್‌ಗಳು)';

  @override
  String get compareBandsB => 'B (ಬ್ಯಾಂಡ್‌ಗಳು)';

  @override
  String get compareArrivalDiff => 'ತಲುಪುವ ಸಮಯದ ವ್ಯತ್ಯಾಸ A − B';

  @override
  String get compareBroadbandDiff => 'ವಿಶಾಲ ಬ್ಯಾಂಡ್ ಮಟ್ಟದ ವ್ಯತ್ಯಾಸ A − B';

  @override
  String get compareWorstBelow300 => '300 Hz ಕೆಳಗಿನ ಅತಿ ದೊಡ್ಡ ವ್ಯತ್ಯಾಸ';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz ಬ್ಯಾಂಡ್‌ನಲ್ಲಿ $db dB';
  }

  @override
  String get compareTrimNote =>
      'ಡಿಸ್ಟೆನ್ಸ್ ಮತ್ತು ಲೆವೆಲ್ ಟ್ರಿಮ್ ತಲುಪುವ ಸಮಯ ಮತ್ತು ಮಟ್ಟದ ವ್ಯತ್ಯಾಸವನ್ನು ಸರಿಪಡಿಸುತ್ತವೆ. 300 Hz ಕೆಳಗಿನ ಆಕಾರದ ವ್ಯತ್ಯಾಸವನ್ನು ಸರಿಪಡಿಸುವುದಿಲ್ಲ — ಅದು ಬೇರೆ ದೂರದ ಬೇರೆ ಗೋಡೆಯಿಂದ ಬರುತ್ತದೆ, ಸ್ಥಾನ ಬದಲಿಸುವುದರಿಂದ ಪರಿಹಾರ.';

  @override
  String get designRt60Live => 'ಕೊನೆಯ ಪ್ರತಿಕ್ರಿಯೆಯಿಂದ T20 125–500 Hz';

  @override
  String get designRt60Stored => 'ಉಳಿಸಿದ ಸ್ವೀಪ್‌ನಿಂದ T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'ಅಂದಾಜು — ಸ್ವೀಪ್ ಅಳೆಯಿರಿ, ಶ್ರೋಡರ್ ಸದ್ಯಕ್ಕೆ ಸೂಚನೆ ಮಾತ್ರ';

  @override
  String get designExportTooltip => 'ಸಂರಚನೆ ರಫ್ತು';

  @override
  String get designCompute => 'ವಿನ್ಯಾಸ ಲೆಕ್ಕಹಾಕಿ';

  @override
  String get designLidarChecking => 'LiDAR ಇದೆಯೇ ಎಂದು ಪರಿಶೀಲಿಸಲಾಗುತ್ತಿದೆ…';

  @override
  String get designLidarAvailable => 'LiDAR ಲಭ್ಯವಿದೆ';

  @override
  String get designLidarMissing => 'LiDAR ಇಲ್ಲ — ಆಯಾಮಗಳನ್ನು ಕೈಯಾರೆ ನಮೂದಿಸಿ';

  @override
  String get designLidarHint =>
      'ಸ್ಕ್ಯಾನ್ ಗೋಡೆಗಳನ್ನು ಸೆಂಟಿಮೀಟರ್ ನಿಖರತೆಯಲ್ಲಿ ನೀಡುತ್ತದೆ, ಆದ್ದರಿಂದ ಮೋಡ್‌ಗಳಷ್ಟೇ ಅಲ್ಲ, ಪ್ರತಿಫಲನ ಬಿಂದುಗಳು ಮತ್ತು ಗಡಿಗಳಿಗೆ ದೂರವೂ ಸರಿಹೊಂದುತ್ತವೆ.';

  @override
  String get designManualHint =>
      'ಮೋಡ್ ಲೆಕ್ಕಕ್ಕೆ ಮೂರು ಸಂಖ್ಯೆ ಸಾಕು — ಆದರೆ ಪ್ರತಿಫಲನ ಬಿಂದುಗಳು ಮತ್ತು ಗೋಡೆಗಳಿಗೆ ನಿಖರ ದೂರ ಕಳೆದುಹೋಗುತ್ತವೆ.';

  @override
  String get designStopScan => 'ಸ್ಕ್ಯಾನ್ ಮುಗಿಸಿ';

  @override
  String get designScanRoom => 'ಕೋಣೆ ಸ್ಕ್ಯಾನ್ ಮಾಡಿ';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls ಗೋಡೆಗಳು',
      one: '1 ಗೋಡೆ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings ತೆರೆಯುವಿಕೆಗಳು',
      one: '1 ತೆರೆಯುವಿಕೆ',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'ಕೋಣೆಯ ಆಯಾಮಗಳು';

  @override
  String get designLength => 'ಉದ್ದ';

  @override
  String get designWidth => 'ಅಗಲ';

  @override
  String get designHeight => 'ಎತ್ತರ';

  @override
  String get designWhatToDo => 'ಇದಕ್ಕೆ ಏನು ಮಾಡಬೇಕು';

  @override
  String get designRoomModes => 'ಕೋಣೆಯ ಮೋಡ್‌ಗಳು';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (ಶ್ರೋಡರ್) ಮೇಲೆ ಪ್ರತ್ಯೇಕ ಮೋಡ್‌ಗಳಿಗೆ ಅರ್ಥವಿಲ್ಲ. RT60 $rt60 ಸೆ: $source.';
  }

  @override
  String get designEqTitle => 'EQ: ಅಳೆದದ್ದು, ಗುರಿ, ಮುನ್ಸೂಚನೆ';

  @override
  String get designEqHelp =>
      'ಮುನ್ಸೂಚನೆ ಎಂದರೆ ಅಳೆದ ಪ್ರತಿಕ್ರಿಯೆ ಜೊತೆಗೆ ರಿಸೀವರ್‌ನ ಹದಿನೈದು-ಬ್ಯಾಂಡ್ ಮಾದರಿ. EQ ನಮೂದಿಸಿದ ನಂತರ, ಮಾದರಿ ಎಷ್ಟು ಹತ್ತಿರವಿತ್ತು ಎಂದು ನೋಡಲು \"EQ ನಂತರ\" ಸ್ವಿಚ್ ಆನ್ ಮಾಡಿ ಚಾನೆಲ್ ಮತ್ತೆ ಅಳೆಯಿರಿ.';

  @override
  String get designReceiverConfig => 'ರಿಸೀವರ್ ಸಂರಚನೆ';

  @override
  String get designGeometryOnly =>
      'ಸ್ವೀಪ್‌ನಿಂದ ಚಾನೆಲ್‌ಗಳನ್ನು ಅಳೆಯದಿದ್ದರೆ ಇರುವುದು ಜ್ಯಾಮಿತಿ ಮಾತ್ರ: ದೂರಗಳು ಮತ್ತು ಕ್ರಾಸ್‌ಓವರ್ ಆವರ್ತನಗಳು. ಪ್ರತಿ ಚಾನೆಲ್‌ಗೆ ಬಿಂದುಗಳು ಸಿಕ್ಕಾಗ EQ ಮತ್ತು ವಾಲ್ಯೂಮ್ ಸೇರುತ್ತವೆ.';

  @override
  String get designShareSubject => 'ಸಂರಚನೆ ಪ್ರಸ್ತಾವನೆ';

  @override
  String get impulseTitle => 'ಇಂಪಲ್ಸ್ ಪ್ರತಿಕ್ರಿಯೆ';

  @override
  String get impulseCompareTooltip => 'ಬಿಂದುಗಳನ್ನು ಹೋಲಿಸಿ';

  @override
  String get impulseExportTooltip => 'ಹಂತದೊಂದಿಗೆ FRD ರಫ್ತು';

  @override
  String get impulseTapToStart => 'ಪ್ರಾರಂಭಿಸಲು ಟ್ಯಾಪ್ ಮಾಡಿ.';

  @override
  String get impulseSweepTitle => 'ಸ್ಪೀಕರ್‌ಗಳಿಗೆ ಪ್ಲೇ ಮಾಡುವ ಸ್ವೀಪ್';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds ಸೆ. ನೀವು ಪ್ಲೇ ಮಾಡುವುದಕ್ಕೆ ಹೊಂದಿಕೆಯಾಗಬೇಕು — ಇಲ್ಲದಿದ್ದರೆ ಡಿಕನ್ವಲ್ಯೂಷನ್ ಅರ್ಥಹೀನ ಫಲಿತಾಂಶ ನೀಡುತ್ತದೆ.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'ರೆಕಾರ್ಡ್ ಆಗುತ್ತಿದೆ — $seconds ಸೆ';
  }

  @override
  String get impulsePlaySweepNow => 'ಈಗ ಕಂಪ್ಯೂಟರ್‌ನಿಂದ ಸ್ವೀಪ್ ಪ್ಲೇ ಮಾಡಿ.';

  @override
  String get impulseStartRecording =>
      'ರೆಕಾರ್ಡಿಂಗ್ ಪ್ರಾರಂಭಿಸಿ, ನಂತರ ಸ್ವೀಪ್ ಪ್ಲೇ ಮಾಡಿ';

  @override
  String get impulseFrequencyResponse => 'ಆವರ್ತನ ಪ್ರತಿಕ್ರಿಯೆ';

  @override
  String get impulseWithRoom => 'ಕೋಣೆಯೊಂದಿಗೆ (1 ಸೆ)';

  @override
  String impulseDirectWindow(String ms) {
    return 'ನೇರ ಧ್ವನಿ (ವಿಂಡೋ $ms ms)';
  }

  @override
  String get impulseWindow => 'ವಿಂಡೋ';

  @override
  String impulseWindowHelp(String hz) {
    return 'ಉದ್ದ ವಿಂಡೋ ಕೆಳ ಆವರ್ತನಗಳನ್ನು ನೋಡುತ್ತದೆ (ಈಗ $hz Hz ಮೇಲೆ ಮಾನ್ಯ), ಆದರೆ ಮೊದಲ ಪ್ರತಿಫಲನವನ್ನೂ ಒಳಗೆ ಬಿಡುತ್ತದೆ. ಈ ಮಿತಿಯ ಕೆಳಗೆ ವಕ್ರರೇಖೆಯನ್ನು ನಯಗೊಳಿಸುವುದೂ ಇಲ್ಲ, ವಿವರಿಸುವುದೂ ಇಲ್ಲ: ಅದು ವಿಂಡೋ, ಕೋಣೆಯಲ್ಲ.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'ಮೊದಲ ಪ್ರತಿಫಲನದವರೆಗೆ ($ms ms)';
  }

  @override
  String get impulseTime => 'ಸಮಯ';

  @override
  String get impulseImpulse => 'ಇಂಪಲ್ಸ್';

  @override
  String get impulseTimeHelp =>
      'ನೀಲಿ ಬಣ್ಣ ವಿಂಡೋ, ಕಿತ್ತಳೆ ರೇಖೆ ಕಂಡುಬಂದ ಮೊದಲ ಪ್ರತಿಫಲನ. ಸಮಯ ಶೂನ್ಯ ನೇರ ಧ್ವನಿ.';

  @override
  String get impulseSpectrogram => 'ಸ್ಪೆಕ್ಟ್ರೋಗ್ರಾಮ್';

  @override
  String get commonHide => 'ಮರೆಮಾಡಿ';

  @override
  String get commonShow => 'ತೋರಿಸಿ';

  @override
  String get impulseSpectrogramHelp =>
      'ನೇರ ಧ್ವನಿಯಿಂದ ms ನಲ್ಲಿ ಸಮಯ, ಆವರ್ತನ ಮೇಲ್ಮುಖ, ಬಣ್ಣ −60 dB ವರೆಗಿನ ಮಟ್ಟ. ಉಳಿದವು ಮಾಯವಾದರೂ ಉಳಿಯುವ ಅಡ್ಡ ಪಟ್ಟಿ ಒಂದು ಮೋಡ್; ಮೇಲಿನ ಕೋಷ್ಟಕ ಅದನ್ನೇ ಸಂಖ್ಯೆಯಲ್ಲಿ ಹೇಳುತ್ತದೆ.';

  @override
  String get impulseDecayByOctave => 'ಆಕ್ಟೇವ್‌ವಾರು ಕ್ಷೀಣತೆ';

  @override
  String get impulseMidNoT20 => 'ಮಧ್ಯ ಬ್ಯಾಂಡ್‌ಗಳು T20 ಗೆ ಸಾಕಷ್ಟು ಕುಸಿಯಲಿಲ್ಲ.';

  @override
  String impulseMidT20(String seconds) {
    return 'ಮಧ್ಯ 125–500 Hz: T20 $seconds ಸೆ — ವಿನ್ಯಾಸ ಬಳಸುವ RT60 ಇದೇ.';
  }

  @override
  String get impulseDecayHelp =>
      'ಬಾಸ್‌ನಲ್ಲಿ ಫೋನ್‌ನಿಂದ ಬರುವ RT60 ಅಂದಾಜು ಮಾತ್ರ: ಹಿನ್ನೆಲೆ ಶಬ್ದ ಅಲ್ಲಿ ಹತ್ತಿರವಿರುತ್ತದೆ, ಮತ್ತು \"—\" ಎಂದರೆ ಪ್ರತಿಧ್ವನಿ ಅದರ ಕೆಳಗೆ ಇಳಿಯಲಿಲ್ಲ. C50 ಶೂನ್ಯಕ್ಕಿಂತ ಹೆಚ್ಚು: ನೇರ ಧ್ವನಿ ಮತ್ತು ಮೊದಲ ಪ್ರತಿಫಲನಗಳು ಪ್ರತಿಧ್ವನಿಗಿಂತ ಹೆಚ್ಚು ಶಕ್ತಿ ಹೊತ್ತಿವೆ.';

  @override
  String get impulseResult => 'ಫಲಿತಾಂಶ';

  @override
  String get impulseDirectArrived => 'ನೇರ ಧ್ವನಿ ತಲುಪಿದ್ದು';

  @override
  String get impulseDirectArrivedHelp =>
      'ಪ್ಲೇಬ್ಯಾಕ್ ವಿಳಂಬ ಜೊತೆಗೆ ಪ್ರಯಾಣ ಸಮಯ — ಅದರಿಂದ ಮಾತ್ರ ಏನೂ ತಿಳಿಯುವುದಿಲ್ಲ, ಆದರೆ L ಮತ್ತು R ಸ್ಪೀಕರ್‌ಗಳ ನಡುವಿನ ವ್ಯತ್ಯಾಸ ತಿಳಿಸುತ್ತದೆ.';

  @override
  String get impulseFirstReflection => 'ಮೊದಲ ಪ್ರತಿಫಲನ';

  @override
  String get impulseNotFound => 'ಸಿಗಲಿಲ್ಲ';

  @override
  String impulseAfterDirect(String time) {
    return 'ನೇರ ಧ್ವನಿಯ $time ನಂತರ';
  }

  @override
  String get impulseNoReflectionHelp =>
      'ಒಂದೋ ಅದು ಇಲ್ಲ, ಇಲ್ಲವೇ ನೇರ ಇಂಪಲ್ಸ್‌ನ ರಿಂಗಿಂಗ್‌ನಲ್ಲಿ ಅಡಗಿದೆ.';

  @override
  String impulseExtraPath(String metres) {
    return 'ಹೆಚ್ಚುವರಿ ಮಾರ್ಗ ≈ $metres ಮೀ.';
  }

  @override
  String get impulseUnmeasurable => 'ಅಳೆಯಲಾಗದು';

  @override
  String get impulseRt60NoiseHelp =>
      'ಪ್ರತಿಧ್ವನಿ ಹಿನ್ನೆಲೆ ಶಬ್ದಕ್ಕಿಂತ ಮೇಲೆ ಸಾಕಷ್ಟು ಆಳಕ್ಕೆ ಇಳಿಯಲಿಲ್ಲ — ಜೋರಾಗಿ ಮಾಡಿ, ಅಥವಾ ಹೆಚ್ಚು ಶಾಂತ ಸಮಯದಲ್ಲಿ ಅಳೆಯಿರಿ.';

  @override
  String get impulseRt60Help =>
      'T20 ಮತ್ತು T30 ನಡುವಿನ ವ್ಯತ್ಯಾಸ ಕ್ಷೀಣತೆ ಎಷ್ಟು ಶುದ್ಧವೆಂದು ಸೂಚಿಸುತ್ತದೆ.';

  @override
  String get impulseGating => 'ವಿಂಡೋ (ಗೇಟಿಂಗ್)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz ಮೇಲೆ ಮಾನ್ಯ';
  }

  @override
  String get impulseGatingHelp =>
      'ಅದರ ಕೆಳಗೆ ವಿಂಡೋಗೆ ಒಂದು ಆವರ್ತವೂ ಕಾಣುವುದಿಲ್ಲ — ಅಲ್ಲಿನ ವಕ್ರರೇಖೆ ವಿಂಡೋದ ಕೃತಕ ಪರಿಣಾಮ, ಕೋಣೆಯದ್ದಲ್ಲ.';

  @override
  String get impulseSchroeder => 'ಶ್ರೋಡರ್ ಕ್ಷೀಣತೆ ವಕ್ರರೇಖೆ';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz ನಲ್ಲಿ HD$order';
  }

  @override
  String get impulseHd2Help =>
      'ಹಾರ್ಮೋನಿಕ್‌ಗಳು ಫರಿನಾ ಡಿಕನ್ವಲ್ಯೂಷನ್‌ನ ಋಣ ಸಮಯದಲ್ಲಿವೆ; ಇಲ್ಲಿ ಅವನ್ನು ಬಿಸಾಡದೆ ಅಲ್ಲಿಂದ ಓದಲಾಗುತ್ತದೆ. −40 dB ಎಂದರೆ 1 %.';

  @override
  String get impulseHd3Help =>
      'ಮೂರನೇ ಹಾರ್ಮೋನಿಕ್ ಓವರ್‌ಲೋಡ್‌ನೊಂದಿಗೆ ಎರಡನೆಯದಕ್ಕಿಂತ ವೇಗವಾಗಿ ಬೆಳೆಯುತ್ತದೆ.';

  @override
  String get impulseDistortionHot => '−30 dB ಮೇಲಿನ ವಿಕೃತಿ';

  @override
  String get impulseDistortionHotHelp =>
      'ಒಂದೋ ಸ್ವೀಪ್ ತುಂಬಾ ಜೋರಾಗಿದೆ, ಇಲ್ಲವೇ ಸ್ಪೀಕರ್ ಮಿತಿಯಲ್ಲಿದೆ. ವಿಕೃತಿಯ ಬಾಲ ಇಂಪಲ್ಸ್‌ನಲ್ಲಿ ಪ್ರತಿಫಲನದಂತೆ ಕಾಣುತ್ತದೆ — ಯಾವುದನ್ನೂ ನಂಬುವ ಮೊದಲು ವಾಲ್ಯೂಮ್ ಕಡಿಮೆ ಮಾಡಿ ಮತ್ತೆ ಅಳೆಯಿರಿ.';

  @override
  String get eqMeasured => 'ಅಳೆದದ್ದು';

  @override
  String get eqTarget => 'ಗುರಿ';

  @override
  String get eqPredicted => 'EQ ನಂತರದ ಮುನ್ಸೂಚನೆ';

  @override
  String get eqMeasuredAfter => 'EQ ನಂತರ ಅಳೆದದ್ದು';

  @override
  String eqDeviation(int maxHz) {
    return 'ಗುರಿಯಿಂದ ವಿಚಲನೆ 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'ರಿಸೀವರ್‌ಗೆ ನಮೂದಿಸಿದ ನಂತರ';

  @override
  String get eqPredictionVsReality => 'ಮುನ್ಸೂಚನೆ vs ವಾಸ್ತವ';

  @override
  String eqStubborn(String bands) {
    return 'ಗುರಿಯಿಂದ 6 dB ಗಿಂತ ಹೆಚ್ಚು ದೂರದಲ್ಲೇ ಉಳಿಯುತ್ತದೆ: $bands. ಇದು ಹಸ್ತಕ್ಷೇಪ, ಶಕ್ತಿಯ ಕೊರತೆಯಲ್ಲ — ಇನ್ನಷ್ಟು ಹೆಚ್ಚಿಸುವುದರಿಂದ ಅಲ್ಲ, ಸ್ಪೀಕರ್ ಅಥವಾ ಕೇಳುಗರ ಸ್ಥಾನ ಬದಲಿಸುವುದರಿಂದ ಪರಿಹಾರ.';
  }

  @override
  String get eqModelOk => 'ರಿಸೀವರ್‌ನ ಫಿಲ್ಟರ್ ಸುಮಾರು ಮಾದರಿಯಂತೆ ವರ್ತಿಸುತ್ತದೆ.';

  @override
  String get eqModelOff =>
      'ರಿಸೀವರ್‌ನ ನಿಜವಾದ ಫಿಲ್ಟರ್ ನಿರೀಕ್ಷೆಗಿಂತ ಹೆಚ್ಚು ಮಾದರಿಯಿಂದ ಭಿನ್ನವಾಗಿದೆ — ಅದರ ಬ್ಯಾಂಡ್‌ಗಳು ಇಲ್ಲಿ ಊಹಿಸಿದ್ದಕ್ಕಿಂತ ಅಗಲ ಅಥವಾ ಕಿರಿದಾಗಿರಬಹುದು.';

  @override
  String get eqTargetCurve => 'ಗುರಿ ವಕ್ರರೇಖೆ';

  @override
  String get eqFlat => 'ಸಮತಟ್ಟು';

  @override
  String get eqTargetHelp =>
      'ಸಮತಟ್ಟಲ್ಲ: ಕೆಲವು kHz ಮೇಲೆ ಕಿವಿ ನೇರ ಧ್ವನಿಯನ್ನು ಕೇಳುತ್ತದೆ, ಮೈಕ್ರೊಫೋನ್ ಪ್ರತಿಫಲನಗಳನ್ನೂ ಕೂಡಿಸುತ್ತದೆ, ಮತ್ತು ಅಳೆದ ವಕ್ರರೇಖೆಯನ್ನು ಸಮತಟ್ಟು ಮಾಡಿದರೆ ಧ್ವನಿ ಮಂದವಾಗುತ್ತದೆ. ಮೇಲ್ಭಾಗದಲ್ಲಿ ಸ್ವಲ್ಪ ಇಳಿಜಾರು ಮತ್ತು ಕೆಳಭಾಗದಲ್ಲಿ ಸ್ವಲ್ಪ ಬಾಸ್ ಅನ್ನು ಜನರು ಕುರುಡು ಆಲಿಕೆಯಲ್ಲಿ ಆರಿಸುತ್ತಾರೆ.';

  @override
  String get eqBassLift => 'ಬಾಸ್ ಏರಿಕೆ';

  @override
  String get eqBassBelow => 'ಬಾಸ್ ಕೆಳಗೆ';

  @override
  String get eqTilt => 'ಇಳಿಜಾರು';

  @override
  String get eqDbPerOctave => 'dB/ಆಕ್ಟ್';

  @override
  String get eqTiltFrom => 'ಇಳಿಜಾರು ಇಂದ';

  @override
  String get errorMicPermission =>
      'ಮೈಕ್ರೊಫೋನ್ ಪ್ರವೇಶವಿಲ್ಲದೆ ಅಳೆಯಲಾಗದು. ಸೆಟ್ಟಿಂಗ್ಸ್ → AudioScanner → ಮೈಕ್ರೊಫೋನ್ ನಲ್ಲಿ ಅನುಮತಿಸಿ.';

  @override
  String errorMic(String error) {
    return 'ಮೈಕ್ರೊಫೋನ್: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'ಮೈಕ್ರೊಫೋನ್ ಪ್ರಾರಂಭಿಸಲಾಗಲಿಲ್ಲ: $error';
  }

  @override
  String get errorNoArkit =>
      'ಈ ಸಾಧನ ARKit ವರ್ಲ್ಡ್ ಟ್ರ್ಯಾಕಿಂಗ್ ಬೆಂಬಲಿಸುವುದಿಲ್ಲ — ಬಿಂದುಗಳನ್ನು ಸ್ಥಳದಲ್ಲಿ ಇಡಲಾಗದು.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'ರೆಕಾರ್ಡಿಂಗ್ ಸ್ವೀಪ್‌ಗಿಂತ ಚಿಕ್ಕದು ($expected ಸೆ ನಲ್ಲಿ $recorded ಸೆ). ಸಂಕೇತ ಪ್ಲೇ ಮಾಡುವ ಮೊದಲು ರೆಕಾರ್ಡಿಂಗ್ ಪ್ರಾರಂಭಿಸಿ.';
  }

  @override
  String get sessionSnapshots => 'ಸ್ನ್ಯಾಪ್‌ಶಾಟ್‌ಗಳು';

  @override
  String get errorTrackingUnreliable =>
      'ಸ್ಥಾನ ಟ್ರ್ಯಾಕಿಂಗ್ ವಿಶ್ವಾಸಾರ್ಹವಲ್ಲ — ಬಿಂದು ನೀವು ನಿಂತ ಸ್ಥಳದಲ್ಲಿ ಇರದಿರಬಹುದು.';

  @override
  String errorNoSound(int seconds) {
    return '$seconds ಸೆ ಒಳಗೆ ಯಾವುದೇ ಧ್ವನಿ ಬರಲಿಲ್ಲ.';
  }

  @override
  String get noteSnapshotNoPose => 'ವಿಶ್ಲೇಷಕದಿಂದ ಸ್ನ್ಯಾಪ್‌ಶಾಟ್, ಸ್ಥಾನವಿಲ್ಲ';

  @override
  String get sessionChannels => 'ಚಾನೆಲ್‌ಗಳು';

  @override
  String get trackingOk => 'ಟ್ರ್ಯಾಕಿಂಗ್ ಸರಿ';

  @override
  String get trackingLimited => 'ದುರ್ಬಲ ಟ್ರ್ಯಾಕಿಂಗ್';

  @override
  String get trackingUnavailable => 'ಟ್ರ್ಯಾಕಿಂಗ್ ಇಲ್ಲ';

  @override
  String get poseHintFeatures =>
      'ಚಿತ್ರದಲ್ಲಿ ವಿವರಗಳು ಕಡಿಮೆ — ಖಾಲಿ ಗೋಡೆಗೆ ಅಲ್ಲ, ವಿನ್ಯಾಸವಿರುವ ಯಾವುದಕ್ಕಾದರೂ ಫೋನ್ ಹಿಡಿಯಿರಿ.';

  @override
  String get poseHintMotion => 'ತುಂಬಾ ವೇಗದ ಚಲನೆ — ನಿಧಾನವಾಗಿ ಹೋಗಿ.';

  @override
  String get poseHintLight =>
      'ಬೆಳಕು ಕಡಿಮೆ — ದೀಪ ಹಚ್ಚಿ, ಕ್ಯಾಮೆರಾಗೆ ತಾನು ಎಲ್ಲಿದೆ ಎಂದು ಕಾಣುತ್ತಿಲ್ಲ.';

  @override
  String get poseHintInitializing =>
      'ARKit ಪ್ರಾರಂಭವಾಗುತ್ತಿದೆ, ಸ್ವಲ್ಪ ಹೊತ್ತು ಚಲಿಸುತ್ತಿರಿ.';

  @override
  String get poseHintRelocalizing =>
      'ಮೂಲ ಬಿಂದುವನ್ನು ಹುಡುಕಲಾಗುತ್ತಿದೆ — ನೀವು ಪ್ರಾರಂಭಿಸಿದ ಸ್ಥಳಕ್ಕೆ ಮರಳಿ.';

  @override
  String get signalPhonePink => 'ಫೋನ್‌ನಿಂದ ಪಿಂಕ್ ನಾಯ್ಸ್';

  @override
  String get signalExternalPink => 'ಸ್ಪೀಕರ್‌ಗಳಿಂದ ಪಿಂಕ್ ನಾಯ್ಸ್';

  @override
  String get signalExternalSweep => 'ಸ್ಪೀಕರ್‌ಗಳಿಂದ ಸ್ವೀಪ್';

  @override
  String get captureWarningBluetooth =>
      'ಬ್ಲೂಟೂತ್ ಮೈಕ್ರೊಫೋನ್: ಸಂಕುಚನ ಮತ್ತು ವಿಳಂಬ ಮಾಪನವನ್ನು ಹಾಳುಮಾಡುತ್ತವೆ. ಹೆಡ್‌ಫೋನ್ ಸಂಪರ್ಕ ಕಡಿದು ಅಂತರ್ನಿರ್ಮಿತ ಮೈಕ್ರೊಫೋನ್‌ನಿಂದ ಅಳೆಯಿರಿ.';

  @override
  String get captureWarningProcessing =>
      'ಸಿಸ್ಟಮ್ ಸಂಕೇತ ಸಂಸ್ಕರಣೆಯನ್ನು (AGC / ಶಬ್ದ ನಿಗ್ರಹ) ಆಫ್ ಮಾಡಲಿಲ್ಲ. ಸ್ಥಳಗಳ ನಡುವೆ ಅಳೆದ ವ್ಯತ್ಯಾಸಗಳು ವಿಕೃತವಾಗುತ್ತವೆ.';

  @override
  String get captureWarningMeasurementMode =>
      'ಮಾಪನ ಮೋಡ್ ಆನ್ ಮಾಡಲಾಗಲಿಲ್ಲ — ಮೈಕ್ರೊಫೋನ್ ತನ್ನದೇ ಆವರ್ತನ ಪ್ರತಿಕ್ರಿಯೆ ತಿದ್ದುಪಡಿ ಹೊಂದಿದೆ.';

  @override
  String get captureRouteUnknown => 'ಅಜ್ಞಾತ';

  @override
  String get axisLength => 'ಉದ್ದ';

  @override
  String get axisWidth => 'ಅಗಲ';

  @override
  String get axisHeight => 'ಎತ್ತರ';
}
