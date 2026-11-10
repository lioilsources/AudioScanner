// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get tabScan => 'स्कैन';

  @override
  String get tabMap => 'नक्शा';

  @override
  String get tabResponse => 'रिस्पॉन्स';

  @override
  String get tabDesign => 'डिज़ाइन';

  @override
  String get tabSignals => 'सिग्नल';

  @override
  String get rtaSnapshotFailed => 'स्नैपशॉट सेव नहीं हुआ।';

  @override
  String rtaSavedAsPoint(String id) {
    return 'बिंदु $id के रूप में सेव किया गया।';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'बिंदु $id के रूप में सेव किया गया (स्थिति के बिना)।';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count बिंदु',
      one: '1 बिंदु',
    );
    return 'कैलिब्रेशन $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'फ़ाइल पढ़ी नहीं जा सकती: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL ऑफ़सेट';

  @override
  String get rtaOffsetHelp =>
      '1 kHz की टोन चलाएँ, SPL मीटर पर स्तर पढ़ें और एनालाइज़र जो दिखा रहा है उससे अंतर दर्ज करें। शून्य के अलावा ऑफ़सेट होने पर स्तर SPL अनुमान के रूप में दिखते हैं; इसके बिना वे dBFS में रहते हैं।';

  @override
  String get commonReset => 'रीसेट';

  @override
  String get commonCancel => 'रद्द करें';

  @override
  String get commonSave => 'सेव करें';

  @override
  String get commonStop => 'रोकें';

  @override
  String get commonStartMic => 'माइक्रोफ़ोन शुरू करें';

  @override
  String get tabAnalyzer => 'एनालाइज़र';

  @override
  String get rtaUnfreeze => 'जारी रखें';

  @override
  String get rtaFreeze => 'फ़्रीज़ करें';

  @override
  String get rtaPeakHold => 'पीक होल्ड';

  @override
  String get rtaMaxMinTraces => 'अधिकतम / न्यूनतम रेखाएँ';

  @override
  String get rtaResetTraces => 'रेखाएँ रीसेट करें';

  @override
  String get rtaSaveAsPoint => 'बिंदु के रूप में सेव करें (3 से.)';

  @override
  String get rtaMicCalibration => 'माइक्रोफ़ोन कैलिब्रेशन…';

  @override
  String get rtaRemoveCalibration => 'कैलिब्रेशन हटाएँ';

  @override
  String get rtaOffsetMenu => 'dB SPL ऑफ़सेट…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · सिग्नल प्रोसेसिंग के बिना';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count बिंदु',
      one: '1 बिंदु',
    );
    return 'कैलिब्रेशन $name: $_temp0, सुधार $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (अनुमान)';

  @override
  String get rtaFrozenHint =>
      'फ़्रीज़ — माइक्रोफ़ोन चलता रहता है, बस ड्रॉ नहीं होता।';

  @override
  String get rtaRelativeHint =>
      'स्तर सापेक्ष हैं (dBFS)। पहला बिंदु सेव करते ही रूपरेखा दिखेगी — वही बाकी सबका संदर्भ है।';

  @override
  String get rtaReferenceHint =>
      'भरे हुए स्तंभ = यहाँ। रूपरेखा = संदर्भ बिंदु।';

  @override
  String get rtaEnvelopeHint => 'लाल = अधिकतम, हरा = रीसेट के बाद से न्यूनतम।';

  @override
  String get rtaMicStopped => 'माइक्रोफ़ोन रुका है';

  @override
  String get rtaSilence => 'सन्नाटा — क्या कोई सिग्नल चल रहा है?';

  @override
  String get rtaPlaceholder =>
      'माइक्रोफ़ोन शुरू करें और कमरे में सिग्नल चलाएँ।';

  @override
  String rtaBandsInfo(int count) {
    return '$count तिहाई-ऑक्टेव बैंड, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'कमरे का स्कैन';

  @override
  String scanPointCount(int count) {
    return '$count बिं.';
  }

  @override
  String get commonMicNotRunning => 'माइक्रोफ़ोन नहीं चल रहा';

  @override
  String get scanMicNeeded =>
      'इसके बिना सिर्फ़ स्थिति मापी जाती है, आवाज़ नहीं।';

  @override
  String get scanContinuous => 'लगातार माप';

  @override
  String get scanContinuousHint => 'हर 0.5 मी. चलने पर अपने-आप एक बिंदु';

  @override
  String get scanMeasuring => 'माप रहा है…';

  @override
  String get scanMeasureHere => 'यहाँ मापें';

  @override
  String scanPointSaved(String id, String position) {
    return 'बिंदु $id को $position पर सेव किया गया';
  }

  @override
  String get scanStartTracking => 'स्थिति ट्रैकिंग शुरू करें';

  @override
  String get scanStartTrackingHint =>
      'ARKit — इसी से ऐप जानता है कि आप कमरे में कहाँ खड़े हैं।';

  @override
  String scanPosition(String position) {
    return 'स्थिति: मूल बिंदु से $position मी.';
  }

  @override
  String get scanSetOriginHint =>
      'सुनने की जगह पर खड़े हों और मूल बिंदु तय करें।';

  @override
  String get scanOriginHere => 'मूल बिंदु यहाँ है';

  @override
  String get scanNoPoints => 'अभी कोई बिंदु नहीं।';

  @override
  String scanPointStats(String variation, String rms) {
    return 'फैलाव 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'बैठक';

  @override
  String get scanNewMeasurement => 'नया माप';

  @override
  String get scanRoomName => 'कमरे का नाम';

  @override
  String get scanExcitation => 'कमरे को किससे उत्तेजित करेंगे';

  @override
  String get scanPhoneNoiseHint =>
      'सिर्फ़ अंदाज़े के लिए — फ़ोन का स्पीकर बास बिल्कुल नहीं देता।';

  @override
  String get scanStart => 'शुरू करें';

  @override
  String get mapExportTooltip => 'FRD + JSON निर्यात करें';

  @override
  String get mapNeedsTwoPoints =>
      'नक्शे को कम से कम दो बिंदु चाहिए। कमरे में घूमें और साथ-साथ मापें।';

  @override
  String get mapShareText =>
      'हर बिंदु का FRD (REW / VituixCAD में आयात के लिए) और पूरा सेशन JSON में।';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'सबसे समतल जगह: $id, $position मी. पर (40–300 Hz में $variation dB फैलाव)';
  }

  @override
  String get signalsSweepHelp =>
      'एकमात्र सिग्नल जिससे इम्पल्स रिस्पॉन्स, गूँज का समय और पहले परावर्तन निकाले जा सकते हैं। इसे कंप्यूटर या DAC से स्पीकरों में चलाएँ और फ़ोन को रिकॉर्ड करने दें।';

  @override
  String get signalsLength => 'अवधि';

  @override
  String get signalsFrom => 'से';

  @override
  String get signalsTo => 'तक';

  @override
  String get signalsMonoNoChannel => 'मोनो (बिना चैनल)';

  @override
  String get signalsExportWav => 'WAV निर्यात करें';

  @override
  String get signalsPinkNoise => 'पिंक नॉइज़';

  @override
  String get signalsPinkHelp =>
      'हर ऑक्टेव में बराबर ऊर्जा। सिर्फ़ फ़्रीक्वेंसी रिस्पॉन्स देता है, समय या परावर्तन नहीं — एक झटपट «क्या यहाँ कुछ हो रहा है?» के लिए काफ़ी है।';

  @override
  String get signalsExportPink => '30 से. WAV निर्यात करें';

  @override
  String get signalsHowTo => 'कैसे मापें';

  @override
  String get signalsStep1 =>
      'सिग्नल कंप्यूटर से स्पीकरों में चलाएँ, फ़ोन से नहीं।';

  @override
  String get signalsStep2 =>
      'वॉल्यूम इतना रखें कि एनालाइज़र लगभग −20 dBFS दिखाए। ओवरलोड परावर्तन जैसा दिखता है।';

  @override
  String get signalsStep3 =>
      'फ़ोन को हाथ फैलाकर सीधा पकड़ें, माइक्रोफ़ोन स्पीकरों की ओर।';

  @override
  String get signalsStep4 =>
      'ब्लूटूथ हेडफ़ोन डिस्कनेक्ट करें — कम्प्रेशन और देरी माप बिगाड़ देते हैं।';

  @override
  String get signalsNoteMono =>
      'दोनों स्पीकरों में एक साथ मोनो L और R को जोड़ देता है, और उनका अंतर योग में गायब हो जाता है। चैनल मापने के लिए चैनल चुनें।';

  @override
  String get signalsNoteStereo =>
      'स्टीरियो फ़ाइल जिसमें सिग्नल सिर्फ़ एक चैनल में है — स्टीरियो चलाने वाली कोई भी चीज़ इसे चला लेगी।';

  @override
  String get signalsNoteChannel =>
      'चैनल के नाम वाली मोनो फ़ाइल। इसे DAW से या मल्टीचैनल इनपुट के ज़रिए रिसीवर के सही इनपुट पर भेजें; स्टीरियो आउटपुट वाला लैपटॉप इसे इस चैनल तक नहीं पहुँचाएगा।';

  @override
  String get channelsTitle => 'चैनलों का माप';

  @override
  String get channelsHelp =>
      'सुनने की जगह पर खड़े हों। हर चैनल के लिए: रिकॉर्डिंग शुरू करें, सिग्नल टैब से उसमें sweep चलाएँ, हो गया पर टैप करें। इन बिंदुओं के बिना डिज़ाइन के पास EQ और स्तर निकालने को कुछ नहीं होता।';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds से.';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ दर्ज करने के बाद जाँच';

  @override
  String get channelsVerifyAfterEqHint =>
      'बिंदु «EQ के बाद» के रूप में सेव होता है और उस बिंदु को नहीं बदलता जिससे EQ निकाला गया था।';

  @override
  String channelsRecording(String seconds) {
    return 'रिकॉर्डिंग $seconds से. — अब sweep चलाएँ';
  }

  @override
  String get channelsNotMeasured => 'मापा नहीं गया';

  @override
  String get channelsMeasuredNoise => 'नॉइज़ से मापा गया';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · सीधी आवाज़ $ms ms बाद';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · सीधी आवाज़ $ms ms बाद, T20 $t20 से.';
  }

  @override
  String get commonDone => 'हो गया';

  @override
  String get channelsMeasure => 'मापें';

  @override
  String get channelsAdd => 'जोड़ें';

  @override
  String get channelsAgain => 'फिर से';

  @override
  String get compareTitle => 'तुलना';

  @override
  String get compareNeedsTwoPoints => 'तुलना के लिए कम से कम दो बिंदु चाहिए।';

  @override
  String get commonWithRoom => 'कमरे के साथ';

  @override
  String get commonDirectSound => 'सीधी आवाज़';

  @override
  String get compareAfterEq => 'EQ के बाद';

  @override
  String get compareBandsA => 'A (बैंड)';

  @override
  String get compareBandsB => 'B (बैंड)';

  @override
  String get compareArrivalDiff => 'आगमन अंतर A − B';

  @override
  String get compareBroadbandDiff => 'ब्रॉडबैंड स्तर A − B';

  @override
  String get compareWorstBelow300 => '300 Hz से नीचे सबसे बड़ा अंतर';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz बैंड में $db dB';
  }

  @override
  String get compareTrimNote =>
      'Distance और level trim आगमन और स्तर का अंतर बराबर कर देते हैं। 300 Hz से नीचे आकार का अंतर नहीं — वह किसी दूसरी दूरी पर दूसरी दीवार से आता है और जगह बदलकर सुलझता है।';

  @override
  String get designRt60Live => 'आख़िरी रिस्पॉन्स से T20 125–500 Hz';

  @override
  String get designRt60Stored => 'सेव किए गए sweep से T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'अनुमान — sweep मापें, Schroeder अभी सिर्फ़ एक संकेत है';

  @override
  String get designExportTooltip => 'कॉन्फ़िगरेशन निर्यात करें';

  @override
  String get designCompute => 'डिज़ाइन की गणना करें';

  @override
  String get designLidarChecking => 'देख रहा है कि LiDAR है या नहीं…';

  @override
  String get designLidarAvailable => 'LiDAR उपलब्ध';

  @override
  String get designLidarMissing => 'LiDAR नहीं — माप हाथ से दर्ज करें';

  @override
  String get designLidarHint =>
      'स्कैन दीवारों को सेंटीमीटर तक देता है, इसलिए सिर्फ़ मोड ही नहीं, परावर्तन बिंदु और सीमाओं तक की दूरियाँ भी सही बैठती हैं।';

  @override
  String get designManualHint =>
      'मोडल गणना को सिर्फ़ तीन संख्याएँ चाहिए — लेकिन परावर्तन बिंदु और दीवारों तक की सटीक दूरियाँ खो जाती हैं।';

  @override
  String get designStopScan => 'स्कैन समाप्त करें';

  @override
  String get designScanRoom => 'कमरा स्कैन करें';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls दीवारें',
      one: '1 दीवार',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings खुली जगहें',
      one: '1 खुली जगह',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'कमरे के माप';

  @override
  String get designLength => 'लंबाई';

  @override
  String get designWidth => 'चौड़ाई';

  @override
  String get designHeight => 'ऊँचाई';

  @override
  String get designWhatToDo => 'इसका क्या करें';

  @override
  String get designRoomModes => 'कमरे के मोड';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (Schroeder) से ऊपर अलग-अलग मोड का कोई मतलब नहीं रहता। RT60 $rt60 से.: $source।';
  }

  @override
  String get designEqTitle => 'EQ: मापा गया, लक्ष्य, पूर्वानुमान';

  @override
  String get designEqHelp =>
      'पूर्वानुमान मापा गया रिस्पॉन्स और रिसीवर के पंद्रह बैंड का मॉडल है। EQ दर्ज करने के बाद «EQ के बाद» स्विच के साथ चैनल को फिर मापें, ताकि दिखे कि मॉडल कितना क़रीब था।';

  @override
  String get designReceiverConfig => 'रिसीवर कॉन्फ़िगरेशन';

  @override
  String get designGeometryOnly =>
      'चैनलों के sweep माप के बिना यहाँ सिर्फ़ ज्यामिति है: दूरियाँ और क्रॉसओवर फ़्रीक्वेंसी। EQ और स्तर तब आएँगे जब हर चैनल के बिंदु होंगे।';

  @override
  String get designShareSubject => 'कॉन्फ़िगरेशन प्रस्ताव';

  @override
  String get impulseTitle => 'इम्पल्स रिस्पॉन्स';

  @override
  String get impulseCompareTooltip => 'बिंदुओं की तुलना करें';

  @override
  String get impulseExportTooltip => 'फ़ेज़ के साथ FRD निर्यात करें';

  @override
  String get impulseTapToStart => 'शुरू करने के लिए टैप करें।';

  @override
  String get impulseSweepTitle => 'वह sweep जो आप स्पीकरों में चलाएँगे';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds से.। यह वही होना चाहिए जो आप चला रहे हैं — वरना डीकन्वोल्यूशन बेतुका नतीजा देगा।';
  }

  @override
  String impulseRecording(String seconds) {
    return 'रिकॉर्डिंग — $seconds से.';
  }

  @override
  String get impulsePlaySweepNow => 'अब कंप्यूटर से sweep चलाएँ।';

  @override
  String get impulseStartRecording => 'रिकॉर्डिंग शुरू करें, फिर sweep चलाएँ';

  @override
  String get impulseFrequencyResponse => 'फ़्रीक्वेंसी रिस्पॉन्स';

  @override
  String get impulseWithRoom => 'कमरे के साथ (1 से.)';

  @override
  String impulseDirectWindow(String ms) {
    return 'सीधी आवाज़ (विंडो $ms ms)';
  }

  @override
  String get impulseWindow => 'विंडो';

  @override
  String impulseWindowHelp(String hz) {
    return 'लंबी विंडो नीचे तक देखती है (अभी $hz Hz से ऊपर मान्य), पर पहले परावर्तन को अंदर आने देती है। सीमा से नीचे वक्र न चिकना किया जाता है न उस पर टिप्पणी: वह विंडो है, कमरा नहीं।';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'पहले परावर्तन तक ($ms ms)';
  }

  @override
  String get impulseTime => 'समय';

  @override
  String get impulseImpulse => 'इम्पल्स';

  @override
  String get impulseTimeHelp =>
      'नीला विंडो है, नारंगी रेखा पहला मिला परावर्तन। शून्य समय सीधी आवाज़ है।';

  @override
  String get impulseSpectrogram => 'स्पेक्ट्रोग्राम';

  @override
  String get commonHide => 'छिपाएँ';

  @override
  String get commonShow => 'दिखाएँ';

  @override
  String get impulseSpectrogramHelp =>
      'सीधी आवाज़ से ms में समय, फ़्रीक्वेंसी ऊपर की ओर, रंग −60 dB तक का स्तर है। एक क्षैतिज पट्टी जो बाकियों से ज़्यादा देर टिके, वह मोड है; ऊपर की तालिका यही बात संख्या में कहती है।';

  @override
  String get impulseDecayByOctave => 'ऑक्टेव के अनुसार क्षय';

  @override
  String get impulseMidNoT20 => 'मध्य बैंड T20 के लिए पर्याप्त नहीं घटे।';

  @override
  String impulseMidT20(String seconds) {
    return 'मध्य 125–500 Hz: T20 $seconds से. — यही वह RT60 है जिससे डिज़ाइन गणना करता है।';
  }

  @override
  String get impulseDecayHelp =>
      'बास में फ़ोन का RT60 ज़्यादातर अनुमान है: पृष्ठभूमि शोर वहाँ सबसे क़रीब होता है, और «—» का मतलब है कि गूँज उससे नीचे नहीं गिरी। शून्य से ऊपर C50: शुरुआती परावर्तनों समेत सीधी आवाज़ गूँज से ज़्यादा ऊर्जा रखती है।';

  @override
  String get impulseResult => 'परिणाम';

  @override
  String get impulseDirectArrived => 'सीधी आवाज़ इतनी देर बाद पहुँची';

  @override
  String get impulseDirectArrivedHelp =>
      'प्लेबैक देरी और यात्रा समय — अकेले कुछ नहीं बताता, लेकिन बाएँ और दाएँ स्पीकर का अंतर बताता है।';

  @override
  String get impulseFirstReflection => 'पहला परावर्तन';

  @override
  String get impulseNotFound => 'नहीं मिला';

  @override
  String impulseAfterDirect(String time) {
    return 'सीधी आवाज़ के $time बाद';
  }

  @override
  String get impulseNoReflectionHelp =>
      'या तो कोई है ही नहीं, या सीधे इम्पल्स की गूँज में छिपा है।';

  @override
  String impulseExtraPath(String metres) {
    return 'अतिरिक्त रास्ता ≈ $metres मी.।';
  }

  @override
  String get impulseUnmeasurable => 'मापा नहीं जा सकता';

  @override
  String get impulseRt60NoiseHelp =>
      'गूँज शोर स्तर से ऊपर पर्याप्त गहराई तक नहीं गिरी — तेज़ आवाज़ में, या किसी शांत पल में।';

  @override
  String get impulseRt60Help =>
      'T20 और T30 का अंतर बताता है कि क्षय कितना साफ़ है।';

  @override
  String get impulseGating => 'विंडो (gating)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz से ऊपर मान्य';
  }

  @override
  String get impulseGatingHelp =>
      'इससे नीचे विंडो एक भी पीरियड नहीं देखती — वहाँ वक्र विंडो का प्रभाव है, कमरे का नहीं।';

  @override
  String get impulseSchroeder => 'श्रोडर क्षय वक्र';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz पर HD$order';
  }

  @override
  String get impulseHd2Help =>
      'हार्मोनिक्स Farina डीकन्वोल्यूशन के ऋणात्मक समय में रहते हैं; यहाँ उन्हें फेंकने की बजाय वहीं से पढ़ा जाता है। −40 dB यानी 1 %।';

  @override
  String get impulseHd3Help =>
      'तीसरा हार्मोनिक ओवरलोड के साथ दूसरे से तेज़ बढ़ता है।';

  @override
  String get impulseDistortionHot => '−30 dB से ऊपर विकृति';

  @override
  String get impulseDistortionHotHelp =>
      'या तो sweep बहुत तेज़ है, या स्पीकर अपनी सीमा पर है। विकृति की पूँछ इम्पल्स में परावर्तन जैसी दिखती है — आवाज़ कम करें और किसी बात पर भरोसा करने से पहले फिर मापें।';

  @override
  String get eqMeasured => 'मापा गया';

  @override
  String get eqTarget => 'लक्ष्य';

  @override
  String get eqPredicted => 'EQ के बाद पूर्वानुमान';

  @override
  String get eqMeasuredAfter => 'EQ के बाद मापा गया';

  @override
  String eqDeviation(int maxHz) {
    return 'लक्ष्य से विचलन 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'रिसीवर में दर्ज करने के बाद';

  @override
  String get eqPredictionVsReality => 'पूर्वानुमान बनाम वास्तविकता';

  @override
  String eqStubborn(String bands) {
    return 'लक्ष्य से 6 dB से ज़्यादा दूर रहेगा: $bands। यह व्यतिकरण है, शक्ति की कमी नहीं — स्पीकर या श्रोता की जगह बदलकर सुलझता है, और बूस्ट से नहीं।';
  }

  @override
  String get eqModelOk => 'रिसीवर का फ़िल्टर लगभग मॉडल जैसा व्यवहार करता है।';

  @override
  String get eqModelOff =>
      'रिसीवर का असली फ़िल्टर मॉडल से उम्मीद से ज़्यादा अलग है — उसके बैंड शायद यहाँ माने गए से चौड़े या संकरे हैं।';

  @override
  String get eqTargetCurve => 'लक्ष्य वक्र';

  @override
  String get eqFlat => 'समतल';

  @override
  String get eqTargetHelp =>
      'समतल नहीं: कुछ kHz से ऊपर कान सीधी आवाज़ सुनता है, माइक्रोफ़ोन परावर्तन भी जोड़ता है, और समतल किया गया मापा वक्र फीका लगता है। ऊपर हल्का झुकाव और नीचे थोड़ा बास — यही लोग ब्लाइंड लिसनिंग में चुनते हैं।';

  @override
  String get eqBassLift => 'बास बूस्ट';

  @override
  String get eqBassBelow => 'बास इसके नीचे';

  @override
  String get eqTilt => 'झुकाव';

  @override
  String get eqDbPerOctave => 'dB/ऑक्टेव';

  @override
  String get eqTiltFrom => 'झुकाव यहाँ से';

  @override
  String get errorMicPermission =>
      'माइक्रोफ़ोन एक्सेस के बिना माप नहीं हो सकता। इसे सेटिंग्स → AudioScanner → माइक्रोफ़ोन में अनुमति दें।';

  @override
  String errorMic(String error) {
    return 'माइक्रोफ़ोन: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'माइक्रोफ़ोन शुरू नहीं हो सका: $error';
  }

  @override
  String get errorNoArkit =>
      'यह डिवाइस ARKit world tracking नहीं कर सकता — बिंदुओं को जगह में नहीं रखा जा सकता।';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'रिकॉर्डिंग sweep से छोटी है ($expected से. में से $recorded से.)। सिग्नल चलाने से पहले रिकॉर्डिंग शुरू करें।';
  }

  @override
  String get sessionSnapshots => 'स्नैपशॉट';

  @override
  String get errorTrackingUnreliable =>
      'स्थिति ट्रैकिंग भरोसेमंद नहीं — बिंदु वहाँ नहीं होगा जहाँ आप खड़े हैं।';

  @override
  String errorNoSound(int seconds) {
    return '$seconds से. में कोई आवाज़ नहीं आई।';
  }

  @override
  String get noteSnapshotNoPose => 'एनालाइज़र का स्नैपशॉट, स्थिति के बिना';

  @override
  String get sessionChannels => 'चैनल';

  @override
  String get trackingOk => 'ट्रैकिंग ठीक';

  @override
  String get trackingLimited => 'कमज़ोर ट्रैकिंग';

  @override
  String get trackingUnavailable => 'ट्रैकिंग नहीं';

  @override
  String get poseHintFeatures =>
      'तस्वीर में बहुत कम विवरण — फ़ोन को किसी बनावट वाली चीज़ की ओर करें, खाली दीवार की ओर नहीं।';

  @override
  String get poseHintMotion => 'बहुत तेज़ हलचल — धीरे चलें।';

  @override
  String get poseHintLight =>
      'बहुत कम रोशनी — लाइट जलाएँ, कैमरा नहीं देख पा रहा कि वह कहाँ है।';

  @override
  String get poseHintInitializing => 'ARKit शुरू हो रहा है, थोड़ा हिलें-डुलें।';

  @override
  String get poseHintRelocalizing =>
      'मूल बिंदु फिर से ढूँढा जा रहा है — वहीं लौटें जहाँ से शुरू किया था।';

  @override
  String get signalPhonePink => 'फ़ोन से पिंक नॉइज़';

  @override
  String get signalExternalPink => 'स्पीकरों से पिंक नॉइज़';

  @override
  String get signalExternalSweep => 'स्पीकरों से sweep';

  @override
  String get captureWarningBluetooth =>
      'ब्लूटूथ माइक्रोफ़ोन: कम्प्रेशन और देरी माप बिगाड़ देते हैं। हेडफ़ोन डिस्कनेक्ट करें और बिल्ट-इन माइक्रोफ़ोन से मापें।';

  @override
  String get captureWarningProcessing =>
      'सिस्टम ने सिग्नल प्रोसेसिंग (AGC / नॉइज़ सप्रेशन) बंद नहीं की। जगहों के बीच मापे गए अंतर विकृत होंगे।';

  @override
  String get captureWarningMeasurementMode =>
      'measurement mode चालू नहीं हो सका — माइक्रोफ़ोन का अपना फ़्रीक्वेंसी रिस्पॉन्स सुधार है।';

  @override
  String get captureRouteUnknown => 'अज्ञात';

  @override
  String get axisLength => 'लंबाई';

  @override
  String get axisWidth => 'चौड़ाई';

  @override
  String get axisHeight => 'ऊँचाई';
}
