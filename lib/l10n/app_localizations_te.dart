// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Telugu (`te`).
class AppLocalizationsTe extends AppLocalizations {
  AppLocalizationsTe([String locale = 'te']) : super(locale);

  @override
  String get tabScan => 'స్కాన్';

  @override
  String get tabMap => 'మ్యాప్';

  @override
  String get tabResponse => 'ప్రతిస్పందన';

  @override
  String get tabDesign => 'రూపకల్పన';

  @override
  String get tabSignals => 'సంకేతాలు';

  @override
  String get rtaSnapshotFailed => 'స్నాప్‌షాట్ సేవ్ కాలేదు.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'పాయింట్ $id గా సేవ్ చేయబడింది.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'పాయింట్ $id గా సేవ్ చేయబడింది (స్థానం లేకుండా).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count పాయింట్లు',
      one: '1 పాయింట్',
    );
    return 'క్రమాంకనం $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'ఫైల్ చదవడం సాధ్యం కాలేదు: $message';
  }

  @override
  String get rtaOffsetTitle => 'ఆఫ్‌సెట్ dB SPL';

  @override
  String get rtaOffsetHelp =>
      '1 kHz టోన్ ప్లే చేసి, SPL మీటర్‌లో స్థాయిని చదివి, విశ్లేషణ సాధనం చూపేదానితో తేడాను నమోదు చేయండి. ఆఫ్‌సెట్ సున్నా కాకపోతే స్థాయిలు అంచనా SPL గా గుర్తించబడతాయి; లేకపోతే dBFS గానే ఉంటాయి.';

  @override
  String get commonReset => 'రీసెట్';

  @override
  String get commonCancel => 'రద్దు చేయి';

  @override
  String get commonSave => 'సేవ్ చేయి';

  @override
  String get commonStop => 'ఆపు';

  @override
  String get commonStartMic => 'మైక్రోఫోన్ ప్రారంభించు';

  @override
  String get tabAnalyzer => 'విశ్లేషణ సాధనం';

  @override
  String get rtaUnfreeze => 'ఫ్రీజ్ తొలగించు';

  @override
  String get rtaFreeze => 'ఫ్రీజ్ చేయి';

  @override
  String get rtaPeakHold => 'పీక్ హోల్డ్';

  @override
  String get rtaMaxMinTraces => 'గరిష్ఠ / కనిష్ఠ రేఖలు';

  @override
  String get rtaResetTraces => 'రేఖలను రీసెట్ చేయి';

  @override
  String get rtaSaveAsPoint => 'పాయింట్‌గా సేవ్ చేయి (3 సె)';

  @override
  String get rtaMicCalibration => 'మైక్రోఫోన్ క్రమాంకనం…';

  @override
  String get rtaRemoveCalibration => 'క్రమాంకనం తొలగించు';

  @override
  String get rtaOffsetMenu => 'ఆఫ్‌సెట్ dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · సంకేత ప్రాసెసింగ్ లేదు';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count పాయింట్లు',
      one: '1 పాయింట్',
    );
    return 'క్రమాంకనం $name: $_temp0, సవరణ $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (అంచనా)';

  @override
  String get rtaFrozenHint =>
      'ఫ్రీజ్ అయింది — మైక్రోఫోన్ నడుస్తూనే ఉంది, గీయడం మాత్రమే ఆగింది.';

  @override
  String get rtaRelativeHint =>
      'స్థాయిలు సాపేక్షమైనవి (dBFS). మొదటి పాయింట్ సేవ్ చేసినప్పుడు రూపురేఖ కనిపిస్తుంది — అదే మిగతావాటికి సూచన.';

  @override
  String get rtaReferenceHint =>
      'నిండిన బార్లు = ఇక్కడ. రూపురేఖ = సూచన పాయింట్.';

  @override
  String get rtaEnvelopeHint =>
      'ఎరుపు = గరిష్ఠం, ఆకుపచ్చ = రీసెట్ తర్వాత కనిష్ఠం.';

  @override
  String get rtaMicStopped => 'మైక్రోఫోన్ ఆగి ఉంది';

  @override
  String get rtaSilence => 'నిశ్శబ్దం — సంకేతం ప్లే అవుతోందా?';

  @override
  String get rtaPlaceholder =>
      'మైక్రోఫోన్ ప్రారంభించి గదిలోకి సంకేతం ప్లే చేయండి.';

  @override
  String rtaBandsInfo(int count) {
    return '$count మూడో వంతు ఆక్టేవ్ బ్యాండ్లు, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'గది స్కాన్';

  @override
  String scanPointCount(int count) {
    return '$count పా.';
  }

  @override
  String get commonMicNotRunning => 'మైక్రోఫోన్ నడవడం లేదు';

  @override
  String get scanMicNeeded =>
      'అది లేకపోతే స్థానం మాత్రమే కొలుస్తారు, ధ్వని కాదు.';

  @override
  String get scanContinuous => 'నిరంతర కొలత';

  @override
  String get scanContinuousHint =>
      'ప్రతి 0.5 మీ నడిచినప్పుడు పాయింట్ ఆటోమేటిక్‌గా';

  @override
  String get scanMeasuring => 'కొలుస్తోంది…';

  @override
  String get scanMeasureHere => 'ఇక్కడ కొలవండి';

  @override
  String scanPointSaved(String id, String position) {
    return 'పాయింట్ $id $position వద్ద సేవ్ చేయబడింది';
  }

  @override
  String get scanStartTracking => 'స్థాన ట్రాకింగ్ ప్రారంభించు';

  @override
  String get scanStartTrackingHint =>
      'ARKit — దీని ద్వారా మీరు గదిలో ఎక్కడ నిలబడ్డారో యాప్‌కు తెలుస్తుంది.';

  @override
  String scanPosition(String position) {
    return 'స్థానం: మూలం నుండి $position మీ';
  }

  @override
  String get scanSetOriginHint =>
      'వినే స్థానంలో నిలబడి మూల బిందువును నిర్ణయించండి.';

  @override
  String get scanOriginHere => 'ఇదే మూల బిందువు';

  @override
  String get scanNoPoints => 'ఇంకా పాయింట్లు లేవు.';

  @override
  String scanPointStats(String variation, String rms) {
    return '40–300 Hz వ్యాప్తి: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'లివింగ్ రూమ్';

  @override
  String get scanNewMeasurement => 'కొత్త కొలత';

  @override
  String get scanRoomName => 'గది పేరు';

  @override
  String get scanExcitation => 'గదిని దేనితో ఉత్తేజపరుస్తారు';

  @override
  String get scanPhoneNoiseHint =>
      'సూచనకు మాత్రమే — ఫోన్ స్పీకర్ బేస్‌ను దాదాపు అస్సలు ఇవ్వదు.';

  @override
  String get scanStart => 'ప్రారంభించు';

  @override
  String get mapExportTooltip => 'FRD + JSON ఎగుమతి';

  @override
  String get mapNeedsTwoPoints =>
      'మ్యాప్‌కు కనీసం రెండు పాయింట్లు కావాలి. గదిలో నడుస్తూ కొలుస్తూ ఉండండి.';

  @override
  String get mapShareText =>
      'పాయింట్ల వారీ FRD (REW / VituixCAD లోకి దిగుమతి) మరియు మొత్తం సెషన్ JSON గా.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'అత్యంత సమతలమైన చోటు: $position మీ వద్ద $id (40–300 Hz లో వ్యాప్తి $variation dB)';
  }

  @override
  String get signalsSweepHelp =>
      'ఇంపల్స్ ప్రతిస్పందన, ప్రతిధ్వని సమయం, తొలి ప్రతిబింబాలను లెక్కించగల ఏకైక సంకేతం. కంప్యూటర్ లేదా DAC నుండి స్పీకర్లకు ప్లే చేయండి, ఫోన్ రికార్డ్ చేయనివ్వండి.';

  @override
  String get signalsLength => 'వ్యవధి';

  @override
  String get signalsFrom => 'నుండి';

  @override
  String get signalsTo => 'వరకు';

  @override
  String get signalsMonoNoChannel => 'మోనో (ఛానల్ లేదు)';

  @override
  String get signalsExportWav => 'WAV ఎగుమతి';

  @override
  String get signalsPinkNoise => 'పింక్ నాయిస్';

  @override
  String get signalsPinkHelp =>
      'ప్రతి ఆక్టేవ్‌లోనూ సమాన శక్తి. కేవలం పౌనఃపున్య ప్రతిస్పందన మాత్రమే వస్తుంది, సమయం లేదా ప్రతిబింబాలు లేవు — \"ఇక్కడ ఏదైనా మారుతోందా?\" అనే త్వరిత పరీక్షకు సరిపోతుంది.';

  @override
  String get signalsExportPink => '30 సె WAV ఎగుమతి';

  @override
  String get signalsHowTo => 'ఎలా కొలవాలి';

  @override
  String get signalsStep1 =>
      'సంకేతాన్ని కంప్యూటర్ నుండి స్పీకర్లకు ప్లే చేయండి, ఫోన్ నుండి కాదు.';

  @override
  String get signalsStep2 =>
      'విశ్లేషణ సాధనం సుమారు −20 dBFS చూపేలా వాల్యూమ్ సెట్ చేయండి. ఓవర్‌లోడ్ ప్రతిబింబంలా కనిపిస్తుంది.';

  @override
  String get signalsStep3 =>
      'ఫోన్‌ను నిలువుగా, చేయి చాచి, మైక్రోఫోన్ స్పీకర్ల వైపు ఉంచి పట్టుకోండి.';

  @override
  String get signalsStep4 =>
      'బ్లూటూత్ హెడ్‌ఫోన్లను తీసివేయండి — కంప్రెషన్, ఆలస్యం కొలతను చెడగొడతాయి.';

  @override
  String get signalsNoteMono =>
      'మోనోను రెండు స్పీకర్లకు ఒకేసారి పంపితే L, R కలిసిపోతాయి, వాటి తేడా మొత్తంలో కనిపించదు. ఛానళ్లను కొలవడానికి ఛానల్ ఎంచుకోండి.';

  @override
  String get signalsNoteStereo =>
      'సంకేతం ఒక్క ఛానల్‌లో మాత్రమే ఉన్న స్టీరియో ఫైల్ — స్టీరియో ప్లే చేసే ఏదైనా దీన్ని ప్లే చేస్తుంది.';

  @override
  String get signalsNoteChannel =>
      'ఛానల్ పేరు పెట్టిన మోనో ఫైల్. DAW లేదా బహుళ-ఛానల్ ఇన్‌పుట్ ద్వారా రిసీవర్‌లోని సరైన ఇన్‌పుట్‌కు పంపండి; స్టీరియో అవుట్‌పుట్ ఉన్న ల్యాప్‌టాప్ దీన్ని ఈ ఛానల్‌కు చేర్చలేదు.';

  @override
  String get channelsTitle => 'ఛానల్ కొలత';

  @override
  String get channelsHelp =>
      'వినే స్థానంలో నిలబడండి. ప్రతి ఛానల్‌కు: రికార్డింగ్ ప్రారంభించి, సంకేతాల ట్యాబ్‌లోని స్వీప్‌ను దానిలోకి ప్లే చేసి, పూర్తయింది నొక్కండి. ఈ పాయింట్లు లేకపోతే రూపకల్పన EQ, వాల్యూమ్ తయారు చేయడానికి ఏమీ ఉండదు.';

  @override
  String channelsSweepLength(int seconds) {
    return 'స్వీప్ $seconds సె';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ నమోదు చేసిన తర్వాత ధృవీకరణ';

  @override
  String get channelsVerifyAfterEqHint =>
      'పాయింట్ \"EQ తర్వాత\" గా సేవ్ అవుతుంది; EQ లెక్కించిన పాయింట్‌ను తిరిగి రాయదు.';

  @override
  String channelsRecording(String seconds) {
    return '$seconds సె రికార్డ్ అవుతోంది — ఇప్పుడు స్వీప్ ప్లే చేయండి';
  }

  @override
  String get channelsNotMeasured => 'కొలవలేదు';

  @override
  String get channelsMeasuredNoise => 'నాయిస్‌తో కొలిచారు';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · ప్రత్యక్ష ధ్వని $ms ms లో';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · ప్రత్యక్ష ధ్వని $ms ms లో, T20 $t20 సె';
  }

  @override
  String get commonDone => 'పూర్తయింది';

  @override
  String get channelsMeasure => 'కొలవండి';

  @override
  String get channelsAdd => 'జోడించు';

  @override
  String get channelsAgain => 'మళ్ళీ';

  @override
  String get compareTitle => 'పోలిక';

  @override
  String get compareNeedsTwoPoints => 'పోలికకు కనీసం రెండు పాయింట్లు కావాలి.';

  @override
  String get commonWithRoom => 'గదితో';

  @override
  String get commonDirectSound => 'ప్రత్యక్ష ధ్వని';

  @override
  String get compareAfterEq => 'EQ తర్వాత';

  @override
  String get compareBandsA => 'A (బ్యాండ్లు)';

  @override
  String get compareBandsB => 'B (బ్యాండ్లు)';

  @override
  String get compareArrivalDiff => 'చేరే సమయ వ్యత్యాసం A − B';

  @override
  String get compareBroadbandDiff => 'విశాల బ్యాండ్ స్థాయి వ్యత్యాసం A − B';

  @override
  String get compareWorstBelow300 => '300 Hz కింద అతిపెద్ద వ్యత్యాసం';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz బ్యాండ్‌లో $db dB';
  }

  @override
  String get compareTrimNote =>
      'డిస్టెన్స్, లెవల్ ట్రిమ్ చేరే సమయం, స్థాయి వ్యత్యాసాలను సరిచేస్తాయి. 300 Hz కింద ఆకార వ్యత్యాసాన్ని సరిచేయవు — అది వేరే దూరంలోని వేరే గోడ వల్ల వస్తుంది, స్థానం మార్చడం ద్వారా పరిష్కరించాలి.';

  @override
  String get designRt60Live => 'చివరి ప్రతిస్పందన నుండి T20 125–500 Hz';

  @override
  String get designRt60Stored => 'సేవ్ చేసిన స్వీప్ నుండి T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'అంచనా — స్వీప్ కొలవండి, ష్రోడర్ ప్రస్తుతానికి సూచన మాత్రమే';

  @override
  String get designExportTooltip => 'కాన్ఫిగరేషన్ ఎగుమతి';

  @override
  String get designCompute => 'రూపకల్పనను లెక్కించు';

  @override
  String get designLidarChecking => 'LiDAR ఉందో లేదో తనిఖీ చేస్తోంది…';

  @override
  String get designLidarAvailable => 'LiDAR అందుబాటులో ఉంది';

  @override
  String get designLidarMissing => 'LiDAR లేదు — కొలతలను చేతితో నమోదు చేయండి';

  @override
  String get designLidarHint =>
      'స్కాన్ గోడలను సెంటీమీటర్ కచ్చితత్వంతో ఇస్తుంది, కాబట్టి మోడ్లే కాదు, ప్రతిబింబ బిందువులు, హద్దులకు దూరాలు కూడా సరిపోతాయి.';

  @override
  String get designManualHint =>
      'మోడ్ లెక్కకు మూడు సంఖ్యలు చాలు — కానీ ప్రతిబింబ బిందువులు, గోడలకు కచ్చితమైన దూరాలు పోతాయి.';

  @override
  String get designStopScan => 'స్కాన్ ముగించు';

  @override
  String get designScanRoom => 'గదిని స్కాన్ చేయి';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls గోడలు',
      one: '1 గోడ',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings ఖాళీలు',
      one: '1 ఖాళీ',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'గది కొలతలు';

  @override
  String get designLength => 'పొడవు';

  @override
  String get designWidth => 'వెడల్పు';

  @override
  String get designHeight => 'ఎత్తు';

  @override
  String get designWhatToDo => 'దీనికి ఏం చేయాలి';

  @override
  String get designRoomModes => 'గది మోడ్లు';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (ష్రోడర్) పైన వ్యక్తిగత మోడ్లకు అర్థం లేదు. RT60 $rt60 సె: $source.';
  }

  @override
  String get designEqTitle => 'EQ: కొలిచింది, లక్ష్యం, అంచనా';

  @override
  String get designEqHelp =>
      'అంచనా అంటే కొలిచిన ప్రతిస్పందనకు రిసీవర్ పదిహేను-బ్యాండ్ నమూనా కలపడం. EQ నమోదు చేసిన తర్వాత, నమూనా ఎంత దగ్గరగా ఉందో చూడడానికి \"EQ తర్వాత\" స్విచ్ ఆన్ చేసి ఛానల్‌ను మళ్లీ కొలవండి.';

  @override
  String get designReceiverConfig => 'రిసీవర్ కాన్ఫిగరేషన్';

  @override
  String get designGeometryOnly =>
      'స్వీప్‌తో ఛానళ్లను కొలవకపోతే జ్యామితి మాత్రమే ఉంటుంది: దూరాలు, క్రాస్‌ఓవర్ పౌనఃపున్యాలు. ప్రతి ఛానల్‌కు పాయింట్లు వచ్చాక EQ, వాల్యూమ్ చేరతాయి.';

  @override
  String get designShareSubject => 'కాన్ఫిగరేషన్ ప్రతిపాదన';

  @override
  String get impulseTitle => 'ఇంపల్స్ ప్రతిస్పందన';

  @override
  String get impulseCompareTooltip => 'పాయింట్లను పోల్చండి';

  @override
  String get impulseExportTooltip => 'ఫేజ్‌తో FRD ఎగుమతి';

  @override
  String get impulseTapToStart => 'ప్రారంభించడానికి తాకండి.';

  @override
  String get impulseSweepTitle => 'స్పీకర్లకు ప్లే చేసే స్వీప్';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds సె. మీరు ప్లే చేసేదానితో సరిపోలాలి — లేకపోతే డికన్వల్యూషన్ అర్థరహిత ఫలితం ఇస్తుంది.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'రికార్డ్ అవుతోంది — $seconds సె';
  }

  @override
  String get impulsePlaySweepNow =>
      'ఇప్పుడు కంప్యూటర్ నుండి స్వీప్ ప్లే చేయండి.';

  @override
  String get impulseStartRecording =>
      'రికార్డింగ్ ప్రారంభించి, తర్వాత స్వీప్ ప్లే చేయండి';

  @override
  String get impulseFrequencyResponse => 'పౌనఃపున్య ప్రతిస్పందన';

  @override
  String get impulseWithRoom => 'గదితో (1 సె)';

  @override
  String impulseDirectWindow(String ms) {
    return 'ప్రత్యక్ష ధ్వని (విండో $ms ms)';
  }

  @override
  String get impulseWindow => 'విండో';

  @override
  String impulseWindowHelp(String hz) {
    return 'పొడవైన విండో తక్కువ పౌనఃపున్యాలను చూస్తుంది (ఇప్పుడు $hz Hz పైన చెల్లుతుంది), కానీ తొలి ప్రతిబింబాన్నీ లోపలికి రానిస్తుంది. ఈ హద్దు కింద వక్రరేఖను నునుపు చేయరు, వ్యాఖ్యానించరు: అది విండో, గది కాదు.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'తొలి ప్రతిబింబం వరకు ($ms ms)';
  }

  @override
  String get impulseTime => 'సమయం';

  @override
  String get impulseImpulse => 'ఇంపల్స్';

  @override
  String get impulseTimeHelp =>
      'నీలం విండో, నారింజ గీత కనుగొన్న తొలి ప్రతిబింబం. సమయం సున్నా ప్రత్యక్ష ధ్వని.';

  @override
  String get impulseSpectrogram => 'స్పెక్ట్రోగ్రామ్';

  @override
  String get commonHide => 'దాచు';

  @override
  String get commonShow => 'చూపు';

  @override
  String get impulseSpectrogramHelp =>
      'ప్రత్యక్ష ధ్వని నుండి ms లో సమయం, పౌనఃపున్యం పైకి, రంగు −60 dB వరకు స్థాయి. మిగతావన్నీ మాయమైనా మిగిలే అడ్డు పట్టీ ఒక మోడ్; పై పట్టిక అదే విషయాన్ని సంఖ్యలో చెబుతుంది.';

  @override
  String get impulseDecayByOctave => 'ఆక్టేవ్ వారీ క్షీణత';

  @override
  String get impulseMidNoT20 => 'మధ్య బ్యాండ్లు T20 కు సరిపడా తగ్గలేదు.';

  @override
  String impulseMidT20(String seconds) {
    return 'మధ్య 125–500 Hz: T20 $seconds సె — రూపకల్పన ఉపయోగించే RT60 ఇదే.';
  }

  @override
  String get impulseDecayHelp =>
      'బేస్‌లో ఫోన్ నుండి వచ్చే RT60 అంచనా మాత్రమే: నేపథ్య శబ్దం అక్కడ దగ్గరగా ఉంటుంది, \"—\" అంటే ప్రతిధ్వని దాని కింద తగ్గలేదు. C50 సున్నా పైన: ప్రత్యక్ష ధ్వని, తొలి ప్రతిబింబాలు ప్రతిధ్వని కంటే ఎక్కువ శక్తిని మోస్తాయి.';

  @override
  String get impulseResult => 'ఫలితం';

  @override
  String get impulseDirectArrived => 'ప్రత్యక్ష ధ్వని చేరింది';

  @override
  String get impulseDirectArrivedHelp =>
      'ప్లేబ్యాక్ ఆలస్యం ప్లస్ ప్రయాణ సమయం — అది ఒంటరిగా ఏమీ చెప్పదు, కానీ L, R స్పీకర్ల మధ్య తేడా చెబుతుంది.';

  @override
  String get impulseFirstReflection => 'తొలి ప్రతిబింబం';

  @override
  String get impulseNotFound => 'కనుగొనలేదు';

  @override
  String impulseAfterDirect(String time) {
    return 'ప్రత్యక్ష ధ్వని తర్వాత $time';
  }

  @override
  String get impulseNoReflectionHelp =>
      'అది అసలు లేదు, లేదా ప్రత్యక్ష ఇంపల్స్ రింగింగ్‌లో దాగి ఉంది.';

  @override
  String impulseExtraPath(String metres) {
    return 'అదనపు మార్గం ≈ $metres మీ.';
  }

  @override
  String get impulseUnmeasurable => 'కొలవలేము';

  @override
  String get impulseRt60NoiseHelp =>
      'ప్రతిధ్వని నేపథ్య శబ్దానికి పైన తగినంత లోతుకు తగ్గలేదు — గట్టిగా పెట్టండి, లేదా నిశ్శబ్ద సమయంలో కొలవండి.';

  @override
  String get impulseRt60Help =>
      'T20, T30 మధ్య తేడా క్షీణత ఎంత శుభ్రంగా ఉందో సూచిస్తుంది.';

  @override
  String get impulseGating => 'విండో (గేటింగ్)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz పైన చెల్లుతుంది';
  }

  @override
  String get impulseGatingHelp =>
      'దాని కింద విండోకు ఒక్క ఆవర్తనమూ కనిపించదు — అక్కడి వక్రరేఖ విండో కృత్రిమ ప్రభావం, గది కాదు.';

  @override
  String get impulseSchroeder => 'ష్రోడర్ క్షీణత వక్రరేఖ';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz వద్ద HD$order';
  }

  @override
  String get impulseHd2Help =>
      'హార్మోనిక్‌లు ఫారినా డికన్వల్యూషన్ ప్రతికూల సమయంలో ఉంటాయి; ఇక్కడ వాటిని పారేయకుండా అక్కడి నుండి చదువుతాం. −40 dB అంటే 1 %.';

  @override
  String get impulseHd3Help =>
      'మూడవ హార్మోనిక్ ఓవర్‌లోడ్‌తో రెండవదాని కంటే వేగంగా పెరుగుతుంది.';

  @override
  String get impulseDistortionHot => '−30 dB పైన వక్రీకరణ';

  @override
  String get impulseDistortionHotHelp =>
      'స్వీప్ మరీ గట్టిగా ఉంది, లేదా స్పీకర్ హద్దులో ఉంది. వక్రీకరణ తోక ఇంపల్స్‌లో ప్రతిబింబంలా కనిపిస్తుంది — దేన్నీ నమ్మే ముందు వాల్యూమ్ తగ్గించి మళ్లీ కొలవండి.';

  @override
  String get eqMeasured => 'కొలిచింది';

  @override
  String get eqTarget => 'లక్ష్యం';

  @override
  String get eqPredicted => 'EQ తర్వాత అంచనా';

  @override
  String get eqMeasuredAfter => 'EQ తర్వాత కొలిచింది';

  @override
  String eqDeviation(int maxHz) {
    return 'లక్ష్యం నుండి విచలనం 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'రిసీవర్‌లో నమోదు చేసిన తర్వాత';

  @override
  String get eqPredictionVsReality => 'అంచనా vs వాస్తవం';

  @override
  String eqStubborn(String bands) {
    return 'లక్ష్యం నుండి 6 dB కంటే ఎక్కువ దూరంలో ఉంటుంది: $bands. ఇది అంతరాయం, శక్తి లోపం కాదు — ఇంకా పెంచడం ద్వారా కాదు, స్పీకర్ లేదా వినేవారి స్థానం మార్చడం ద్వారా పరిష్కరించండి.';
  }

  @override
  String get eqModelOk => 'రిసీవర్ ఫిల్టర్ దాదాపు నమూనాలాగే ప్రవర్తిస్తోంది.';

  @override
  String get eqModelOff =>
      'రిసీవర్ అసలు ఫిల్టర్ ఊహించిన దానికంటే నమూనా నుండి ఎక్కువ భిన్నంగా ఉంది — దాని బ్యాండ్లు ఇక్కడ ఊహించిన వాటి కంటే వెడల్పుగా లేదా ఇరుకుగా ఉండవచ్చు.';

  @override
  String get eqTargetCurve => 'లక్ష్య వక్రరేఖ';

  @override
  String get eqFlat => 'సమతలం';

  @override
  String get eqTargetHelp =>
      'సమతలం కాదు: కొన్ని kHz పైన చెవి ప్రత్యక్ష ధ్వనిని వింటుంది, మైక్రోఫోన్ ప్రతిబింబాలనూ కూడుతుంది, కొలిచిన వక్రరేఖను సమతలం చేస్తే ధ్వని మందగిస్తుంది. పైన కొద్దిపాటి వాలు, కింద కొంచెం బేస్ — గుడ్డి వినికిడిలో ప్రజలు ఎంచుకునేది అదే.';

  @override
  String get eqBassLift => 'బేస్ పెంపు';

  @override
  String get eqBassBelow => 'బేస్ కింద';

  @override
  String get eqTilt => 'వాలు';

  @override
  String get eqDbPerOctave => 'dB/ఆక్టేవ్';

  @override
  String get eqTiltFrom => 'వాలు నుండి';

  @override
  String get errorMicPermission =>
      'మైక్రోఫోన్ అనుమతి లేకుండా కొలవలేము. సెట్టింగ్‌లు → AudioScanner → మైక్రోఫోన్ లో అనుమతించండి.';

  @override
  String errorMic(String error) {
    return 'మైక్రోఫోన్: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'మైక్రోఫోన్ ప్రారంభం కాలేదు: $error';
  }

  @override
  String get errorNoArkit =>
      'ఈ పరికరం ARKit వరల్డ్ ట్రాకింగ్‌కు మద్దతు ఇవ్వదు — పాయింట్లను స్థలంలో ఉంచలేము.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'రికార్డింగ్ స్వీప్ కంటే చిన్నది ($expected సె లో $recorded సె). సంకేతం ప్లే చేసే ముందు రికార్డింగ్ ప్రారంభించండి.';
  }

  @override
  String get sessionSnapshots => 'స్నాప్‌షాట్లు';

  @override
  String get errorTrackingUnreliable =>
      'స్థాన ట్రాకింగ్ నమ్మదగినది కాదు — పాయింట్ మీరు నిలబడిన చోట ఉండకపోవచ్చు.';

  @override
  String errorNoSound(int seconds) {
    return '$seconds సె లో ఎలాంటి ధ్వనీ చేరలేదు.';
  }

  @override
  String get noteSnapshotNoPose =>
      'విశ్లేషణ సాధనం నుండి స్నాప్‌షాట్, స్థానం లేదు';

  @override
  String get sessionChannels => 'ఛానళ్లు';

  @override
  String get trackingOk => 'ట్రాకింగ్ సరే';

  @override
  String get trackingLimited => 'బలహీన ట్రాకింగ్';

  @override
  String get trackingUnavailable => 'ట్రాకింగ్ లేదు';

  @override
  String get poseHintFeatures =>
      'చిత్రంలో వివరాలు చాలా తక్కువ — ఖాళీ గోడకు కాదు, నిర్మాణం ఉన్న దేనికైనా ఫోన్ చూపండి.';

  @override
  String get poseHintMotion => 'చాలా వేగమైన కదలిక — నెమ్మదిగా వెళ్లండి.';

  @override
  String get poseHintLight =>
      'వెలుతురు తక్కువ — లైట్ వేయండి, కెమెరాకు తాను ఎక్కడ ఉందో కనిపించడం లేదు.';

  @override
  String get poseHintInitializing =>
      'ARKit ప్రారంభమవుతోంది, కాసేపు కదులుతూ ఉండండి.';

  @override
  String get poseHintRelocalizing =>
      'అసలు పాయింట్ కోసం వెతుకుతోంది — మీరు మొదలుపెట్టిన చోటుకు తిరిగి వెళ్లండి.';

  @override
  String get signalPhonePink => 'ఫోన్ నుండి పింక్ నాయిస్';

  @override
  String get signalExternalPink => 'స్పీకర్ల నుండి పింక్ నాయిస్';

  @override
  String get signalExternalSweep => 'స్పీకర్ల నుండి స్వీప్';

  @override
  String get captureWarningBluetooth =>
      'బ్లూటూత్ మైక్రోఫోన్: కంప్రెషన్, ఆలస్యం కొలతను చెడగొడతాయి. హెడ్‌ఫోన్లను తీసివేసి అంతర్నిర్మిత మైక్రోఫోన్‌తో కొలవండి.';

  @override
  String get captureWarningProcessing =>
      'సిస్టమ్ సంకేత ప్రాసెసింగ్‌ను (AGC / శబ్ద అణచివేత) ఆపలేదు. స్థలాల మధ్య కొలిచిన తేడాలు వక్రీకరించబడతాయి.';

  @override
  String get captureWarningMeasurementMode =>
      'కొలత మోడ్‌ను ఆన్ చేయలేకపోయింది — మైక్రోఫోన్‌కు తన సొంత పౌనఃపున్య ప్రతిస్పందన సవరణ ఉంది.';

  @override
  String get captureRouteUnknown => 'తెలియదు';

  @override
  String get axisLength => 'పొడవు';

  @override
  String get axisWidth => 'వెడల్పు';

  @override
  String get axisHeight => 'ఎత్తు';
}
