// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Tamil (`ta`).
class AppLocalizationsTa extends AppLocalizations {
  AppLocalizationsTa([String locale = 'ta']) : super(locale);

  @override
  String get tabScan => 'ஸ்கேன்';

  @override
  String get tabMap => 'வரைபடம்';

  @override
  String get tabResponse => 'பதில்';

  @override
  String get tabDesign => 'வடிவமைப்பு';

  @override
  String get tabSignals => 'சமிக்ஞைகள்';

  @override
  String get rtaSnapshotFailed => 'ஸ்னாப்ஷாட் சேமிக்கப்படவில்லை.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'புள்ளி $id ஆகச் சேமிக்கப்பட்டது.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'புள்ளி $id ஆகச் சேமிக்கப்பட்டது (இடம் இல்லாமல்).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count புள்ளிகள்',
      one: '1 புள்ளி',
    );
    return 'அளவுத்திருத்தம் $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'கோப்பைப் படிக்க முடியவில்லை: $message';
  }

  @override
  String get rtaOffsetTitle => 'ஆஃப்செட் dB SPL';

  @override
  String get rtaOffsetHelp =>
      '1 kHz ஒலியை இயக்கி, SPL மீட்டரில் அளவைப் படித்து, அனலைசர் காட்டுவதற்கும் அதற்கும் உள்ள வேறுபாட்டை உள்ளிடவும். ஆஃப்செட் பூஜ்ஜியமாக இல்லாவிட்டால் அளவுகள் மதிப்பிடப்பட்ட SPL எனக் குறிக்கப்படும்; இல்லையெனில் dBFS ஆகவே இருக்கும்.';

  @override
  String get commonReset => 'மீட்டமை';

  @override
  String get commonCancel => 'ரத்துசெய்';

  @override
  String get commonSave => 'சேமி';

  @override
  String get commonStop => 'நிறுத்து';

  @override
  String get commonStartMic => 'மைக்ரோஃபோனைத் தொடங்கு';

  @override
  String get tabAnalyzer => 'அனலைசர்';

  @override
  String get rtaUnfreeze => 'முடக்கத்தை நீக்கு';

  @override
  String get rtaFreeze => 'முடக்கு';

  @override
  String get rtaPeakHold => 'பீக் ஹோல்ட்';

  @override
  String get rtaMaxMinTraces => 'அதிகபட்ச / குறைந்தபட்ச தடங்கள்';

  @override
  String get rtaResetTraces => 'தடங்களை மீட்டமை';

  @override
  String get rtaSaveAsPoint => 'புள்ளியாகச் சேமி (3 வி)';

  @override
  String get rtaMicCalibration => 'மைக்ரோஃபோன் அளவுத்திருத்தம்…';

  @override
  String get rtaRemoveCalibration => 'அளவுத்திருத்தத்தை நீக்கு';

  @override
  String get rtaOffsetMenu => 'ஆஃப்செட் dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · சமிக்ஞைச் செயலாக்கம் இல்லை';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count புள்ளிகள்',
      one: '1 புள்ளி',
    );
    return 'அளவுத்திருத்தம் $name: $_temp0, திருத்தம் $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (மதிப்பீடு)';

  @override
  String get rtaFrozenHint =>
      'முடக்கப்பட்டது — மைக்ரோஃபோன் தொடர்ந்து இயங்குகிறது, வரையப்படுவதில்லை.';

  @override
  String get rtaRelativeHint =>
      'அளவுகள் ஒப்பீட்டளவில் உள்ளவை (dBFS). முதல் புள்ளியைச் சேமித்ததும் வெளிக்கோடு தோன்றும் — அதுவே மற்றவற்றுக்கான குறிப்பு.';

  @override
  String get rtaReferenceHint =>
      'நிரம்பிய பட்டைகள் = இங்கே. வெளிக்கோடு = குறிப்புப் புள்ளி.';

  @override
  String get rtaEnvelopeHint =>
      'சிவப்பு = அதிகபட்சம், பச்சை = மீட்டமைத்த பின் குறைந்தபட்சம்.';

  @override
  String get rtaMicStopped => 'மைக்ரோஃபோன் நின்றுள்ளது';

  @override
  String get rtaSilence => 'அமைதி — சமிக்ஞை இயங்குகிறதா?';

  @override
  String get rtaPlaceholder =>
      'மைக்ரோஃபோனைத் தொடங்கி அறைக்குள் சமிக்ஞையை இயக்கவும்.';

  @override
  String rtaBandsInfo(int count) {
    return '$count மூன்றில் ஒரு ஆக்டேவ் பட்டைகள், 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'அறை ஸ்கேன்';

  @override
  String scanPointCount(int count) {
    return '$count பு.';
  }

  @override
  String get commonMicNotRunning => 'மைக்ரோஃபோன் இயங்கவில்லை';

  @override
  String get scanMicNeeded =>
      'இது இல்லாமல் இடம் மட்டுமே அளக்கப்படும், ஒலி அல்ல.';

  @override
  String get scanContinuous => 'தொடர் அளவீடு';

  @override
  String get scanContinuousHint =>
      'ஒவ்வொரு 0.5 மீ நடக்கும்போதும் தானாகப் புள்ளி';

  @override
  String get scanMeasuring => 'அளக்கிறது…';

  @override
  String get scanMeasureHere => 'இங்கே அளக்கவும்';

  @override
  String scanPointSaved(String id, String position) {
    return 'புள்ளி $id $position இல் சேமிக்கப்பட்டது';
  }

  @override
  String get scanStartTracking => 'இட கண்காணிப்பைத் தொடங்கு';

  @override
  String get scanStartTrackingHint =>
      'ARKit — இதன் மூலம் நீங்கள் அறையில் எங்கு நிற்கிறீர்கள் என்பதை ஆப் அறிகிறது.';

  @override
  String scanPosition(String position) {
    return 'இடம்: தொடக்கப்புள்ளியிலிருந்து $position மீ';
  }

  @override
  String get scanSetOriginHint =>
      'கேட்கும் இடத்தில் நின்று தொடக்கப்புள்ளியை அமைக்கவும்.';

  @override
  String get scanOriginHere => 'இதுவே தொடக்கப்புள்ளி';

  @override
  String get scanNoPoints => 'இன்னும் புள்ளிகள் இல்லை.';

  @override
  String scanPointStats(String variation, String rms) {
    return '40–300 Hz பரவல்: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'வரவேற்பறை';

  @override
  String get scanNewMeasurement => 'புதிய அளவீடு';

  @override
  String get scanRoomName => 'அறையின் பெயர்';

  @override
  String get scanExcitation => 'அறையை எதைக் கொண்டு தூண்டுவீர்கள்';

  @override
  String get scanPhoneNoiseHint =>
      'வழிகாட்டுதலுக்கு மட்டுமே — தொலைபேசி ஸ்பீக்கர் பேஸை கிட்டத்தட்ட வெளியிடாது.';

  @override
  String get scanStart => 'தொடங்கு';

  @override
  String get mapExportTooltip => 'FRD + JSON ஏற்றுமதி';

  @override
  String get mapNeedsTwoPoints =>
      'வரைபடத்துக்குக் குறைந்தது இரண்டு புள்ளிகள் வேண்டும். அறையில் நடந்து தொடர்ந்து அளக்கவும்.';

  @override
  String get mapShareText =>
      'புள்ளி வாரியாக FRD (REW / VituixCAD இல் இறக்குமதி) மற்றும் முழு அமர்வு JSON ஆக.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'மிகவும் சமமான இடம்: $position மீ இல் $id (40–300 Hz இல் பரவல் $variation dB)';
  }

  @override
  String get signalsSweepHelp =>
      'இம்பல்ஸ் பதில், எதிரொலி நேரம், முதல் பிரதிபலிப்புகள் ஆகியவற்றைக் கணக்கிடக்கூடிய ஒரே சமிக்ஞை. கணினி அல்லது DAC இலிருந்து ஸ்பீக்கர்களுக்கு இயக்கவும், தொலைபேசி பதிவு செய்யட்டும்.';

  @override
  String get signalsLength => 'நீளம்';

  @override
  String get signalsFrom => 'இருந்து';

  @override
  String get signalsTo => 'வரை';

  @override
  String get signalsMonoNoChannel => 'மோனோ (சேனல் இல்லை)';

  @override
  String get signalsExportWav => 'WAV ஏற்றுமதி';

  @override
  String get signalsPinkNoise => 'பிங்க் இரைச்சல்';

  @override
  String get signalsPinkHelp =>
      'ஒவ்வொரு ஆக்டேவிலும் சம ஆற்றல். அதிர்வெண் பதில் மட்டுமே கிடைக்கும், நேரமோ பிரதிபலிப்புகளோ இல்லை — \"இங்கே ஏதாவது மாறுகிறதா?\" என்ற விரைவுச் சோதனைக்குப் போதும்.';

  @override
  String get signalsExportPink => '30 வி WAV ஏற்றுமதி';

  @override
  String get signalsHowTo => 'எப்படி அளப்பது';

  @override
  String get signalsStep1 =>
      'சமிக்ஞையைக் கணினியிலிருந்து ஸ்பீக்கர்களுக்கு இயக்கவும், தொலைபேசியிலிருந்து அல்ல.';

  @override
  String get signalsStep2 =>
      'அனலைசர் சுமார் −20 dBFS காட்டுமாறு ஒலியளவை அமைக்கவும். அதிகச்சுமை பிரதிபலிப்பு போலத் தெரியும்.';

  @override
  String get signalsStep3 =>
      'தொலைபேசியை நேராக, கையை நீட்டி, மைக்ரோஃபோன் ஸ்பீக்கர்களை நோக்கிப் பிடிக்கவும்.';

  @override
  String get signalsStep4 =>
      'புளூடூத் ஹெட்ஃபோனைத் துண்டிக்கவும் — சுருக்கமும் தாமதமும் அளவீட்டைக் கெடுக்கும்.';

  @override
  String get signalsNoteMono =>
      'மோனோவை இரு ஸ்பீக்கர்களுக்கும் ஒரே நேரத்தில் அனுப்பினால் L மற்றும் R கூடிவிடும், அவற்றின் வேறுபாடு கூட்டுத்தொகையில் மறையும். சேனல்களை அளக்க சேனலைத் தேர்ந்தெடுக்கவும்.';

  @override
  String get signalsNoteStereo =>
      'சமிக்ஞை ஒரே சேனலில் மட்டும் உள்ள ஸ்டீரியோ கோப்பு — ஸ்டீரியோவை இயக்கும் எதுவும் இதை இயக்கும்.';

  @override
  String get signalsNoteChannel =>
      'சேனல் பெயரிடப்பட்ட மோனோ கோப்பு. DAW அல்லது பல-சேனல் உள்ளீடு வழியாக ரிசீவரின் சரியான உள்ளீட்டுக்கு அனுப்பவும்; ஸ்டீரியோ வெளியீடு கொண்ட மடிக்கணினியால் இதை இந்த சேனலுக்குச் சேர்க்க முடியாது.';

  @override
  String get channelsTitle => 'சேனல் அளவீடு';

  @override
  String get channelsHelp =>
      'கேட்கும் இடத்தில் நிற்கவும். ஒவ்வொரு சேனலுக்கும்: பதிவைத் தொடங்கி, சமிக்ஞைகள் தாவலின் ஸ்வீப்பை அதில் இயக்கி, முடிந்தது தட்டவும். இந்தப் புள்ளிகள் இல்லாமல் வடிவமைப்பிடம் EQ, ஒலியளவு உருவாக்க எதுவும் இல்லை.';

  @override
  String channelsSweepLength(int seconds) {
    return 'ஸ்வீப் $seconds வி';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ உள்ளிட்ட பின் சரிபார்ப்பு';

  @override
  String get channelsVerifyAfterEqHint =>
      'புள்ளி \"EQ க்குப் பின்\" எனச் சேமிக்கப்படும்; EQ கணக்கிடப்பட்ட புள்ளியை மேலெழுதாது.';

  @override
  String channelsRecording(String seconds) {
    return '$seconds வி பதிவாகிறது — இப்போது ஸ்வீப்பை இயக்கவும்';
  }

  @override
  String get channelsNotMeasured => 'அளக்கப்படவில்லை';

  @override
  String get channelsMeasuredNoise => 'இரைச்சலால் அளக்கப்பட்டது';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · நேரடி ஒலி $ms ms இல்';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · நேரடி ஒலி $ms ms இல், T20 $t20 வி';
  }

  @override
  String get commonDone => 'முடிந்தது';

  @override
  String get channelsMeasure => 'அளக்கவும்';

  @override
  String get channelsAdd => 'சேர்';

  @override
  String get channelsAgain => 'மீண்டும்';

  @override
  String get compareTitle => 'ஒப்பீடு';

  @override
  String get compareNeedsTwoPoints =>
      'ஒப்பீட்டுக்குக் குறைந்தது இரண்டு புள்ளிகள் வேண்டும்.';

  @override
  String get commonWithRoom => 'அறையுடன்';

  @override
  String get commonDirectSound => 'நேரடி ஒலி';

  @override
  String get compareAfterEq => 'EQ க்குப் பின்';

  @override
  String get compareBandsA => 'A (பட்டைகள்)';

  @override
  String get compareBandsB => 'B (பட்டைகள்)';

  @override
  String get compareArrivalDiff => 'வந்து சேரும் நேர வேறுபாடு A − B';

  @override
  String get compareBroadbandDiff => 'அகலப்பட்டை அளவு வேறுபாடு A − B';

  @override
  String get compareWorstBelow300 => '300 Hz க்குக் கீழ் மிகப் பெரிய வேறுபாடு';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz பட்டையில் $db dB';
  }

  @override
  String get compareTrimNote =>
      'டிஸ்டன்ஸ், லெவல் டிரிம் ஆகியவை வந்து சேரும் நேரம், அளவு வேறுபாடுகளைச் சமன் செய்யும். 300 Hz க்குக் கீழுள்ள வடிவ வேறுபாட்டைச் செய்யாது — அது வேறு தூரத்தில் உள்ள வேறு சுவரால் வருகிறது, இடத்தை நகர்த்தித் தீர்க்கப்படுகிறது.';

  @override
  String get designRt60Live => 'கடைசி பதிலிலிருந்து T20 125–500 Hz';

  @override
  String get designRt60Stored => 'சேமித்த ஸ்வீப்பிலிருந்து T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'மதிப்பீடு — ஸ்வீப்பை அளக்கவும், ஷ்ரோடர் இப்போதைக்கு குறிப்பு மட்டுமே';

  @override
  String get designExportTooltip => 'கட்டமைப்பு ஏற்றுமதி';

  @override
  String get designCompute => 'வடிவமைப்பைக் கணக்கிடு';

  @override
  String get designLidarChecking => 'LiDAR உள்ளதா என்று சோதிக்கிறது…';

  @override
  String get designLidarAvailable => 'LiDAR உள்ளது';

  @override
  String get designLidarMissing =>
      'LiDAR இல்லை — அளவுகளைக் கைமுறையாக உள்ளிடவும்';

  @override
  String get designLidarHint =>
      'ஸ்கேன் சுவர்களைச் சென்டிமீட்டர் துல்லியத்தில் தரும்; எனவே மோடுகள் மட்டுமல்ல, பிரதிபலிப்புப் புள்ளிகளும் எல்லைகளுக்கான தூரங்களும் பொருந்தும்.';

  @override
  String get designManualHint =>
      'மோடு கணக்கீட்டுக்கு மூன்று எண்கள் போதும் — ஆனால் பிரதிபலிப்புப் புள்ளிகளையும் சுவர்களுக்கான துல்லிய தூரங்களையும் இழப்பீர்கள்.';

  @override
  String get designStopScan => 'ஸ்கேனை முடி';

  @override
  String get designScanRoom => 'அறையை ஸ்கேன் செய்';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls சுவர்கள்',
      one: '1 சுவர்',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings திறப்புகள்',
      one: '1 திறப்பு',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'அறையின் அளவுகள்';

  @override
  String get designLength => 'நீளம்';

  @override
  String get designWidth => 'அகலம்';

  @override
  String get designHeight => 'உயரம்';

  @override
  String get designWhatToDo => 'இதற்கு என்ன செய்வது';

  @override
  String get designRoomModes => 'அறையின் மோடுகள்';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (ஷ்ரோடர்) க்கு மேல் தனித்தனி மோடுகளுக்குப் பொருள் இல்லை. RT60 $rt60 வி: $source.';
  }

  @override
  String get designEqTitle => 'EQ: அளந்தது, இலக்கு, முன்கணிப்பு';

  @override
  String get designEqHelp =>
      'முன்கணிப்பு என்பது அளந்த பதிலுடன் ரிசீவரின் பதினைந்து-பட்டை மாதிரி சேர்ந்தது. EQ உள்ளிட்ட பின், மாதிரி எவ்வளவு நெருக்கமாக இருந்தது என்று பார்க்க \"EQ க்குப் பின்\" சுவிட்சை இயக்கி சேனலை மீண்டும் அளக்கவும்.';

  @override
  String get designReceiverConfig => 'ரிசீவர் கட்டமைப்பு';

  @override
  String get designGeometryOnly =>
      'ஸ்வீப் மூலம் சேனல்களை அளக்காவிட்டால் வடிவியல் மட்டுமே உள்ளது: தூரங்கள், கிராஸ்ஓவர் அதிர்வெண்கள். ஒவ்வொரு சேனலுக்கும் புள்ளிகள் வந்ததும் EQ, ஒலியளவு சேரும்.';

  @override
  String get designShareSubject => 'கட்டமைப்புப் பரிந்துரை';

  @override
  String get impulseTitle => 'இம்பல்ஸ் பதில்';

  @override
  String get impulseCompareTooltip => 'புள்ளிகளை ஒப்பிடு';

  @override
  String get impulseExportTooltip => 'கட்டத்துடன் FRD ஏற்றுமதி';

  @override
  String get impulseTapToStart => 'தொடங்கத் தட்டவும்.';

  @override
  String get impulseSweepTitle => 'ஸ்பீக்கர்களுக்கு இயக்கும் ஸ்வீப்';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds வி. நீங்கள் இயக்குவதுடன் பொருந்த வேண்டும் — இல்லையெனில் டிகன்வல்யூஷன் அர்த்தமற்ற முடிவைத் தரும்.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'பதிவாகிறது — $seconds வி';
  }

  @override
  String get impulsePlaySweepNow =>
      'இப்போது கணினியிலிருந்து ஸ்வீப்பை இயக்கவும்.';

  @override
  String get impulseStartRecording =>
      'பதிவைத் தொடங்கவும், பிறகு ஸ்வீப்பை இயக்கவும்';

  @override
  String get impulseFrequencyResponse => 'அதிர்வெண் பதில்';

  @override
  String get impulseWithRoom => 'அறையுடன் (1 வி)';

  @override
  String impulseDirectWindow(String ms) {
    return 'நேரடி ஒலி (சாளரம் $ms ms)';
  }

  @override
  String get impulseWindow => 'சாளரம்';

  @override
  String impulseWindowHelp(String hz) {
    return 'நீண்ட சாளரம் குறைந்த அதிர்வெண்களைக் காணும் (இப்போது $hz Hz க்கு மேல் செல்லுபடி), ஆனால் முதல் பிரதிபலிப்பையும் உள்ளே விடும். இந்த எல்லைக்குக் கீழ் வளைவு மென்மையாக்கப்படாது, கருத்தும் சொல்லப்படாது: அது சாளரம், அறை அல்ல.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'முதல் பிரதிபலிப்பு வரை ($ms ms)';
  }

  @override
  String get impulseTime => 'நேரம்';

  @override
  String get impulseImpulse => 'இம்பல்ஸ்';

  @override
  String get impulseTimeHelp =>
      'நீலம் சாளரம், ஆரஞ்சு கோடு கண்டறிந்த முதல் பிரதிபலிப்பு. நேரம் பூஜ்ஜியம் நேரடி ஒலி.';

  @override
  String get impulseSpectrogram => 'ஸ்பெக்ட்ரோகிராம்';

  @override
  String get commonHide => 'மறை';

  @override
  String get commonShow => 'காட்டு';

  @override
  String get impulseSpectrogramHelp =>
      'நேரடி ஒலியிலிருந்து ms இல் நேரம், அதிர்வெண் மேல்நோக்கி, நிறம் −60 dB வரையிலான அளவு. மற்றவை மறைந்தும் நிலைத்திருக்கும் கிடைமட்டப் பட்டை ஒரு மோடு; மேலுள்ள அட்டவணை அதையே எண்ணில் சொல்கிறது.';

  @override
  String get impulseDecayByOctave => 'ஆக்டேவ் வாரியாகத் தேய்வு';

  @override
  String get impulseMidNoT20 =>
      'நடுப் பட்டைகள் T20 க்குப் போதுமான அளவு இறங்கவில்லை.';

  @override
  String impulseMidT20(String seconds) {
    return 'நடு 125–500 Hz: T20 $seconds வி — வடிவமைப்பு பயன்படுத்தும் RT60 இதுவே.';
  }

  @override
  String get impulseDecayHelp =>
      'பேஸில் தொலைபேசி RT60 மதிப்பீடே: பின்னணி இரைச்சல் அங்கு மிக அருகில் இருக்கும், \"—\" என்றால் எதிரொலி அதற்குக் கீழே இறங்கவில்லை. C50 பூஜ்ஜியத்துக்கு மேல்: நேரடி ஒலியும் முதல் பிரதிபலிப்புகளும் எதிரொலியை விட அதிக ஆற்றல் கொண்டுள்ளன.';

  @override
  String get impulseResult => 'முடிவு';

  @override
  String get impulseDirectArrived => 'நேரடி ஒலி வந்து சேர்ந்தது';

  @override
  String get impulseDirectArrivedHelp =>
      'இயக்கத் தாமதமும் பயண நேரமும் — தனியாக எதையும் சொல்லாது, ஆனால் L மற்றும் R ஸ்பீக்கர்களுக்கு இடையிலான வேறுபாடு சொல்லும்.';

  @override
  String get impulseFirstReflection => 'முதல் பிரதிபலிப்பு';

  @override
  String get impulseNotFound => 'கிடைக்கவில்லை';

  @override
  String impulseAfterDirect(String time) {
    return 'நேரடி ஒலிக்குப் பின் $time';
  }

  @override
  String get impulseNoReflectionHelp =>
      'ஒன்று அது இல்லை, அல்லது நேரடி இம்பல்ஸின் ரிங்கிங்கில் மறைந்துள்ளது.';

  @override
  String impulseExtraPath(String metres) {
    return 'கூடுதல் பாதை ≈ $metres மீ.';
  }

  @override
  String get impulseUnmeasurable => 'அளக்க முடியாதது';

  @override
  String get impulseRt60NoiseHelp =>
      'எதிரொலி பின்னணி இரைச்சலுக்கு மேலே போதுமான ஆழம் இறங்கவில்லை — சத்தமாக்கவும், அல்லது அமைதியான நேரத்தில் அளக்கவும்.';

  @override
  String get impulseRt60Help =>
      'T20 க்கும் T30 க்கும் இடையிலான வேறுபாடு தேய்வு எவ்வளவு தூய்மையானது என்பதைக் காட்டும்.';

  @override
  String get impulseGating => 'சாளரம் (கேட்டிங்)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz க்கு மேல் செல்லுபடி';
  }

  @override
  String get impulseGatingHelp =>
      'அதற்குக் கீழ் சாளரத்தால் ஒரு சுழற்சியையும் காண முடியாது — அங்குள்ள வளைவு சாளரத்தின் செயற்கை விளைவு, அறையுடையது அல்ல.';

  @override
  String get impulseSchroeder => 'ஷ்ரோடர் தேய்வு வளைவு';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz இல் HD$order';
  }

  @override
  String get impulseHd2Help =>
      'ஹார்மோனிக்குகள் ஃபரினா டிகன்வல்யூஷனின் எதிர்மறை நேரத்தில் உள்ளன; இங்கே அவற்றை எறியாமல் அங்கிருந்து படிக்கிறோம். −40 dB என்றால் 1 %.';

  @override
  String get impulseHd3Help =>
      'மூன்றாம் ஹார்மோனிக் அதிகச்சுமையுடன் இரண்டாவதை விட வேகமாக வளரும்.';

  @override
  String get impulseDistortionHot => '−30 dB க்கு மேல் சிதைவு';

  @override
  String get impulseDistortionHotHelp =>
      'ஒன்று ஸ்வீப் மிகவும் சத்தமாக உள்ளது, அல்லது ஸ்பீக்கர் எல்லையில் உள்ளது. சிதைவின் வால் இம்பல்ஸில் பிரதிபலிப்பு போலத் தெரியும் — எதையும் நம்பும் முன் ஒலியளவைக் குறைத்து மீண்டும் அளக்கவும்.';

  @override
  String get eqMeasured => 'அளந்தது';

  @override
  String get eqTarget => 'இலக்கு';

  @override
  String get eqPredicted => 'EQ க்குப் பின் முன்கணிப்பு';

  @override
  String get eqMeasuredAfter => 'EQ க்குப் பின் அளந்தது';

  @override
  String eqDeviation(int maxHz) {
    return 'இலக்கிலிருந்து விலகல் 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'ரிசீவரில் உள்ளிட்ட பின்';

  @override
  String get eqPredictionVsReality => 'முன்கணிப்பு vs உண்மை';

  @override
  String eqStubborn(String bands) {
    return 'இலக்கிலிருந்து 6 dB க்கு மேல் தொலைவில் இருக்கும்: $bands. இது குறுக்கீடு, ஆற்றல் பற்றாக்குறை அல்ல — மேலும் உயர்த்தியல்ல, ஸ்பீக்கரையோ கேட்பவரையோ நகர்த்தித் தீர்க்கவும்.';
  }

  @override
  String get eqModelOk =>
      'ரிசீவரின் வடிகட்டி ஏறக்குறைய மாதிரி போலவே நடந்துகொள்கிறது.';

  @override
  String get eqModelOff =>
      'ரிசீவரின் உண்மையான வடிகட்டி எதிர்பார்த்ததை விட மாதிரியிலிருந்து மாறுபடுகிறது — அதன் பட்டைகள் இங்கே கருதியதை விட அகலமாகவோ குறுகலாகவோ இருக்கலாம்.';

  @override
  String get eqTargetCurve => 'இலக்கு வளைவு';

  @override
  String get eqFlat => 'சமம்';

  @override
  String get eqTargetHelp =>
      'சமமாக இல்லை: சில kHz க்கு மேல் காது நேரடி ஒலியைக் கேட்கிறது, மைக்ரோஃபோன் பிரதிபலிப்புகளையும் கூட்டுகிறது, அளந்த வளைவை சமமாக்கினால் ஒலி மந்தமாகத் தோன்றும். மேலே சிறு சரிவும் கீழே சிறிது பேஸும் தான் கண்மூடிக் கேட்கும்போது மக்கள் தேர்ந்தெடுப்பது.';

  @override
  String get eqBassLift => 'பேஸ் உயர்வு';

  @override
  String get eqBassBelow => 'பேஸ் கீழ்';

  @override
  String get eqTilt => 'சரிவு';

  @override
  String get eqDbPerOctave => 'dB/ஆக்டேவ்';

  @override
  String get eqTiltFrom => 'சரிவு தொடக்கம்';

  @override
  String get errorMicPermission =>
      'மைக்ரோஃபோன் அணுகல் இல்லாமல் அளக்க முடியாது. அமைப்புகள் → AudioScanner → மைக்ரோஃபோன் இல் அனுமதிக்கவும்.';

  @override
  String errorMic(String error) {
    return 'மைக்ரோஃபோன்: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'மைக்ரோஃபோனைத் தொடங்க முடியவில்லை: $error';
  }

  @override
  String get errorNoArkit =>
      'இந்தச் சாதனம் ARKit வேர்ல்ட் டிராக்கிங்கை ஆதரிக்கவில்லை — புள்ளிகளை இடத்தில் வைக்க முடியாது.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'பதிவு ஸ்வீப்பை விடச் சிறியது ($expected வி இல் $recorded வி). சமிக்ஞையை இயக்கும் முன் பதிவைத் தொடங்கவும்.';
  }

  @override
  String get sessionSnapshots => 'ஸ்னாப்ஷாட்கள்';

  @override
  String get errorTrackingUnreliable =>
      'இட கண்காணிப்பு நம்பகமானதல்ல — புள்ளி நீங்கள் நிற்கும் இடத்தில் இல்லாமல் போகலாம்.';

  @override
  String errorNoSound(int seconds) {
    return '$seconds வி இல் எந்த ஒலியும் வந்து சேரவில்லை.';
  }

  @override
  String get noteSnapshotNoPose => 'அனலைசரிலிருந்து ஸ்னாப்ஷாட், இடம் இல்லை';

  @override
  String get sessionChannels => 'சேனல்கள்';

  @override
  String get trackingOk => 'கண்காணிப்பு சரி';

  @override
  String get trackingLimited => 'பலவீனமான கண்காணிப்பு';

  @override
  String get trackingUnavailable => 'கண்காணிப்பு இல்லை';

  @override
  String get poseHintFeatures =>
      'படத்தில் விவரங்கள் மிகக் குறைவு — வெற்றுச் சுவரை அல்ல, அமைப்பு உள்ள ஏதாவது ஒன்றை நோக்கித் தொலைபேசியைப் பிடிக்கவும்.';

  @override
  String get poseHintMotion => 'மிக வேகமான நகர்வு — மெதுவாகச் செல்லவும்.';

  @override
  String get poseHintLight =>
      'வெளிச்சம் குறைவு — விளக்கை ஏற்றவும், கேமராவால் தான் எங்கு உள்ளது என்று பார்க்க முடியவில்லை.';

  @override
  String get poseHintInitializing =>
      'ARKit தொடங்குகிறது, சிறிது நேரம் நகர்ந்துகொண்டிருங்கள்.';

  @override
  String get poseHintRelocalizing =>
      'அசல் புள்ளியைத் தேடுகிறது — நீங்கள் தொடங்கிய இடத்துக்குத் திரும்பவும்.';

  @override
  String get signalPhonePink => 'தொலைபேசியிலிருந்து பிங்க் இரைச்சல்';

  @override
  String get signalExternalPink => 'ஸ்பீக்கர்களிலிருந்து பிங்க் இரைச்சல்';

  @override
  String get signalExternalSweep => 'ஸ்பீக்கர்களிலிருந்து ஸ்வீப்';

  @override
  String get captureWarningBluetooth =>
      'புளூடூத் மைக்ரோஃபோன்: சுருக்கமும் தாமதமும் அளவீட்டைக் கெடுக்கும். ஹெட்ஃபோனைத் துண்டித்து உள்ளமைந்த மைக்ரோஃபோனால் அளக்கவும்.';

  @override
  String get captureWarningProcessing =>
      'அமைப்பு சமிக்ஞைச் செயலாக்கத்தை (AGC / இரைச்சல் அடக்கம்) அணைக்கவில்லை. இடங்களுக்கு இடையே அளந்த வேறுபாடுகள் திரிபடையும்.';

  @override
  String get captureWarningMeasurementMode =>
      'அளவீட்டு முறையை இயக்க முடியவில்லை — மைக்ரோஃபோனுக்குத் தனக்கே உரிய அதிர்வெண் பதில் திருத்தம் உள்ளது.';

  @override
  String get captureRouteUnknown => 'தெரியாதது';

  @override
  String get axisLength => 'நீளம்';

  @override
  String get axisWidth => 'அகலம்';

  @override
  String get axisHeight => 'உயரம்';
}
