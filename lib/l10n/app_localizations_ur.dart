// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Urdu (`ur`).
class AppLocalizationsUr extends AppLocalizations {
  AppLocalizationsUr([String locale = 'ur']) : super(locale);

  @override
  String get tabScan => 'اسکین';

  @override
  String get tabMap => 'نقشہ';

  @override
  String get tabResponse => 'ردِعمل';

  @override
  String get tabDesign => 'ڈیزائن';

  @override
  String get tabSignals => 'سگنلز';

  @override
  String get rtaSnapshotFailed => 'اسنیپ شاٹ محفوظ نہیں ہوا۔';

  @override
  String rtaSavedAsPoint(String id) {
    return 'نقطہ $id کے طور پر محفوظ ہو گیا۔';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'نقطہ $id کے طور پر محفوظ ہو گیا (مقام کے بغیر)۔';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count نقاط',
      one: '1 نقطہ',
    );
    return 'کیلیبریشن $name: $_temp0، $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'فائل نہیں پڑھی جا سکتی: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL آفسیٹ';

  @override
  String get rtaOffsetHelp =>
      '1 kHz کی ٹون چلائیں، SPL میٹر پر سطح پڑھیں اور جو اینالائزر دکھا رہا ہے اس سے فرق درج کریں۔ صفر کے علاوہ آفسیٹ ہو تو سطحیں SPL اندازے کے طور پر دکھائی جاتی ہیں؛ اس کے بغیر dBFS میں رہتی ہیں۔';

  @override
  String get commonReset => 'ری سیٹ';

  @override
  String get commonCancel => 'منسوخ';

  @override
  String get commonSave => 'محفوظ کریں';

  @override
  String get commonStop => 'روکیں';

  @override
  String get commonStartMic => 'مائیکروفون شروع کریں';

  @override
  String get tabAnalyzer => 'اینالائزر';

  @override
  String get rtaUnfreeze => 'جاری رکھیں';

  @override
  String get rtaFreeze => 'منجمد کریں';

  @override
  String get rtaPeakHold => 'پیک ہولڈ';

  @override
  String get rtaMaxMinTraces => 'زیادہ سے زیادہ / کم سے کم خطوط';

  @override
  String get rtaResetTraces => 'خطوط ری سیٹ کریں';

  @override
  String get rtaSaveAsPoint => 'نقطے کے طور پر محفوظ کریں (3 سیکنڈ)';

  @override
  String get rtaMicCalibration => 'مائیکروفون کیلیبریشن…';

  @override
  String get rtaRemoveCalibration => 'کیلیبریشن ہٹائیں';

  @override
  String get rtaOffsetMenu => 'dB SPL آفسیٹ…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · سگنل پروسیسنگ کے بغیر';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count نقاط',
      one: '1 نقطہ',
    );
    return 'کیلیبریشن $name: $_temp0، تصحیح $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (اندازہ)';

  @override
  String get rtaFrozenHint =>
      'منجمد — مائیکروفون چل رہا ہے، بس ڈرا نہیں ہو رہا۔';

  @override
  String get rtaRelativeHint =>
      'سطحیں نسبتی ہیں (dBFS)۔ خاکہ تب ظاہر ہوگا جب آپ پہلا نقطہ محفوظ کریں گے — وہی باقیوں کا حوالہ ہے۔';

  @override
  String get rtaReferenceHint => 'بھرے ہوئے کالم = یہاں۔ خاکہ = حوالہ نقطہ۔';

  @override
  String get rtaEnvelopeHint =>
      'سرخ = زیادہ سے زیادہ، سبز = ری سیٹ کے بعد سے کم سے کم۔';

  @override
  String get rtaMicStopped => 'مائیکروفون رکا ہوا ہے';

  @override
  String get rtaSilence => 'خاموشی — کیا کوئی سگنل چل رہا ہے؟';

  @override
  String get rtaPlaceholder => 'مائیکروفون شروع کریں اور کمرے میں سگنل چلائیں۔';

  @override
  String rtaBandsInfo(int count) {
    return '$count تہائی آکٹیو بینڈ، 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'کمرے کا اسکین';

  @override
  String scanPointCount(int count) {
    return '$count نقاط';
  }

  @override
  String get commonMicNotRunning => 'مائیکروفون نہیں چل رہا';

  @override
  String get scanMicNeeded => 'اس کے بغیر صرف مقام ناپا جاتا ہے، آواز نہیں۔';

  @override
  String get scanContinuous => 'مسلسل پیمائش';

  @override
  String get scanContinuousHint => 'ہر 0.5 میٹر چلنے پر خودکار نقطہ';

  @override
  String get scanMeasuring => 'ناپ رہا ہے…';

  @override
  String get scanMeasureHere => 'یہاں ناپیں';

  @override
  String scanPointSaved(String id, String position) {
    return 'نقطہ $id مقام $position پر محفوظ ہو گیا';
  }

  @override
  String get scanStartTracking => 'مقام کی ٹریکنگ شروع کریں';

  @override
  String get scanStartTrackingHint =>
      'ARKit — اسی سے ایپ جانتی ہے کہ آپ کمرے میں کہاں کھڑے ہیں۔';

  @override
  String scanPosition(String position) {
    return 'مقام: مبدا سے $position میٹر';
  }

  @override
  String get scanSetOriginHint => 'سننے کی جگہ پر کھڑے ہوں اور مبدا مقرر کریں۔';

  @override
  String get scanOriginHere => 'مبدا یہاں ہے';

  @override
  String get scanNoPoints => 'ابھی کوئی نقطہ نہیں۔';

  @override
  String scanPointStats(String variation, String rms) {
    return 'پھیلاؤ 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'بیٹھک';

  @override
  String get scanNewMeasurement => 'نئی پیمائش';

  @override
  String get scanRoomName => 'کمرے کا نام';

  @override
  String get scanExcitation => 'کمرے کو کس چیز سے متحرک کریں گے';

  @override
  String get scanPhoneNoiseHint =>
      'صرف اندازے کے لیے — فون کا اسپیکر بیس بالکل نہیں دیتا۔';

  @override
  String get scanStart => 'شروع کریں';

  @override
  String get mapExportTooltip => 'FRD + JSON برآمد کریں';

  @override
  String get mapNeedsTwoPoints =>
      'نقشے کو کم از کم دو نقاط چاہئیں۔ کمرے میں چلیں اور ساتھ ساتھ ناپیں۔';

  @override
  String get mapShareText =>
      'ہر نقطے کی FRD (REW / VituixCAD میں درآمد کے لیے) اور پورا سیشن JSON میں۔';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'سب سے ہموار جگہ: $id، $position میٹر پر (40–300 Hz میں $variation dB پھیلاؤ)';
  }

  @override
  String get signalsSweepHelp =>
      'واحد سگنل جس سے امپلس ردِعمل، گونج کا وقت اور پہلے انعکاسات نکالے جا سکتے ہیں۔ اسے کمپیوٹر یا DAC سے اسپیکروں میں چلائیں اور فون کو ریکارڈ کرنے دیں۔';

  @override
  String get signalsLength => 'دورانیہ';

  @override
  String get signalsFrom => 'سے';

  @override
  String get signalsTo => 'تک';

  @override
  String get signalsMonoNoChannel => 'مونو (چینل کے بغیر)';

  @override
  String get signalsExportWav => 'WAV برآمد کریں';

  @override
  String get signalsPinkNoise => 'گلابی شور';

  @override
  String get signalsPinkHelp =>
      'ہر آکٹیو میں یکساں توانائی۔ صرف فریکوئنسی ردِعمل دیتا ہے، وقت یا انعکاسات نہیں — ایک فوری «کیا یہاں کچھ ہو رہا ہے؟» کے لیے کافی ہے۔';

  @override
  String get signalsExportPink => '30 سیکنڈ WAV برآمد کریں';

  @override
  String get signalsHowTo => 'کیسے ناپیں';

  @override
  String get signalsStep1 =>
      'سگنل کمپیوٹر سے اسپیکروں میں چلائیں، فون سے نہیں۔';

  @override
  String get signalsStep2 =>
      'آواز اتنی رکھیں کہ اینالائزر تقریباً −20 dBFS دکھائے۔ اوورلوڈ انعکاس جیسا لگتا ہے۔';

  @override
  String get signalsStep3 =>
      'فون کو بازو پھیلا کر سیدھا پکڑیں، مائیکروفون اسپیکروں کی طرف۔';

  @override
  String get signalsStep4 =>
      'بلوٹوتھ ہیڈ فون منقطع کریں — کمپریشن اور تاخیر پیمائش خراب کر دیتے ہیں۔';

  @override
  String get signalsNoteMono =>
      'دونوں اسپیکروں میں ایک ساتھ مونو L اور R کو جمع کر دیتا ہے، اور ان کا فرق مجموعے میں غائب ہو جاتا ہے۔ چینل ناپنے کے لیے چینل منتخب کریں۔';

  @override
  String get signalsNoteStereo =>
      'اسٹیریو فائل جس میں سگنل صرف ایک چینل میں ہے — جو کچھ بھی اسٹیریو چلاتا ہے اسے چلا لے گا۔';

  @override
  String get signalsNoteChannel =>
      'چینل کے نام والی مونو فائل۔ اسے DAW سے یا ملٹی چینل ان پٹ کے ذریعے ریسیور کے درست ان پٹ پر بھیجیں؛ اسٹیریو آؤٹ پٹ والا لیپ ٹاپ اسے اس چینل تک نہیں پہنچائے گا۔';

  @override
  String get channelsTitle => 'چینلز کی پیمائش';

  @override
  String get channelsHelp =>
      'سننے کی جگہ پر کھڑے ہوں۔ ہر چینل کے لیے: ریکارڈنگ شروع کریں، سگنلز ٹیب سے اس میں sweep چلائیں، ہو گیا پر ٹیپ کریں۔ ان نقاط کے بغیر ڈیزائن کے پاس EQ اور سطحیں نکالنے کے لیے کچھ نہیں ہوتا۔';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds سیکنڈ';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ درج کرنے کے بعد تصدیق';

  @override
  String get channelsVerifyAfterEqHint =>
      'نقطہ «EQ کے بعد» کے طور پر محفوظ ہوتا ہے اور اس نقطے کو نہیں بدلتا جس سے EQ نکالا گیا تھا۔';

  @override
  String channelsRecording(String seconds) {
    return 'ریکارڈنگ $seconds سیکنڈ — اب sweep چلائیں';
  }

  @override
  String get channelsNotMeasured => 'نہیں ناپا گیا';

  @override
  String get channelsMeasuredNoise => 'شور سے ناپا گیا';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · براہِ راست آواز $ms ms بعد';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · براہِ راست آواز $ms ms بعد، T20 $t20 سیکنڈ';
  }

  @override
  String get commonDone => 'ہو گیا';

  @override
  String get channelsMeasure => 'ناپیں';

  @override
  String get channelsAdd => 'شامل کریں';

  @override
  String get channelsAgain => 'دوبارہ';

  @override
  String get compareTitle => 'موازنہ';

  @override
  String get compareNeedsTwoPoints => 'موازنے کے لیے کم از کم دو نقاط چاہئیں۔';

  @override
  String get commonWithRoom => 'کمرے کے ساتھ';

  @override
  String get commonDirectSound => 'براہِ راست آواز';

  @override
  String get compareAfterEq => 'EQ کے بعد';

  @override
  String get compareBandsA => 'A (بینڈز)';

  @override
  String get compareBandsB => 'B (بینڈز)';

  @override
  String get compareArrivalDiff => 'آمد کا فرق A − B';

  @override
  String get compareBroadbandDiff => 'براڈ بینڈ سطح A − B';

  @override
  String get compareWorstBelow300 => '300 Hz سے نیچے سب سے بڑا فرق';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz بینڈ میں $db dB';
  }

  @override
  String get compareTrimNote =>
      'Distance اور level trim آمد اور سطح کا فرق برابر کر دیتے ہیں۔ 300 Hz سے نیچے شکل کا فرق برابر نہیں کرتے — وہ کسی دوسرے فاصلے پر دوسری دیوار سے آتا ہے اور جگہ بدلنے سے حل ہوتا ہے۔';

  @override
  String get designRt60Live => 'آخری ردِعمل سے T20 125–500 Hz';

  @override
  String get designRt60Stored => 'محفوظ sweep سے T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'اندازہ — sweep ناپیں، Schroeder فی الحال صرف اشارہ ہے';

  @override
  String get designExportTooltip => 'کنفیگریشن برآمد کریں';

  @override
  String get designCompute => 'ڈیزائن کا حساب لگائیں';

  @override
  String get designLidarChecking => 'دیکھ رہا ہے کہ LiDAR موجود ہے یا نہیں…';

  @override
  String get designLidarAvailable => 'LiDAR دستیاب ہے';

  @override
  String get designLidarMissing => 'LiDAR نہیں — پیمائشیں ہاتھ سے درج کریں';

  @override
  String get designLidarHint =>
      'اسکین دیواروں کو سینٹی میٹر تک دیتا ہے، اس لیے صرف موڈز ہی نہیں بلکہ انعکاس کے نقاط اور حدود تک فاصلے بھی درست ہوتے ہیں۔';

  @override
  String get designManualHint =>
      'موڈل حساب کو صرف تین اعداد چاہئیں — لیکن انعکاس کے نقاط اور دیواروں تک درست فاصلے ہاتھ سے نکل جاتے ہیں۔';

  @override
  String get designStopScan => 'اسکین ختم کریں';

  @override
  String get designScanRoom => 'کمرہ اسکین کریں';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls دیواریں',
      one: '1 دیوار',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings کھلی جگہیں',
      one: '1 کھلی جگہ',
    );
    return '$_temp0، $_temp1';
  }

  @override
  String get designRoomDimensions => 'کمرے کی پیمائشیں';

  @override
  String get designLength => 'لمبائی';

  @override
  String get designWidth => 'چوڑائی';

  @override
  String get designHeight => 'اونچائی';

  @override
  String get designWhatToDo => 'اس کا کیا کریں';

  @override
  String get designRoomModes => 'کمرے کے موڈز';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (Schroeder) سے اوپر انفرادی موڈز کا کوئی مطلب نہیں رہتا۔ RT60 $rt60 سیکنڈ: $source۔';
  }

  @override
  String get designEqTitle => 'EQ: ناپا گیا، ہدف، پیش گوئی';

  @override
  String get designEqHelp =>
      'پیش گوئی ناپا گیا ردِعمل اور ریسیور کے پندرہ بینڈز کا ماڈل ہے۔ EQ درج کرنے کے بعد «EQ کے بعد» سوئچ کے ساتھ چینل دوبارہ ناپیں تاکہ دیکھ سکیں ماڈل کتنا قریب تھا۔';

  @override
  String get designReceiverConfig => 'ریسیور کنفیگریشن';

  @override
  String get designGeometryOnly =>
      'چینلز کی sweep پیمائش کے بغیر یہاں صرف جیومیٹری ہے: فاصلے اور کراس اوور فریکوئنسیاں۔ EQ اور سطحیں تب آئیں گی جب ہر چینل کے نقاط ہوں گے۔';

  @override
  String get designShareSubject => 'کنفیگریشن کی تجویز';

  @override
  String get impulseTitle => 'امپلس ردِعمل';

  @override
  String get impulseCompareTooltip => 'نقاط کا موازنہ کریں';

  @override
  String get impulseExportTooltip => 'فیز کے ساتھ FRD برآمد کریں';

  @override
  String get impulseTapToStart => 'شروع کرنے کے لیے ٹیپ کریں۔';

  @override
  String get impulseSweepTitle => 'وہ sweep جو آپ اسپیکروں میں چلائیں گے';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz، $seconds سیکنڈ۔ یہ اسی کے مطابق ہونا چاہیے جو آپ چلا رہے ہیں — ورنہ ڈی کنوولیوشن بے معنی نتیجہ دے گا۔';
  }

  @override
  String impulseRecording(String seconds) {
    return 'ریکارڈنگ — $seconds سیکنڈ';
  }

  @override
  String get impulsePlaySweepNow => 'اب کمپیوٹر سے sweep چلائیں۔';

  @override
  String get impulseStartRecording => 'ریکارڈنگ شروع کریں، پھر sweep چلائیں';

  @override
  String get impulseFrequencyResponse => 'فریکوئنسی ردِعمل';

  @override
  String get impulseWithRoom => 'کمرے کے ساتھ (1 سیکنڈ)';

  @override
  String impulseDirectWindow(String ms) {
    return 'براہِ راست آواز (ونڈو $ms ms)';
  }

  @override
  String get impulseWindow => 'ونڈو';

  @override
  String impulseWindowHelp(String hz) {
    return 'لمبی ونڈو نیچے تک دیکھتی ہے (ابھی $hz Hz سے اوپر درست)، مگر پہلا انعکاس اندر آنے دیتی ہے۔ حد سے نیچے خط نہ ہموار کیا جاتا ہے نہ اس پر تبصرہ: وہ ونڈو ہے، کمرہ نہیں۔';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'پہلے انعکاس تک ($ms ms)';
  }

  @override
  String get impulseTime => 'وقت';

  @override
  String get impulseImpulse => 'امپلس';

  @override
  String get impulseTimeHelp =>
      'نیلا ونڈو ہے، نارنجی لکیر پہلا ملا ہوا انعکاس۔ صفر وقت براہِ راست آواز ہے۔';

  @override
  String get impulseSpectrogram => 'اسپیکٹروگرام';

  @override
  String get commonHide => 'چھپائیں';

  @override
  String get commonShow => 'دکھائیں';

  @override
  String get impulseSpectrogramHelp =>
      'براہِ راست آواز سے ms میں وقت، فریکوئنسی اوپر کی طرف، رنگ −60 dB تک سطح ہے۔ ایک افقی پٹی جو باقیوں سے زیادہ دیر رہے وہ موڈ ہے؛ اوپر کی جدول یہی بات عدد میں بتاتی ہے۔';

  @override
  String get impulseDecayByOctave => 'آکٹیو کے لحاظ سے مدھم ہونا';

  @override
  String get impulseMidNoT20 => 'درمیانی بینڈز T20 کے لیے کافی مدھم نہیں ہوئے۔';

  @override
  String impulseMidT20(String seconds) {
    return 'درمیان 125–500 Hz: T20 $seconds سیکنڈ — یہی وہ RT60 ہے جس سے ڈیزائن حساب لگاتا ہے۔';
  }

  @override
  String get impulseDecayHelp =>
      'بیس میں فون سے RT60 زیادہ تر اندازہ ہے: پس منظر کا شور وہاں سب سے قریب ہوتا ہے اور «—» کا مطلب ہے کہ گونج اس سے نیچے نہیں گری۔ صفر سے اوپر C50: براہِ راست آواز ابتدائی انعکاسات کے ساتھ گونج سے زیادہ توانائی رکھتی ہے۔';

  @override
  String get impulseResult => 'نتیجہ';

  @override
  String get impulseDirectArrived => 'براہِ راست آواز اتنی دیر بعد پہنچی';

  @override
  String get impulseDirectArrivedHelp =>
      'پلے بیک کی تاخیر اور سفر کا وقت — اکیلے کچھ نہیں بتاتا، لیکن بائیں اور دائیں اسپیکر کا فرق بتاتا ہے۔';

  @override
  String get impulseFirstReflection => 'پہلا انعکاس';

  @override
  String get impulseNotFound => 'نہیں ملا';

  @override
  String impulseAfterDirect(String time) {
    return 'براہِ راست آواز کے $time بعد';
  }

  @override
  String get impulseNoReflectionHelp =>
      'یا تو کوئی ہے ہی نہیں، یا براہِ راست امپلس کی گونج میں چھپا ہے۔';

  @override
  String impulseExtraPath(String metres) {
    return 'اضافی راستہ ≈ $metres میٹر۔';
  }

  @override
  String get impulseUnmeasurable => 'ناپا نہیں جا سکتا';

  @override
  String get impulseRt60NoiseHelp =>
      'گونج شور کی سطح سے اوپر کافی گہرائی تک نہیں گری — زیادہ آواز میں، یا کسی پرسکون لمحے میں۔';

  @override
  String get impulseRt60Help =>
      'T20 اور T30 کا فرق بتاتا ہے کہ مدھم ہونا کتنا صاف ہے۔';

  @override
  String get impulseGating => 'ونڈو (gating)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz سے اوپر درست';
  }

  @override
  String get impulseGatingHelp =>
      'اس سے نیچے ونڈو ایک بھی پیریڈ نہیں دیکھتی — وہاں خط ونڈو کا اثر ہے، کمرے کا نہیں۔';

  @override
  String get impulseSchroeder => 'شروڈر کا مدھم ہونے کا خط';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz پر HD$order';
  }

  @override
  String get impulseHd2Help =>
      'ہارمونکس Farina ڈی کنوولیوشن کے منفی وقت میں ہوتے ہیں؛ یہاں انہیں پھینکنے کے بجائے وہیں سے پڑھا جاتا ہے۔ −40 dB یعنی 1 %۔';

  @override
  String get impulseHd3Help =>
      'تیسرا ہارمونک اوورلوڈ کے ساتھ دوسرے سے تیز بڑھتا ہے۔';

  @override
  String get impulseDistortionHot => '−30 dB سے اوپر بگاڑ';

  @override
  String get impulseDistortionHotHelp =>
      'یا sweep بہت اونچا ہے، یا اسپیکر اپنی حد پر ہے۔ بگاڑ کی دم امپلس میں انعکاس جیسی لگتی ہے — آواز کم کریں اور کسی بات پر یقین کرنے سے پہلے دوبارہ ناپیں۔';

  @override
  String get eqMeasured => 'ناپا گیا';

  @override
  String get eqTarget => 'ہدف';

  @override
  String get eqPredicted => 'EQ کے بعد پیش گوئی';

  @override
  String get eqMeasuredAfter => 'EQ کے بعد ناپا گیا';

  @override
  String eqDeviation(int maxHz) {
    return 'ہدف سے انحراف 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'ریسیور میں درج کرنے کے بعد';

  @override
  String get eqPredictionVsReality => 'پیش گوئی بمقابلہ حقیقت';

  @override
  String eqStubborn(String bands) {
    return 'ہدف سے 6 dB سے زیادہ دور رہے گا: $bands۔ یہ مداخلت ہے، طاقت کی کمی نہیں — اسپیکر یا سننے والے کی جگہ بدلنے سے حل ہوتا ہے، مزید بوسٹ سے نہیں۔';
  }

  @override
  String get eqModelOk => 'ریسیور کا فلٹر تقریباً ماڈل کی طرح برتاؤ کرتا ہے۔';

  @override
  String get eqModelOff =>
      'ریسیور کا اصل فلٹر ماڈل سے توقع سے زیادہ مختلف ہے — اس کے بینڈز شاید یہاں فرض کیے گئے سے چوڑے یا تنگ ہیں۔';

  @override
  String get eqTargetCurve => 'ہدف کا خط';

  @override
  String get eqFlat => 'ہموار';

  @override
  String get eqTargetHelp =>
      'ہموار نہیں: چند kHz سے اوپر کان براہِ راست آواز سنتا ہے، مائیکروفون انعکاسات بھی جمع کرتا ہے، اور ہموار کیا ہوا ناپا گیا خط بے جان لگتا ہے۔ اوپر ہلکا جھکاؤ اور نیچے تھوڑا بیس — یہی لوگ اندھی سماعت میں چنتے ہیں۔';

  @override
  String get eqBassLift => 'بیس بوسٹ';

  @override
  String get eqBassBelow => 'بیس اس سے نیچے';

  @override
  String get eqTilt => 'جھکاؤ';

  @override
  String get eqDbPerOctave => 'dB/آکٹیو';

  @override
  String get eqTiltFrom => 'جھکاؤ یہاں سے';

  @override
  String get errorMicPermission =>
      'مائیکروفون تک رسائی کے بغیر پیمائش نہیں ہو سکتی۔ اسے ترتیبات ← AudioScanner ← مائیکروفون میں اجازت دیں۔';

  @override
  String errorMic(String error) {
    return 'مائیکروفون: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'مائیکروفون شروع نہیں ہو سکا: $error';
  }

  @override
  String get errorNoArkit =>
      'یہ ڈیوائس ARKit world tracking نہیں کر سکتی — نقاط کو جگہ میں نہیں رکھا جا سکتا۔';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'ریکارڈنگ sweep سے چھوٹی ہے ($expected سیکنڈ میں سے $recorded سیکنڈ)۔ سگنل چلانے سے پہلے ریکارڈنگ شروع کریں۔';
  }

  @override
  String get sessionSnapshots => 'اسنیپ شاٹس';

  @override
  String get errorTrackingUnreliable =>
      'مقام کی ٹریکنگ قابلِ اعتماد نہیں — نقطہ وہاں نہیں ہوگا جہاں آپ کھڑے ہیں۔';

  @override
  String errorNoSound(int seconds) {
    return '$seconds سیکنڈ میں کوئی آواز نہیں آئی۔';
  }

  @override
  String get noteSnapshotNoPose => 'اینالائزر کا اسنیپ شاٹ، مقام کے بغیر';

  @override
  String get sessionChannels => 'چینلز';

  @override
  String get trackingOk => 'ٹریکنگ ٹھیک ہے';

  @override
  String get trackingLimited => 'کمزور ٹریکنگ';

  @override
  String get trackingUnavailable => 'ٹریکنگ نہیں';

  @override
  String get poseHintFeatures =>
      'تصویر میں بہت کم تفصیل — فون کو کسی ساخت والی چیز کی طرف کریں، خالی دیوار کی طرف نہیں۔';

  @override
  String get poseHintMotion => 'بہت تیز حرکت — آہستہ چلیں۔';

  @override
  String get poseHintLight =>
      'بہت کم روشنی — روشنی جلائیں، کیمرہ نہیں دیکھ پا رہا کہ وہ کہاں ہے۔';

  @override
  String get poseHintInitializing => 'ARKit شروع ہو رہا ہے، تھوڑا حرکت کریں۔';

  @override
  String get poseHintRelocalizing =>
      'اصل نقطہ دوبارہ تلاش ہو رہا ہے — وہیں واپس جائیں جہاں سے شروع کیا تھا۔';

  @override
  String get signalPhonePink => 'فون سے گلابی شور';

  @override
  String get signalExternalPink => 'اسپیکروں سے گلابی شور';

  @override
  String get signalExternalSweep => 'اسپیکروں سے sweep';

  @override
  String get captureWarningBluetooth =>
      'بلوٹوتھ مائیکروفون: کمپریشن اور تاخیر پیمائش خراب کر دیتے ہیں۔ ہیڈ فون منقطع کریں اور بلٹ اِن مائیکروفون سے ناپیں۔';

  @override
  String get captureWarningProcessing =>
      'سسٹم نے سگنل پروسیسنگ (AGC / شور میں کمی) بند نہیں کی۔ جگہوں کے درمیان ناپے گئے فرق بگڑے ہوں گے۔';

  @override
  String get captureWarningMeasurementMode =>
      'measurement mode آن نہیں ہو سکا — مائیکروفون کی اپنی فریکوئنسی ردِعمل کی تصحیح ہے۔';

  @override
  String get captureRouteUnknown => 'نامعلوم';

  @override
  String get axisLength => 'لمبائی';

  @override
  String get axisWidth => 'چوڑائی';

  @override
  String get axisHeight => 'اونچائی';
}
