// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Oriya (`or`).
class AppLocalizationsOr extends AppLocalizations {
  AppLocalizationsOr([String locale = 'or']) : super(locale);

  @override
  String get tabScan => 'ସ୍କାନ';

  @override
  String get tabMap => 'ମାନଚିତ୍ର';

  @override
  String get tabResponse => 'ପ୍ରତିକ୍ରିୟା';

  @override
  String get tabDesign => 'ଡିଜାଇନ';

  @override
  String get tabSignals => 'ସଙ୍କେତ';

  @override
  String get rtaSnapshotFailed => 'ସ୍ନାପସଟ୍ ସଞ୍ଚୟ ହେଲା ନାହିଁ।';

  @override
  String rtaSavedAsPoint(String id) {
    return 'ବିନ୍ଦୁ $id ଭାବେ ସଞ୍ଚୟ ହେଲା।';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'ବିନ୍ଦୁ $id ଭାବେ ସଞ୍ଚୟ ହେଲା (ସ୍ଥାନ ବିନା)।';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ବିନ୍ଦୁ',
      one: '1 ବିନ୍ଦୁ',
    );
    return 'କାଲିବ୍ରେସନ $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'ଫାଇଲ ପଢ଼ାଯାଇପାରୁନାହିଁ: $message';
  }

  @override
  String get rtaOffsetTitle => 'ଅଫସେଟ dB SPL';

  @override
  String get rtaOffsetHelp =>
      '1 kHz ସ୍ୱର ଚଲାନ୍ତୁ, SPL ମିଟରରେ ସ୍ତର ପଢ଼ନ୍ତୁ ଏବଂ ବିଶ୍ଳେଷକ ଯାହା ଦେଖାଉଛି ତାହା ସହ ପାର୍ଥକ୍ୟ ଦିଅନ୍ତୁ। ଅଫସେଟ ଶୂନ୍ୟ ନହେଲେ ସ୍ତର ଅନୁମାନିତ SPL ଭାବେ ଚିହ୍ନିତ ହୁଏ; ନହେଲେ dBFS ହିଁ ରହେ।';

  @override
  String get commonReset => 'ରିସେଟ';

  @override
  String get commonCancel => 'ବାତିଲ';

  @override
  String get commonSave => 'ସଞ୍ଚୟ';

  @override
  String get commonStop => 'ବନ୍ଦ';

  @override
  String get commonStartMic => 'ମାଇକ୍ରୋଫୋନ ଆରମ୍ଭ';

  @override
  String get tabAnalyzer => 'ବିଶ୍ଳେଷକ';

  @override
  String get rtaUnfreeze => 'ଫ୍ରିଜ ହଟାନ୍ତୁ';

  @override
  String get rtaFreeze => 'ଫ୍ରିଜ';

  @override
  String get rtaPeakHold => 'ପିକ ହୋଲ୍ଡ';

  @override
  String get rtaMaxMinTraces => 'ସର୍ବାଧିକ / ସର୍ବନିମ୍ନ ରେଖା';

  @override
  String get rtaResetTraces => 'ରେଖା ରିସେଟ';

  @override
  String get rtaSaveAsPoint => 'ବିନ୍ଦୁ ଭାବେ ସଞ୍ଚୟ (3 ସେ)';

  @override
  String get rtaMicCalibration => 'ମାଇକ୍ରୋଫୋନ କାଲିବ୍ରେସନ…';

  @override
  String get rtaRemoveCalibration => 'କାଲିବ୍ରେସନ ହଟାନ୍ତୁ';

  @override
  String get rtaOffsetMenu => 'ଅଫସେଟ dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · ସଙ୍କେତ ପ୍ରକ୍ରିୟାକରଣ ନାହିଁ';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ବିନ୍ଦୁ',
      one: '1 ବିନ୍ଦୁ',
    );
    return 'କାଲିବ୍ରେସନ $name: $_temp0, ସଂଶୋଧନ $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (ଅନୁମାନ)';

  @override
  String get rtaFrozenHint =>
      'ଫ୍ରିଜ ହୋଇଛି — ମାଇକ୍ରୋଫୋନ ଚାଲୁଛି, କେବଳ ଆଙ୍କାଯାଉନାହିଁ।';

  @override
  String get rtaRelativeHint =>
      'ସ୍ତର ଆପେକ୍ଷିକ (dBFS)। ପ୍ରଥମ ବିନ୍ଦୁ ସଞ୍ଚୟ କଲେ ରୂପରେଖା ଦେଖାଯିବ — ସେଇଟି ଅନ୍ୟମାନଙ୍କ ପାଇଁ ସୂଚକ।';

  @override
  String get rtaReferenceHint =>
      'ପୂର୍ଣ୍ଣ ଖୁଣ୍ଟ = ଏଠାରେ। ରୂପରେଖା = ସୂଚକ ବିନ୍ଦୁ।';

  @override
  String get rtaEnvelopeHint => 'ନାଲି = ସର୍ବାଧିକ, ସବୁଜ = ରିସେଟ ପରେ ସର୍ବନିମ୍ନ।';

  @override
  String get rtaMicStopped => 'ମାଇକ୍ରୋଫୋନ ବନ୍ଦ';

  @override
  String get rtaSilence => 'ନୀରବ — ସଙ୍କେତ ଚାଲୁଛି କି?';

  @override
  String get rtaPlaceholder => 'ମାଇକ୍ରୋଫୋନ ଆରମ୍ଭ କରି କୋଠରୀକୁ ସଙ୍କେତ ଚଲାନ୍ତୁ।';

  @override
  String rtaBandsInfo(int count) {
    return '$count ତୃତୀୟାଂଶ-ଅକ୍ଟେଭ ବ୍ୟାଣ୍ଡ, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'କୋଠରୀ ସ୍କାନ';

  @override
  String scanPointCount(int count) {
    return '$count ବି.';
  }

  @override
  String get commonMicNotRunning => 'ମାଇକ୍ରୋଫୋନ ଚାଲୁନାହିଁ';

  @override
  String get scanMicNeeded => 'ଏହା ବିନା କେବଳ ସ୍ଥାନ ମପାଯିବ, ଧ୍ୱନି ନୁହେଁ।';

  @override
  String get scanContinuous => 'ନିରନ୍ତର ମାପ';

  @override
  String get scanContinuousHint => 'ପ୍ରତି 0.5 ମି ଚାଲିଲେ ବିନ୍ଦୁ ସ୍ୱୟଂଚାଳିତ';

  @override
  String get scanMeasuring => 'ମପାଯାଉଛି…';

  @override
  String get scanMeasureHere => 'ଏଠାରେ ମାପନ୍ତୁ';

  @override
  String scanPointSaved(String id, String position) {
    return 'ବିନ୍ଦୁ $id କୁ $position ରେ ସଞ୍ଚୟ କରାଗଲା';
  }

  @override
  String get scanStartTracking => 'ସ୍ଥାନ ଟ୍ରାକିଂ ଆରମ୍ଭ';

  @override
  String get scanStartTrackingHint =>
      'ARKit — ଏହା ଦ୍ୱାରା ଆପ ଜାଣେ ଆପଣ କୋଠରୀରେ କେଉଁଠି ଠିଆ ହୋଇଛନ୍ତି।';

  @override
  String scanPosition(String position) {
    return 'ସ୍ଥାନ: ମୂଳବିନ୍ଦୁରୁ $position ମି';
  }

  @override
  String get scanSetOriginHint =>
      'ଶୁଣିବା ସ୍ଥାନରେ ଠିଆ ହୋଇ ମୂଳବିନ୍ଦୁ ସ୍ଥିର କରନ୍ତୁ।';

  @override
  String get scanOriginHere => 'ଏଠାରେ ମୂଳବିନ୍ଦୁ';

  @override
  String get scanNoPoints => 'ଏପର୍ଯ୍ୟନ୍ତ କୌଣସି ବିନ୍ଦୁ ନାହିଁ।';

  @override
  String scanPointStats(String variation, String rms) {
    return '40–300 Hz ବିସ୍ତାର: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'ବସିବା ଘର';

  @override
  String get scanNewMeasurement => 'ନୂଆ ମାପ';

  @override
  String get scanRoomName => 'କୋଠରୀର ନାମ';

  @override
  String get scanExcitation => 'କୋଠରୀକୁ କଣ ଦ୍ୱାରା ଉତ୍ତେଜିତ କରିବେ';

  @override
  String get scanPhoneNoiseHint =>
      'କେବଳ ଆନୁମାନିକ — ଫୋନ ସ୍ପିକର ପ୍ରାୟ ବାସ ଦିଏ ନାହିଁ।';

  @override
  String get scanStart => 'ଆରମ୍ଭ';

  @override
  String get mapExportTooltip => 'FRD + JSON ରପ୍ତାନି';

  @override
  String get mapNeedsTwoPoints =>
      'ମାନଚିତ୍ରକୁ ଅତିକମରେ ଦୁଇଟି ବିନ୍ଦୁ ଦରକାର। କୋଠରୀରେ ଚାଲି ମାପୁଥାନ୍ତୁ।';

  @override
  String get mapShareText =>
      'ବିନ୍ଦୁ ଅନୁସାରେ FRD (REW / VituixCAD ରେ ଆମଦାନି) ଏବଂ ସମ୍ପୂର୍ଣ୍ଣ ସେସନ JSON ରୂପେ।';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'ସବୁଠୁ ସମତଳ ସ୍ଥାନ: $position ମି ରେ $id (40–300 Hz ରେ ବିସ୍ତାର $variation dB)';
  }

  @override
  String get signalsSweepHelp =>
      'ଇମ୍ପଲ୍ସ ପ୍ରତିକ୍ରିୟା, ପ୍ରତିଧ୍ୱନି ସମୟ ଓ ପ୍ରଥମ ପ୍ରତିଫଳନ ଗଣନା କରିହେଉଥିବା ଏକମାତ୍ର ସଙ୍କେତ। କମ୍ପ୍ୟୁଟର କିମ୍ବା DAC ରୁ ସ୍ପିକରକୁ ଚଲାନ୍ତୁ, ଫୋନ ରେକର୍ଡ କରୁ।';

  @override
  String get signalsLength => 'ଅବଧି';

  @override
  String get signalsFrom => 'ଠାରୁ';

  @override
  String get signalsTo => 'ପର୍ଯ୍ୟନ୍ତ';

  @override
  String get signalsMonoNoChannel => 'ମନୋ (ଚ୍ୟାନେଲ ନାହିଁ)';

  @override
  String get signalsExportWav => 'WAV ରପ୍ତାନି';

  @override
  String get signalsPinkNoise => 'ପିଙ୍କ ନଏଜ';

  @override
  String get signalsPinkHelp =>
      'ପ୍ରତ୍ୟେକ ଅକ୍ଟେଭରେ ସମାନ ଶକ୍ତି। କେବଳ ଆବୃତ୍ତି ପ୍ରତିକ୍ରିୟା ମିଳେ, ସମୟ କି ପ୍ରତିଫଳନ ନୁହେଁ — \"ଏଠାରେ କିଛି ବଦଳୁଛି କି?\" ଭଳି ଶୀଘ୍ର ପରୀକ୍ଷା ପାଇଁ ଯଥେଷ୍ଟ।';

  @override
  String get signalsExportPink => '30 ସେ WAV ରପ୍ତାନି';

  @override
  String get signalsHowTo => 'କିପରି ମାପିବେ';

  @override
  String get signalsStep1 =>
      'ସଙ୍କେତକୁ କମ୍ପ୍ୟୁଟରରୁ ସ୍ପିକରକୁ ଚଲାନ୍ତୁ, ଫୋନରୁ ନୁହେଁ।';

  @override
  String get signalsStep2 =>
      'ଭଲ୍ୟୁମ ଏପରି ରଖନ୍ତୁ ଯେ ବିଶ୍ଳେଷକ ପ୍ରାୟ −20 dBFS ଦେଖାଉ। ଓଭରଲୋଡ ପ୍ରତିଫଳନ ପରି ଦିଶେ।';

  @override
  String get signalsStep3 =>
      'ଫୋନକୁ ସିଧା ଧରନ୍ତୁ, ହାତ ଲମ୍ବାଇ, ମାଇକ୍ରୋଫୋନ ସ୍ପିକର ଆଡ଼କୁ।';

  @override
  String get signalsStep4 =>
      'ବ୍ଲୁଟୁଥ ହେଡଫୋନ ଅଲଗା କରନ୍ତୁ — ସଙ୍କୋଚନ ଓ ବିଳମ୍ବ ମାପକୁ ନଷ୍ଟ କରେ।';

  @override
  String get signalsNoteMono =>
      'ମନୋକୁ ଦୁଇ ସ୍ପିକରକୁ ଏକାଥରେ ପଠାଇଲେ L ଓ R ଯୋଗ ହୁଏ ଏବଂ ସେମାନଙ୍କ ପାର୍ଥକ୍ୟ ଯୋଗଫଳରେ ହଜିଯାଏ। ଚ୍ୟାନେଲ ମାପିବାକୁ ଚ୍ୟାନେଲ ବାଛନ୍ତୁ।';

  @override
  String get signalsNoteStereo =>
      'ସଙ୍କେତ କେବଳ ଗୋଟିଏ ଚ୍ୟାନେଲରେ ଥିବା ଷ୍ଟେରିଓ ଫାଇଲ — ଷ୍ଟେରିଓ ଚଲାଉଥିବା ଯେକୌଣସି ଉପକରଣ ଏହାକୁ ଚଲାଇବ।';

  @override
  String get signalsNoteChannel =>
      'ଚ୍ୟାନେଲ ନାମରେ ମନୋ ଫାଇଲ। DAW କିମ୍ବା ବହୁ-ଚ୍ୟାନେଲ ଇନପୁଟ ମାଧ୍ୟମରେ ରିସିଭରର ସଠିକ ଇନପୁଟକୁ ପଠାନ୍ତୁ; ଷ୍ଟେରିଓ ଆଉଟପୁଟ ଥିବା ଲାପଟପ ଏହାକୁ ଏହି ଚ୍ୟାନେଲକୁ ପହଞ୍ଚାଇପାରିବ ନାହିଁ।';

  @override
  String get channelsTitle => 'ଚ୍ୟାନେଲ ମାପ';

  @override
  String get channelsHelp =>
      'ଶୁଣିବା ସ୍ଥାନରେ ଠିଆ ହୁଅନ୍ତୁ। ପ୍ରତ୍ୟେକ ଚ୍ୟାନେଲ ପାଇଁ: ରେକର୍ଡିଂ ଆରମ୍ଭ କରନ୍ତୁ, ସଙ୍କେତ ଟ୍ୟାବର ସ୍ୱୀପ ତାହାକୁ ଚଲାନ୍ତୁ, ସରିଲା ଦବାନ୍ତୁ। ଏହି ବିନ୍ଦୁ ବିନା ଡିଜାଇନ ପାଖରେ EQ ଓ ଭଲ୍ୟୁମ ତିଆରି କରିବାକୁ କିଛି ନାହିଁ।';

  @override
  String channelsSweepLength(int seconds) {
    return 'ସ୍ୱୀପ $seconds ସେ';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ ଦେବା ପରେ ଯାଞ୍ଚ';

  @override
  String get channelsVerifyAfterEqHint =>
      'ବିନ୍ଦୁ \"EQ ପରେ\" ଭାବେ ସଞ୍ଚୟ ହେବ ଏବଂ EQ ଗଣନା ହୋଇଥିବା ବିନ୍ଦୁକୁ ବଦଳାଇବ ନାହିଁ।';

  @override
  String channelsRecording(String seconds) {
    return '$seconds ସେ ରେକର୍ଡ ହେଉଛି — ଏବେ ସ୍ୱୀପ ଚଲାନ୍ତୁ';
  }

  @override
  String get channelsNotMeasured => 'ମପାଯାଇନାହିଁ';

  @override
  String get channelsMeasuredNoise => 'ନଏଜ ଦ୍ୱାରା ମପାଯାଇଛି';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · ସିଧା ଧ୍ୱନି $ms ms ରେ';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · ସିଧା ଧ୍ୱନି $ms ms ରେ, T20 $t20 ସେ';
  }

  @override
  String get commonDone => 'ସରିଲା';

  @override
  String get channelsMeasure => 'ମାପନ୍ତୁ';

  @override
  String get channelsAdd => 'ଯୋଡ଼ନ୍ତୁ';

  @override
  String get channelsAgain => 'ପୁଣି';

  @override
  String get compareTitle => 'ତୁଳନା';

  @override
  String get compareNeedsTwoPoints => 'ତୁଳନା ପାଇଁ ଅତିକମରେ ଦୁଇଟି ବିନ୍ଦୁ ଦରକାର।';

  @override
  String get commonWithRoom => 'କୋଠରୀ ସହ';

  @override
  String get commonDirectSound => 'ସିଧା ଧ୍ୱନି';

  @override
  String get compareAfterEq => 'EQ ପରେ';

  @override
  String get compareBandsA => 'A (ବ୍ୟାଣ୍ଡ)';

  @override
  String get compareBandsB => 'B (ବ୍ୟାଣ୍ଡ)';

  @override
  String get compareArrivalDiff => 'ପହଞ୍ଚିବା ସମୟର ପାର୍ଥକ୍ୟ A − B';

  @override
  String get compareBroadbandDiff => 'ବିସ୍ତୃତ ବ୍ୟାଣ୍ଡ ସ୍ତର ପାର୍ଥକ୍ୟ A − B';

  @override
  String get compareWorstBelow300 => '300 Hz ତଳେ ସବୁଠୁ ବଡ଼ ପାର୍ଥକ୍ୟ';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz ବ୍ୟାଣ୍ଡରେ $db dB';
  }

  @override
  String get compareTrimNote =>
      'ଡିଷ୍ଟାନ୍ସ ଓ ଲେଭେଲ ଟ୍ରିମ ପହଞ୍ଚିବା ସମୟ ଓ ସ୍ତରର ପାର୍ଥକ୍ୟକୁ ସମାନ କରେ। 300 Hz ତଳର ଆକୃତି ପାର୍ଥକ୍ୟକୁ କରେ ନାହିଁ — ତାହା ଅନ୍ୟ ଦୂରତାର ଅନ୍ୟ ପ୍ରାଚୀର ଯୋଗୁଁ, ସ୍ଥାନ ବଦଳାଇ ସମାଧାନ ହୁଏ।';

  @override
  String get designRt60Live => 'ଶେଷ ପ୍ରତିକ୍ରିୟାରୁ T20 125–500 Hz';

  @override
  String get designRt60Stored => 'ସଞ୍ଚିତ ସ୍ୱୀପରୁ T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'ଅନୁମାନ — ସ୍ୱୀପ ମାପନ୍ତୁ, ଶ୍ରୋଡର ବର୍ତ୍ତମାନ କେବଳ ସୂଚନା';

  @override
  String get designExportTooltip => 'ବିନ୍ୟାସ ରପ୍ତାନି';

  @override
  String get designCompute => 'ଡିଜାଇନ ଗଣନା କରନ୍ତୁ';

  @override
  String get designLidarChecking => 'LiDAR ଅଛି କି ନାହିଁ ଯାଞ୍ଚ ହେଉଛି…';

  @override
  String get designLidarAvailable => 'LiDAR ଉପଲବ୍ଧ';

  @override
  String get designLidarMissing => 'LiDAR ନାହିଁ — ମାପ ହାତରେ ଦିଅନ୍ତୁ';

  @override
  String get designLidarHint =>
      'ସ୍କାନ ପ୍ରାଚୀରକୁ ସେଣ୍ଟିମିଟର ସଠିକତାରେ ଦିଏ, ତେଣୁ କେବଳ ମୋଡ ନୁହେଁ, ପ୍ରତିଫଳନ ବିନ୍ଦୁ ଓ ସୀମାକୁ ଦୂରତା ମଧ୍ୟ ଠିକ ହୁଏ।';

  @override
  String get designManualHint =>
      'ମୋଡ ଗଣନା ପାଇଁ ତିନୋଟି ସଂଖ୍ୟା ଯଥେଷ୍ଟ — କିନ୍ତୁ ପ୍ରତିଫଳନ ବିନ୍ଦୁ ଓ ପ୍ରାଚୀରକୁ ସଠିକ ଦୂରତା ହରାଇବେ।';

  @override
  String get designStopScan => 'ସ୍କାନ ସମାପ୍ତ କରନ୍ତୁ';

  @override
  String get designScanRoom => 'କୋଠରୀ ସ୍କାନ କରନ୍ତୁ';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls ପ୍ରାଚୀର',
      one: '1 ପ୍ରାଚୀର',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings ଖୋଲା ସ୍ଥାନ',
      one: '1 ଖୋଲା ସ୍ଥାନ',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'କୋଠରୀର ମାପ';

  @override
  String get designLength => 'ଲମ୍ବ';

  @override
  String get designWidth => 'ଚଉଡ଼ା';

  @override
  String get designHeight => 'ଉଚ୍ଚତା';

  @override
  String get designWhatToDo => 'ଏହାର ସମାଧାନ କ\'ଣ';

  @override
  String get designRoomModes => 'କୋଠରୀର ମୋଡ';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (ଶ୍ରୋଡର) ଉପରେ ଏକକ ମୋଡର ଅର୍ଥ ନାହିଁ। RT60 $rt60 ସେ: $source।';
  }

  @override
  String get designEqTitle => 'EQ: ମପାଯାଇଥିବା, ଲକ୍ଷ୍ୟ, ପୂର୍ବାନୁମାନ';

  @override
  String get designEqHelp =>
      'ପୂର୍ବାନୁମାନ ହେଉଛି ମପାଯାଇଥିବା ପ୍ରତିକ୍ରିୟା ଏବଂ ରିସିଭରର ପନ୍ଦର-ବ୍ୟାଣ୍ଡ ମଡେଲ। EQ ଦେବା ପରେ, ମଡେଲ କେତେ ନିକଟ ଥିଲା ଦେଖିବାକୁ \"EQ ପରେ\" ସୁଇଚ ଚାଲୁ କରି ଚ୍ୟାନେଲକୁ ପୁଣି ମାପନ୍ତୁ।';

  @override
  String get designReceiverConfig => 'ରିସିଭର ବିନ୍ୟାସ';

  @override
  String get designGeometryOnly =>
      'ସ୍ୱୀପ ଦ୍ୱାରା ଚ୍ୟାନେଲ ମପା ନହେଲେ କେବଳ ଜ୍ୟାମିତି ଅଛି: ଦୂରତା ଓ କ୍ରସଓଭର ଆବୃତ୍ତି। ପ୍ରତ୍ୟେକ ଚ୍ୟାନେଲର ବିନ୍ଦୁ ହେଲେ EQ ଓ ଭଲ୍ୟୁମ ଯୋଡ଼ାଯିବ।';

  @override
  String get designShareSubject => 'ବିନ୍ୟାସ ପ୍ରସ୍ତାବ';

  @override
  String get impulseTitle => 'ଇମ୍ପଲ୍ସ ପ୍ରତିକ୍ରିୟା';

  @override
  String get impulseCompareTooltip => 'ବିନ୍ଦୁ ତୁଳନା କରନ୍ତୁ';

  @override
  String get impulseExportTooltip => 'ଫେଜ ସହ FRD ରପ୍ତାନି';

  @override
  String get impulseTapToStart => 'ଆରମ୍ଭ କରିବାକୁ ଟାପ କରନ୍ତୁ।';

  @override
  String get impulseSweepTitle => 'ସ୍ପିକରକୁ ଚଳାଇବାକୁ ସ୍ୱୀପ';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds ସେ। ଆପଣ ଯାହା ଚଲାଉଛନ୍ତି ତାହା ସହ ମେଳ ଖାଇବା ଜରୁରୀ — ନହେଲେ ଡିକନ୍ଭଲ୍ୟୁସନ ଅର୍ଥହୀନ ଫଳ ଦିଏ।';
  }

  @override
  String impulseRecording(String seconds) {
    return 'ରେକର୍ଡ ହେଉଛି — $seconds ସେ';
  }

  @override
  String get impulsePlaySweepNow => 'ଏବେ କମ୍ପ୍ୟୁଟରରୁ ସ୍ୱୀପ ଚଲାନ୍ତୁ।';

  @override
  String get impulseStartRecording =>
      'ରେକର୍ଡିଂ ଆରମ୍ଭ କରନ୍ତୁ, ତା\'ପରେ ସ୍ୱୀପ ଚଲାନ୍ତୁ';

  @override
  String get impulseFrequencyResponse => 'ଆବୃତ୍ତି ପ୍ରତିକ୍ରିୟା';

  @override
  String get impulseWithRoom => 'କୋଠରୀ ସହ (1 ସେ)';

  @override
  String impulseDirectWindow(String ms) {
    return 'ସିଧା ଧ୍ୱନି (ୱିଣ୍ଡୋ $ms ms)';
  }

  @override
  String get impulseWindow => 'ୱିଣ୍ଡୋ';

  @override
  String impulseWindowHelp(String hz) {
    return 'ଲମ୍ବା ୱିଣ୍ଡୋ ଅଧିକ ନିମ୍ନ ଆବୃତ୍ତି ଦେଖେ (ବର୍ତ୍ତମାନ $hz Hz ଉପରେ ବୈଧ), କିନ୍ତୁ ପ୍ରଥମ ପ୍ରତିଫଳନକୁ ମଧ୍ୟ ଭିତରକୁ ଛାଡ଼େ। ଏହି ସୀମା ତଳେ ବକ୍ରରେଖାକୁ ମସୃଣ କରାଯାଏ ନାହିଁ କି ମନ୍ତବ୍ୟ ଦିଆଯାଏ ନାହିଁ: ଏହା ୱିଣ୍ଡୋ, କୋଠରୀ ନୁହେଁ।';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'ପ୍ରଥମ ପ୍ରତିଫଳନ ପର୍ଯ୍ୟନ୍ତ ($ms ms)';
  }

  @override
  String get impulseTime => 'ସମୟ';

  @override
  String get impulseImpulse => 'ଇମ୍ପଲ୍ସ';

  @override
  String get impulseTimeHelp =>
      'ନୀଳ ହେଉଛି ୱିଣ୍ଡୋ, କମଳା ରେଖା ମିଳିଥିବା ପ୍ରଥମ ପ୍ରତିଫଳନ। ସମୟ ଶୂନ୍ୟ ହେଉଛି ସିଧା ଧ୍ୱନି।';

  @override
  String get impulseSpectrogram => 'ସ୍ପେକ୍ଟ୍ରୋଗ୍ରାମ';

  @override
  String get commonHide => 'ଲୁଚାନ୍ତୁ';

  @override
  String get commonShow => 'ଦେଖାନ୍ତୁ';

  @override
  String get impulseSpectrogramHelp =>
      'ସିଧା ଧ୍ୱନିରୁ ms ରେ ସମୟ, ଆବୃତ୍ତି ଉପର ଦିଗରେ, ରଙ୍ଗ −60 dB ପର୍ଯ୍ୟନ୍ତ ସ୍ତର। ଅନ୍ୟ ସବୁ ମଳିନ ହେଲେ ମଧ୍ୟ ରହୁଥିବା ଆଡ଼ ପଟି ଏକ ମୋଡ; ଉପରର ଟେବୁଲ ସେଇ କଥା ସଂଖ୍ୟାରେ କହେ।';

  @override
  String get impulseDecayByOctave => 'ଅକ୍ଟେଭ ଅନୁସାରେ କ୍ଷୟ';

  @override
  String get impulseMidNoT20 => 'ମଧ୍ୟମ ବ୍ୟାଣ୍ଡ T20 ପାଇଁ ଯଥେଷ୍ଟ ଖସିଲା ନାହିଁ।';

  @override
  String impulseMidT20(String seconds) {
    return 'ମଧ୍ୟମ 125–500 Hz: T20 $seconds ସେ — ଡିଜାଇନ ବ୍ୟବହାର କରୁଥିବା RT60 ଏହା।';
  }

  @override
  String get impulseDecayHelp =>
      'ବାସରେ ଫୋନରୁ ମିଳିଥିବା RT60 ଅନୁମାନ ମାତ୍ର: ସେଠାରେ ପୃଷ୍ଠଭୂମି ଶବ୍ଦ ସବୁଠୁ ନିକଟ ଏବଂ \"—\" ର ଅର୍ଥ ପ୍ରତିଧ୍ୱନି ତା\' ତଳକୁ ଖସିଲା ନାହିଁ। C50 ଶୂନ୍ୟ ଉପରେ: ସିଧା ଧ୍ୱନି ଓ ପ୍ରଥମ ପ୍ରତିଫଳନ ପ୍ରତିଧ୍ୱନିଠାରୁ ଅଧିକ ଶକ୍ତି ବହନ କରେ।';

  @override
  String get impulseResult => 'ଫଳାଫଳ';

  @override
  String get impulseDirectArrived => 'ସିଧା ଧ୍ୱନି ପହଞ୍ଚିଲା';

  @override
  String get impulseDirectArrivedHelp =>
      'ପ୍ଲେବ୍ୟାକ ବିଳମ୍ବ ସହ ଯାତ୍ରା ସମୟ — ଏହା ନିଜେ କିଛି କହେ ନାହିଁ, କିନ୍ତୁ L ଓ R ସ୍ପିକର ମଧ୍ୟରେ ପାର୍ଥକ୍ୟ କହେ।';

  @override
  String get impulseFirstReflection => 'ପ୍ରଥମ ପ୍ରତିଫଳନ';

  @override
  String get impulseNotFound => 'ମିଳିଲା ନାହିଁ';

  @override
  String impulseAfterDirect(String time) {
    return 'ସିଧା ଧ୍ୱନିର $time ପରେ';
  }

  @override
  String get impulseNoReflectionHelp =>
      'ହୟ ସେଠି କିଛି ନାହିଁ, ନହେଲେ ସିଧା ଇମ୍ପଲ୍ସର ରିଙ୍ଗିଂରେ ଲୁଚିଛି।';

  @override
  String impulseExtraPath(String metres) {
    return 'ଅତିରିକ୍ତ ପଥ ≈ $metres ମି।';
  }

  @override
  String get impulseUnmeasurable => 'ମପାଯାଇପାରିବ ନାହିଁ';

  @override
  String get impulseRt60NoiseHelp =>
      'ପ୍ରତିଧ୍ୱନି ପୃଷ୍ଠଭୂମି ଶବ୍ଦ ଉପରେ ଯଥେଷ୍ଟ ଗଭୀରକୁ ଖସିଲା ନାହିଁ — ଜୋରରେ କରନ୍ତୁ, ନହେଲେ ଅଧିକ ଶାନ୍ତ ସମୟରେ ମାପନ୍ତୁ।';

  @override
  String get impulseRt60Help =>
      'T20 ଓ T30 ମଧ୍ୟରେ ପାର୍ଥକ୍ୟ କ୍ଷୟ କେତେ ସଫା ତାହା ସୂଚାଏ।';

  @override
  String get impulseGating => 'ୱିଣ୍ଡୋ (ଗେଟିଂ)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz ଉପରେ ବୈଧ';
  }

  @override
  String get impulseGatingHelp =>
      'ତାହା ତଳେ ୱିଣ୍ଡୋ ଗୋଟିଏ ଆବର୍ତ୍ତନ ମଧ୍ୟ ଦେଖେ ନାହିଁ — ସେଠାର ବକ୍ରରେଖା ୱିଣ୍ଡୋର କୃତ୍ରିମ ପ୍ରଭାବ, କୋଠରୀର ନୁହେଁ।';

  @override
  String get impulseSchroeder => 'ଶ୍ରୋଡର କ୍ଷୟ ବକ୍ରରେଖା';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz ରେ HD$order';
  }

  @override
  String get impulseHd2Help =>
      'ହାର୍ମୋନିକ ଫାରିନା ଡିକନ୍ଭଲ୍ୟୁସନର ଋଣାତ୍ମକ ସମୟରେ ଅଛି; ଏଠାରେ ସେଗୁଡ଼ିକୁ ଫିଙ୍ଗିବା ବଦଳେ ସେଠୁ ପଢ଼ାଯାଏ। −40 dB ମାନେ 1 %।';

  @override
  String get impulseHd3Help =>
      'ତୃତୀୟ ହାର୍ମୋନିକ ଓଭରଲୋଡ ସହ ଦ୍ୱିତୀୟଠାରୁ ଶୀଘ୍ର ବଢ଼େ।';

  @override
  String get impulseDistortionHot => '−30 dB ଉପରେ ବିକୃତି';

  @override
  String get impulseDistortionHotHelp =>
      'ହୟ ସ୍ୱୀପ ବହୁତ ଜୋରରେ, ନହେଲେ ସ୍ପିକର ସୀମାରେ। ବିକୃତିର ଲାଞ୍ଜ ଇମ୍ପଲ୍ସରେ ପ୍ରତିଫଳନ ପରି ଦିଶେ — କିଛି ବିଶ୍ୱାସ କରିବା ପୂର୍ବରୁ ଭଲ୍ୟୁମ କମାଇ ପୁଣି ମାପନ୍ତୁ।';

  @override
  String get eqMeasured => 'ମପାଯାଇଥିବା';

  @override
  String get eqTarget => 'ଲକ୍ଷ୍ୟ';

  @override
  String get eqPredicted => 'EQ ପରେ ପୂର୍ବାନୁମାନ';

  @override
  String get eqMeasuredAfter => 'EQ ପରେ ମପାଯାଇଥିବା';

  @override
  String eqDeviation(int maxHz) {
    return 'ଲକ୍ଷ୍ୟରୁ ବିଚଳନ 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'ରିସିଭରରେ ଦେବା ପରେ';

  @override
  String get eqPredictionVsReality => 'ପୂର୍ବାନୁମାନ ବନାମ ବାସ୍ତବତା';

  @override
  String eqStubborn(String bands) {
    return 'ଲକ୍ଷ୍ୟଠାରୁ 6 dB ରୁ ଅଧିକ ଦୂରରେ ରହିବ: $bands। ଏହା ଅନ୍ତରାୟ, ଶକ୍ତି ଅଭାବ ନୁହେଁ — ଆହୁରି ବଢ଼ାଇ ନୁହେଁ, ସ୍ପିକର କିମ୍ବା ଶ୍ରୋତାଙ୍କ ସ୍ଥାନ ବଦଳାଇ ସମାଧାନ ହୁଏ।';
  }

  @override
  String get eqModelOk => 'ରିସିଭରର ଫିଲ୍ଟର ପ୍ରାୟ ମଡେଲ ପରି ଆଚରଣ କରୁଛି।';

  @override
  String get eqModelOff =>
      'ରିସିଭରର ପ୍ରକୃତ ଫିଲ୍ଟର ଆଶା ଠାରୁ ଅଧିକ ମଡେଲରୁ ଭିନ୍ନ — ଏହାର ବ୍ୟାଣ୍ଡ ଏଠାରେ ଧରାଯାଇଥିବା ଠାରୁ ଚଉଡ଼ା କିମ୍ବା ସଂକୀର୍ଣ୍ଣ ହୋଇପାରେ।';

  @override
  String get eqTargetCurve => 'ଲକ୍ଷ୍ୟ ବକ୍ରରେଖା';

  @override
  String get eqFlat => 'ସମତଳ';

  @override
  String get eqTargetHelp =>
      'ସମତଳ ନୁହେଁ: କିଛି kHz ଉପରେ କାନ ସିଧା ଧ୍ୱନି ଶୁଣେ, ମାଇକ୍ରୋଫୋନ ପ୍ରତିଫଳନକୁ ମଧ୍ୟ ଯୋଗ କରେ, ଏବଂ ମପାଯାଇଥିବା ବକ୍ରରେଖାକୁ ସମତଳ କଲେ ଧ୍ୱନି ମଳିନ ଲାଗେ। ଉପରେ ଟିକିଏ ଢାଲୁ ଓ ତଳେ ଟିକିଏ ବାସ ଲୋକେ ଅନ୍ଧ ଶୁଣାରେ ବାଛନ୍ତି।';

  @override
  String get eqBassLift => 'ବାସ ଉଠାଣ';

  @override
  String get eqBassBelow => 'ବାସ ତଳେ';

  @override
  String get eqTilt => 'ଢାଲୁ';

  @override
  String get eqDbPerOctave => 'dB/ଅକ୍ଟେଭ';

  @override
  String get eqTiltFrom => 'ଢାଲୁ ଆରମ୍ଭ';

  @override
  String get errorMicPermission =>
      'ମାଇକ୍ରୋଫୋନ ଅନୁମତି ବିନା ମାପିହେବ ନାହିଁ। ସେଟିଂସ → AudioScanner → ମାଇକ୍ରୋଫୋନ ରେ ଅନୁମତି ଦିଅନ୍ତୁ।';

  @override
  String errorMic(String error) {
    return 'ମାଇକ୍ରୋଫୋନ: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'ମାଇକ୍ରୋଫୋନ ଆରମ୍ଭ ହେଲା ନାହିଁ: $error';
  }

  @override
  String get errorNoArkit =>
      'ଏହି ଉପକରଣ ARKit ୱାର୍ଲ୍ଡ ଟ୍ରାକିଂ ସମର୍ଥନ କରେ ନାହିଁ — ବିନ୍ଦୁ ସ୍ଥାନରେ ରଖିହେବ ନାହିଁ।';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'ରେକର୍ଡିଂ ସ୍ୱୀପଠାରୁ ଛୋଟ ($expected ସେ ମଧ୍ୟରୁ $recorded ସେ)। ସଙ୍କେତ ଚଲାଇବା ପୂର୍ବରୁ ରେକର୍ଡିଂ ଆରମ୍ଭ କରନ୍ତୁ।';
  }

  @override
  String get sessionSnapshots => 'ସ୍ନାପସଟ୍';

  @override
  String get errorTrackingUnreliable =>
      'ସ୍ଥାନ ଟ୍ରାକିଂ ଭରସାଯୋଗ୍ୟ ନୁହେଁ — ବିନ୍ଦୁ ଆପଣ ଠିଆ ହୋଇଥିବା ସ୍ଥାନରେ ନ ରହିପାରେ।';

  @override
  String errorNoSound(int seconds) {
    return '$seconds ସେ ମଧ୍ୟରେ କୌଣସି ଧ୍ୱନି ପହଞ୍ଚିଲା ନାହିଁ।';
  }

  @override
  String get noteSnapshotNoPose => 'ବିଶ୍ଳେଷକରୁ ସ୍ନାପସଟ୍, ସ୍ଥାନ ନାହିଁ';

  @override
  String get sessionChannels => 'ଚ୍ୟାନେଲ';

  @override
  String get trackingOk => 'ଟ୍ରାକିଂ ଠିକ';

  @override
  String get trackingLimited => 'ଦୁର୍ବଳ ଟ୍ରାକିଂ';

  @override
  String get trackingUnavailable => 'ଟ୍ରାକିଂ ନାହିଁ';

  @override
  String get poseHintFeatures =>
      'ଛବିରେ ବିବରଣ ବହୁତ କମ — ଖାଲି ପ୍ରାଚୀରକୁ ନୁହେଁ, ଗଠନ ଥିବା କିଛି ଆଡ଼କୁ ଫୋନ ଦେଖାନ୍ତୁ।';

  @override
  String get poseHintMotion => 'ବହୁତ ଦ୍ରୁତ ଗତି — ଧୀରେ ଚାଲନ୍ତୁ।';

  @override
  String get poseHintLight =>
      'ଆଲୋକ କମ — ଆଲୋକ ଜାଳନ୍ତୁ, କ୍ୟାମେରା ଜାଣିପାରୁନାହିଁ ସେ କେଉଁଠି ଅଛି।';

  @override
  String get poseHintInitializing =>
      'ARKit ଆରମ୍ଭ ହେଉଛି, କିଛି ସମୟ ଘୁରି ବୁଲନ୍ତୁ।';

  @override
  String get poseHintRelocalizing =>
      'ମୂଳ ବିନ୍ଦୁ ଖୋଜାଯାଉଛି — ଆପଣ ଆରମ୍ଭ କରିଥିବା ସ୍ଥାନକୁ ଫେରନ୍ତୁ।';

  @override
  String get signalPhonePink => 'ଫୋନରୁ ପିଙ୍କ ନଏଜ';

  @override
  String get signalExternalPink => 'ସ୍ପିକରରୁ ପିଙ୍କ ନଏଜ';

  @override
  String get signalExternalSweep => 'ସ୍ପିକରରୁ ସ୍ୱୀପ';

  @override
  String get captureWarningBluetooth =>
      'ବ୍ଲୁଟୁଥ ମାଇକ୍ରୋଫୋନ: ସଙ୍କୋଚନ ଓ ବିଳମ୍ବ ମାପକୁ ନଷ୍ଟ କରେ। ହେଡଫୋନ ଅଲଗା କରି ଭିତରର ମାଇକ୍ରୋଫୋନରେ ମାପନ୍ତୁ।';

  @override
  String get captureWarningProcessing =>
      'ସିଷ୍ଟମ ସଙ୍କେତ ପ୍ରକ୍ରିୟାକରଣ (AGC / ଶବ୍ଦ ଦମନ) ବନ୍ଦ କଲା ନାହିଁ। ସ୍ଥାନ ମଧ୍ୟରେ ମପାଯାଇଥିବା ପାର୍ଥକ୍ୟ ବିକୃତ ହେବ।';

  @override
  String get captureWarningMeasurementMode =>
      'ମାପ ମୋଡ ଚାଲୁ ହେଲା ନାହିଁ — ମାଇକ୍ରୋଫୋନର ନିଜସ୍ୱ ଆବୃତ୍ତି ପ୍ରତିକ୍ରିୟା ସଂଶୋଧନ ଅଛି।';

  @override
  String get captureRouteUnknown => 'ଅଜଣା';

  @override
  String get axisLength => 'ଲମ୍ବ';

  @override
  String get axisWidth => 'ଚଉଡ଼ା';

  @override
  String get axisHeight => 'ଉଚ୍ଚତା';
}
