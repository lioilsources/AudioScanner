// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get tabScan => 'المسح';

  @override
  String get tabMap => 'الخريطة';

  @override
  String get tabResponse => 'الاستجابة';

  @override
  String get tabDesign => 'التصميم';

  @override
  String get tabSignals => 'الإشارات';

  @override
  String get rtaSnapshotFailed => 'لم تُحفظ اللقطة.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'حُفظت كنقطة $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'حُفظت كنقطة $id (دون موضع).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count نقطة',
      many: '$count نقطة',
      few: '$count نقاط',
      two: 'نقطتان',
      one: 'نقطة واحدة',
      zero: 'لا نقاط',
    );
    return 'المعايرة $name: $_temp0، $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'تعذّرت قراءة الملف: $message';
  }

  @override
  String get rtaOffsetTitle => 'إزاحة dB SPL';

  @override
  String get rtaOffsetHelp =>
      'شغّل نغمة 1 kHz، واقرأ المستوى على مقياس SPL، وأدخل الفرق عمّا يعرضه المحلّل. مع إزاحة غير صفرية تُعلَّم المستويات كتقدير SPL؛ ومن دونها تبقى بوحدة dBFS.';

  @override
  String get commonReset => 'تصفير';

  @override
  String get commonCancel => 'إلغاء';

  @override
  String get commonSave => 'حفظ';

  @override
  String get commonStop => 'إيقاف';

  @override
  String get commonStartMic => 'تشغيل الميكروفون';

  @override
  String get tabAnalyzer => 'المحلّل';

  @override
  String get rtaUnfreeze => 'استئناف';

  @override
  String get rtaFreeze => 'تجميد';

  @override
  String get rtaPeakHold => 'تثبيت القمم';

  @override
  String get rtaMaxMinTraces => 'منحنيات الأقصى / الأدنى';

  @override
  String get rtaResetTraces => 'تصفير المنحنيات';

  @override
  String get rtaSaveAsPoint => 'حفظ كنقطة (3 ث)';

  @override
  String get rtaMicCalibration => 'معايرة الميكروفون…';

  @override
  String get rtaRemoveCalibration => 'إزالة المعايرة';

  @override
  String get rtaOffsetMenu => 'إزاحة dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · دون معالجة للإشارة';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count نقطة',
      many: '$count نقطة',
      few: '$count نقاط',
      two: 'نقطتان',
      one: 'نقطة واحدة',
      zero: 'لا نقاط',
    );
    return 'المعايرة $name: $_temp0، التصحيح $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (تقدير)';

  @override
  String get rtaFrozenHint =>
      'مجمّد — الميكروفون مستمر في العمل، لكنه لا يُرسم.';

  @override
  String get rtaRelativeHint =>
      'المستويات نسبية (dBFS). يظهر المخطط الخارجي حين تحفظ النقطة الأولى — فهي المرجع لبقية النقاط.';

  @override
  String get rtaReferenceHint =>
      'الأعمدة الممتلئة = هنا. المخطط الخارجي = نقطة المرجع.';

  @override
  String get rtaEnvelopeHint => 'الأحمر = الأقصى، الأخضر = الأدنى منذ التصفير.';

  @override
  String get rtaMicStopped => 'الميكروفون متوقف';

  @override
  String get rtaSilence => 'صمت — هل هناك إشارة تُشغَّل؟';

  @override
  String get rtaPlaceholder => 'شغّل الميكروفون وشغّل إشارة في الغرفة.';

  @override
  String rtaBandsInfo(int count) {
    return '$count نطاقًا بثلث أوكتاف، 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'مسح الغرفة';

  @override
  String scanPointCount(int count) {
    return '$count نقطة';
  }

  @override
  String get commonMicNotRunning => 'الميكروفون لا يعمل';

  @override
  String get scanMicNeeded => 'من دونه يُقاس الموضع فقط، لا الصوت.';

  @override
  String get scanContinuous => 'قياس مستمر';

  @override
  String get scanContinuousHint => 'نقطة تلقائيًا كل 0.5 م من المشي';

  @override
  String get scanMeasuring => 'جارٍ القياس…';

  @override
  String get scanMeasureHere => 'قِس هنا';

  @override
  String scanPointSaved(String id, String position) {
    return 'حُفظت النقطة $id عند $position';
  }

  @override
  String get scanStartTracking => 'بدء تتبّع الموضع';

  @override
  String get scanStartTrackingHint =>
      'ARKit — هكذا يعرف التطبيق أين تقف في الغرفة.';

  @override
  String scanPosition(String position) {
    return 'الموضع: $position م من نقطة الأصل';
  }

  @override
  String get scanSetOriginHint => 'قف في موضع الاستماع وحدّد نقطة الأصل.';

  @override
  String get scanOriginHere => 'نقطة الأصل هنا';

  @override
  String get scanNoPoints => 'لا توجد نقاط بعد.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'التشتت 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'غرفة المعيشة';

  @override
  String get scanNewMeasurement => 'قياس جديد';

  @override
  String get scanRoomName => 'اسم الغرفة';

  @override
  String get scanExcitation => 'بماذا ستُثير الغرفة';

  @override
  String get scanPhoneNoiseHint =>
      'للاسترشاد فقط — سمّاعة الهاتف لا تُصدر أي ترددات منخفضة إطلاقًا.';

  @override
  String get scanStart => 'ابدأ';

  @override
  String get mapExportTooltip => 'تصدير FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'تحتاج الخريطة إلى نقطتين على الأقل. تجوّل في الغرفة وقِس أثناء ذلك.';

  @override
  String get mapShareText =>
      'ملف FRD لكل نقطة (للاستيراد في REW / VituixCAD) والجلسة كاملة بصيغة JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'الموضع الأكثر استواءً: $id عند $position م (تشتت $variation dB في 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'الإشارة الوحيدة التي يمكن منها حساب الاستجابة النبضية وزمن الارتداد والانعكاسات الأولى. شغّلها من حاسوب أو DAC عبر السماعات ودع الهاتف يسجّل.';

  @override
  String get signalsLength => 'المدة';

  @override
  String get signalsFrom => 'من';

  @override
  String get signalsTo => 'إلى';

  @override
  String get signalsMonoNoChannel => 'أحادي (دون قناة)';

  @override
  String get signalsExportWav => 'تصدير WAV';

  @override
  String get signalsPinkNoise => 'ضوضاء وردية';

  @override
  String get signalsPinkHelp =>
      'طاقة متساوية في كل أوكتاف. تعطي الاستجابة الترددية فقط، دون زمن أو انعكاسات — تكفي لسؤال سريع: «هل يحدث شيء هنا؟».';

  @override
  String get signalsExportPink => 'تصدير WAV لمدة 30 ث';

  @override
  String get signalsHowTo => 'كيف تقيس';

  @override
  String get signalsStep1 =>
      'شغّل الإشارة من حاسوب عبر السماعات، لا من الهاتف.';

  @override
  String get signalsStep2 =>
      'اضبط مستوى الصوت بحيث يُظهر المحلّل نحو −20 dBFS. التشبّع يبدو كانعكاس.';

  @override
  String get signalsStep3 =>
      'أمسك الهاتف عموديًا بذراع ممدودة، والميكروفون نحو السماعات.';

  @override
  String get signalsStep4 =>
      'افصل سماعات Bluetooth — الضغط والتأخير يُفسدان القياس.';

  @override
  String get signalsNoteMono =>
      'الأحادي إلى السماعتين معًا يجمع L وR، فيختفي الفرق بينهما في المجموع. لقياس القنوات اختر قناة.';

  @override
  String get signalsNoteStereo =>
      'ملف ستيريو بإشارة في قناة واحدة فقط — يشغّله أي شيء يشغّل الستيريو.';

  @override
  String get signalsNoteChannel =>
      'ملف أحادي مسمّى باسم القناة. وجّهه إلى المدخل الصحيح في جهاز الاستقبال من DAW أو عبر مدخل متعدد القنوات؛ الحاسوب المحمول ذو المخرج الستيريو لن يوصله إلى هذه القناة.';

  @override
  String get channelsTitle => 'قياس القنوات';

  @override
  String get channelsHelp =>
      'قف في موضع الاستماع. لكل قناة: ابدأ التسجيل، وشغّل عليها sweep من تبويب الإشارات، ثم اضغط «تم». من دون هذه النقاط لا يجد التصميم ما يحسب منه EQ والمستويات.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds ث';
  }

  @override
  String get channelsVerifyAfterEq => 'التحقق بعد إدخال EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'تُحفظ النقطة كـ«بعد EQ» ولا تستبدل النقطة التي حُسب منها EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'جارٍ التسجيل $seconds ث — شغّل الـ sweep الآن';
  }

  @override
  String get channelsNotMeasured => 'لم تُقَس';

  @override
  String get channelsMeasuredNoise => 'قيست بالضوضاء';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · الصوت المباشر بعد $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · الصوت المباشر بعد $ms ms، T20 $t20 ث';
  }

  @override
  String get commonDone => 'تم';

  @override
  String get channelsMeasure => 'قِس';

  @override
  String get channelsAdd => 'إضافة';

  @override
  String get channelsAgain => 'مجددًا';

  @override
  String get compareTitle => 'المقارنة';

  @override
  String get compareNeedsTwoPoints => 'تحتاج المقارنة إلى نقطتين على الأقل.';

  @override
  String get commonWithRoom => 'مع الغرفة';

  @override
  String get commonDirectSound => 'الصوت المباشر';

  @override
  String get compareAfterEq => 'بعد EQ';

  @override
  String get compareBandsA => 'A (نطاقات)';

  @override
  String get compareBandsB => 'B (نطاقات)';

  @override
  String get compareArrivalDiff => 'فرق الوصول A − B';

  @override
  String get compareBroadbandDiff => 'المستوى عريض النطاق A − B';

  @override
  String get compareWorstBelow300 => 'أكبر فرق تحت 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB في نطاق $band Hz';
  }

  @override
  String get compareTrimNote =>
      'يُعادل Distance وlevel trim فرقَ الوصول والمستوى. أما فرق الشكل تحت 300 Hz فلا يعادلانه — يُحدثه جدار آخر على مسافة أخرى، ويُحلّ بتغيير المواضع.';

  @override
  String get designRt60Live => 'T20 125–500 Hz من آخر استجابة';

  @override
  String get designRt60Stored => 'T20 125–500 Hz من sweep محفوظ';

  @override
  String get designRt60Guess =>
      'تقدير — قِس sweep، فـ Schroeder حاليًا مجرد تلميح';

  @override
  String get designExportTooltip => 'تصدير الإعدادات';

  @override
  String get designCompute => 'احسب التصميم';

  @override
  String get designLidarChecking => 'جارٍ التحقق من وجود LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR متاح';

  @override
  String get designLidarMissing => 'لا يوجد LiDAR — أدخل الأبعاد يدويًا';

  @override
  String get designLidarHint =>
      'يعطي المسح الجدران بدقة السنتيمتر، فتصحّ أيضًا نقاط الانعكاس والمسافات إلى الحدود، لا الأنماط وحدها.';

  @override
  String get designManualHint =>
      'الحساب النمطي يحتاج ثلاثة أرقام فقط — لكنك تخسر نقاط الانعكاس والمسافات الدقيقة إلى الجدران.';

  @override
  String get designStopScan => 'إنهاء المسح';

  @override
  String get designScanRoom => 'مسح الغرفة';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls جدار',
      many: '$walls جدارًا',
      few: '$walls جدران',
      two: 'جداران',
      one: 'جدار واحد',
      zero: 'لا جدران',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings فتحة',
      many: '$openings فتحة',
      few: '$openings فتحات',
      two: 'فتحتان',
      one: 'فتحة واحدة',
      zero: 'لا فتحات',
    );
    return '$_temp0، $_temp1';
  }

  @override
  String get designRoomDimensions => 'أبعاد الغرفة';

  @override
  String get designLength => 'الطول';

  @override
  String get designWidth => 'العرض';

  @override
  String get designHeight => 'الارتفاع';

  @override
  String get designWhatToDo => 'ما الذي يجب فعله';

  @override
  String get designRoomModes => 'أنماط الغرفة';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'فوق $schroeder Hz (Schroeder) لا يعود للأنماط المنفردة معنى. RT60 $rt60 ث: $source.';
  }

  @override
  String get designEqTitle => 'EQ: المقيس، الهدف، التوقع';

  @override
  String get designEqHelp =>
      'التوقع هو الاستجابة المقيسة مضافًا إليها نموذج للنطاقات الخمسة عشر في جهاز الاستقبال. بعد إدخال EQ قِس القناة مجددًا مع مفتاح «بعد EQ» لترى مدى قرب النموذج.';

  @override
  String get designReceiverConfig => 'إعدادات جهاز الاستقبال';

  @override
  String get designGeometryOnly =>
      'من دون قياسات sweep للقنوات لا يوجد هنا سوى الهندسة: المسافات وترددات التقاطع. سيُضاف EQ والمستويات حين توجد نقاط لكل قناة.';

  @override
  String get designShareSubject => 'مقترح الإعدادات';

  @override
  String get impulseTitle => 'الاستجابة النبضية';

  @override
  String get impulseCompareTooltip => 'مقارنة النقاط';

  @override
  String get impulseExportTooltip => 'تصدير FRD مع الطور';

  @override
  String get impulseTapToStart => 'اضغط للتشغيل.';

  @override
  String get impulseSweepTitle => 'الـ sweep الذي تشغّله عبر السماعات';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz، $seconds ث. يجب أن يطابق ما تشغّله — وإلا أعاد فكّ الالتفاف نتيجة لا معنى لها.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'جارٍ التسجيل — $seconds ث';
  }

  @override
  String get impulsePlaySweepNow => 'شغّل الآن الـ sweep من الحاسوب.';

  @override
  String get impulseStartRecording => 'ابدأ التسجيل ثم شغّل الـ sweep';

  @override
  String get impulseFrequencyResponse => 'الاستجابة الترددية';

  @override
  String get impulseWithRoom => 'مع الغرفة (1 ث)';

  @override
  String impulseDirectWindow(String ms) {
    return 'الصوت المباشر (نافذة $ms ms)';
  }

  @override
  String get impulseWindow => 'النافذة';

  @override
  String impulseWindowHelp(String hz) {
    return 'النافذة الأطول ترى ترددات أدنى (صالحة الآن فوق $hz Hz)، لكنها تُدخل الانعكاس الأول. تحت الحد لا يُنعَّم المنحنى ولا يُعلَّق عليه: هذه النافذة، لا الغرفة.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'حتى الانعكاس الأول ($ms ms)';
  }

  @override
  String get impulseTime => 'الزمن';

  @override
  String get impulseImpulse => 'النبضة';

  @override
  String get impulseTimeHelp =>
      'الأزرق هو النافذة، والخط البرتقالي أول انعكاس عُثر عليه. الزمن صفر هو الصوت المباشر.';

  @override
  String get impulseSpectrogram => 'المخطط الطيفي';

  @override
  String get commonHide => 'إخفاء';

  @override
  String get commonShow => 'إظهار';

  @override
  String get impulseSpectrogramHelp =>
      'الزمن بالميلي ثانية من الصوت المباشر، والتردد إلى الأعلى، واللون هو المستوى حتى −60 dB. الشريط الأفقي الذي يبقى بعد غيره هو نمط؛ والجدول أعلاه يقول الشيء نفسه بالأرقام.';

  @override
  String get impulseDecayByOctave => 'التلاشي حسب الأوكتاف';

  @override
  String get impulseMidNoT20 => 'لم تتلاشَ النطاقات الوسطى بما يكفي لحساب T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'الوسط 125–500 Hz: T20 $seconds ث — هذا هو RT60 الذي يعتمد عليه التصميم.';
  }

  @override
  String get impulseDecayHelp =>
      'في الترددات المنخفضة يكون RT60 من الهاتف تقديرًا أكثر منه قياسًا: ضوضاء الخلفية هناك هي الأقرب، و«—» تعني أن الارتداد لم ينخفض تحتها. C50 فوق الصفر: الصوت المباشر مع الانعكاسات المبكرة يحمل طاقة أكبر من الارتداد.';

  @override
  String get impulseResult => 'النتيجة';

  @override
  String get impulseDirectArrived => 'وصل الصوت المباشر بعد';

  @override
  String get impulseDirectArrivedHelp =>
      'تأخير التشغيل مضافًا إليه زمن الانتقال — لا يعني شيئًا بمفرده، لكن الفرق بين السماعة اليسرى واليمنى يعني.';

  @override
  String get impulseFirstReflection => 'الانعكاس الأول';

  @override
  String get impulseNotFound => 'لم يُعثر عليه';

  @override
  String impulseAfterDirect(String time) {
    return '$time بعد الصوت المباشر';
  }

  @override
  String get impulseNoReflectionHelp =>
      'إما أنه غير موجود، أو أنه مختبئ في رنين النبضة المباشرة.';

  @override
  String impulseExtraPath(String metres) {
    return 'مسار إضافي ≈ $metres م.';
  }

  @override
  String get impulseUnmeasurable => 'غير قابل للقياس';

  @override
  String get impulseRt60NoiseHelp =>
      'لم ينخفض الارتداد بعمق كافٍ فوق مستوى الضوضاء — بصوت أعلى، أو في لحظة أهدأ.';

  @override
  String get impulseRt60Help =>
      'الفرق بين T20 وT30 يشير إلى مدى نظافة التلاشي.';

  @override
  String get impulseGating => 'النافذة (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'صالحة فوق $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'تحت هذا الحد لا ترى النافذة ولا دورة واحدة — المنحنى هناك أثر للنافذة، لا للغرفة.';

  @override
  String get impulseSchroeder => 'منحنى تلاشي شرودر';

  @override
  String impulseHdAt(int order) {
    return 'HD$order عند 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'تقع التوافقيات في الزمن السالب لفكّ التفاف Farina؛ وهنا تُقرأ منه بدل التخلص منها. ‎−40 dB تعادل 1 %.';

  @override
  String get impulseHd3Help =>
      'التوافقية الثالثة تزداد مع التشبّع أسرع من الثانية.';

  @override
  String get impulseDistortionHot => 'تشوّه فوق −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'إما أن الـ sweep عالٍ جدًا، أو أن السماعة عند حدّها. ذيل التشوّه يبدو في النبضة كانعكاس — اخفض الصوت وقِس مجددًا قبل أن تصدّق أي شيء.';

  @override
  String get eqMeasured => 'المقيس';

  @override
  String get eqTarget => 'الهدف';

  @override
  String get eqPredicted => 'التوقع بعد EQ';

  @override
  String get eqMeasuredAfter => 'المقيس بعد EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'الانحراف عن الهدف 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'بعد الإدخال في جهاز الاستقبال';

  @override
  String get eqPredictionVsReality => 'التوقع مقابل الواقع';

  @override
  String eqStubborn(String bands) {
    return 'سيبقى أبعد من 6 dB عن الهدف: $bands. هذا تداخل، لا نقص في القدرة — يُحلّ بنقل السماعة أو المستمع، لا بمزيد من الرفع.';
  }

  @override
  String get eqModelOk => 'مرشّح جهاز الاستقبال يتصرف تقريبًا مثل النموذج.';

  @override
  String get eqModelOff =>
      'المرشّح الفعلي لجهاز الاستقبال يختلف عن النموذج أكثر مما هو متوقع — نطاقاته على الأرجح أعرض أو أضيق مما يُفترض هنا.';

  @override
  String get eqTargetCurve => 'منحنى الهدف';

  @override
  String get eqFlat => 'مستوٍ';

  @override
  String get eqTargetHelp =>
      'ليس مستويًا: فوق بضعة kHz تسمع الأذن الصوت المباشر، بينما يجمع الميكروفون الانعكاسات أيضًا، فيبدو المنحنى المقيس المسوّى باهتًا. ميل خفيف في الأعلى وقليل من الترددات المنخفضة في الأسفل — هذا ما يختاره الناس في الاستماع الأعمى.';

  @override
  String get eqBassLift => 'رفع الترددات المنخفضة';

  @override
  String get eqBassBelow => 'المنخفضة تحت';

  @override
  String get eqTilt => 'الميل';

  @override
  String get eqDbPerOctave => 'dB/أوكتاف';

  @override
  String get eqTiltFrom => 'الميل بدءًا من';

  @override
  String get errorMicPermission =>
      'لا يمكن القياس دون الوصول إلى الميكروفون. اسمح به في الإعدادات ← AudioScanner ← الميكروفون.';

  @override
  String errorMic(String error) {
    return 'الميكروفون: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'تعذّر تشغيل الميكروفون: $error';
  }

  @override
  String get errorNoArkit =>
      'هذا الجهاز لا يدعم ARKit world tracking — لا يمكن وضع النقاط في الفراغ.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'التسجيل أقصر من الـ sweep ($recorded ث من $expected ث). ابدأ التسجيل قبل تشغيل الإشارة.';
  }

  @override
  String get sessionSnapshots => 'اللقطات';

  @override
  String get errorTrackingUnreliable =>
      'تتبّع الموضع غير موثوق — ستقع النقطة في مكان غير الذي تقف فيه.';

  @override
  String errorNoSound(int seconds) {
    return 'لم يصل أي صوت خلال $seconds ث.';
  }

  @override
  String get noteSnapshotNoPose => 'لقطة من المحلّل، دون موضع';

  @override
  String get sessionChannels => 'القنوات';

  @override
  String get trackingOk => 'التتبّع سليم';

  @override
  String get trackingLimited => 'تتبّع ضعيف';

  @override
  String get trackingUnavailable => 'لا يوجد تتبّع';

  @override
  String get poseHintFeatures =>
      'تفاصيل قليلة في الصورة — وجّه الهاتف نحو شيء ذي ملمس، لا نحو جدار عارٍ.';

  @override
  String get poseHintMotion => 'حركة سريعة جدًا — امشِ ببطء أكثر.';

  @override
  String get poseHintLight =>
      'إضاءة قليلة — أشعل الضوء، فالكاميرا لا ترى أين هي.';

  @override
  String get poseHintInitializing => 'ARKit قيد البدء، تحرّك قليلًا.';

  @override
  String get poseHintRelocalizing =>
      'جارٍ البحث مجددًا عن النقطة الأصلية — عد إلى حيث بدأت.';

  @override
  String get signalPhonePink => 'ضوضاء وردية من الهاتف';

  @override
  String get signalExternalPink => 'ضوضاء وردية من السماعات';

  @override
  String get signalExternalSweep => 'Sweep من السماعات';

  @override
  String get captureWarningBluetooth =>
      'ميكروفون Bluetooth: الضغط والتأخير يُفسدان القياس. افصل السماعات وقِس بالميكروفون المدمج.';

  @override
  String get captureWarningProcessing =>
      'لم يُوقف النظام معالجة الإشارة (AGC / كبت الضوضاء). ستكون الفروق المقيسة بين المواضع مشوّهة.';

  @override
  String get captureWarningMeasurementMode =>
      'تعذّر تفعيل measurement mode — للميكروفون تصحيح خاص به للاستجابة الترددية.';

  @override
  String get captureRouteUnknown => 'غير معروف';

  @override
  String get axisLength => 'الطول';

  @override
  String get axisWidth => 'العرض';

  @override
  String get axisHeight => 'الارتفاع';
}
