// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Marathi (`mr`).
class AppLocalizationsMr extends AppLocalizations {
  AppLocalizationsMr([String locale = 'mr']) : super(locale);

  @override
  String get tabScan => 'स्कॅन';

  @override
  String get tabMap => 'नकाशा';

  @override
  String get tabResponse => 'प्रतिसाद';

  @override
  String get tabDesign => 'डिझाइन';

  @override
  String get tabSignals => 'सिग्नल';

  @override
  String get rtaSnapshotFailed => 'स्नॅपशॉट जतन झाला नाही.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'बिंदू $id म्हणून जतन केले.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'बिंदू $id म्हणून जतन केले (स्थानाशिवाय).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count बिंदू',
      one: '1 बिंदू',
    );
    return 'कॅलिब्रेशन $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'फाइल वाचता येत नाही: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL ऑफसेट';

  @override
  String get rtaOffsetHelp =>
      '1 kHz टोन वाजवा, SPL मीटरवर पातळी वाचा आणि अ‍ॅनालायझर जे दाखवतो त्याच्याशी असलेला फरक भरा. शून्याखेरीज ऑफसेट असल्यास पातळ्या SPL अंदाज म्हणून दाखवल्या जातात; त्याशिवाय त्या dBFS मध्येच राहतात.';

  @override
  String get commonReset => 'रीसेट';

  @override
  String get commonCancel => 'रद्द करा';

  @override
  String get commonSave => 'जतन करा';

  @override
  String get commonStop => 'थांबवा';

  @override
  String get commonStartMic => 'मायक्रोफोन सुरू करा';

  @override
  String get tabAnalyzer => 'अ‍ॅनालायझर';

  @override
  String get rtaUnfreeze => 'पुन्हा सुरू करा';

  @override
  String get rtaFreeze => 'गोठवा';

  @override
  String get rtaPeakHold => 'पीक होल्ड';

  @override
  String get rtaMaxMinTraces => 'कमाल / किमान रेषा';

  @override
  String get rtaResetTraces => 'रेषा रीसेट करा';

  @override
  String get rtaSaveAsPoint => 'बिंदू म्हणून जतन करा (3 से.)';

  @override
  String get rtaMicCalibration => 'मायक्रोफोन कॅलिब्रेशन…';

  @override
  String get rtaRemoveCalibration => 'कॅलिब्रेशन काढा';

  @override
  String get rtaOffsetMenu => 'dB SPL ऑफसेट…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · सिग्नल प्रक्रियेशिवाय';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count बिंदू',
      one: '1 बिंदू',
    );
    return 'कॅलिब्रेशन $name: $_temp0, दुरुस्ती $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (अंदाज)';

  @override
  String get rtaFrozenHint =>
      'गोठवले — मायक्रोफोन चालू आहे, फक्त काढले जात नाही.';

  @override
  String get rtaRelativeHint =>
      'पातळ्या सापेक्ष आहेत (dBFS). पहिला बिंदू जतन केल्यावर रूपरेषा दिसेल — तोच बाकीच्यांचा संदर्भ आहे.';

  @override
  String get rtaReferenceHint => 'भरलेले स्तंभ = इथे. रूपरेषा = संदर्भ बिंदू.';

  @override
  String get rtaEnvelopeHint => 'लाल = कमाल, हिरवा = रीसेटपासून किमान.';

  @override
  String get rtaMicStopped => 'मायक्रोफोन थांबला आहे';

  @override
  String get rtaSilence => 'शांतता — सिग्नल वाजत आहे का?';

  @override
  String get rtaPlaceholder => 'मायक्रोफोन सुरू करा आणि खोलीत सिग्नल वाजवा.';

  @override
  String rtaBandsInfo(int count) {
    return '$count एक-तृतीयांश ऑक्टेव्ह बँड, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'खोलीचे स्कॅन';

  @override
  String scanPointCount(int count) {
    return '$count बिं.';
  }

  @override
  String get commonMicNotRunning => 'मायक्रोफोन चालू नाही';

  @override
  String get scanMicNeeded => 'त्याशिवाय फक्त स्थान मोजले जाते, आवाज नाही.';

  @override
  String get scanContinuous => 'सतत मापन';

  @override
  String get scanContinuousHint => 'प्रत्येक 0.5 मी. चालल्यावर आपोआप एक बिंदू';

  @override
  String get scanMeasuring => 'मोजत आहे…';

  @override
  String get scanMeasureHere => 'इथे मोजा';

  @override
  String scanPointSaved(String id, String position) {
    return 'बिंदू $id $position येथे जतन केला';
  }

  @override
  String get scanStartTracking => 'स्थान ट्रॅकिंग सुरू करा';

  @override
  String get scanStartTrackingHint =>
      'ARKit — यामुळे अ‍ॅपला कळते की तुम्ही खोलीत कुठे उभे आहात.';

  @override
  String scanPosition(String position) {
    return 'स्थान: मूळबिंदूपासून $position मी.';
  }

  @override
  String get scanSetOriginHint => 'ऐकण्याच्या जागी उभे राहा आणि मूळबिंदू ठरवा.';

  @override
  String get scanOriginHere => 'मूळबिंदू इथे आहे';

  @override
  String get scanNoPoints => 'अजून एकही बिंदू नाही.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'पसारा 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'दिवाणखाना';

  @override
  String get scanNewMeasurement => 'नवीन मापन';

  @override
  String get scanRoomName => 'खोलीचे नाव';

  @override
  String get scanExcitation => 'खोली कशाने उत्तेजित कराल';

  @override
  String get scanPhoneNoiseHint =>
      'फक्त अंदाजासाठी — फोनचा स्पीकर बेस अजिबात देत नाही.';

  @override
  String get scanStart => 'सुरू करा';

  @override
  String get mapExportTooltip => 'FRD + JSON निर्यात करा';

  @override
  String get mapNeedsTwoPoints =>
      'नकाशासाठी किमान दोन बिंदू हवेत. खोलीत फिरा आणि सोबतच मोजा.';

  @override
  String get mapShareText =>
      'प्रत्येक बिंदूचा FRD (REW / VituixCAD मध्ये आयातीसाठी) आणि संपूर्ण सत्र JSON मध्ये.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'सर्वात सपाट जागा: $id, $position मी. वर (40–300 Hz मध्ये $variation dB पसारा)';
  }

  @override
  String get signalsSweepHelp =>
      'एकमेव सिग्नल ज्यावरून इम्पल्स प्रतिसाद, प्रतिध्वनी वेळ आणि पहिली परावर्तने काढता येतात. संगणक किंवा DAC वरून स्पीकरमध्ये वाजवा आणि फोनला रेकॉर्ड करू द्या.';

  @override
  String get signalsLength => 'कालावधी';

  @override
  String get signalsFrom => 'पासून';

  @override
  String get signalsTo => 'पर्यंत';

  @override
  String get signalsMonoNoChannel => 'मोनो (चॅनेलशिवाय)';

  @override
  String get signalsExportWav => 'WAV निर्यात करा';

  @override
  String get signalsPinkNoise => 'पिंक नॉइज';

  @override
  String get signalsPinkHelp =>
      'प्रत्येक ऑक्टेव्हमध्ये समान ऊर्जा. फक्त वारंवारता प्रतिसाद देतो, वेळ किंवा परावर्तन नाही — झटपट «इथे काही घडतंय का?» साठी पुरेसे.';

  @override
  String get signalsExportPink => '30 से. WAV निर्यात करा';

  @override
  String get signalsHowTo => 'कसे मोजावे';

  @override
  String get signalsStep1 =>
      'सिग्नल संगणकावरून स्पीकरमध्ये वाजवा, फोनवरून नाही.';

  @override
  String get signalsStep2 =>
      'आवाज असा ठेवा की अ‍ॅनालायझर सुमारे −20 dBFS दाखवेल. ओव्हरलोड परावर्तनासारखा दिसतो.';

  @override
  String get signalsStep3 => 'फोन हात पसरून सरळ धरा, मायक्रोफोन स्पीकरकडे.';

  @override
  String get signalsStep4 =>
      'ब्लूटूथ हेडफोन डिस्कनेक्ट करा — कॉम्प्रेशन आणि विलंब मापन बिघडवतात.';

  @override
  String get signalsNoteMono =>
      'दोन्ही स्पीकरमध्ये एकाच वेळी मोनो L आणि R ची बेरीज करतो, आणि त्यांचा फरक बेरजेत नाहीसा होतो. चॅनेल मोजण्यासाठी चॅनेल निवडा.';

  @override
  String get signalsNoteStereo =>
      'स्टिरिओ फाइल ज्यात सिग्नल फक्त एका चॅनेलमध्ये आहे — स्टिरिओ वाजवणारे काहीही ती वाजवेल.';

  @override
  String get signalsNoteChannel =>
      'चॅनेलच्या नावाची मोनो फाइल. ती DAW मधून किंवा मल्टीचॅनेल इनपुटद्वारे रिसीव्हरच्या योग्य इनपुटकडे पाठवा; स्टिरिओ आउटपुट असलेला लॅपटॉप ती या चॅनेलपर्यंत पोहोचवणार नाही.';

  @override
  String get channelsTitle => 'चॅनेल मापन';

  @override
  String get channelsHelp =>
      'ऐकण्याच्या जागी उभे राहा. प्रत्येक चॅनेलसाठी: रेकॉर्डिंग सुरू करा, सिग्नल टॅबमधून त्यात sweep वाजवा, पूर्ण वर टॅप करा. या बिंदूंशिवाय डिझाइनकडे EQ आणि पातळ्या काढायला काहीच नसते.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds से.';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ भरल्यानंतर पडताळणी';

  @override
  String get channelsVerifyAfterEqHint =>
      'बिंदू «EQ नंतर» म्हणून जतन होतो आणि ज्यावरून EQ काढला त्या बिंदूवर लिहित नाही.';

  @override
  String channelsRecording(String seconds) {
    return 'रेकॉर्डिंग $seconds से. — आता sweep वाजवा';
  }

  @override
  String get channelsNotMeasured => 'मोजले नाही';

  @override
  String get channelsMeasuredNoise => 'नॉइजने मोजले';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · थेट आवाज $ms ms नंतर';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · थेट आवाज $ms ms नंतर, T20 $t20 से.';
  }

  @override
  String get commonDone => 'पूर्ण';

  @override
  String get channelsMeasure => 'मोजा';

  @override
  String get channelsAdd => 'जोडा';

  @override
  String get channelsAgain => 'पुन्हा';

  @override
  String get compareTitle => 'तुलना';

  @override
  String get compareNeedsTwoPoints => 'तुलनेसाठी किमान दोन बिंदू हवेत.';

  @override
  String get commonWithRoom => 'खोलीसह';

  @override
  String get commonDirectSound => 'थेट आवाज';

  @override
  String get compareAfterEq => 'EQ नंतर';

  @override
  String get compareBandsA => 'A (बँड)';

  @override
  String get compareBandsB => 'B (बँड)';

  @override
  String get compareArrivalDiff => 'आगमनातील फरक A − B';

  @override
  String get compareBroadbandDiff => 'ब्रॉडबँड पातळी A − B';

  @override
  String get compareWorstBelow300 => '300 Hz खालील सर्वात मोठा फरक';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz बँडमध्ये $db dB';
  }

  @override
  String get compareTrimNote =>
      'Distance आणि level trim आगमन आणि पातळीतील फरक समान करतात. 300 Hz खालील आकारातील फरक नाही — तो दुसऱ्या अंतरावरील दुसऱ्या भिंतीमुळे येतो आणि जागा बदलून सुटतो.';

  @override
  String get designRt60Live => 'शेवटच्या प्रतिसादातून T20 125–500 Hz';

  @override
  String get designRt60Stored => 'जतन केलेल्या sweep मधून T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'अंदाज — sweep मोजा, Schroeder सध्या फक्त सूचक आहे';

  @override
  String get designExportTooltip => 'कॉन्फिगरेशन निर्यात करा';

  @override
  String get designCompute => 'डिझाइन मोजा';

  @override
  String get designLidarChecking => 'LiDAR आहे का ते पाहत आहे…';

  @override
  String get designLidarAvailable => 'LiDAR उपलब्ध';

  @override
  String get designLidarMissing => 'LiDAR नाही — मापे हाताने भरा';

  @override
  String get designLidarHint =>
      'स्कॅन भिंती सेंटीमीटरपर्यंत देते, त्यामुळे फक्त मोडच नाही तर परावर्तन बिंदू आणि सीमांपर्यंतची अंतरेही जुळतात.';

  @override
  String get designManualHint =>
      'मोडल गणनेला फक्त तीन संख्या लागतात — पण परावर्तन बिंदू आणि भिंतींपर्यंतची अचूक अंतरे गमावता.';

  @override
  String get designStopScan => 'स्कॅन संपवा';

  @override
  String get designScanRoom => 'खोली स्कॅन करा';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls भिंती',
      one: '1 भिंत',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings उघड्या जागा',
      one: '1 उघडी जागा',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'खोलीची मापे';

  @override
  String get designLength => 'लांबी';

  @override
  String get designWidth => 'रुंदी';

  @override
  String get designHeight => 'उंची';

  @override
  String get designWhatToDo => 'यावर काय करावे';

  @override
  String get designRoomModes => 'खोलीचे मोड';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (Schroeder) वर वैयक्तिक मोडना अर्थ उरत नाही. RT60 $rt60 से.: $source.';
  }

  @override
  String get designEqTitle => 'EQ: मोजलेले, लक्ष्य, अंदाज';

  @override
  String get designEqHelp =>
      'अंदाज म्हणजे मोजलेला प्रतिसाद आणि रिसीव्हरच्या पंधरा बँडचे मॉडेल. EQ भरल्यानंतर «EQ नंतर» स्विचसह चॅनेल पुन्हा मोजा, म्हणजे मॉडेल किती जवळ होते ते दिसेल.';

  @override
  String get designReceiverConfig => 'रिसीव्हर कॉन्फिगरेशन';

  @override
  String get designGeometryOnly =>
      'चॅनेलच्या sweep मापनाशिवाय इथे फक्त भूमिती आहे: अंतरे आणि क्रॉसओव्हर वारंवारता. प्रत्येक चॅनेलचे बिंदू आल्यावर EQ आणि पातळ्या येतील.';

  @override
  String get designShareSubject => 'कॉन्फिगरेशन प्रस्ताव';

  @override
  String get impulseTitle => 'इम्पल्स प्रतिसाद';

  @override
  String get impulseCompareTooltip => 'बिंदूंची तुलना करा';

  @override
  String get impulseExportTooltip => 'फेजसह FRD निर्यात करा';

  @override
  String get impulseTapToStart => 'सुरू करण्यासाठी टॅप करा.';

  @override
  String get impulseSweepTitle => 'तुम्ही स्पीकरमध्ये वाजवणार असलेला sweep';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds से. तुम्ही जे वाजवता त्याच्याशी जुळले पाहिजे — नाहीतर डीकन्व्होल्युशन निरर्थक निकाल देईल.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'रेकॉर्डिंग — $seconds से.';
  }

  @override
  String get impulsePlaySweepNow => 'आता संगणकावरून sweep वाजवा.';

  @override
  String get impulseStartRecording => 'रेकॉर्डिंग सुरू करा, मग sweep वाजवा';

  @override
  String get impulseFrequencyResponse => 'वारंवारता प्रतिसाद';

  @override
  String get impulseWithRoom => 'खोलीसह (1 से.)';

  @override
  String impulseDirectWindow(String ms) {
    return 'थेट आवाज (विंडो $ms ms)';
  }

  @override
  String get impulseWindow => 'विंडो';

  @override
  String impulseWindowHelp(String hz) {
    return 'लांब विंडो खालपर्यंत पाहते (सध्या $hz Hz वर वैध), पण पहिले परावर्तन आत येऊ देते. मर्यादेखाली वक्र गुळगुळीत केला जात नाही की त्यावर भाष्य होत नाही: ती विंडो आहे, खोली नाही.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'पहिल्या परावर्तनापर्यंत ($ms ms)';
  }

  @override
  String get impulseTime => 'वेळ';

  @override
  String get impulseImpulse => 'इम्पल्स';

  @override
  String get impulseTimeHelp =>
      'निळी विंडो आहे, नारिंगी रेषा पहिले सापडलेले परावर्तन. शून्य वेळ म्हणजे थेट आवाज.';

  @override
  String get impulseSpectrogram => 'स्पेक्ट्रोग्राम';

  @override
  String get commonHide => 'लपवा';

  @override
  String get commonShow => 'दाखवा';

  @override
  String get impulseSpectrogramHelp =>
      'थेट आवाजापासून ms मध्ये वेळ, वारंवारता वरच्या दिशेने, रंग म्हणजे −60 dB पर्यंतची पातळी. इतरांपेक्षा जास्त टिकणारी आडवी पट्टी म्हणजे मोड; वरचा तक्ता तेच संख्येत सांगतो.';

  @override
  String get impulseDecayByOctave => 'ऑक्टेव्हनुसार क्षय';

  @override
  String get impulseMidNoT20 => 'मधले बँड T20 साठी पुरेसे कमी झाले नाहीत.';

  @override
  String impulseMidT20(String seconds) {
    return 'मध्य 125–500 Hz: T20 $seconds से. — हाच तो RT60 ज्यावरून डिझाइन गणना करते.';
  }

  @override
  String get impulseDecayHelp =>
      'बेसमध्ये फोनवरचा RT60 बहुधा अंदाजच असतो: पार्श्वभूमीचा नॉइज तिथे सर्वात जवळ असतो, आणि «—» म्हणजे प्रतिध्वनी त्याच्या खाली गेली नाही. शून्यावर C50: सुरुवातीच्या परावर्तनांसह थेट आवाज प्रतिध्वनीपेक्षा जास्त ऊर्जा वाहतो.';

  @override
  String get impulseResult => 'निकाल';

  @override
  String get impulseDirectArrived => 'थेट आवाज इतक्या वेळाने पोहोचला';

  @override
  String get impulseDirectArrivedHelp =>
      'प्लेबॅक विलंब अधिक प्रवासाची वेळ — एकटे काही सांगत नाही, पण डाव्या आणि उजव्या स्पीकरमधील फरक सांगतो.';

  @override
  String get impulseFirstReflection => 'पहिले परावर्तन';

  @override
  String get impulseNotFound => 'सापडले नाही';

  @override
  String impulseAfterDirect(String time) {
    return 'थेट आवाजानंतर $time';
  }

  @override
  String get impulseNoReflectionHelp =>
      'एकतर ते नाहीच, किंवा थेट इम्पल्सच्या रिंगिंगमध्ये लपले आहे.';

  @override
  String impulseExtraPath(String metres) {
    return 'जादा मार्ग ≈ $metres मी.';
  }

  @override
  String get impulseUnmeasurable => 'मोजता येत नाही';

  @override
  String get impulseRt60NoiseHelp =>
      'प्रतिध्वनी नॉइज पातळीच्या वर पुरेशी खोल उतरली नाही — मोठ्या आवाजात, किंवा शांत क्षणी करा.';

  @override
  String get impulseRt60Help =>
      'T20 आणि T30 मधील फरक क्षय किती स्वच्छ आहे ते सूचित करतो.';

  @override
  String get impulseGating => 'विंडो (gating)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz वर वैध';
  }

  @override
  String get impulseGatingHelp =>
      'याखाली विंडोला एकही आवर्तन दिसत नाही — तिथला वक्र विंडोचा परिणाम आहे, खोलीचा नाही.';

  @override
  String get impulseSchroeder => 'श्रोडर क्षय वक्र';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz वर HD$order';
  }

  @override
  String get impulseHd2Help =>
      'हार्मोनिक्स Farina डीकन्व्होल्युशनच्या ऋण वेळेत असतात; इथे ते टाकून न देता तिथूनच वाचले जातात. −40 dB म्हणजे 1 %.';

  @override
  String get impulseHd3Help =>
      'ओव्हरलोडसह तिसरा हार्मोनिक दुसऱ्यापेक्षा वेगाने वाढतो.';

  @override
  String get impulseDistortionHot => '−30 dB वर विकृती';

  @override
  String get impulseDistortionHotHelp =>
      'एकतर sweep खूप मोठा आहे, किंवा स्पीकर मर्यादेवर आहे. विकृतीची शेपटी इम्पल्समध्ये परावर्तनासारखी दिसते — आवाज कमी करा आणि कशावरही विश्वास ठेवण्याआधी पुन्हा मोजा.';

  @override
  String get eqMeasured => 'मोजलेले';

  @override
  String get eqTarget => 'लक्ष्य';

  @override
  String get eqPredicted => 'EQ नंतर अंदाज';

  @override
  String get eqMeasuredAfter => 'EQ नंतर मोजलेले';

  @override
  String eqDeviation(int maxHz) {
    return 'लक्ष्यापासून विचलन 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'रिसीव्हरमध्ये भरल्यानंतर';

  @override
  String get eqPredictionVsReality => 'अंदाज विरुद्ध वास्तव';

  @override
  String eqStubborn(String bands) {
    return 'लक्ष्यापासून 6 dB पेक्षा दूर राहील: $bands. हा व्यतिकरण आहे, शक्तीची कमतरता नाही — स्पीकर किंवा श्रोता हलवून सुटतो, जास्त बूस्टने नाही.';
  }

  @override
  String get eqModelOk => 'रिसीव्हरचा फिल्टर साधारण मॉडेलसारखा वागतो.';

  @override
  String get eqModelOff =>
      'रिसीव्हरचा खरा फिल्टर अपेक्षेपेक्षा मॉडेलपासून जास्त वेगळा आहे — त्याचे बँड बहुधा इथे गृहीत धरलेल्यापेक्षा रुंद किंवा अरुंद आहेत.';

  @override
  String get eqTargetCurve => 'लक्ष्य वक्र';

  @override
  String get eqFlat => 'सपाट';

  @override
  String get eqTargetHelp =>
      'सपाट नाही: काही kHz वर कान थेट आवाज ऐकतो, मायक्रोफोन परावर्तनेही जोडतो, आणि सपाट केलेला मोजलेला वक्र निस्तेज वाटतो. वर हलका उतार आणि खाली थोडा बेस — अंध श्रवणात लोक हेच निवडतात.';

  @override
  String get eqBassLift => 'बेस बूस्ट';

  @override
  String get eqBassBelow => 'बेस यांच्याखाली';

  @override
  String get eqTilt => 'उतार';

  @override
  String get eqDbPerOctave => 'dB/ऑक्टेव्ह';

  @override
  String get eqTiltFrom => 'उतार येथून';

  @override
  String get errorMicPermission =>
      'मायक्रोफोन प्रवेशाशिवाय मोजता येत नाही. सेटिंग्ज → AudioScanner → मायक्रोफोन मध्ये परवानगी द्या.';

  @override
  String errorMic(String error) {
    return 'मायक्रोफोन: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'मायक्रोफोन सुरू करता आला नाही: $error';
  }

  @override
  String get errorNoArkit =>
      'हे डिव्हाइस ARKit world tracking करू शकत नाही — बिंदू जागेत ठेवता येत नाहीत.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'रेकॉर्डिंग sweep पेक्षा लहान आहे ($expected से. पैकी $recorded से.). सिग्नल वाजवण्याआधी रेकॉर्डिंग सुरू करा.';
  }

  @override
  String get sessionSnapshots => 'स्नॅपशॉट';

  @override
  String get errorTrackingUnreliable =>
      'स्थान ट्रॅकिंग विश्वासार्ह नाही — बिंदू तुम्ही उभे आहात त्याऐवजी दुसरीकडे पडेल.';

  @override
  String errorNoSound(int seconds) {
    return '$seconds से. मध्ये कोणताही आवाज आला नाही.';
  }

  @override
  String get noteSnapshotNoPose => 'अ‍ॅनालायझरचा स्नॅपशॉट, स्थानाशिवाय';

  @override
  String get sessionChannels => 'चॅनेल';

  @override
  String get trackingOk => 'ट्रॅकिंग ठीक';

  @override
  String get trackingLimited => 'कमकुवत ट्रॅकिंग';

  @override
  String get trackingUnavailable => 'ट्रॅकिंग नाही';

  @override
  String get poseHintFeatures =>
      'चित्रात खूप कमी तपशील — फोन रिकाम्या भिंतीकडे नव्हे, पोत असलेल्या गोष्टीकडे धरा.';

  @override
  String get poseHintMotion => 'खूप वेगवान हालचाल — हळू चाला.';

  @override
  String get poseHintLight =>
      'खूप कमी प्रकाश — दिवा लावा, कॅमेऱ्याला तो कुठे आहे ते दिसत नाही.';

  @override
  String get poseHintInitializing => 'ARKit सुरू होत आहे, थोडे हालचाल करा.';

  @override
  String get poseHintRelocalizing =>
      'मूळ बिंदू पुन्हा शोधला जात आहे — जिथून सुरुवात केली तिथे परत जा.';

  @override
  String get signalPhonePink => 'फोनमधून पिंक नॉइज';

  @override
  String get signalExternalPink => 'स्पीकरमधून पिंक नॉइज';

  @override
  String get signalExternalSweep => 'स्पीकरमधून sweep';

  @override
  String get captureWarningBluetooth =>
      'ब्लूटूथ मायक्रोफोन: कॉम्प्रेशन आणि विलंब मापन बिघडवतात. हेडफोन डिस्कनेक्ट करा आणि अंगभूत मायक्रोफोनने मोजा.';

  @override
  String get captureWarningProcessing =>
      'सिस्टमने सिग्नल प्रक्रिया (AGC / नॉइज दमन) बंद केली नाही. जागांमधील मोजलेले फरक विकृत होतील.';

  @override
  String get captureWarningMeasurementMode =>
      'measurement mode चालू करता आला नाही — मायक्रोफोनची स्वतःची वारंवारता प्रतिसाद दुरुस्ती आहे.';

  @override
  String get captureRouteUnknown => 'अज्ञात';

  @override
  String get axisLength => 'लांबी';

  @override
  String get axisWidth => 'रुंदी';

  @override
  String get axisHeight => 'उंची';
}
