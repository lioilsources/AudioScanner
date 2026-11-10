// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Panjabi Punjabi (`pa`).
class AppLocalizationsPa extends AppLocalizations {
  AppLocalizationsPa([String locale = 'pa']) : super(locale);

  @override
  String get tabScan => 'ਸਕੈਨ';

  @override
  String get tabMap => 'ਨਕਸ਼ਾ';

  @override
  String get tabResponse => 'ਪ੍ਰਤੀਕਿਰਿਆ';

  @override
  String get tabDesign => 'ਡਿਜ਼ਾਈਨ';

  @override
  String get tabSignals => 'ਸਿਗਨਲ';

  @override
  String get rtaSnapshotFailed => 'ਸਨੈਪਸ਼ਾਟ ਸੰਭਾਲਿਆ ਨਹੀਂ ਗਿਆ।';

  @override
  String rtaSavedAsPoint(String id) {
    return 'ਬਿੰਦੂ $id ਵਜੋਂ ਸੰਭਾਲਿਆ ਗਿਆ।';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'ਬਿੰਦੂ $id ਵਜੋਂ ਸੰਭਾਲਿਆ ਗਿਆ (ਸਥਿਤੀ ਤੋਂ ਬਿਨਾਂ)।';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਬਿੰਦੂ',
      one: '1 ਬਿੰਦੂ',
    );
    return 'ਕੈਲੀਬ੍ਰੇਸ਼ਨ $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'ਫ਼ਾਈਲ ਪੜ੍ਹੀ ਨਹੀਂ ਜਾ ਸਕਦੀ: $message';
  }

  @override
  String get rtaOffsetTitle => 'ਔਫਸੈੱਟ dB SPL';

  @override
  String get rtaOffsetHelp =>
      '1 kHz ਦੀ ਧੁਨੀ ਚਲਾਓ, SPL ਮੀਟਰ ਤੋਂ ਪੱਧਰ ਪੜ੍ਹੋ ਅਤੇ ਵਿਸ਼ਲੇਸ਼ਕ ਜੋ ਦਿਖਾ ਰਿਹਾ ਹੈ ਉਸ ਨਾਲ ਫ਼ਰਕ ਦਰਜ ਕਰੋ। ਔਫਸੈੱਟ ਸਿਫ਼ਰ ਨਾ ਹੋਵੇ ਤਾਂ ਪੱਧਰ ਅੰਦਾਜ਼ਨ SPL ਵਜੋਂ ਦਰਸਾਏ ਜਾਂਦੇ ਹਨ; ਨਹੀਂ ਤਾਂ dBFS ਹੀ ਰਹਿੰਦੇ ਹਨ।';

  @override
  String get commonReset => 'ਰੀਸੈੱਟ';

  @override
  String get commonCancel => 'ਰੱਦ ਕਰੋ';

  @override
  String get commonSave => 'ਸੰਭਾਲੋ';

  @override
  String get commonStop => 'ਰੋਕੋ';

  @override
  String get commonStartMic => 'ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਚਾਲੂ ਕਰੋ';

  @override
  String get tabAnalyzer => 'ਵਿਸ਼ਲੇਸ਼ਕ';

  @override
  String get rtaUnfreeze => 'ਫ੍ਰੀਜ਼ ਹਟਾਓ';

  @override
  String get rtaFreeze => 'ਫ੍ਰੀਜ਼ ਕਰੋ';

  @override
  String get rtaPeakHold => 'ਪੀਕ ਹੋਲਡ';

  @override
  String get rtaMaxMinTraces => 'ਵੱਧ ਤੋਂ ਵੱਧ / ਘੱਟ ਤੋਂ ਘੱਟ ਲਕੀਰਾਂ';

  @override
  String get rtaResetTraces => 'ਲਕੀਰਾਂ ਰੀਸੈੱਟ ਕਰੋ';

  @override
  String get rtaSaveAsPoint => 'ਬਿੰਦੂ ਵਜੋਂ ਸੰਭਾਲੋ (3 ਸਕਿੰ)';

  @override
  String get rtaMicCalibration => 'ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਕੈਲੀਬ੍ਰੇਸ਼ਨ…';

  @override
  String get rtaRemoveCalibration => 'ਕੈਲੀਬ੍ਰੇਸ਼ਨ ਹਟਾਓ';

  @override
  String get rtaOffsetMenu => 'ਔਫਸੈੱਟ dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · ਸਿਗਨਲ ਪ੍ਰੋਸੈਸਿੰਗ ਨਹੀਂ';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ਬਿੰਦੂ',
      one: '1 ਬਿੰਦੂ',
    );
    return 'ਕੈਲੀਬ੍ਰੇਸ਼ਨ $name: $_temp0, ਸੁਧਾਈ $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (ਅੰਦਾਜ਼ਨ)';

  @override
  String get rtaFrozenHint =>
      'ਫ੍ਰੀਜ਼ ਹੈ — ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਚੱਲ ਰਿਹਾ ਹੈ, ਸਿਰਫ਼ ਤਸਵੀਰ ਨਹੀਂ ਬਣ ਰਹੀ।';

  @override
  String get rtaRelativeHint =>
      'ਪੱਧਰ ਸਾਪੇਖ (dBFS) ਹਨ। ਪਹਿਲਾ ਬਿੰਦੂ ਸੰਭਾਲਣ ਤੇ ਰੂਪ-ਰੇਖਾ ਦਿਸੇਗੀ — ਉਹੀ ਬਾਕੀਆਂ ਲਈ ਹਵਾਲਾ ਹੈ।';

  @override
  String get rtaReferenceHint => 'ਭਰੇ ਹੋਏ ਖੰਭੇ = ਇੱਥੇ। ਰੂਪ-ਰੇਖਾ = ਹਵਾਲਾ ਬਿੰਦੂ।';

  @override
  String get rtaEnvelopeHint =>
      'ਲਾਲ = ਵੱਧ ਤੋਂ ਵੱਧ, ਹਰਾ = ਰੀਸੈੱਟ ਤੋਂ ਬਾਅਦ ਘੱਟ ਤੋਂ ਘੱਟ।';

  @override
  String get rtaMicStopped => 'ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਰੁਕਿਆ ਹੈ';

  @override
  String get rtaSilence => 'ਚੁੱਪ — ਕੀ ਸਿਗਨਲ ਚੱਲ ਰਿਹਾ ਹੈ?';

  @override
  String get rtaPlaceholder => 'ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਚਾਲੂ ਕਰੋ ਅਤੇ ਕਮਰੇ ਵਿੱਚ ਸਿਗਨਲ ਚਲਾਓ।';

  @override
  String rtaBandsInfo(int count) {
    return '$count ਤਿਹਾਈ-ਸਪਤਕ ਬੈਂਡ, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'ਕਮਰਾ ਸਕੈਨ';

  @override
  String scanPointCount(int count) {
    return '$count ਬਿੰ.';
  }

  @override
  String get commonMicNotRunning => 'ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਚੱਲ ਨਹੀਂ ਰਿਹਾ';

  @override
  String get scanMicNeeded =>
      'ਇਸ ਤੋਂ ਬਿਨਾਂ ਸਿਰਫ਼ ਸਥਿਤੀ ਮਾਪੀ ਜਾਵੇਗੀ, ਆਵਾਜ਼ ਨਹੀਂ।';

  @override
  String get scanContinuous => 'ਲਗਾਤਾਰ ਮਾਪ';

  @override
  String get scanContinuousHint => 'ਹਰ 0.5 ਮੀ ਤੁਰਨ ਤੇ ਬਿੰਦੂ ਆਪਣੇ-ਆਪ';

  @override
  String get scanMeasuring => 'ਮਾਪ ਰਹੇ ਹਾਂ…';

  @override
  String get scanMeasureHere => 'ਇੱਥੇ ਮਾਪੋ';

  @override
  String scanPointSaved(String id, String position) {
    return 'ਬਿੰਦੂ $id $position ਤੇ ਸੰਭਾਲਿਆ ਗਿਆ';
  }

  @override
  String get scanStartTracking => 'ਸਥਿਤੀ ਟ੍ਰੈਕਿੰਗ ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get scanStartTrackingHint =>
      'ARKit — ਇਸ ਨਾਲ ਐਪ ਨੂੰ ਪਤਾ ਲੱਗਦਾ ਹੈ ਕਿ ਤੁਸੀਂ ਕਮਰੇ ਵਿੱਚ ਕਿੱਥੇ ਖੜ੍ਹੇ ਹੋ।';

  @override
  String scanPosition(String position) {
    return 'ਸਥਿਤੀ: ਮੂਲ ਬਿੰਦੂ ਤੋਂ $position ਮੀ';
  }

  @override
  String get scanSetOriginHint =>
      'ਸੁਣਨ ਵਾਲੀ ਥਾਂ ਤੇ ਖੜ੍ਹੇ ਹੋ ਕੇ ਮੂਲ ਬਿੰਦੂ ਤੈਅ ਕਰੋ।';

  @override
  String get scanOriginHere => 'ਇੱਥੇ ਮੂਲ ਬਿੰਦੂ';

  @override
  String get scanNoPoints => 'ਹਾਲੇ ਕੋਈ ਬਿੰਦੂ ਨਹੀਂ।';

  @override
  String scanPointStats(String variation, String rms) {
    return '40–300 Hz ਫੈਲਾਅ: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'ਬੈਠਕ';

  @override
  String get scanNewMeasurement => 'ਨਵਾਂ ਮਾਪ';

  @override
  String get scanRoomName => 'ਕਮਰੇ ਦਾ ਨਾਮ';

  @override
  String get scanExcitation => 'ਕਮਰੇ ਨੂੰ ਕਿਸ ਨਾਲ ਉਤੇਜਿਤ ਕਰੋਗੇ';

  @override
  String get scanPhoneNoiseHint =>
      'ਸਿਰਫ਼ ਅੰਦਾਜ਼ੇ ਲਈ — ਫ਼ੋਨ ਦਾ ਸਪੀਕਰ ਬੇਸ ਲਗਭਗ ਨਹੀਂ ਦਿੰਦਾ।';

  @override
  String get scanStart => 'ਸ਼ੁਰੂ ਕਰੋ';

  @override
  String get mapExportTooltip => 'FRD + JSON ਐਕਸਪੋਰਟ';

  @override
  String get mapNeedsTwoPoints =>
      'ਨਕਸ਼ੇ ਲਈ ਘੱਟੋ-ਘੱਟ ਦੋ ਬਿੰਦੂ ਚਾਹੀਦੇ ਹਨ। ਕਮਰੇ ਵਿੱਚ ਤੁਰ ਕੇ ਮਾਪਦੇ ਰਹੋ।';

  @override
  String get mapShareText =>
      'ਬਿੰਦੂ ਅਨੁਸਾਰ FRD (REW / VituixCAD ਵਿੱਚ ਇੰਪੋਰਟ) ਅਤੇ ਪੂਰਾ ਸੈਸ਼ਨ JSON ਵਿੱਚ।';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'ਸਭ ਤੋਂ ਸਮਤਲ ਥਾਂ: $position ਮੀ ਤੇ $id (40–300 Hz ਵਿੱਚ ਫੈਲਾਅ $variation dB)';
  }

  @override
  String get signalsSweepHelp =>
      'ਇੰਪਲਸ ਪ੍ਰਤੀਕਿਰਿਆ, ਗੂੰਜ ਸਮਾਂ ਅਤੇ ਪਹਿਲੀਆਂ ਪ੍ਰਤੀਬਿੰਬਾਂ ਦੀ ਗਣਨਾ ਹੋ ਸਕਣ ਵਾਲਾ ਇੱਕੋ-ਇੱਕ ਸਿਗਨਲ। ਕੰਪਿਊਟਰ ਜਾਂ DAC ਤੋਂ ਸਪੀਕਰਾਂ ਨੂੰ ਚਲਾਓ, ਫ਼ੋਨ ਰਿਕਾਰਡ ਕਰਨ ਦਿਓ।';

  @override
  String get signalsLength => 'ਮਿਆਦ';

  @override
  String get signalsFrom => 'ਤੋਂ';

  @override
  String get signalsTo => 'ਤੱਕ';

  @override
  String get signalsMonoNoChannel => 'ਮੋਨੋ (ਚੈਨਲ ਨਹੀਂ)';

  @override
  String get signalsExportWav => 'WAV ਐਕਸਪੋਰਟ';

  @override
  String get signalsPinkNoise => 'ਪਿੰਕ ਨੋਇਜ਼';

  @override
  String get signalsPinkHelp =>
      'ਹਰ ਸਪਤਕ ਵਿੱਚ ਇੱਕੋ ਜਿੰਨੀ ਊਰਜਾ। ਸਿਰਫ਼ ਆਵਿਰਤੀ ਪ੍ਰਤੀਕਿਰਿਆ ਮਿਲਦੀ ਹੈ, ਸਮਾਂ ਜਾਂ ਪ੍ਰਤੀਬਿੰਬ ਨਹੀਂ — \"ਇੱਥੇ ਕੁਝ ਬਦਲ ਰਿਹਾ ਹੈ ਜਾਂ ਨਹੀਂ?\" ਦੀ ਤੇਜ਼ ਜਾਂਚ ਲਈ ਕਾਫ਼ੀ।';

  @override
  String get signalsExportPink => '30 ਸਕਿੰ WAV ਐਕਸਪੋਰਟ';

  @override
  String get signalsHowTo => 'ਮਾਪਣਾ ਕਿਵੇਂ ਹੈ';

  @override
  String get signalsStep1 =>
      'ਸਿਗਨਲ ਕੰਪਿਊਟਰ ਤੋਂ ਸਪੀਕਰਾਂ ਨੂੰ ਚਲਾਓ, ਫ਼ੋਨ ਤੋਂ ਨਹੀਂ।';

  @override
  String get signalsStep2 =>
      'ਵਾਲੀਅਮ ਇੰਨੀ ਰੱਖੋ ਕਿ ਵਿਸ਼ਲੇਸ਼ਕ ਲਗਭਗ −20 dBFS ਦਿਖਾਏ। ਓਵਰਲੋਡ ਪ੍ਰਤੀਬਿੰਬ ਵਰਗਾ ਲੱਗਦਾ ਹੈ।';

  @override
  String get signalsStep3 =>
      'ਫ਼ੋਨ ਨੂੰ ਖੜ੍ਹਾ, ਬਾਂਹ ਪਸਾਰ ਕੇ, ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਸਪੀਕਰਾਂ ਵੱਲ ਰੱਖੋ।';

  @override
  String get signalsStep4 =>
      'ਬਲੂਟੁੱਥ ਹੈੱਡਫ਼ੋਨ ਕੱਟ ਦਿਓ — ਕੰਪ੍ਰੈਸ਼ਨ ਅਤੇ ਦੇਰੀ ਮਾਪ ਖ਼ਰਾਬ ਕਰਦੇ ਹਨ।';

  @override
  String get signalsNoteMono =>
      'ਮੋਨੋ ਨੂੰ ਦੋਵੇਂ ਸਪੀਕਰਾਂ ਨੂੰ ਇਕੱਠੇ ਭੇਜਣ ਨਾਲ L ਅਤੇ R ਜੁੜ ਜਾਂਦੇ ਹਨ ਅਤੇ ਉਨ੍ਹਾਂ ਦਾ ਫ਼ਰਕ ਜੋੜ ਵਿੱਚ ਗੁਆਚ ਜਾਂਦਾ ਹੈ। ਚੈਨਲ ਮਾਪਣ ਲਈ ਚੈਨਲ ਚੁਣੋ।';

  @override
  String get signalsNoteStereo =>
      'ਸਟੀਰੀਓ ਫ਼ਾਈਲ ਜਿਸ ਵਿੱਚ ਸਿਗਨਲ ਸਿਰਫ਼ ਇੱਕ ਚੈਨਲ ਵਿੱਚ ਹੈ — ਸਟੀਰੀਓ ਚਲਾਉਣ ਵਾਲਾ ਕੋਈ ਵੀ ਇਸਨੂੰ ਚਲਾ ਲਵੇਗਾ।';

  @override
  String get signalsNoteChannel =>
      'ਚੈਨਲ ਦੇ ਨਾਮ ਵਾਲੀ ਮੋਨੋ ਫ਼ਾਈਲ। ਇਸਨੂੰ DAW ਜਾਂ ਬਹੁ-ਚੈਨਲ ਇਨਪੁਟ ਰਾਹੀਂ ਰਿਸੀਵਰ ਦੇ ਸਹੀ ਇਨਪੁਟ ਤੱਕ ਭੇਜੋ; ਸਟੀਰੀਓ ਆਉਟਪੁਟ ਵਾਲਾ ਲੈਪਟਾਪ ਇਸਨੂੰ ਇਸ ਚੈਨਲ ਤੱਕ ਨਹੀਂ ਪਹੁੰਚਾ ਸਕਦਾ।';

  @override
  String get channelsTitle => 'ਚੈਨਲ ਮਾਪ';

  @override
  String get channelsHelp =>
      'ਸੁਣਨ ਵਾਲੀ ਥਾਂ ਤੇ ਖੜ੍ਹੇ ਹੋਵੋ। ਹਰ ਚੈਨਲ ਲਈ: ਰਿਕਾਰਡਿੰਗ ਸ਼ੁਰੂ ਕਰੋ, ਸਿਗਨਲ ਟੈਬ ਦਾ ਸਵੀਪ ਉਸ ਵਿੱਚ ਚਲਾਓ, ਹੋ ਗਿਆ ਦਬਾਓ। ਇਨ੍ਹਾਂ ਬਿੰਦੂਆਂ ਤੋਂ ਬਿਨਾਂ ਡਿਜ਼ਾਈਨ ਕੋਲ EQ ਅਤੇ ਵਾਲੀਅਮ ਬਣਾਉਣ ਲਈ ਕੁਝ ਨਹੀਂ ਹੁੰਦਾ।';

  @override
  String channelsSweepLength(int seconds) {
    return 'ਸਵੀਪ $seconds ਸਕਿੰ';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ ਭਰਨ ਤੋਂ ਬਾਅਦ ਤਸਦੀਕ';

  @override
  String get channelsVerifyAfterEqHint =>
      'ਬਿੰਦੂ \"EQ ਤੋਂ ਬਾਅਦ\" ਵਜੋਂ ਸੰਭਾਲਿਆ ਜਾਵੇਗਾ ਅਤੇ ਜਿਸ ਬਿੰਦੂ ਤੋਂ EQ ਗਿਣਿਆ ਗਿਆ ਸੀ ਉਸਨੂੰ ਨਹੀਂ ਬਦਲੇਗਾ।';

  @override
  String channelsRecording(String seconds) {
    return '$seconds ਸਕਿੰ ਰਿਕਾਰਡ ਹੋ ਰਿਹਾ ਹੈ — ਹੁਣ ਸਵੀਪ ਚਲਾਓ';
  }

  @override
  String get channelsNotMeasured => 'ਮਾਪਿਆ ਨਹੀਂ';

  @override
  String get channelsMeasuredNoise => 'ਨੋਇਜ਼ ਨਾਲ ਮਾਪਿਆ';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · ਸਿੱਧੀ ਆਵਾਜ਼ $ms ms ਵਿੱਚ';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · ਸਿੱਧੀ ਆਵਾਜ਼ $ms ms ਵਿੱਚ, T20 $t20 ਸਕਿੰ';
  }

  @override
  String get commonDone => 'ਹੋ ਗਿਆ';

  @override
  String get channelsMeasure => 'ਮਾਪੋ';

  @override
  String get channelsAdd => 'ਜੋੜੋ';

  @override
  String get channelsAgain => 'ਦੁਬਾਰਾ';

  @override
  String get compareTitle => 'ਤੁਲਨਾ';

  @override
  String get compareNeedsTwoPoints => 'ਤੁਲਨਾ ਲਈ ਘੱਟੋ-ਘੱਟ ਦੋ ਬਿੰਦੂ ਚਾਹੀਦੇ ਹਨ।';

  @override
  String get commonWithRoom => 'ਕਮਰੇ ਸਮੇਤ';

  @override
  String get commonDirectSound => 'ਸਿੱਧੀ ਆਵਾਜ਼';

  @override
  String get compareAfterEq => 'EQ ਤੋਂ ਬਾਅਦ';

  @override
  String get compareBandsA => 'A (ਬੈਂਡ)';

  @override
  String get compareBandsB => 'B (ਬੈਂਡ)';

  @override
  String get compareArrivalDiff => 'ਪਹੁੰਚਣ ਦੇ ਸਮੇਂ ਦਾ ਫ਼ਰਕ A − B';

  @override
  String get compareBroadbandDiff => 'ਚੌੜੇ ਬੈਂਡ ਪੱਧਰ ਦਾ ਫ਼ਰਕ A − B';

  @override
  String get compareWorstBelow300 => '300 Hz ਤੋਂ ਹੇਠਾਂ ਸਭ ਤੋਂ ਵੱਡਾ ਫ਼ਰਕ';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz ਬੈਂਡ ਵਿੱਚ $db dB';
  }

  @override
  String get compareTrimNote =>
      'ਡਿਸਟੈਂਸ ਅਤੇ ਲੈਵਲ ਟ੍ਰਿਮ ਪਹੁੰਚਣ ਦੇ ਸਮੇਂ ਅਤੇ ਪੱਧਰ ਦੇ ਫ਼ਰਕ ਨੂੰ ਬਰਾਬਰ ਕਰਦੇ ਹਨ। 300 Hz ਤੋਂ ਹੇਠਾਂ ਸ਼ਕਲ ਦੇ ਫ਼ਰਕ ਨੂੰ ਨਹੀਂ ਕਰਦੇ — ਉਹ ਹੋਰ ਦੂਰੀ ਤੇ ਹੋਰ ਕੰਧ ਕਰਕੇ ਹੁੰਦਾ ਹੈ ਅਤੇ ਥਾਂ ਬਦਲ ਕੇ ਹੱਲ ਹੁੰਦਾ ਹੈ।';

  @override
  String get designRt60Live => 'ਆਖ਼ਰੀ ਪ੍ਰਤੀਕਿਰਿਆ ਤੋਂ T20 125–500 Hz';

  @override
  String get designRt60Stored => 'ਸੰਭਾਲੇ ਸਵੀਪ ਤੋਂ T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'ਅੰਦਾਜ਼ਾ — ਸਵੀਪ ਮਾਪੋ, ਸ਼ਰੋਡਰ ਹਾਲੇ ਸਿਰਫ਼ ਸੰਕੇਤ ਹੈ';

  @override
  String get designExportTooltip => 'ਕੌਂਫ਼ਿਗਰੇਸ਼ਨ ਐਕਸਪੋਰਟ';

  @override
  String get designCompute => 'ਡਿਜ਼ਾਈਨ ਗਿਣੋ';

  @override
  String get designLidarChecking => 'ਜਾਂਚ ਹੋ ਰਹੀ ਹੈ ਕਿ LiDAR ਹੈ ਜਾਂ ਨਹੀਂ…';

  @override
  String get designLidarAvailable => 'LiDAR ਉਪਲਬਧ ਹੈ';

  @override
  String get designLidarMissing => 'LiDAR ਨਹੀਂ — ਮਾਪ ਹੱਥੀਂ ਭਰੋ';

  @override
  String get designLidarHint =>
      'ਸਕੈਨ ਕੰਧਾਂ ਨੂੰ ਸੈਂਟੀਮੀਟਰ ਦੀ ਸ਼ੁੱਧਤਾ ਨਾਲ ਦਿੰਦਾ ਹੈ, ਇਸ ਲਈ ਸਿਰਫ਼ ਮੋਡ ਨਹੀਂ, ਪ੍ਰਤੀਬਿੰਬ ਬਿੰਦੂ ਅਤੇ ਹੱਦਾਂ ਤੱਕ ਦੂਰੀ ਵੀ ਸਹੀ ਬੈਠਦੇ ਹਨ।';

  @override
  String get designManualHint =>
      'ਮੋਡ ਗਣਨਾ ਲਈ ਤਿੰਨ ਅੰਕ ਹੀ ਕਾਫ਼ੀ ਹਨ — ਪਰ ਪ੍ਰਤੀਬਿੰਬ ਬਿੰਦੂ ਅਤੇ ਕੰਧਾਂ ਤੱਕ ਸਹੀ ਦੂਰੀ ਗੁਆਚ ਜਾਂਦੀ ਹੈ।';

  @override
  String get designStopScan => 'ਸਕੈਨ ਮੁਕਾਓ';

  @override
  String get designScanRoom => 'ਕਮਰਾ ਸਕੈਨ ਕਰੋ';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls ਕੰਧਾਂ',
      one: '1 ਕੰਧ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings ਖੁੱਲ੍ਹਾਂ',
      one: '1 ਖੁੱਲ੍ਹ',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'ਕਮਰੇ ਦੇ ਮਾਪ';

  @override
  String get designLength => 'ਲੰਬਾਈ';

  @override
  String get designWidth => 'ਚੌੜਾਈ';

  @override
  String get designHeight => 'ਉਚਾਈ';

  @override
  String get designWhatToDo => 'ਇਸ ਦਾ ਕੀ ਕਰੀਏ';

  @override
  String get designRoomModes => 'ਕਮਰੇ ਦੇ ਮੋਡ';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (ਸ਼ਰੋਡਰ) ਤੋਂ ਉੱਪਰ ਇਕੱਲੇ ਮੋਡਾਂ ਦਾ ਕੋਈ ਮਤਲਬ ਨਹੀਂ। RT60 $rt60 ਸਕਿੰ: $source।';
  }

  @override
  String get designEqTitle => 'EQ: ਮਾਪਿਆ, ਟੀਚਾ, ਅਨੁਮਾਨ';

  @override
  String get designEqHelp =>
      'ਅਨੁਮਾਨ ਮਾਪੀ ਹੋਈ ਪ੍ਰਤੀਕਿਰਿਆ ਅਤੇ ਰਿਸੀਵਰ ਦੇ ਪੰਦਰਾਂ-ਬੈਂਡ ਮਾਡਲ ਦਾ ਜੋੜ ਹੈ। EQ ਭਰਨ ਤੋਂ ਬਾਅਦ, ਮਾਡਲ ਕਿੰਨਾ ਨੇੜੇ ਸੀ ਇਹ ਵੇਖਣ ਲਈ \"EQ ਤੋਂ ਬਾਅਦ\" ਸਵਿੱਚ ਚਾਲੂ ਕਰਕੇ ਚੈਨਲ ਦੁਬਾਰਾ ਮਾਪੋ।';

  @override
  String get designReceiverConfig => 'ਰਿਸੀਵਰ ਕੌਂਫ਼ਿਗਰੇਸ਼ਨ';

  @override
  String get designGeometryOnly =>
      'ਸਵੀਪ ਨਾਲ ਚੈਨਲ ਮਾਪੇ ਬਿਨਾਂ ਸਿਰਫ਼ ਜਿਓਮੈਟਰੀ ਹੈ: ਦੂਰੀਆਂ ਅਤੇ ਕ੍ਰੌਸਓਵਰ ਆਵਿਰਤੀਆਂ। ਹਰ ਚੈਨਲ ਦੇ ਬਿੰਦੂ ਹੋਣ ਤੇ EQ ਅਤੇ ਵਾਲੀਅਮ ਜੁੜ ਜਾਣਗੇ।';

  @override
  String get designShareSubject => 'ਕੌਂਫ਼ਿਗਰੇਸ਼ਨ ਸੁਝਾਅ';

  @override
  String get impulseTitle => 'ਇੰਪਲਸ ਪ੍ਰਤੀਕਿਰਿਆ';

  @override
  String get impulseCompareTooltip => 'ਬਿੰਦੂਆਂ ਦੀ ਤੁਲਨਾ ਕਰੋ';

  @override
  String get impulseExportTooltip => 'ਫ਼ੇਜ਼ ਸਮੇਤ FRD ਐਕਸਪੋਰਟ';

  @override
  String get impulseTapToStart => 'ਸ਼ੁਰੂ ਕਰਨ ਲਈ ਟੈਪ ਕਰੋ।';

  @override
  String get impulseSweepTitle => 'ਸਪੀਕਰਾਂ ਨੂੰ ਚਲਾਉਣ ਵਾਲਾ ਸਵੀਪ';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds ਸਕਿੰ। ਇਹ ਉਸ ਨਾਲ ਮੇਲ ਖਾਣਾ ਚਾਹੀਦਾ ਹੈ ਜੋ ਤੁਸੀਂ ਚਲਾਉਂਦੇ ਹੋ — ਨਹੀਂ ਤਾਂ ਡੀਕੌਨਵੋਲਿਊਸ਼ਨ ਬੇਮਤਲਬ ਨਤੀਜਾ ਦੇਵੇਗਾ।';
  }

  @override
  String impulseRecording(String seconds) {
    return 'ਰਿਕਾਰਡ ਹੋ ਰਿਹਾ ਹੈ — $seconds ਸਕਿੰ';
  }

  @override
  String get impulsePlaySweepNow => 'ਹੁਣ ਕੰਪਿਊਟਰ ਤੋਂ ਸਵੀਪ ਚਲਾਓ।';

  @override
  String get impulseStartRecording => 'ਰਿਕਾਰਡਿੰਗ ਸ਼ੁਰੂ ਕਰੋ, ਫਿਰ ਸਵੀਪ ਚਲਾਓ';

  @override
  String get impulseFrequencyResponse => 'ਆਵਿਰਤੀ ਪ੍ਰਤੀਕਿਰਿਆ';

  @override
  String get impulseWithRoom => 'ਕਮਰੇ ਸਮੇਤ (1 ਸਕਿੰ)';

  @override
  String impulseDirectWindow(String ms) {
    return 'ਸਿੱਧੀ ਆਵਾਜ਼ (ਵਿੰਡੋ $ms ms)';
  }

  @override
  String get impulseWindow => 'ਵਿੰਡੋ';

  @override
  String impulseWindowHelp(String hz) {
    return 'ਲੰਬੀ ਵਿੰਡੋ ਹੋਰ ਹੇਠਲੀਆਂ ਆਵਿਰਤੀਆਂ ਵੇਖਦੀ ਹੈ (ਹੁਣ $hz Hz ਤੋਂ ਉੱਪਰ ਜਾਇਜ਼), ਪਰ ਪਹਿਲਾ ਪ੍ਰਤੀਬਿੰਬ ਵੀ ਅੰਦਰ ਆ ਜਾਂਦਾ ਹੈ। ਇਸ ਹੱਦ ਤੋਂ ਹੇਠਾਂ ਵਕਰ ਨੂੰ ਨਾ ਮੁਲਾਇਮ ਕੀਤਾ ਜਾਂਦਾ ਹੈ ਨਾ ਉਸ ਤੇ ਟਿੱਪਣੀ: ਇਹ ਵਿੰਡੋ ਹੈ, ਕਮਰਾ ਨਹੀਂ।';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'ਪਹਿਲੇ ਪ੍ਰਤੀਬਿੰਬ ਤੱਕ ($ms ms)';
  }

  @override
  String get impulseTime => 'ਸਮਾਂ';

  @override
  String get impulseImpulse => 'ਇੰਪਲਸ';

  @override
  String get impulseTimeHelp =>
      'ਨੀਲਾ ਵਿੰਡੋ ਹੈ, ਸੰਤਰੀ ਲਕੀਰ ਮਿਲਿਆ ਪਹਿਲਾ ਪ੍ਰਤੀਬਿੰਬ ਹੈ। ਸਮਾਂ ਸਿਫ਼ਰ ਸਿੱਧੀ ਆਵਾਜ਼ ਹੈ।';

  @override
  String get impulseSpectrogram => 'ਸਪੈਕਟ੍ਰੋਗ੍ਰਾਮ';

  @override
  String get commonHide => 'ਲੁਕਾਓ';

  @override
  String get commonShow => 'ਵਿਖਾਓ';

  @override
  String get impulseSpectrogramHelp =>
      'ਸਿੱਧੀ ਆਵਾਜ਼ ਤੋਂ ms ਵਿੱਚ ਸਮਾਂ, ਆਵਿਰਤੀ ਉੱਪਰ ਵੱਲ, ਰੰਗ −60 dB ਤੱਕ ਦਾ ਪੱਧਰ। ਬਾਕੀ ਮਿਟ ਜਾਣ ਤੇ ਵੀ ਬਚੀ ਰਹਿਣ ਵਾਲੀ ਲੇਟਵੀਂ ਪੱਟੀ ਇੱਕ ਮੋਡ ਹੈ; ਉੱਪਰਲੀ ਸਾਰਣੀ ਉਹੀ ਗੱਲ ਅੰਕਾਂ ਵਿੱਚ ਕਹਿੰਦੀ ਹੈ।';

  @override
  String get impulseDecayByOctave => 'ਸਪਤਕ ਅਨੁਸਾਰ ਘਟਾਅ';

  @override
  String get impulseMidNoT20 => 'ਵਿਚਕਾਰਲੇ ਬੈਂਡ T20 ਲਈ ਕਾਫ਼ੀ ਨਹੀਂ ਡਿੱਗੇ।';

  @override
  String impulseMidT20(String seconds) {
    return 'ਵਿਚਕਾਰਲਾ 125–500 Hz: T20 $seconds ਸਕਿੰ — ਡਿਜ਼ਾਈਨ ਇਹੀ RT60 ਵਰਤਦਾ ਹੈ।';
  }

  @override
  String get impulseDecayHelp =>
      'ਬੇਸ ਵਿੱਚ ਫ਼ੋਨ ਤੋਂ ਮਿਲਿਆ RT60 ਅੰਦਾਜ਼ਾ ਹੀ ਹੈ: ਉੱਥੇ ਪਿਛੋਕੜ ਦਾ ਸ਼ੋਰ ਸਭ ਤੋਂ ਨੇੜੇ ਹੁੰਦਾ ਹੈ ਅਤੇ \"—\" ਦਾ ਮਤਲਬ ਹੈ ਗੂੰਜ ਉਸ ਤੋਂ ਹੇਠਾਂ ਨਹੀਂ ਉਤਰੀ। C50 ਸਿਫ਼ਰ ਤੋਂ ਉੱਪਰ: ਸਿੱਧੀ ਆਵਾਜ਼ ਤੇ ਪਹਿਲੇ ਪ੍ਰਤੀਬਿੰਬ ਗੂੰਜ ਨਾਲੋਂ ਵੱਧ ਊਰਜਾ ਲਿਆਉਂਦੇ ਹਨ।';

  @override
  String get impulseResult => 'ਨਤੀਜਾ';

  @override
  String get impulseDirectArrived => 'ਸਿੱਧੀ ਆਵਾਜ਼ ਪਹੁੰਚੀ';

  @override
  String get impulseDirectArrivedHelp =>
      'ਪਲੇਬੈਕ ਦੇਰੀ ਅਤੇ ਸਫ਼ਰ ਦਾ ਸਮਾਂ — ਆਪਣੇ-ਆਪ ਵਿੱਚ ਕੁਝ ਨਹੀਂ ਦੱਸਦਾ, ਪਰ L ਅਤੇ R ਸਪੀਕਰ ਦਾ ਫ਼ਰਕ ਦੱਸਦਾ ਹੈ।';

  @override
  String get impulseFirstReflection => 'ਪਹਿਲਾ ਪ੍ਰਤੀਬਿੰਬ';

  @override
  String get impulseNotFound => 'ਨਹੀਂ ਮਿਲਿਆ';

  @override
  String impulseAfterDirect(String time) {
    return 'ਸਿੱਧੀ ਆਵਾਜ਼ ਤੋਂ $time ਬਾਅਦ';
  }

  @override
  String get impulseNoReflectionHelp =>
      'ਜਾਂ ਤਾਂ ਕੋਈ ਨਹੀਂ ਹੈ, ਜਾਂ ਸਿੱਧੇ ਇੰਪਲਸ ਦੀ ਗੂੰਜ ਵਿੱਚ ਲੁਕਿਆ ਹੋਇਆ ਹੈ।';

  @override
  String impulseExtraPath(String metres) {
    return 'ਵਾਧੂ ਰਾਹ ≈ $metres ਮੀ।';
  }

  @override
  String get impulseUnmeasurable => 'ਮਾਪਿਆ ਨਹੀਂ ਜਾ ਸਕਦਾ';

  @override
  String get impulseRt60NoiseHelp =>
      'ਗੂੰਜ ਪਿਛੋਕੜ ਦੇ ਸ਼ੋਰ ਤੋਂ ਕਾਫ਼ੀ ਉੱਪਰ ਤੱਕ ਨਹੀਂ ਡਿੱਗੀ — ਉੱਚੀ ਕਰੋ, ਜਾਂ ਸ਼ਾਂਤ ਵੇਲੇ ਮਾਪੋ।';

  @override
  String get impulseRt60Help =>
      'T20 ਅਤੇ T30 ਦਾ ਫ਼ਰਕ ਦੱਸਦਾ ਹੈ ਕਿ ਘਟਾਅ ਕਿੰਨਾ ਸਾਫ਼ ਹੈ।';

  @override
  String get impulseGating => 'ਵਿੰਡੋ (ਗੇਟਿੰਗ)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz ਤੋਂ ਉੱਪਰ ਜਾਇਜ਼';
  }

  @override
  String get impulseGatingHelp =>
      'ਉਸ ਤੋਂ ਹੇਠਾਂ ਵਿੰਡੋ ਨੂੰ ਇੱਕ ਚੱਕਰ ਵੀ ਨਹੀਂ ਦਿੱਸਦਾ — ਉੱਥੋਂ ਦਾ ਵਕਰ ਵਿੰਡੋ ਦਾ ਨਕਲੀ ਪ੍ਰਭਾਵ ਹੈ, ਕਮਰੇ ਦਾ ਨਹੀਂ।';

  @override
  String get impulseSchroeder => 'ਸ਼ਰੋਡਰ ਘਟਾਅ ਵਕਰ';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz ਤੇ HD$order';
  }

  @override
  String get impulseHd2Help =>
      'ਹਾਰਮੋਨਿਕ ਫ਼ਾਰੀਨਾ ਡੀਕੌਨਵੋਲਿਊਸ਼ਨ ਦੇ ਰਿਣਾਤਮਕ ਸਮੇਂ ਵਿੱਚ ਹਨ; ਇੱਥੇ ਉਨ੍ਹਾਂ ਨੂੰ ਸੁੱਟਣ ਦੀ ਥਾਂ ਉੱਥੋਂ ਪੜ੍ਹਿਆ ਜਾਂਦਾ ਹੈ। −40 dB ਮਤਲਬ 1 %।';

  @override
  String get impulseHd3Help =>
      'ਤੀਜਾ ਹਾਰਮੋਨਿਕ ਓਵਰਲੋਡ ਨਾਲ ਦੂਜੇ ਨਾਲੋਂ ਤੇਜ਼ ਵਧਦਾ ਹੈ।';

  @override
  String get impulseDistortionHot => '−30 dB ਤੋਂ ਉੱਪਰ ਵਿਗਾੜ';

  @override
  String get impulseDistortionHotHelp =>
      'ਜਾਂ ਤਾਂ ਸਵੀਪ ਬਹੁਤ ਉੱਚਾ ਹੈ, ਜਾਂ ਸਪੀਕਰ ਹੱਦ ਤੇ ਹੈ। ਵਿਗਾੜ ਦੀ ਪੂਛ ਇੰਪਲਸ ਵਿੱਚ ਪ੍ਰਤੀਬਿੰਬ ਵਰਗੀ ਲੱਗਦੀ ਹੈ — ਕਿਸੇ ਗੱਲ ਤੇ ਯਕੀਨ ਕਰਨ ਤੋਂ ਪਹਿਲਾਂ ਵਾਲੀਅਮ ਘਟਾ ਕੇ ਦੁਬਾਰਾ ਮਾਪੋ।';

  @override
  String get eqMeasured => 'ਮਾਪਿਆ';

  @override
  String get eqTarget => 'ਟੀਚਾ';

  @override
  String get eqPredicted => 'EQ ਤੋਂ ਬਾਅਦ ਅਨੁਮਾਨ';

  @override
  String get eqMeasuredAfter => 'EQ ਤੋਂ ਬਾਅਦ ਮਾਪਿਆ';

  @override
  String eqDeviation(int maxHz) {
    return 'ਟੀਚੇ ਤੋਂ ਭਟਕਾਅ 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'ਰਿਸੀਵਰ ਵਿੱਚ ਭਰਨ ਤੋਂ ਬਾਅਦ';

  @override
  String get eqPredictionVsReality => 'ਅਨੁਮਾਨ ਬਨਾਮ ਹਕੀਕਤ';

  @override
  String eqStubborn(String bands) {
    return 'ਟੀਚੇ ਤੋਂ 6 dB ਤੋਂ ਵੱਧ ਦੂਰ ਰਹੇਗਾ: $bands। ਇਹ ਦਖ਼ਲ ਹੈ, ਤਾਕਤ ਦੀ ਕਮੀ ਨਹੀਂ — ਹੋਰ ਚੁੱਕਣ ਨਾਲ ਨਹੀਂ, ਸਪੀਕਰ ਜਾਂ ਸੁਣਨ ਵਾਲੇ ਦੀ ਥਾਂ ਬਦਲਣ ਨਾਲ ਹੱਲ ਹੁੰਦਾ ਹੈ।';
  }

  @override
  String get eqModelOk => 'ਰਿਸੀਵਰ ਦਾ ਫ਼ਿਲਟਰ ਲਗਭਗ ਮਾਡਲ ਵਾਂਗ ਵਿਹਾਰ ਕਰਦਾ ਹੈ।';

  @override
  String get eqModelOff =>
      'ਰਿਸੀਵਰ ਦਾ ਅਸਲ ਫ਼ਿਲਟਰ ਉਮੀਦ ਤੋਂ ਵੱਧ ਮਾਡਲ ਤੋਂ ਵੱਖਰਾ ਹੈ — ਉਸਦੇ ਬੈਂਡ ਇੱਥੇ ਮੰਨੇ ਗਏ ਨਾਲੋਂ ਚੌੜੇ ਜਾਂ ਤੰਗ ਹੋ ਸਕਦੇ ਹਨ।';

  @override
  String get eqTargetCurve => 'ਟੀਚਾ ਵਕਰ';

  @override
  String get eqFlat => 'ਸਮਤਲ';

  @override
  String get eqTargetHelp =>
      'ਸਮਤਲ ਨਹੀਂ: ਕੁਝ kHz ਤੋਂ ਉੱਪਰ ਕੰਨ ਸਿੱਧੀ ਆਵਾਜ਼ ਸੁਣਦਾ ਹੈ, ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਪ੍ਰਤੀਬਿੰਬ ਵੀ ਜੋੜ ਲੈਂਦਾ ਹੈ, ਅਤੇ ਮਾਪੇ ਵਕਰ ਨੂੰ ਸਮਤਲ ਕਰਨ ਤੇ ਆਵਾਜ਼ ਧੁੰਦਲੀ ਲੱਗਦੀ ਹੈ। ਉੱਪਰ ਹਲਕੀ ਢਲਾਣ ਤੇ ਹੇਠਾਂ ਥੋੜ੍ਹਾ ਬੇਸ ਉਹ ਹੈ ਜੋ ਲੋਕ ਅੰਨ੍ਹੀ ਸੁਣਵਾਈ ਵਿੱਚ ਚੁਣਦੇ ਹਨ।';

  @override
  String get eqBassLift => 'ਬੇਸ ਉਭਾਰ';

  @override
  String get eqBassBelow => 'ਬੇਸ ਹੇਠਾਂ';

  @override
  String get eqTilt => 'ਢਲਾਣ';

  @override
  String get eqDbPerOctave => 'dB/ਸਪਤਕ';

  @override
  String get eqTiltFrom => 'ਢਲਾਣ ਇੱਥੋਂ';

  @override
  String get errorMicPermission =>
      'ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਦੀ ਪਹੁੰਚ ਤੋਂ ਬਿਨਾਂ ਮਾਪ ਨਹੀਂ ਹੋ ਸਕਦਾ। ਸੈਟਿੰਗਾਂ → AudioScanner → ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਵਿੱਚ ਇਜਾਜ਼ਤ ਦਿਓ।';

  @override
  String errorMic(String error) {
    return 'ਮਾਈਕ੍ਰੋਫ਼ੋਨ: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਚਾਲੂ ਨਹੀਂ ਹੋਇਆ: $error';
  }

  @override
  String get errorNoArkit =>
      'ਇਹ ਡਿਵਾਈਸ ARKit ਵਰਲਡ ਟ੍ਰੈਕਿੰਗ ਦਾ ਸਮਰਥਨ ਨਹੀਂ ਕਰਦੀ — ਬਿੰਦੂ ਥਾਂ ਵਿੱਚ ਨਹੀਂ ਰੱਖੇ ਜਾ ਸਕਦੇ।';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'ਰਿਕਾਰਡਿੰਗ ਸਵੀਪ ਤੋਂ ਛੋਟੀ ਹੈ ($expected ਸਕਿੰ ਵਿੱਚੋਂ $recorded ਸਕਿੰ)। ਸਿਗਨਲ ਚਲਾਉਣ ਤੋਂ ਪਹਿਲਾਂ ਰਿਕਾਰਡਿੰਗ ਸ਼ੁਰੂ ਕਰੋ।';
  }

  @override
  String get sessionSnapshots => 'ਸਨੈਪਸ਼ਾਟ';

  @override
  String get errorTrackingUnreliable =>
      'ਸਥਿਤੀ ਟ੍ਰੈਕਿੰਗ ਭਰੋਸੇਯੋਗ ਨਹੀਂ — ਬਿੰਦੂ ਤੁਹਾਡੇ ਖੜ੍ਹੇ ਹੋਣ ਦੀ ਥਾਂ ਤੋਂ ਵੱਖਰੀ ਥਾਂ ਤੇ ਬੈਠ ਸਕਦਾ ਹੈ।';

  @override
  String errorNoSound(int seconds) {
    return '$seconds ਸਕਿੰ ਵਿੱਚ ਕੋਈ ਆਵਾਜ਼ ਨਹੀਂ ਪਹੁੰਚੀ।';
  }

  @override
  String get noteSnapshotNoPose => 'ਵਿਸ਼ਲੇਸ਼ਕ ਤੋਂ ਸਨੈਪਸ਼ਾਟ, ਸਥਿਤੀ ਨਹੀਂ';

  @override
  String get sessionChannels => 'ਚੈਨਲ';

  @override
  String get trackingOk => 'ਟ੍ਰੈਕਿੰਗ ਠੀਕ';

  @override
  String get trackingLimited => 'ਕਮਜ਼ੋਰ ਟ੍ਰੈਕਿੰਗ';

  @override
  String get trackingUnavailable => 'ਟ੍ਰੈਕਿੰਗ ਨਹੀਂ';

  @override
  String get poseHintFeatures =>
      'ਤਸਵੀਰ ਵਿੱਚ ਵੇਰਵੇ ਬਹੁਤ ਘੱਟ ਹਨ — ਖ਼ਾਲੀ ਕੰਧ ਵੱਲ ਨਹੀਂ, ਬਣਤਰ ਵਾਲੀ ਕਿਸੇ ਚੀਜ਼ ਵੱਲ ਫ਼ੋਨ ਕਰੋ।';

  @override
  String get poseHintMotion => 'ਬਹੁਤ ਤੇਜ਼ ਹਰਕਤ — ਹੌਲੀ ਚੱਲੋ।';

  @override
  String get poseHintLight =>
      'ਰੋਸ਼ਨੀ ਘੱਟ ਹੈ — ਬੱਤੀ ਜਗਾਓ, ਕੈਮਰੇ ਨੂੰ ਪਤਾ ਨਹੀਂ ਲੱਗ ਰਿਹਾ ਕਿ ਉਹ ਕਿੱਥੇ ਹੈ।';

  @override
  String get poseHintInitializing =>
      'ARKit ਸ਼ੁਰੂ ਹੋ ਰਿਹਾ ਹੈ, ਕੁਝ ਦੇਰ ਹਿਲਦੇ ਰਹੋ।';

  @override
  String get poseHintRelocalizing =>
      'ਮੂਲ ਬਿੰਦੂ ਲੱਭਿਆ ਜਾ ਰਿਹਾ ਹੈ — ਜਿੱਥੋਂ ਸ਼ੁਰੂ ਕੀਤਾ ਸੀ ਉੱਥੇ ਮੁੜੋ।';

  @override
  String get signalPhonePink => 'ਫ਼ੋਨ ਤੋਂ ਪਿੰਕ ਨੋਇਜ਼';

  @override
  String get signalExternalPink => 'ਸਪੀਕਰਾਂ ਤੋਂ ਪਿੰਕ ਨੋਇਜ਼';

  @override
  String get signalExternalSweep => 'ਸਪੀਕਰਾਂ ਤੋਂ ਸਵੀਪ';

  @override
  String get captureWarningBluetooth =>
      'ਬਲੂਟੁੱਥ ਮਾਈਕ੍ਰੋਫ਼ੋਨ: ਕੰਪ੍ਰੈਸ਼ਨ ਅਤੇ ਦੇਰੀ ਮਾਪ ਖ਼ਰਾਬ ਕਰਦੇ ਹਨ। ਹੈੱਡਫ਼ੋਨ ਕੱਟ ਕੇ ਅੰਦਰੂਨੀ ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਨਾਲ ਮਾਪੋ।';

  @override
  String get captureWarningProcessing =>
      'ਸਿਸਟਮ ਨੇ ਸਿਗਨਲ ਪ੍ਰੋਸੈਸਿੰਗ (AGC / ਸ਼ੋਰ ਦਬਾਅ) ਬੰਦ ਨਹੀਂ ਕੀਤੀ। ਥਾਵਾਂ ਵਿਚਕਾਰ ਮਾਪੇ ਫ਼ਰਕ ਵਿਗੜ ਜਾਣਗੇ।';

  @override
  String get captureWarningMeasurementMode =>
      'ਮਾਪ ਮੋਡ ਚਾਲੂ ਨਹੀਂ ਹੋ ਸਕਿਆ — ਮਾਈਕ੍ਰੋਫ਼ੋਨ ਦੀ ਆਪਣੀ ਆਵਿਰਤੀ ਪ੍ਰਤੀਕਿਰਿਆ ਸੁਧਾਈ ਹੈ।';

  @override
  String get captureRouteUnknown => 'ਅਣਜਾਣ';

  @override
  String get axisLength => 'ਲੰਬਾਈ';

  @override
  String get axisWidth => 'ਚੌੜਾਈ';

  @override
  String get axisHeight => 'ਉਚਾਈ';
}
