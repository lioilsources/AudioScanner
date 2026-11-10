// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malayalam (`ml`).
class AppLocalizationsMl extends AppLocalizations {
  AppLocalizationsMl([String locale = 'ml']) : super(locale);

  @override
  String get tabScan => 'സ്കാൻ';

  @override
  String get tabMap => 'മാപ്പ്';

  @override
  String get tabResponse => 'പ്രതികരണം';

  @override
  String get tabDesign => 'രൂപകൽപ്പന';

  @override
  String get tabSignals => 'സിഗ്നലുകൾ';

  @override
  String get rtaSnapshotFailed => 'സ്നാപ്ഷോട്ട് സംരക്ഷിക്കാനായില്ല.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'പോയിന്റ് $id ആയി സംരക്ഷിച്ചു.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'പോയിന്റ് $id ആയി സംരക്ഷിച്ചു (സ്ഥാനമില്ലാതെ).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count പോയിന്റുകൾ',
      one: '1 പോയിന്റ്',
    );
    return 'കാലിബ്രേഷൻ $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'ഫയൽ വായിക്കാനാകുന്നില്ല: $message';
  }

  @override
  String get rtaOffsetTitle => 'ഓഫ്സെറ്റ് dB SPL';

  @override
  String get rtaOffsetHelp =>
      '1 kHz ടോൺ പ്ലേ ചെയ്ത്, SPL മീറ്ററിൽ നിലവാരം വായിച്ച്, അനലൈസർ കാണിക്കുന്നതുമായുള്ള വ്യത്യാസം നൽകുക. ഓഫ്സെറ്റ് പൂജ്യമല്ലെങ്കിൽ നിലവാരങ്ങൾ കണക്കാക്കിയ SPL ആയി അടയാളപ്പെടുത്തും; അല്ലെങ്കിൽ dBFS ആയി തുടരും.';

  @override
  String get commonReset => 'റീസെറ്റ്';

  @override
  String get commonCancel => 'റദ്ദാക്കുക';

  @override
  String get commonSave => 'സംരക്ഷിക്കുക';

  @override
  String get commonStop => 'നിർത്തുക';

  @override
  String get commonStartMic => 'മൈക്രോഫോൺ ആരംഭിക്കുക';

  @override
  String get tabAnalyzer => 'അനലൈസർ';

  @override
  String get rtaUnfreeze => 'ഫ്രീസ് മാറ്റുക';

  @override
  String get rtaFreeze => 'ഫ്രീസ് ചെയ്യുക';

  @override
  String get rtaPeakHold => 'പീക്ക് ഹോൾഡ്';

  @override
  String get rtaMaxMinTraces => 'പരമാവധി / കുറഞ്ഞ ട്രേസുകൾ';

  @override
  String get rtaResetTraces => 'ട്രേസുകൾ റീസെറ്റ് ചെയ്യുക';

  @override
  String get rtaSaveAsPoint => 'പോയിന്റായി സംരക്ഷിക്കുക (3 സെ)';

  @override
  String get rtaMicCalibration => 'മൈക്രോഫോൺ കാലിബ്രേഷൻ…';

  @override
  String get rtaRemoveCalibration => 'കാലിബ്രേഷൻ നീക്കുക';

  @override
  String get rtaOffsetMenu => 'ഓഫ്സെറ്റ് dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · സിഗ്നൽ പ്രോസസ്സിംഗ് ഇല്ല';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count പോയിന്റുകൾ',
      one: '1 പോയിന്റ്',
    );
    return 'കാലിബ്രേഷൻ $name: $_temp0, തിരുത്തൽ $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (കണക്കാക്കിയത്)';

  @override
  String get rtaFrozenHint =>
      'ഫ്രീസ് ചെയ്തു — മൈക്രോഫോൺ പ്രവർത്തിക്കുന്നുണ്ട്, വരയ്ക്കുന്നില്ല എന്നു മാത്രം.';

  @override
  String get rtaRelativeHint =>
      'നിലവാരങ്ങൾ ആപേക്ഷികമാണ് (dBFS). ആദ്യ പോയിന്റ് സംരക്ഷിക്കുമ്പോൾ രൂപരേഖ കാണും — അതാണ് മറ്റുള്ളവയുടെ റഫറൻസ്.';

  @override
  String get rtaReferenceHint =>
      'നിറച്ച ബാറുകൾ = ഇവിടെ. രൂപരേഖ = റഫറൻസ് പോയിന്റ്.';

  @override
  String get rtaEnvelopeHint =>
      'ചുവപ്പ് = പരമാവധി, പച്ച = റീസെറ്റിനു ശേഷമുള്ള കുറഞ്ഞത്.';

  @override
  String get rtaMicStopped => 'മൈക്രോഫോൺ നിലച്ചിരിക്കുന്നു';

  @override
  String get rtaSilence => 'നിശ്ശബ്ദം — സിഗ്നൽ പ്ലേ ചെയ്യുന്നുണ്ടോ?';

  @override
  String get rtaPlaceholder =>
      'മൈക്രോഫോൺ ആരംഭിച്ച് മുറിയിലേക്ക് സിഗ്നൽ പ്ലേ ചെയ്യുക.';

  @override
  String rtaBandsInfo(int count) {
    return '$count മൂന്നിലൊന്ന് ഒക്ടേവ് ബാൻഡുകൾ, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'മുറി സ്കാൻ';

  @override
  String scanPointCount(int count) {
    return '$count പോ.';
  }

  @override
  String get commonMicNotRunning => 'മൈക്രോഫോൺ പ്രവർത്തിക്കുന്നില്ല';

  @override
  String get scanMicNeeded => 'അതില്ലെങ്കിൽ സ്ഥാനം മാത്രമേ അളക്കൂ, ശബ്ദം അല്ല.';

  @override
  String get scanContinuous => 'തുടർച്ചയായ അളവ്';

  @override
  String get scanContinuousHint => '0.5 മീ നടക്കുമ്പോഴെല്ലാം പോയിന്റ് സ്വയം';

  @override
  String get scanMeasuring => 'അളക്കുന്നു…';

  @override
  String get scanMeasureHere => 'ഇവിടെ അളക്കുക';

  @override
  String scanPointSaved(String id, String position) {
    return 'പോയിന്റ് $id $position ൽ സംരക്ഷിച്ചു';
  }

  @override
  String get scanStartTracking => 'സ്ഥാന ട്രാക്കിംഗ് ആരംഭിക്കുക';

  @override
  String get scanStartTrackingHint =>
      'ARKit — ഇതിലൂടെയാണ് മുറിയിൽ നിങ്ങൾ എവിടെ നിൽക്കുന്നു എന്ന് ആപ്പ് അറിയുന്നത്.';

  @override
  String scanPosition(String position) {
    return 'സ്ഥാനം: ഉത്ഭവത്തിൽ നിന്ന് $position മീ';
  }

  @override
  String get scanSetOriginHint =>
      'കേൾക്കുന്ന സ്ഥാനത്തു നിന്ന് ഉത്ഭവം നിശ്ചയിക്കുക.';

  @override
  String get scanOriginHere => 'ഇവിടെയാണ് ഉത്ഭവം';

  @override
  String get scanNoPoints => 'ഇതുവരെ പോയിന്റുകളില്ല.';

  @override
  String scanPointStats(String variation, String rms) {
    return '40–300 Hz വ്യാപനം: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'ലിവിംഗ് റൂം';

  @override
  String get scanNewMeasurement => 'പുതിയ അളവ്';

  @override
  String get scanRoomName => 'മുറിയുടെ പേര്';

  @override
  String get scanExcitation => 'മുറിയെ എന്തുകൊണ്ട് ഉത്തേജിപ്പിക്കും';

  @override
  String get scanPhoneNoiseHint =>
      'സൂചനയ്ക്കു മാത്രം — ഫോൺ സ്പീക്കർ ബാസ് ഏതാണ്ട് പുറപ്പെടുവിക്കുകയേയില്ല.';

  @override
  String get scanStart => 'തുടങ്ങുക';

  @override
  String get mapExportTooltip => 'FRD + JSON എക്സ്പോർട്ട്';

  @override
  String get mapNeedsTwoPoints =>
      'മാപ്പിന് കുറഞ്ഞത് രണ്ട് പോയിന്റ് വേണം. മുറിയിൽ നടന്ന് അളന്നുകൊണ്ടിരിക്കുക.';

  @override
  String get mapShareText =>
      'പോയിന്റ് തിരിച്ചുള്ള FRD (REW / VituixCAD ലേക്ക് ഇറക്കുമതി) ഒപ്പം മുഴുവൻ സെഷനും JSON ആയി.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'ഏറ്റവും സമനിരപ്പായ സ്ഥലം: $position മീ ൽ $id (40–300 Hz ൽ വ്യാപനം $variation dB)';
  }

  @override
  String get signalsSweepHelp =>
      'ഇംപൾസ് പ്രതികരണം, പ്രതിധ്വനി സമയം, ആദ്യ പ്രതിഫലനങ്ങൾ എന്നിവ കണക്കാക്കാവുന്ന ഏക സിഗ്നൽ. കമ്പ്യൂട്ടറിൽ നിന്നോ DAC ൽ നിന്നോ സ്പീക്കറുകളിലേക്ക് പ്ലേ ചെയ്യുക, ഫോൺ റെക്കോർഡ് ചെയ്യട്ടെ.';

  @override
  String get signalsLength => 'ദൈർഘ്യം';

  @override
  String get signalsFrom => 'മുതൽ';

  @override
  String get signalsTo => 'വരെ';

  @override
  String get signalsMonoNoChannel => 'മോണോ (ചാനലില്ല)';

  @override
  String get signalsExportWav => 'WAV എക്സ്പോർട്ട്';

  @override
  String get signalsPinkNoise => 'പിങ്ക് നോയ്സ്';

  @override
  String get signalsPinkHelp =>
      'ഓരോ ഒക്ടേവിലും തുല്യ ഊർജ്ജം. ആവൃത്തി പ്രതികരണം മാത്രം കിട്ടും, സമയമോ പ്രതിഫലനങ്ങളോ ഇല്ല — \"ഇവിടെ എന്തെങ്കിലും മാറുന്നുണ്ടോ?\" എന്ന പെട്ടെന്നുള്ള പരിശോധനയ്ക്ക് മതി.';

  @override
  String get signalsExportPink => '30 സെ WAV എക്സ്പോർട്ട്';

  @override
  String get signalsHowTo => 'എങ്ങനെ അളക്കാം';

  @override
  String get signalsStep1 =>
      'സിഗ്നൽ കമ്പ്യൂട്ടറിൽ നിന്ന് സ്പീക്കറുകളിലേക്ക് പ്ലേ ചെയ്യുക, ഫോണിൽ നിന്നല്ല.';

  @override
  String get signalsStep2 =>
      'അനലൈസർ ഏകദേശം −20 dBFS കാണിക്കുംവിധം വോളിയം ക്രമീകരിക്കുക. ഓവർലോഡ് പ്രതിഫലനം പോലെ തോന്നും.';

  @override
  String get signalsStep3 =>
      'ഫോൺ കുത്തനെ, കൈ നീട്ടി, മൈക്രോഫോൺ സ്പീക്കറുകളുടെ നേരെ പിടിക്കുക.';

  @override
  String get signalsStep4 =>
      'ബ്ലൂടൂത്ത് ഹെഡ്ഫോൺ വിച്ഛേദിക്കുക — കംപ്രഷനും ലേറ്റൻസിയും അളവ് നശിപ്പിക്കും.';

  @override
  String get signalsNoteMono =>
      'മോണോ രണ്ട് സ്പീക്കറുകളിലേക്കും ഒരുമിച്ച് അയച്ചാൽ L ഉം R ഉം കൂടിച്ചേരുകയും അവയുടെ വ്യത്യാസം തുകയിൽ മറയുകയും ചെയ്യും. ചാനലുകൾ അളക്കാൻ ചാനൽ തിരഞ്ഞെടുക്കുക.';

  @override
  String get signalsNoteStereo =>
      'സിഗ്നൽ ഒരു ചാനലിൽ മാത്രമുള്ള സ്റ്റീരിയോ ഫയൽ — സ്റ്റീരിയോ പ്ലേ ചെയ്യുന്ന ഏതും ഇത് പ്ലേ ചെയ്യും.';

  @override
  String get signalsNoteChannel =>
      'ചാനലിന്റെ പേരിട്ട മോണോ ഫയൽ. DAW അല്ലെങ്കിൽ മൾട്ടി-ചാനൽ ഇൻപുട്ട് വഴി റിസീവറിന്റെ ശരിയായ ഇൻപുട്ടിലേക്ക് അയയ്ക്കുക; സ്റ്റീരിയോ ഔട്ട്പുട്ടുള്ള ലാപ്ടോപ്പിന് ഇതിനെ ഈ ചാനലിലേക്ക് എത്തിക്കാനാകില്ല.';

  @override
  String get channelsTitle => 'ചാനൽ അളവ്';

  @override
  String get channelsHelp =>
      'കേൾക്കുന്ന സ്ഥാനത്ത് നിൽക്കുക. ഓരോ ചാനലിനും: റെക്കോർഡിംഗ് തുടങ്ങുക, സിഗ്നലുകൾ ടാബിലെ സ്വീപ്പ് അതിലേക്ക് പ്ലേ ചെയ്യുക, പൂർത്തിയായി അമർത്തുക. ഈ പോയിന്റുകളില്ലെങ്കിൽ രൂപകൽപ്പനയ്ക്ക് EQ ഉം വോളിയവും ഉണ്ടാക്കാൻ ഒന്നുമില്ല.';

  @override
  String channelsSweepLength(int seconds) {
    return 'സ്വീപ്പ് $seconds സെ';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ നൽകിയ ശേഷം പരിശോധന';

  @override
  String get channelsVerifyAfterEqHint =>
      'പോയിന്റ് \"EQ ന് ശേഷം\" ആയി സംരക്ഷിക്കും; EQ കണക്കാക്കിയ പോയിന്റ് മാറ്റിയെഴുതില്ല.';

  @override
  String channelsRecording(String seconds) {
    return '$seconds സെ റെക്കോർഡ് ചെയ്യുന്നു — ഇപ്പോൾ സ്വീപ്പ് പ്ലേ ചെയ്യുക';
  }

  @override
  String get channelsNotMeasured => 'അളന്നിട്ടില്ല';

  @override
  String get channelsMeasuredNoise => 'നോയ്സ് ഉപയോഗിച്ച് അളന്നു';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · നേരിട്ടുള്ള ശബ്ദം $ms ms ൽ';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · നേരിട്ടുള്ള ശബ്ദം $ms ms ൽ, T20 $t20 സെ';
  }

  @override
  String get commonDone => 'പൂർത്തിയായി';

  @override
  String get channelsMeasure => 'അളക്കുക';

  @override
  String get channelsAdd => 'ചേർക്കുക';

  @override
  String get channelsAgain => 'വീണ്ടും';

  @override
  String get compareTitle => 'താരതമ്യം';

  @override
  String get compareNeedsTwoPoints =>
      'താരതമ്യത്തിന് കുറഞ്ഞത് രണ്ട് പോയിന്റ് വേണം.';

  @override
  String get commonWithRoom => 'മുറിയോടെ';

  @override
  String get commonDirectSound => 'നേരിട്ടുള്ള ശബ്ദം';

  @override
  String get compareAfterEq => 'EQ ന് ശേഷം';

  @override
  String get compareBandsA => 'A (ബാൻഡുകൾ)';

  @override
  String get compareBandsB => 'B (ബാൻഡുകൾ)';

  @override
  String get compareArrivalDiff => 'എത്തുന്ന സമയത്തിന്റെ വ്യത്യാസം A − B';

  @override
  String get compareBroadbandDiff => 'വിശാല ബാൻഡ് നിലവാര വ്യത്യാസം A − B';

  @override
  String get compareWorstBelow300 =>
      '300 Hz ന് താഴെയുള്ള ഏറ്റവും വലിയ വ്യത്യാസം';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz ബാൻഡിൽ $db dB';
  }

  @override
  String get compareTrimNote =>
      'ഡിസ്റ്റൻസും ലെവൽ ട്രിമ്മും എത്തുന്ന സമയത്തിന്റെയും നിലവാരത്തിന്റെയും വ്യത്യാസം ശരിയാക്കും. 300 Hz ന് താഴെയുള്ള ആകൃതി വ്യത്യാസം ശരിയാക്കില്ല — അത് മറ്റൊരു ദൂരത്തിലുള്ള മറ്റൊരു ഭിത്തി കാരണമാണ്, സ്ഥാനം മാറ്റിയാണ് പരിഹരിക്കേണ്ടത്.';

  @override
  String get designRt60Live => 'അവസാന പ്രതികരണത്തിൽ നിന്ന് T20 125–500 Hz';

  @override
  String get designRt60Stored => 'സംരക്ഷിച്ച സ്വീപ്പിൽ നിന്ന് T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'കണക്കാക്കിയത് — സ്വീപ്പ് അളക്കുക, ഷ്രോഡർ തൽക്കാലം സൂചന മാത്രം';

  @override
  String get designExportTooltip => 'കോൺഫിഗറേഷൻ എക്സ്പോർട്ട്';

  @override
  String get designCompute => 'രൂപകൽപ്പന കണക്കാക്കുക';

  @override
  String get designLidarChecking => 'LiDAR ഉണ്ടോ എന്ന് പരിശോധിക്കുന്നു…';

  @override
  String get designLidarAvailable => 'LiDAR ലഭ്യമാണ്';

  @override
  String get designLidarMissing => 'LiDAR ഇല്ല — അളവുകൾ സ്വയം നൽകുക';

  @override
  String get designLidarHint =>
      'സ്കാൻ ഭിത്തികളെ സെന്റിമീറ്റർ കൃത്യതയിൽ നൽകുന്നു; അതിനാൽ മോഡുകൾ മാത്രമല്ല, പ്രതിഫലന പോയിന്റുകളും അതിരുകളിലേക്കുള്ള ദൂരവും ശരിയാകും.';

  @override
  String get designManualHint =>
      'മോഡ് കണക്കുകൂട്ടലിന് മൂന്ന് സംഖ്യകൾ മതി — പക്ഷേ പ്രതിഫലന പോയിന്റുകളും ഭിത്തികളിലേക്കുള്ള കൃത്യമായ ദൂരവും നഷ്ടപ്പെടും.';

  @override
  String get designStopScan => 'സ്കാൻ അവസാനിപ്പിക്കുക';

  @override
  String get designScanRoom => 'മുറി സ്കാൻ ചെയ്യുക';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls ഭിത്തികൾ',
      one: '1 ഭിത്തി',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings തുറസ്സുകൾ',
      one: '1 തുറസ്സ്',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'മുറിയുടെ അളവുകൾ';

  @override
  String get designLength => 'നീളം';

  @override
  String get designWidth => 'വീതി';

  @override
  String get designHeight => 'ഉയരം';

  @override
  String get designWhatToDo => 'ഇതിന് എന്ത് ചെയ്യണം';

  @override
  String get designRoomModes => 'മുറിയുടെ മോഡുകൾ';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (ഷ്രോഡർ) ന് മുകളിൽ ഒറ്റയൊറ്റ മോഡുകൾക്ക് അർത്ഥമില്ല. RT60 $rt60 സെ: $source.';
  }

  @override
  String get designEqTitle => 'EQ: അളന്നത്, ലക്ഷ്യം, പ്രവചനം';

  @override
  String get designEqHelp =>
      'അളന്ന പ്രതികരണവും റിസീവറിന്റെ പതിനഞ്ച്-ബാൻഡ് മോഡലും ചേർന്നതാണ് പ്രവചനം. EQ നൽകിയ ശേഷം, മോഡൽ എത്ര അടുത്തായിരുന്നു എന്നു കാണാൻ \"EQ ന് ശേഷം\" സ്വിച്ച് ഓണാക്കി ചാനൽ വീണ്ടും അളക്കുക.';

  @override
  String get designReceiverConfig => 'റിസീവർ കോൺഫിഗറേഷൻ';

  @override
  String get designGeometryOnly =>
      'സ്വീപ്പ് ഉപയോഗിച്ച് ചാനലുകൾ അളക്കാതെ ജ്യാമിതി മാത്രമേയുള്ളൂ: ദൂരങ്ങളും ക്രോസ്ഓവർ ആവൃത്തികളും. ഓരോ ചാനലിനും പോയിന്റുകളാകുമ്പോൾ EQ ഉം വോളിയവും വരും.';

  @override
  String get designShareSubject => 'കോൺഫിഗറേഷൻ നിർദ്ദേശം';

  @override
  String get impulseTitle => 'ഇംപൾസ് പ്രതികരണം';

  @override
  String get impulseCompareTooltip => 'പോയിന്റുകൾ താരതമ്യം ചെയ്യുക';

  @override
  String get impulseExportTooltip => 'ഫേസ് സഹിതം FRD എക്സ്പോർട്ട്';

  @override
  String get impulseTapToStart => 'ആരംഭിക്കാൻ ടാപ്പ് ചെയ്യുക.';

  @override
  String get impulseSweepTitle => 'സ്പീക്കറുകളിലേക്ക് പ്ലേ ചെയ്യുന്ന സ്വീപ്പ്';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds സെ. നിങ്ങൾ പ്ലേ ചെയ്യുന്നതുമായി യോജിക്കണം — അല്ലെങ്കിൽ ഡീകോൺവല്യൂഷൻ അർത്ഥശൂന്യമായ ഫലം നൽകും.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'റെക്കോർഡ് ചെയ്യുന്നു — $seconds സെ';
  }

  @override
  String get impulsePlaySweepNow =>
      'ഇപ്പോൾ കമ്പ്യൂട്ടറിൽ നിന്ന് സ്വീപ്പ് പ്ലേ ചെയ്യുക.';

  @override
  String get impulseStartRecording =>
      'റെക്കോർഡിംഗ് തുടങ്ങുക, പിന്നെ സ്വീപ്പ് പ്ലേ ചെയ്യുക';

  @override
  String get impulseFrequencyResponse => 'ആവൃത്തി പ്രതികരണം';

  @override
  String get impulseWithRoom => 'മുറിയോടെ (1 സെ)';

  @override
  String impulseDirectWindow(String ms) {
    return 'നേരിട്ടുള്ള ശബ്ദം (വിൻഡോ $ms ms)';
  }

  @override
  String get impulseWindow => 'വിൻഡോ';

  @override
  String impulseWindowHelp(String hz) {
    return 'നീളമുള്ള വിൻഡോ കൂടുതൽ താഴ്ന്ന ആവൃത്തികൾ കാണുന്നു (ഇപ്പോൾ $hz Hz ന് മുകളിൽ സാധുവാണ്), പക്ഷേ ആദ്യ പ്രതിഫലനവും അകത്തു കടക്കും. ഈ പരിധിക്കു താഴെ വക്രം മിനുസപ്പെടുത്തുകയോ വിശദീകരിക്കുകയോ ചെയ്യില്ല: അത് വിൻഡോയാണ്, മുറിയല്ല.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'ആദ്യ പ്രതിഫലനം വരെ ($ms ms)';
  }

  @override
  String get impulseTime => 'സമയം';

  @override
  String get impulseImpulse => 'ഇംപൾസ്';

  @override
  String get impulseTimeHelp =>
      'നീല വിൻഡോയാണ്, ഓറഞ്ച് വര കണ്ടെത്തിയ ആദ്യ പ്രതിഫലനം. സമയം പൂജ്യം നേരിട്ടുള്ള ശബ്ദമാണ്.';

  @override
  String get impulseSpectrogram => 'സ്പെക്ട്രോഗ്രാം';

  @override
  String get commonHide => 'മറയ്ക്കുക';

  @override
  String get commonShow => 'കാണിക്കുക';

  @override
  String get impulseSpectrogramHelp =>
      'നേരിട്ടുള്ള ശബ്ദം മുതൽ ms ൽ സമയം, ആവൃത്തി മുകളിലേക്ക്, നിറം −60 dB വരെയുള്ള നിലവാരം. മറ്റുള്ളവ മാഞ്ഞാലും നിലനിൽക്കുന്ന തിരശ്ചീന വര ഒരു മോഡാണ്; മുകളിലെ പട്ടിക അതുതന്നെ സംഖ്യയിൽ പറയുന്നു.';

  @override
  String get impulseDecayByOctave => 'ഒക്ടേവ് തിരിച്ചുള്ള ക്ഷയം';

  @override
  String get impulseMidNoT20 => 'മധ്യ ബാൻഡുകൾ T20 ന് മതിയായത്ര താഴ്ന്നില്ല.';

  @override
  String impulseMidT20(String seconds) {
    return 'മധ്യം 125–500 Hz: T20 $seconds സെ — രൂപകൽപ്പന ഉപയോഗിക്കുന്ന RT60 ഇതാണ്.';
  }

  @override
  String get impulseDecayHelp =>
      'ബാസിൽ ഫോണിൽ നിന്നുള്ള RT60 ഏകദേശ കണക്കാണ്: പശ്ചാത്തല ശബ്ദം അവിടെ ഏറ്റവും അടുത്താണ്, \"—\" എന്നാൽ പ്രതിധ്വനി അതിനു താഴെ ഇറങ്ങിയില്ല. C50 പൂജ്യത്തിനു മുകളിൽ: നേരിട്ടുള്ള ശബ്ദവും ആദ്യ പ്രതിഫലനങ്ങളും പ്രതിധ്വനിയെക്കാൾ കൂടുതൽ ഊർജ്ജം വഹിക്കുന്നു.';

  @override
  String get impulseResult => 'ഫലം';

  @override
  String get impulseDirectArrived => 'നേരിട്ടുള്ള ശബ്ദം എത്തിയത്';

  @override
  String get impulseDirectArrivedHelp =>
      'പ്ലേബാക്ക് കാലതാമസവും യാത്രാ സമയവും ചേർന്നത് — അതിൽ നിന്നുതന്നെ ഒന്നും മനസ്സിലാകില്ല, പക്ഷേ L, R സ്പീക്കറുകൾ തമ്മിലുള്ള വ്യത്യാസം മനസ്സിലാക്കിത്തരും.';

  @override
  String get impulseFirstReflection => 'ആദ്യ പ്രതിഫലനം';

  @override
  String get impulseNotFound => 'കണ്ടെത്തിയില്ല';

  @override
  String impulseAfterDirect(String time) {
    return 'നേരിട്ടുള്ള ശബ്ദത്തിന് $time ശേഷം';
  }

  @override
  String get impulseNoReflectionHelp =>
      'ഒന്നുകിൽ അതില്ല, അല്ലെങ്കിൽ നേരിട്ടുള്ള ഇംപൾസിന്റെ റിംഗിംഗിൽ ഒളിച്ചിരിക്കുന്നു.';

  @override
  String impulseExtraPath(String metres) {
    return 'അധിക പാത ≈ $metres മീ.';
  }

  @override
  String get impulseUnmeasurable => 'അളക്കാനാകില്ല';

  @override
  String get impulseRt60NoiseHelp =>
      'പ്രതിധ്വനി പശ്ചാത്തല ശബ്ദത്തിനു മുകളിൽ മതിയായത്ര ആഴത്തിൽ ഇറങ്ങിയില്ല — ഉച്ചത്തിലാക്കുക, അല്ലെങ്കിൽ കൂടുതൽ ശാന്തമായ സമയത്ത് അളക്കുക.';

  @override
  String get impulseRt60Help =>
      'T20 ഉം T30 ഉം തമ്മിലുള്ള വ്യത്യാസം ക്ഷയം എത്ര ശുദ്ധമാണെന്ന് സൂചിപ്പിക്കുന്നു.';

  @override
  String get impulseGating => 'വിൻഡോ (ഗേറ്റിംഗ്)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz ന് മുകളിൽ സാധുവാണ്';
  }

  @override
  String get impulseGatingHelp =>
      'അതിനു താഴെ വിൻഡോയ്ക്ക് ഒരു ചക്രം പോലും കാണാനാകില്ല — അവിടത്തെ വക്രം വിൻഡോയുടെ കൃത്രിമഫലമാണ്, മുറിയുടേതല്ല.';

  @override
  String get impulseSchroeder => 'ഷ്രോഡർ ക്ഷയ വക്രം';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz ൽ HD$order';
  }

  @override
  String get impulseHd2Help =>
      'ഹാർമോണിക്കുകൾ ഫരീന ഡീകോൺവല്യൂഷന്റെ നെഗറ്റീവ് സമയത്താണ്; ഇവിടെ അവയെ ഉപേക്ഷിക്കാതെ അവിടെ നിന്ന് വായിക്കുന്നു. −40 dB എന്നാൽ 1 %.';

  @override
  String get impulseHd3Help =>
      'മൂന്നാം ഹാർമോണിക് ഓവർലോഡിനൊപ്പം രണ്ടാമത്തേതിനെക്കാൾ വേഗത്തിൽ വളരുന്നു.';

  @override
  String get impulseDistortionHot => '−30 dB ന് മുകളിലുള്ള വികൃതി';

  @override
  String get impulseDistortionHotHelp =>
      'ഒന്നുകിൽ സ്വീപ്പ് വളരെ ഉച്ചത്തിലാണ്, അല്ലെങ്കിൽ സ്പീക്കർ പരിധിയിലാണ്. വികൃതിയുടെ വാൽ ഇംപൾസിൽ പ്രതിഫലനം പോലെ തോന്നും — എന്തെങ്കിലും വിശ്വസിക്കുംമുമ്പ് വോളിയം കുറച്ച് വീണ്ടും അളക്കുക.';

  @override
  String get eqMeasured => 'അളന്നത്';

  @override
  String get eqTarget => 'ലക്ഷ്യം';

  @override
  String get eqPredicted => 'EQ ന് ശേഷമുള്ള പ്രവചനം';

  @override
  String get eqMeasuredAfter => 'EQ ന് ശേഷം അളന്നത്';

  @override
  String eqDeviation(int maxHz) {
    return 'ലക്ഷ്യത്തിൽ നിന്നുള്ള വ്യതിയാനം 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'റിസീവറിൽ നൽകിയ ശേഷം';

  @override
  String get eqPredictionVsReality => 'പ്രവചനം vs യാഥാർത്ഥ്യം';

  @override
  String eqStubborn(String bands) {
    return 'ലക്ഷ്യത്തിൽ നിന്ന് 6 dB യിൽ കൂടുതൽ അകലെ തുടരും: $bands. ഇത് ഇന്റർഫെറൻസാണ്, ശക്തിക്കുറവല്ല — കൂടുതൽ ഉയർത്തിയല്ല, സ്പീക്കറോ കേൾവിക്കാരനോ നീക്കിയാണ് പരിഹരിക്കേണ്ടത്.';
  }

  @override
  String get eqModelOk =>
      'റിസീവറിന്റെ ഫിൽട്ടർ ഏകദേശം മോഡലിനെപ്പോലെ പെരുമാറുന്നു.';

  @override
  String get eqModelOff =>
      'റിസീവറിന്റെ യഥാർത്ഥ ഫിൽട്ടർ പ്രതീക്ഷിച്ചതിലും കൂടുതൽ മോഡലിൽ നിന്ന് വ്യത്യസ്തമാണ് — അതിന്റെ ബാൻഡുകൾ ഇവിടെ അനുമാനിച്ചതിനെക്കാൾ വീതിയോ ഇടുങ്ങിയതോ ആയിരിക്കാം.';

  @override
  String get eqTargetCurve => 'ലക്ഷ്യ വക്രം';

  @override
  String get eqFlat => 'സമനില';

  @override
  String get eqTargetHelp =>
      'സമനിരപ്പല്ല: ഏതാനും kHz ന് മുകളിൽ ചെവി നേരിട്ടുള്ള ശബ്ദം കേൾക്കുന്നു, മൈക്രോഫോൺ പ്രതിഫലനങ്ങളും കൂട്ടിച്ചേർക്കുന്നു, അളന്ന വക്രം നിരപ്പാക്കിയാൽ ശബ്ദം മന്ദമായി തോന്നും. മുകളിൽ നേരിയ ചരിവും താഴെ അൽപ്പം ബാസും ആണ് ബ്ലൈൻഡ് ലിസണിങ്ങിൽ ആളുകൾ തിരഞ്ഞെടുക്കുന്നത്.';

  @override
  String get eqBassLift => 'ബാസ് ഉയർത്തൽ';

  @override
  String get eqBassBelow => 'ബാസ് താഴെ';

  @override
  String get eqTilt => 'ചരിവ്';

  @override
  String get eqDbPerOctave => 'dB/ഒക്ടേവ്';

  @override
  String get eqTiltFrom => 'ചരിവ് തുടങ്ങുന്നത്';

  @override
  String get errorMicPermission =>
      'മൈക്രോഫോൺ ആക്സസ് ഇല്ലാതെ അളക്കാനാകില്ല. ക്രമീകരണങ്ങൾ → AudioScanner → മൈക്രോഫോൺ ൽ അനുവദിക്കുക.';

  @override
  String errorMic(String error) {
    return 'മൈക്രോഫോൺ: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'മൈക്രോഫോൺ ആരംഭിക്കാനായില്ല: $error';
  }

  @override
  String get errorNoArkit =>
      'ഈ ഉപകരണം ARKit വേൾഡ് ട്രാക്കിംഗ് പിന്തുണയ്ക്കുന്നില്ല — പോയിന്റുകൾ സ്ഥലത്ത് സ്ഥാപിക്കാനാകില്ല.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'റെക്കോർഡിംഗ് സ്വീപ്പിനെക്കാൾ ചെറുതാണ് ($expected സെ ൽ $recorded സെ). സിഗ്നൽ പ്ലേ ചെയ്യുംമുമ്പ് റെക്കോർഡിംഗ് തുടങ്ങുക.';
  }

  @override
  String get sessionSnapshots => 'സ്നാപ്ഷോട്ടുകൾ';

  @override
  String get errorTrackingUnreliable =>
      'സ്ഥാന ട്രാക്കിംഗ് വിശ്വസനീയമല്ല — പോയിന്റ് നിങ്ങൾ നിൽക്കുന്നിടത്ത് ആയിരിക്കില്ല.';

  @override
  String errorNoSound(int seconds) {
    return '$seconds സെ ൽ ശബ്ദമൊന്നും എത്തിയില്ല.';
  }

  @override
  String get noteSnapshotNoPose =>
      'അനലൈസറിൽ നിന്നുള്ള സ്നാപ്ഷോട്ട്, സ്ഥാനമില്ല';

  @override
  String get sessionChannels => 'ചാനലുകൾ';

  @override
  String get trackingOk => 'ട്രാക്കിംഗ് ശരി';

  @override
  String get trackingLimited => 'ദുർബല ട്രാക്കിംഗ്';

  @override
  String get trackingUnavailable => 'ട്രാക്കിംഗ് ഇല്ല';

  @override
  String get poseHintFeatures =>
      'ചിത്രത്തിൽ വിശദാംശങ്ങൾ കുറവാണ് — ശൂന്യമായ ഭിത്തിയിലല്ല, ഘടനയുള്ള എന്തിലെങ്കിലും ഫോൺ ചൂണ്ടുക.';

  @override
  String get poseHintMotion => 'വളരെ വേഗത്തിൽ നീങ്ങുന്നു — പതുക്കെ പോകുക.';

  @override
  String get poseHintLight =>
      'വെളിച്ചം കുറവാണ് — ലൈറ്റ് ഇടുക, ക്യാമറയ്ക്ക് താൻ എവിടെയാണെന്ന് കാണാനാകുന്നില്ല.';

  @override
  String get poseHintInitializing =>
      'ARKit തുടങ്ങുകയാണ്, അൽപ്പനേരം നീങ്ങിക്കൊണ്ടിരിക്കുക.';

  @override
  String get poseHintRelocalizing =>
      'ആദ്യത്തെ പോയിന്റ് തിരയുന്നു — നിങ്ങൾ തുടങ്ങിയിടത്തേക്ക് മടങ്ങുക.';

  @override
  String get signalPhonePink => 'ഫോണിൽ നിന്നുള്ള പിങ്ക് നോയ്സ്';

  @override
  String get signalExternalPink => 'സ്പീക്കറുകളിൽ നിന്നുള്ള പിങ്ക് നോയ്സ്';

  @override
  String get signalExternalSweep => 'സ്പീക്കറുകളിൽ നിന്നുള്ള സ്വീപ്പ്';

  @override
  String get captureWarningBluetooth =>
      'ബ്ലൂടൂത്ത് മൈക്രോഫോൺ: കംപ്രഷനും ലേറ്റൻസിയും അളവ് നശിപ്പിക്കും. ഹെഡ്ഫോൺ വിച്ഛേദിച്ച് ഉള്ളിലെ മൈക്രോഫോൺ ഉപയോഗിച്ച് അളക്കുക.';

  @override
  String get captureWarningProcessing =>
      'സിസ്റ്റം സിഗ്നൽ പ്രോസസ്സിംഗ് (AGC / നോയ്സ് അടിച്ചമർത്തൽ) ഓഫ് ചെയ്തില്ല. സ്ഥലങ്ങൾ തമ്മിൽ അളന്ന വ്യത്യാസങ്ങൾ വികലമാകും.';

  @override
  String get captureWarningMeasurementMode =>
      'മെഷർമെന്റ് മോഡ് ഓണാക്കാനായില്ല — മൈക്രോഫോണിന് സ്വന്തം ആവൃത്തി പ്രതികരണ തിരുത്തലുണ്ട്.';

  @override
  String get captureRouteUnknown => 'അജ്ഞാതം';

  @override
  String get axisLength => 'നീളം';

  @override
  String get axisWidth => 'വീതി';

  @override
  String get axisHeight => 'ഉയരം';
}
