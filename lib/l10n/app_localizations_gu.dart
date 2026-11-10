// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Gujarati (`gu`).
class AppLocalizationsGu extends AppLocalizations {
  AppLocalizationsGu([String locale = 'gu']) : super(locale);

  @override
  String get tabScan => 'સ્કેન';

  @override
  String get tabMap => 'નકશો';

  @override
  String get tabResponse => 'પ્રતિસાદ';

  @override
  String get tabDesign => 'ડિઝાઇન';

  @override
  String get tabSignals => 'સિગ્નલ';

  @override
  String get rtaSnapshotFailed => 'સ્નેપશોટ સાચવાયો નહીં.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'બિંદુ $id તરીકે સાચવ્યું.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'બિંદુ $id તરીકે સાચવ્યું (સ્થાન વિના).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count બિંદુઓ',
      one: '1 બિંદુ',
    );
    return 'કેલિબ્રેશન $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'ફાઇલ વાંચી શકાતી નથી: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL ઑફસેટ';

  @override
  String get rtaOffsetHelp =>
      '1 kHz ટોન વગાડો, SPL મીટર પર સ્તર વાંચો અને એનાલાઇઝર જે બતાવે છે તેની સાથેનો તફાવત દાખલ કરો. શૂન્ય સિવાયના ઑફસેટ સાથે સ્તરો SPL અંદાજ તરીકે દર્શાવાય છે; તેના વિના dBFS માં રહે છે.';

  @override
  String get commonReset => 'રીસેટ';

  @override
  String get commonCancel => 'રદ કરો';

  @override
  String get commonSave => 'સાચવો';

  @override
  String get commonStop => 'રોકો';

  @override
  String get commonStartMic => 'માઇક્રોફોન શરૂ કરો';

  @override
  String get tabAnalyzer => 'એનાલાઇઝર';

  @override
  String get rtaUnfreeze => 'ફરી શરૂ કરો';

  @override
  String get rtaFreeze => 'સ્થિર કરો';

  @override
  String get rtaPeakHold => 'પીક હોલ્ડ';

  @override
  String get rtaMaxMinTraces => 'મહત્તમ / લઘુત્તમ રેખાઓ';

  @override
  String get rtaResetTraces => 'રેખાઓ રીસેટ કરો';

  @override
  String get rtaSaveAsPoint => 'બિંદુ તરીકે સાચવો (3 સે.)';

  @override
  String get rtaMicCalibration => 'માઇક્રોફોન કેલિબ્રેશન…';

  @override
  String get rtaRemoveCalibration => 'કેલિબ્રેશન દૂર કરો';

  @override
  String get rtaOffsetMenu => 'dB SPL ઑફસેટ…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · સિગ્નલ પ્રક્રિયા વિના';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count બિંદુઓ',
      one: '1 બિંદુ',
    );
    return 'કેલિબ્રેશન $name: $_temp0, સુધારો $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (અંદાજ)';

  @override
  String get rtaFrozenHint => 'સ્થિર — માઇક્રોફોન ચાલુ છે, ફક્ત દોરાતું નથી.';

  @override
  String get rtaRelativeHint =>
      'સ્તરો સાપેક્ષ છે (dBFS). પહેલું બિંદુ સાચવશો ત્યારે રૂપરેખા દેખાશે — તે જ બાકીનાનો સંદર્ભ છે.';

  @override
  String get rtaReferenceHint => 'ભરેલા સ્તંભ = અહીં. રૂપરેખા = સંદર્ભ બિંદુ.';

  @override
  String get rtaEnvelopeHint => 'લાલ = મહત્તમ, લીલો = રીસેટ પછીનું લઘુત્તમ.';

  @override
  String get rtaMicStopped => 'માઇક્રોફોન બંધ છે';

  @override
  String get rtaSilence => 'શાંતિ — કોઈ સિગ્નલ વાગે છે?';

  @override
  String get rtaPlaceholder => 'માઇક્રોફોન શરૂ કરો અને રૂમમાં સિગ્નલ વગાડો.';

  @override
  String rtaBandsInfo(int count) {
    return '$count ત્રીજા-ઓક્ટેવ બેન્ડ, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'રૂમ સ્કેન';

  @override
  String scanPointCount(int count) {
    return '$count બિં.';
  }

  @override
  String get commonMicNotRunning => 'માઇક્રોફોન ચાલુ નથી';

  @override
  String get scanMicNeeded => 'તેના વિના ફક્ત સ્થાન મપાય છે, અવાજ નહીં.';

  @override
  String get scanContinuous => 'સતત માપન';

  @override
  String get scanContinuousHint => 'દર 0.5 મી. ચાલવા પર આપમેળે એક બિંદુ';

  @override
  String get scanMeasuring => 'માપી રહ્યું છે…';

  @override
  String get scanMeasureHere => 'અહીં માપો';

  @override
  String scanPointSaved(String id, String position) {
    return 'બિંદુ $id $position પર સાચવ્યું';
  }

  @override
  String get scanStartTracking => 'સ્થાન ટ્રેકિંગ શરૂ કરો';

  @override
  String get scanStartTrackingHint =>
      'ARKit — આનાથી ઍપ જાણે છે કે તમે રૂમમાં ક્યાં ઊભા છો.';

  @override
  String scanPosition(String position) {
    return 'સ્થાન: મૂળબિંદુથી $position મી.';
  }

  @override
  String get scanSetOriginHint =>
      'સાંભળવાની જગ્યાએ ઊભા રહો અને મૂળબિંદુ નક્કી કરો.';

  @override
  String get scanOriginHere => 'મૂળબિંદુ અહીં છે';

  @override
  String get scanNoPoints => 'હજી કોઈ બિંદુ નથી.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'ફેલાવો 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'બેઠક ખંડ';

  @override
  String get scanNewMeasurement => 'નવું માપન';

  @override
  String get scanRoomName => 'રૂમનું નામ';

  @override
  String get scanExcitation => 'રૂમને શેનાથી ઉત્તેજિત કરશો';

  @override
  String get scanPhoneNoiseHint =>
      'ફક્ત અંદાજ માટે — ફોનનું સ્પીકર બિલકુલ બાસ આપતું નથી.';

  @override
  String get scanStart => 'શરૂ કરો';

  @override
  String get mapExportTooltip => 'FRD + JSON નિકાસ કરો';

  @override
  String get mapNeedsTwoPoints =>
      'નકશા માટે ઓછામાં ઓછા બે બિંદુ જોઈએ. રૂમમાં ફરો અને સાથે સાથે માપો.';

  @override
  String get mapShareText =>
      'દરેક બિંદુની FRD (REW / VituixCAD માં આયાત માટે) અને આખું સત્ર JSON માં.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'સૌથી સપાટ જગ્યા: $id, $position મી. પર (40–300 Hz માં $variation dB ફેલાવો)';
  }

  @override
  String get signalsSweepHelp =>
      'એકમાત્ર સિગ્નલ જેનાથી ઇમ્પલ્સ પ્રતિસાદ, પડઘાનો સમય અને પ્રથમ પરાવર્તનો ગણી શકાય. કમ્પ્યુટર કે DAC થી સ્પીકરમાં વગાડો અને ફોનને રેકોર્ડ કરવા દો.';

  @override
  String get signalsLength => 'અવધિ';

  @override
  String get signalsFrom => 'થી';

  @override
  String get signalsTo => 'સુધી';

  @override
  String get signalsMonoNoChannel => 'મોનો (ચેનલ વિના)';

  @override
  String get signalsExportWav => 'WAV નિકાસ કરો';

  @override
  String get signalsPinkNoise => 'પિંક નોઇઝ';

  @override
  String get signalsPinkHelp =>
      'દરેક ઓક્ટેવમાં સમાન ઊર્જા. ફક્ત આવર્તન પ્રતિસાદ આપે છે, સમય કે પરાવર્તન નહીં — ઝડપી «અહીં કંઈ થાય છે?» માટે પૂરતું.';

  @override
  String get signalsExportPink => '30 સે. WAV નિકાસ કરો';

  @override
  String get signalsHowTo => 'કેવી રીતે માપવું';

  @override
  String get signalsStep1 => 'સિગ્નલ કમ્પ્યુટરથી સ્પીકરમાં વગાડો, ફોનથી નહીં.';

  @override
  String get signalsStep2 =>
      'વોલ્યુમ એવું રાખો કે એનાલાઇઝર લગભગ −20 dBFS બતાવે. ઓવરલોડ પરાવર્તન જેવો દેખાય છે.';

  @override
  String get signalsStep3 =>
      'ફોનને હાથ લંબાવીને સીધો પકડો, માઇક્રોફોન સ્પીકર તરફ.';

  @override
  String get signalsStep4 =>
      'બ્લૂટૂથ હેડફોન ડિસ્કનેક્ટ કરો — કમ્પ્રેશન અને વિલંબ માપન બગાડે છે.';

  @override
  String get signalsNoteMono =>
      'બંને સ્પીકરમાં એકસાથે મોનો L અને R નો સરવાળો કરે છે, અને તેમનો તફાવત સરવાળામાં ગાયબ થાય છે. ચેનલ માપવા ચેનલ પસંદ કરો.';

  @override
  String get signalsNoteStereo =>
      'સ્ટીરિયો ફાઇલ જેમાં સિગ્નલ ફક્ત એક ચેનલમાં છે — સ્ટીરિયો વગાડતી કોઈપણ વસ્તુ તેને વગાડશે.';

  @override
  String get signalsNoteChannel =>
      'ચેનલના નામવાળી મોનો ફાઇલ. તેને DAW થી અથવા મલ્ટિચેનલ ઇનપુટ દ્વારા રીસીવરના સાચા ઇનપુટ પર મોકલો; સ્ટીરિયો આઉટપુટવાળું લેપટોપ તેને આ ચેનલ સુધી નહીં પહોંચાડે.';

  @override
  String get channelsTitle => 'ચેનલ માપન';

  @override
  String get channelsHelp =>
      'સાંભળવાની જગ્યાએ ઊભા રહો. દરેક ચેનલ માટે: રેકોર્ડિંગ શરૂ કરો, સિગ્નલ ટૅબમાંથી તેમાં sweep વગાડો, થઈ ગયું પર ટૅપ કરો. આ બિંદુઓ વિના ડિઝાઇન પાસે EQ અને સ્તરો ગણવા માટે કંઈ નથી.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds સે.';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ દાખલ કર્યા પછી ચકાસણી';

  @override
  String get channelsVerifyAfterEqHint =>
      'બિંદુ «EQ પછી» તરીકે સાચવાય છે અને જેમાંથી EQ ગણાયું હતું તેના પર લખાતું નથી.';

  @override
  String channelsRecording(String seconds) {
    return 'રેકોર્ડિંગ $seconds સે. — હવે sweep વગાડો';
  }

  @override
  String get channelsNotMeasured => 'માપ્યું નથી';

  @override
  String get channelsMeasuredNoise => 'નોઇઝથી માપ્યું';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · સીધો અવાજ $ms ms પછી';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · સીધો અવાજ $ms ms પછી, T20 $t20 સે.';
  }

  @override
  String get commonDone => 'થઈ ગયું';

  @override
  String get channelsMeasure => 'માપો';

  @override
  String get channelsAdd => 'ઉમેરો';

  @override
  String get channelsAgain => 'ફરીથી';

  @override
  String get compareTitle => 'સરખામણી';

  @override
  String get compareNeedsTwoPoints => 'સરખામણી માટે ઓછામાં ઓછા બે બિંદુ જોઈએ.';

  @override
  String get commonWithRoom => 'રૂમ સાથે';

  @override
  String get commonDirectSound => 'સીધો અવાજ';

  @override
  String get compareAfterEq => 'EQ પછી';

  @override
  String get compareBandsA => 'A (બેન્ડ)';

  @override
  String get compareBandsB => 'B (બેન્ડ)';

  @override
  String get compareArrivalDiff => 'આગમન તફાવત A − B';

  @override
  String get compareBroadbandDiff => 'બ્રોડબેન્ડ સ્તર A − B';

  @override
  String get compareWorstBelow300 => '300 Hz નીચે સૌથી મોટો તફાવત';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz બેન્ડમાં $db dB';
  }

  @override
  String get compareTrimNote =>
      'Distance અને level trim આગમન અને સ્તરનો તફાવત સરખો કરે છે. 300 Hz નીચે આકારનો તફાવત નહીં — તે બીજા અંતરે બીજી દીવાલથી આવે છે અને જગ્યા બદલીને ઉકેલાય છે.';

  @override
  String get designRt60Live => 'છેલ્લા પ્રતિસાદમાંથી T20 125–500 Hz';

  @override
  String get designRt60Stored => 'સાચવેલા sweep માંથી T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'અંદાજ — sweep માપો, Schroeder હાલ ફક્ત સંકેત છે';

  @override
  String get designExportTooltip => 'કન્ફિગરેશન નિકાસ કરો';

  @override
  String get designCompute => 'ડિઝાઇન ગણો';

  @override
  String get designLidarChecking => 'LiDAR છે કે નહીં તે તપાસી રહ્યું છે…';

  @override
  String get designLidarAvailable => 'LiDAR ઉપલબ્ધ';

  @override
  String get designLidarMissing => 'LiDAR નથી — માપ હાથથી દાખલ કરો';

  @override
  String get designLidarHint =>
      'સ્કેન દીવાલોને સેન્ટિમીટર સુધી આપે છે, તેથી ફક્ત મોડ જ નહીં, પરાવર્તન બિંદુઓ અને સીમાઓ સુધીનાં અંતર પણ બંધબેસે છે.';

  @override
  String get designManualHint =>
      'મોડલ ગણતરીને ફક્ત ત્રણ સંખ્યાઓ જોઈએ — પણ પરાવર્તન બિંદુઓ અને દીવાલો સુધીનાં ચોક્કસ અંતર ગુમાવો છો.';

  @override
  String get designStopScan => 'સ્કેન સમાપ્ત કરો';

  @override
  String get designScanRoom => 'રૂમ સ્કેન કરો';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls દીવાલો',
      one: '1 દીવાલ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings ખુલ્લી જગ્યાઓ',
      one: '1 ખુલ્લી જગ્યા',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'રૂમનાં માપ';

  @override
  String get designLength => 'લંબાઈ';

  @override
  String get designWidth => 'પહોળાઈ';

  @override
  String get designHeight => 'ઊંચાઈ';

  @override
  String get designWhatToDo => 'શું કરવું';

  @override
  String get designRoomModes => 'રૂમના મોડ';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (Schroeder) ઉપર અલગ મોડનો કોઈ અર્થ રહેતો નથી. RT60 $rt60 સે.: $source.';
  }

  @override
  String get designEqTitle => 'EQ: માપેલું, લક્ષ્ય, અનુમાન';

  @override
  String get designEqHelp =>
      'અનુમાન એટલે માપેલો પ્રતિસાદ વત્તા રીસીવરના પંદર બેન્ડનું મોડેલ. EQ દાખલ કર્યા પછી «EQ પછી» સ્વિચ સાથે ચેનલ ફરી માપો, જેથી દેખાય કે મોડેલ કેટલું નજીક હતું.';

  @override
  String get designReceiverConfig => 'રીસીવર કન્ફિગરેશન';

  @override
  String get designGeometryOnly =>
      'ચેનલોના sweep માપન વિના અહીં ફક્ત ભૂમિતિ છે: અંતર અને ક્રોસઓવર આવર્તન. દરેક ચેનલના બિંદુ હશે ત્યારે EQ અને સ્તરો આવશે.';

  @override
  String get designShareSubject => 'કન્ફિગરેશન પ્રસ્તાવ';

  @override
  String get impulseTitle => 'ઇમ્પલ્સ પ્રતિસાદ';

  @override
  String get impulseCompareTooltip => 'બિંદુઓની સરખામણી કરો';

  @override
  String get impulseExportTooltip => 'ફેઝ સાથે FRD નિકાસ કરો';

  @override
  String get impulseTapToStart => 'શરૂ કરવા ટૅપ કરો.';

  @override
  String get impulseSweepTitle => 'તમે સ્પીકરમાં વગાડશો તે sweep';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds સે. તમે જે વગાડો છો તેની સાથે મેળ ખાવો જોઈએ — નહીં તો ડીકન્વોલ્યુશન અર્થહીન પરિણામ આપશે.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'રેકોર્ડિંગ — $seconds સે.';
  }

  @override
  String get impulsePlaySweepNow => 'હવે કમ્પ્યુટરથી sweep વગાડો.';

  @override
  String get impulseStartRecording => 'રેકોર્ડિંગ શરૂ કરો, પછી sweep વગાડો';

  @override
  String get impulseFrequencyResponse => 'આવર્તન પ્રતિસાદ';

  @override
  String get impulseWithRoom => 'રૂમ સાથે (1 સે.)';

  @override
  String impulseDirectWindow(String ms) {
    return 'સીધો અવાજ (વિન્ડો $ms ms)';
  }

  @override
  String get impulseWindow => 'વિન્ડો';

  @override
  String impulseWindowHelp(String hz) {
    return 'લાંબી વિન્ડો નીચે સુધી જુએ છે (હાલ $hz Hz ઉપર માન્ય), પણ પહેલું પરાવર્તન અંદર આવવા દે છે. સીમા નીચે વક્ર ન તો સરળ કરાય છે ન તેના પર ટિપ્પણી: તે વિન્ડો છે, રૂમ નહીં.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'પહેલા પરાવર્તન સુધી ($ms ms)';
  }

  @override
  String get impulseTime => 'સમય';

  @override
  String get impulseImpulse => 'ઇમ્પલ્સ';

  @override
  String get impulseTimeHelp =>
      'વાદળી વિન્ડો છે, નારંગી રેખા પહેલું મળેલું પરાવર્તન. શૂન્ય સમય સીધો અવાજ છે.';

  @override
  String get impulseSpectrogram => 'સ્પેક્ટ્રોગ્રામ';

  @override
  String get commonHide => 'છુપાવો';

  @override
  String get commonShow => 'બતાવો';

  @override
  String get impulseSpectrogramHelp =>
      'સીધા અવાજથી ms માં સમય, આવર્તન ઉપર તરફ, રંગ −60 dB સુધીનું સ્તર છે. બાકીના કરતાં લાંબી ટકતી આડી પટ્ટી મોડ છે; ઉપરનું કોષ્ટક એ જ સંખ્યામાં કહે છે.';

  @override
  String get impulseDecayByOctave => 'ઓક્ટેવ મુજબ ક્ષય';

  @override
  String get impulseMidNoT20 => 'મધ્ય બેન્ડ T20 માટે પૂરતા ઘટ્યા નથી.';

  @override
  String impulseMidT20(String seconds) {
    return 'મધ્ય 125–500 Hz: T20 $seconds સે. — આ જ તે RT60 છે જેનાથી ડિઝાઇન ગણતરી કરે છે.';
  }

  @override
  String get impulseDecayHelp =>
      'બાસમાં ફોનનો RT60 મોટે ભાગે અંદાજ છે: પૃષ્ઠભૂમિ નોઇઝ ત્યાં સૌથી નજીક હોય છે, અને «—» એટલે પડઘો તેની નીચે ગયો નથી. શૂન્ય ઉપર C50: પ્રારંભિક પરાવર્તનો સાથેનો સીધો અવાજ પડઘા કરતાં વધુ ઊર્જા ધરાવે છે.';

  @override
  String get impulseResult => 'પરિણામ';

  @override
  String get impulseDirectArrived => 'સીધો અવાજ આટલા સમય પછી પહોંચ્યો';

  @override
  String get impulseDirectArrivedHelp =>
      'પ્લેબેક વિલંબ વત્તા મુસાફરીનો સમય — એકલું કંઈ કહેતું નથી, પણ ડાબા અને જમણા સ્પીકરનો તફાવત કહે છે.';

  @override
  String get impulseFirstReflection => 'પહેલું પરાવર્તન';

  @override
  String get impulseNotFound => 'મળ્યું નહીં';

  @override
  String impulseAfterDirect(String time) {
    return 'સીધા અવાજ પછી $time';
  }

  @override
  String get impulseNoReflectionHelp =>
      'કાં તો કોઈ નથી, કાં તો સીધા ઇમ્પલ્સના રિંગિંગમાં છુપાયેલું છે.';

  @override
  String impulseExtraPath(String metres) {
    return 'વધારાનો માર્ગ ≈ $metres મી.';
  }

  @override
  String get impulseUnmeasurable => 'માપી શકાતું નથી';

  @override
  String get impulseRt60NoiseHelp =>
      'પડઘો નોઇઝ સ્તરની ઉપર પૂરતો ઊંડો ઊતર્યો નથી — વધુ અવાજે, અથવા શાંત ક્ષણે કરો.';

  @override
  String get impulseRt60Help =>
      'T20 અને T30 નો તફાવત બતાવે છે કે ક્ષય કેટલો સ્વચ્છ છે.';

  @override
  String get impulseGating => 'વિન્ડો (gating)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz ઉપર માન્ય';
  }

  @override
  String get impulseGatingHelp =>
      'આની નીચે વિન્ડો એક પણ આવર્તન જોતી નથી — ત્યાંનો વક્ર વિન્ડોની અસર છે, રૂમની નહીં.';

  @override
  String get impulseSchroeder => 'શ્રોડર ક્ષય વક્ર';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz પર HD$order';
  }

  @override
  String get impulseHd2Help =>
      'હાર્મોનિક્સ Farina ડીકન્વોલ્યુશનના ઋણ સમયમાં હોય છે; અહીં તેમને ફેંકી દેવાને બદલે ત્યાંથી જ વાંચવામાં આવે છે. −40 dB એટલે 1 %.';

  @override
  String get impulseHd3Help =>
      'ઓવરલોડ સાથે ત્રીજો હાર્મોનિક બીજા કરતાં ઝડપથી વધે છે.';

  @override
  String get impulseDistortionHot => '−30 dB ઉપર વિકૃતિ';

  @override
  String get impulseDistortionHotHelp =>
      'કાં તો sweep બહુ મોટો છે, કાં તો સ્પીકર તેની મર્યાદા પર છે. વિકૃતિની પૂંછડી ઇમ્પલ્સમાં પરાવર્તન જેવી દેખાય છે — અવાજ ઘટાડો અને કંઈ પણ માનતા પહેલાં ફરી માપો.';

  @override
  String get eqMeasured => 'માપેલું';

  @override
  String get eqTarget => 'લક્ષ્ય';

  @override
  String get eqPredicted => 'EQ પછી અનુમાન';

  @override
  String get eqMeasuredAfter => 'EQ પછી માપેલું';

  @override
  String eqDeviation(int maxHz) {
    return 'લક્ષ્યથી વિચલન 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'રીસીવરમાં દાખલ કર્યા પછી';

  @override
  String get eqPredictionVsReality => 'અનુમાન વિરુદ્ધ વાસ્તવિકતા';

  @override
  String eqStubborn(String bands) {
    return 'લક્ષ્યથી 6 dB થી વધુ દૂર રહેશે: $bands. આ વ્યતિકરણ છે, શક્તિની અછત નહીં — સ્પીકર કે શ્રોતાને ખસેડીને ઉકેલાય છે, વધુ બૂસ્ટથી નહીં.';
  }

  @override
  String get eqModelOk => 'રીસીવરનું ફિલ્ટર લગભગ મોડેલ જેવું વર્તે છે.';

  @override
  String get eqModelOff =>
      'રીસીવરનું ખરું ફિલ્ટર અપેક્ષા કરતાં મોડેલથી વધુ અલગ છે — તેના બેન્ડ કદાચ અહીં ધારેલા કરતાં પહોળા કે સાંકડા છે.';

  @override
  String get eqTargetCurve => 'લક્ષ્ય વક્ર';

  @override
  String get eqFlat => 'સપાટ';

  @override
  String get eqTargetHelp =>
      'સપાટ નહીં: થોડા kHz ઉપર કાન સીધો અવાજ સાંભળે છે, માઇક્રોફોન પરાવર્તનો પણ ઉમેરે છે, અને સપાટ કરેલો માપેલો વક્ર નિસ્તેજ લાગે છે. ઉપર હળવો ઢાળ અને નીચે થોડો બાસ — અંધ શ્રવણમાં લોકો આ જ પસંદ કરે છે.';

  @override
  String get eqBassLift => 'બાસ બૂસ્ટ';

  @override
  String get eqBassBelow => 'બાસ આની નીચે';

  @override
  String get eqTilt => 'ઢાળ';

  @override
  String get eqDbPerOctave => 'dB/ઓક્ટેવ';

  @override
  String get eqTiltFrom => 'ઢાળ અહીંથી';

  @override
  String get errorMicPermission =>
      'માઇક્રોફોન ઍક્સેસ વિના માપી શકાતું નથી. સેટિંગ્સ → AudioScanner → માઇક્રોફોનમાં મંજૂરી આપો.';

  @override
  String errorMic(String error) {
    return 'માઇક્રોફોન: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'માઇક્રોફોન શરૂ થઈ શક્યો નહીં: $error';
  }

  @override
  String get errorNoArkit =>
      'આ ઉપકરણ ARKit world tracking કરી શકતું નથી — બિંદુઓને જગ્યામાં મૂકી શકાતા નથી.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'રેકોર્ડિંગ sweep કરતાં ટૂંકું છે ($expected સે. માંથી $recorded સે.). સિગ્નલ વગાડતાં પહેલાં રેકોર્ડિંગ શરૂ કરો.';
  }

  @override
  String get sessionSnapshots => 'સ્નેપશોટ';

  @override
  String get errorTrackingUnreliable =>
      'સ્થાન ટ્રેકિંગ વિશ્વસનીય નથી — બિંદુ તમે ઊભા છો તેના બદલે બીજે પડશે.';

  @override
  String errorNoSound(int seconds) {
    return '$seconds સે. માં કોઈ અવાજ આવ્યો નહીં.';
  }

  @override
  String get noteSnapshotNoPose => 'એનાલાઇઝરનો સ્નેપશોટ, સ્થાન વિના';

  @override
  String get sessionChannels => 'ચેનલો';

  @override
  String get trackingOk => 'ટ્રેકિંગ બરાબર';

  @override
  String get trackingLimited => 'નબળું ટ્રેકિંગ';

  @override
  String get trackingUnavailable => 'ટ્રેકિંગ નથી';

  @override
  String get poseHintFeatures =>
      'ચિત્રમાં બહુ ઓછી વિગત — ફોનને ખાલી દીવાલ તરફ નહીં, ભાતવાળી વસ્તુ તરફ રાખો.';

  @override
  String get poseHintMotion => 'બહુ ઝડપી હલનચલન — ધીમે ચાલો.';

  @override
  String get poseHintLight =>
      'બહુ ઓછો પ્રકાશ — લાઇટ ચાલુ કરો, કૅમેરા જોઈ શકતો નથી કે તે ક્યાં છે.';

  @override
  String get poseHintInitializing => 'ARKit શરૂ થઈ રહ્યું છે, થોડું હલો.';

  @override
  String get poseHintRelocalizing =>
      'મૂળ બિંદુ ફરી શોધાય છે — જ્યાંથી શરૂ કર્યું હતું ત્યાં પાછા જાઓ.';

  @override
  String get signalPhonePink => 'ફોનમાંથી પિંક નોઇઝ';

  @override
  String get signalExternalPink => 'સ્પીકરમાંથી પિંક નોઇઝ';

  @override
  String get signalExternalSweep => 'સ્પીકરમાંથી sweep';

  @override
  String get captureWarningBluetooth =>
      'બ્લૂટૂથ માઇક્રોફોન: કમ્પ્રેશન અને વિલંબ માપન બગાડે છે. હેડફોન ડિસ્કનેક્ટ કરો અને બિલ્ટ-ઇન માઇક્રોફોનથી માપો.';

  @override
  String get captureWarningProcessing =>
      'સિસ્ટમે સિગ્નલ પ્રક્રિયા (AGC / નોઇઝ દમન) બંધ કરી નથી. જગ્યાઓ વચ્ચે માપેલા તફાવત વિકૃત હશે.';

  @override
  String get captureWarningMeasurementMode =>
      'measurement mode ચાલુ થઈ શક્યો નહીં — માઇક્રોફોનનો પોતાનો આવર્તન પ્રતિસાદ સુધારો છે.';

  @override
  String get captureRouteUnknown => 'અજ્ઞાત';

  @override
  String get axisLength => 'લંબાઈ';

  @override
  String get axisWidth => 'પહોળાઈ';

  @override
  String get axisHeight => 'ઊંચાઈ';
}
