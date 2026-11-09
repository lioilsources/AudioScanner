// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hebrew (`he`).
class AppLocalizationsHe extends AppLocalizations {
  AppLocalizationsHe([String locale = 'he']) : super(locale);

  @override
  String get tabScan => 'סריקה';

  @override
  String get tabMap => 'מפה';

  @override
  String get tabResponse => 'תגובה';

  @override
  String get tabDesign => 'תכנון';

  @override
  String get tabSignals => 'אותות';

  @override
  String get rtaSnapshotFailed => 'תמונת המצב לא נשמרה.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'נשמר כנקודה $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'נשמר כנקודה $id (ללא מיקום).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count נקודות',
      two: '$count נקודות',
      one: 'נקודה אחת',
    );
    return 'כיול $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'לא ניתן לקרוא את הקובץ: $message';
  }

  @override
  String get rtaOffsetTitle => 'היסט dB SPL';

  @override
  String get rtaOffsetHelp =>
      'נגן צליל של 1 kHz, קרא את הרמה במד SPL והזן את ההפרש ממה שהמנתח מציג. עם היסט שונה מאפס, הרמות יסומנו כהערכת SPL; בלעדיו הן נשארות ב־dBFS.';

  @override
  String get commonReset => 'איפוס';

  @override
  String get commonCancel => 'ביטול';

  @override
  String get commonSave => 'שמירה';

  @override
  String get commonStop => 'עצירה';

  @override
  String get commonStartMic => 'הפעלת המיקרופון';

  @override
  String get tabAnalyzer => 'מנתח';

  @override
  String get rtaUnfreeze => 'המשך';

  @override
  String get rtaFreeze => 'הקפאה';

  @override
  String get rtaPeakHold => 'החזקת שיא';

  @override
  String get rtaMaxMinTraces => 'עקומות מקס׳ / מינ׳';

  @override
  String get rtaResetTraces => 'איפוס עקומות';

  @override
  String get rtaSaveAsPoint => 'שמירה כנקודה (3 שנ׳)';

  @override
  String get rtaMicCalibration => 'כיול מיקרופון…';

  @override
  String get rtaRemoveCalibration => 'הסרת כיול';

  @override
  String get rtaOffsetMenu => 'היסט dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · ללא עיבוד אות';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count נקודות',
      two: '$count נקודות',
      one: 'נקודה אחת',
    );
    return 'כיול $name: $_temp0, תיקון $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (הערכה)';

  @override
  String get rtaFrozenHint => 'מוקפא — המיקרופון ממשיך לפעול, רק לא משורטט.';

  @override
  String get rtaRelativeHint =>
      'הרמות יחסיות (dBFS). קו המתאר יופיע כשתשמור את הנקודה הראשונה — היא הייחוס לכל השאר.';

  @override
  String get rtaReferenceHint => 'עמודות מלאות = כאן. קו מתאר = נקודת ייחוס.';

  @override
  String get rtaEnvelopeHint => 'אדום = מקס׳, ירוק = מינ׳ מאז האיפוס.';

  @override
  String get rtaMicStopped => 'המיקרופון עצור';

  @override
  String get rtaSilence => 'שקט — האם מתנגן אות?';

  @override
  String get rtaPlaceholder => 'הפעל את המיקרופון ונגן אות לתוך החדר.';

  @override
  String rtaBandsInfo(int count) {
    return '$count פסי שליש אוקטבה, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'סריקת חדר';

  @override
  String scanPointCount(int count) {
    return '$count נק׳';
  }

  @override
  String get commonMicNotRunning => 'המיקרופון לא פועל';

  @override
  String get scanMicNeeded => 'בלעדיו נמדד רק המיקום, לא הצליל.';

  @override
  String get scanContinuous => 'מדידה רציפה';

  @override
  String get scanContinuousHint => 'נקודה אוטומטית כל 0.5 מ׳ הליכה';

  @override
  String get scanMeasuring => 'מודד…';

  @override
  String get scanMeasureHere => 'מדוד כאן';

  @override
  String scanPointSaved(String id, String position) {
    return 'נקודה $id נשמרה ב־$position';
  }

  @override
  String get scanStartTracking => 'הפעלת מעקב מיקום';

  @override
  String get scanStartTrackingHint =>
      'ARKit — כך האפליקציה יודעת איפה אתה עומד בחדר.';

  @override
  String scanPosition(String position) {
    return 'מיקום: $position מ׳ מנקודת הראשית';
  }

  @override
  String get scanSetOriginHint => 'עמוד במקום ההאזנה וקבע את נקודת הראשית.';

  @override
  String get scanOriginHere => 'הראשית כאן';

  @override
  String get scanNoPoints => 'עדיין אין נקודות.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'פיזור 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'סלון';

  @override
  String get scanNewMeasurement => 'מדידה חדשה';

  @override
  String get scanRoomName => 'שם החדר';

  @override
  String get scanExcitation => 'במה תעורר את החדר';

  @override
  String get scanPhoneNoiseHint =>
      'להתרשמות בלבד — רמקול הטלפון לא מפיק בס בכלל.';

  @override
  String get scanStart => 'התחל';

  @override
  String get mapExportTooltip => 'ייצוא FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'המפה צריכה לפחות שתי נקודות. עבור בחדר ומדוד תוך כדי.';

  @override
  String get mapShareText =>
      'FRD לכל נקודה (ייבוא ל־REW / VituixCAD) וכל הסשן ב־JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'המקום האחיד ביותר: $id ב־$position מ׳ (פיזור $variation dB ב־40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'האות היחיד שממנו אפשר לחשב תגובת הלם, זמן הדהוד והחזרות ראשונות. נגן אותו ממחשב או מ־DAC דרך הרמקולים ותן לטלפון להקליט.';

  @override
  String get signalsLength => 'אורך';

  @override
  String get signalsFrom => 'מ־';

  @override
  String get signalsTo => 'עד';

  @override
  String get signalsMonoNoChannel => 'מונו (ללא ערוץ)';

  @override
  String get signalsExportWav => 'ייצוא WAV';

  @override
  String get signalsPinkNoise => 'רעש ורוד';

  @override
  String get signalsPinkHelp =>
      'אותה אנרגיה בכל אוקטבה. נותן רק תגובת תדר, בלי זמן ובלי החזרות — מספיק ל״קורה פה משהו?״ מהיר.';

  @override
  String get signalsExportPink => 'ייצוא WAV של 30 שנ׳';

  @override
  String get signalsHowTo => 'איך מודדים';

  @override
  String get signalsStep1 => 'נגן את האות ממחשב דרך הרמקולים, לא מהטלפון.';

  @override
  String get signalsStep2 =>
      'כוונן את העוצמה כך שהמנתח יציג בערך −20 dBFS. עיוות מעומס נראה כמו החזרה.';

  @override
  String get signalsStep3 =>
      'החזק את הטלפון זקוף ביד מושטת, עם המיקרופון לכיוון הרמקולים.';

  @override
  String get signalsStep4 =>
      'נתק אוזניות Bluetooth — דחיסה והשהיה הורסות את המדידה.';

  @override
  String get signalsNoteMono =>
      'מונו לשני הרמקולים יחד מסכם L ו־R, וההפרש ביניהם נעלם בסכום. למדידת ערוצים בחר ערוץ.';

  @override
  String get signalsNoteStereo =>
      'קובץ סטריאו עם האות בערוץ אחד בלבד — כל מה שמנגן סטריאו ינגן אותו.';

  @override
  String get signalsNoteChannel =>
      'קובץ מונו בשם הערוץ. נתב אותו לכניסה הנכונה של המקלט מ־DAW או דרך כניסה רב־ערוצית; מחשב נייד עם יציאת סטריאו לא יביא אותו לערוץ הזה.';

  @override
  String get channelsTitle => 'מדידת ערוצים';

  @override
  String get channelsHelp =>
      'עמוד במקום ההאזנה. לכל ערוץ: התחל להקליט, נגן אליו sweep מהלשונית ״אותות״, ולחץ ״סיום״. בלי הנקודות האלה לתכנון אין ממה לחשב EQ ורמות.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds שנ׳';
  }

  @override
  String get channelsVerifyAfterEq => 'אימות אחרי הזנת ה־EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'הנקודה תישמר כ״אחרי EQ״ ולא תדרוס את זו שממנה חושב ה־EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'מקליט $seconds שנ׳ — נגן עכשיו את ה־sweep';
  }

  @override
  String get channelsNotMeasured => 'לא נמדד';

  @override
  String get channelsMeasuredNoise => 'נמדד ברעש';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · צליל ישיר אחרי $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · צליל ישיר אחרי $ms ms, T20 $t20 שנ׳';
  }

  @override
  String get commonDone => 'סיום';

  @override
  String get channelsMeasure => 'מדוד';

  @override
  String get channelsAdd => 'הוסף';

  @override
  String get channelsAgain => 'שוב';

  @override
  String get compareTitle => 'השוואה';

  @override
  String get compareNeedsTwoPoints => 'השוואה צריכה לפחות שתי נקודות.';

  @override
  String get commonWithRoom => 'עם החדר';

  @override
  String get commonDirectSound => 'צליל ישיר';

  @override
  String get compareAfterEq => 'אחרי EQ';

  @override
  String get compareBandsA => 'A (פסים)';

  @override
  String get compareBandsB => 'B (פסים)';

  @override
  String get compareArrivalDiff => 'הפרש הגעה A − B';

  @override
  String get compareBroadbandDiff => 'רמה רחבת פס A − B';

  @override
  String get compareWorstBelow300 => 'ההפרש הגדול ביותר מתחת ל־300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB בפס $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance ו־level trim משווים את הפרש ההגעה והרמה. את הפרש הצורה מתחת ל־300 Hz הם לא משווים — אותו יוצר קיר אחר במרחק אחר, והוא נפתר בהזזה.';

  @override
  String get designRt60Live => 'T20 125–500 Hz מהתגובה האחרונה';

  @override
  String get designRt60Stored => 'T20 125–500 Hz מ־sweep שמור';

  @override
  String get designRt60Guess => 'הערכה — מדוד sweep, Schroeder בינתיים רק רמז';

  @override
  String get designExportTooltip => 'ייצוא תצורה';

  @override
  String get designCompute => 'חשב תכנון';

  @override
  String get designLidarChecking => 'בודק אם יש LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR זמין';

  @override
  String get designLidarMissing => 'אין LiDAR — הזן את המידות ידנית';

  @override
  String get designLidarHint =>
      'הסריקה נותנת את הקירות ברמת סנטימטר, כך שגם נקודות ההחזרה והמרחקים לגבולות מדויקים, לא רק המודים.';

  @override
  String get designManualHint =>
      'חישוב המודים צריך רק שלושה מספרים — אבל תפסיד את נקודות ההחזרה ואת המרחקים המדויקים לקירות.';

  @override
  String get designStopScan => 'סיים סריקה';

  @override
  String get designScanRoom => 'סרוק את החדר';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls קירות',
      two: '$walls קירות',
      one: 'קיר אחד',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings פתחים',
      two: '$openings פתחים',
      one: 'פתח אחד',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'מידות החדר';

  @override
  String get designLength => 'אורך';

  @override
  String get designWidth => 'רוחב';

  @override
  String get designHeight => 'גובה';

  @override
  String get designWhatToDo => 'מה לעשות';

  @override
  String get designRoomModes => 'מודים של החדר';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'מעל $schroeder Hz (Schroeder) למודים בודדים כבר אין משמעות. RT60 $rt60 שנ׳: $source.';
  }

  @override
  String get designEqTitle => 'EQ: נמדד, יעד, תחזית';

  @override
  String get designEqHelp =>
      'התחזית היא התגובה הנמדדת ועוד מודל של חמשת־עשר הפסים של המקלט. אחרי הזנת ה־EQ מדוד את הערוץ שוב עם המתג ״אחרי EQ״ כדי לראות כמה קרוב היה המודל.';

  @override
  String get designReceiverConfig => 'תצורת המקלט';

  @override
  String get designGeometryOnly =>
      'בלי מדידות sweep של הערוצים יש כאן רק גיאומטריה: מרחקים ותדרי הצלבה. EQ ורמות יתווספו כשיהיו נקודות לכל ערוץ.';

  @override
  String get designShareSubject => 'הצעת תצורה';

  @override
  String get impulseTitle => 'תגובת הלם';

  @override
  String get impulseCompareTooltip => 'השווה נקודות';

  @override
  String get impulseExportTooltip => 'ייצוא FRD עם פאזה';

  @override
  String get impulseTapToStart => 'הקש כדי להפעיל.';

  @override
  String get impulseSweepTitle => 'ה־sweep שתנגן דרך הרמקולים';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds שנ׳. חייב להתאים למה שאתה מנגן — אחרת הדקונבולוציה תחזיר שטויות.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'מקליט — $seconds שנ׳';
  }

  @override
  String get impulsePlaySweepNow => 'עכשיו נגן את ה־sweep מהמחשב.';

  @override
  String get impulseStartRecording => 'התחל להקליט ואז נגן את ה־sweep';

  @override
  String get impulseFrequencyResponse => 'תגובת תדר';

  @override
  String get impulseWithRoom => 'עם החדר (1 שנ׳)';

  @override
  String impulseDirectWindow(String ms) {
    return 'צליל ישיר (חלון $ms ms)';
  }

  @override
  String get impulseWindow => 'חלון';

  @override
  String impulseWindowHelp(String hz) {
    return 'חלון ארוך יותר רואה נמוך יותר (כרגע תקף מעל $hz Hz), אבל מכניס את ההחזרה הראשונה. מתחת לגבול העקומה לא מוחלקת ולא מפורשת: זה החלון, לא החדר.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'עד ההחזרה הראשונה ($ms ms)';
  }

  @override
  String get impulseTime => 'זמן';

  @override
  String get impulseImpulse => 'הלם';

  @override
  String get impulseTimeHelp =>
      'בכחול החלון, הקו הכתום הוא ההחזרה הראשונה שנמצאה. זמן אפס הוא הצליל הישיר.';

  @override
  String get impulseSpectrogram => 'ספקטרוגרמה';

  @override
  String get commonHide => 'הסתר';

  @override
  String get commonShow => 'הצג';

  @override
  String get impulseSpectrogramHelp =>
      'זמן ב־ms מהצליל הישיר, תדר כלפי מעלה, הצבע הוא הרמה עד −60 dB. פס אופקי ששורד את השאר הוא מוד; הטבלה למעלה אומרת אותו דבר במספרים.';

  @override
  String get impulseDecayByOctave => 'דעיכה לפי אוקטבות';

  @override
  String get impulseMidNoT20 => 'הפסים האמצעיים לא דעכו מספיק בשביל T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'אמצע 125–500 Hz: T20 $seconds שנ׳ — זה ה־RT60 שהתכנון משתמש בו.';
  }

  @override
  String get impulseDecayHelp =>
      'בבסים RT60 מטלפון הוא יותר הערכה: רעש הרקע שם הכי קרוב, ו־״—״ אומר שההדהוד לא ירד מתחתיו. C50 מעל אפס: הצליל הישיר עם ההחזרות המוקדמות נושא יותר אנרגיה מההדהוד.';

  @override
  String get impulseResult => 'תוצאה';

  @override
  String get impulseDirectArrived => 'הצליל הישיר הגיע אחרי';

  @override
  String get impulseDirectArrivedHelp =>
      'השהיית ניגון ועוד זמן מעבר — לבד זה לא אומר כלום, אבל ההפרש בין הרמקול השמאלי לימני כן.';

  @override
  String get impulseFirstReflection => 'החזרה ראשונה';

  @override
  String get impulseNotFound => 'לא נמצאה';

  @override
  String impulseAfterDirect(String time) {
    return '$time אחרי הצליל הישיר';
  }

  @override
  String get impulseNoReflectionHelp =>
      'או שאין בכלל, או שהיא מסתתרת בצלצול של ההלם הישיר.';

  @override
  String impulseExtraPath(String metres) {
    return 'מסלול נוסף ≈ $metres מ׳.';
  }

  @override
  String get impulseUnmeasurable => 'לא ניתן למדידה';

  @override
  String get impulseRt60NoiseHelp =>
      'ההדהוד לא ירד מספיק עמוק מעל רצפת הרעש — חזק יותר, או ברגע שקט יותר.';

  @override
  String get impulseRt60Help => 'ההפרש בין T20 ל־T30 רומז עד כמה הדעיכה נקייה.';

  @override
  String get impulseGating => 'חלון (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'תקף מעל $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'מתחת לזה החלון לא רואה אפילו מחזור אחד — העקומה שם היא תוצר של החלון, לא של החדר.';

  @override
  String get impulseSchroeder => 'עקומת הדעיכה של שרדר';

  @override
  String impulseHdAt(int order) {
    return 'HD$order ב־100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'ההרמוניות נמצאות בזמן השלילי של הדקונבולוציה של Farina; כאן קוראים אותן משם במקום לזרוק. −40 dB זה 1 %.';

  @override
  String get impulseHd3Help => 'ההרמונית השלישית גדלה בעומס מהר יותר מהשנייה.';

  @override
  String get impulseDistortionHot => 'עיוות מעל −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'או שה־sweep חזק מדי, או שהרמקול בקצה גבולו. זנב עיוות נראה בהלם כמו החזרה — הנמך את העוצמה ומדוד שוב לפני שאתה מאמין למשהו.';

  @override
  String get eqMeasured => 'נמדד';

  @override
  String get eqTarget => 'יעד';

  @override
  String get eqPredicted => 'תחזית אחרי EQ';

  @override
  String get eqMeasuredAfter => 'נמדד אחרי EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'סטייה מהיעד 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'אחרי הזנה במקלט';

  @override
  String get eqPredictionVsReality => 'תחזית מול מציאות';

  @override
  String eqStubborn(String bands) {
    return 'יישאר רחוק מהיעד יותר מ־6 dB: $bands. זו התאבכות, לא חוסר הספק — פותרים בהזזת הרמקול או המאזין, לא בהגברה נוספת.';
  }

  @override
  String get eqModelOk => 'המסנן של המקלט מתנהג בערך כמו המודל.';

  @override
  String get eqModelOff =>
      'המסנן האמיתי של המקלט שונה מהמודל יותר מהצפוי — הפסים שלו כנראה רחבים או צרים יותר ממה שמונח כאן.';

  @override
  String get eqTargetCurve => 'עקומת יעד';

  @override
  String get eqFlat => 'שטוחה';

  @override
  String get eqTargetHelp =>
      'לא שטוחה: מעל כמה kHz האוזן שומעת את הצליל הישיר, המיקרופון מסכם גם את ההחזרות, ועקומה נמדדת שיושרה נשמעת עמומה. נטייה עדינה למעלה וקצת בס למטה — זה מה שאנשים בוחרים בהאזנה עיוורת.';

  @override
  String get eqBassLift => 'הגברת בס';

  @override
  String get eqBassBelow => 'בס מתחת ל־';

  @override
  String get eqTilt => 'נטייה';

  @override
  String get eqDbPerOctave => 'dB/אוק׳';

  @override
  String get eqTiltFrom => 'נטייה החל מ־';

  @override
  String get errorMicPermission =>
      'בלי גישה למיקרופון אי אפשר למדוד. אפשר אותה ב״הגדרות״ ← AudioScanner ← ״מיקרופון״.';

  @override
  String errorMic(String error) {
    return 'מיקרופון: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'לא ניתן להפעיל את המיקרופון: $error';
  }

  @override
  String get errorNoArkit =>
      'המכשיר הזה לא תומך ב־ARKit world tracking — אי אפשר למקם נקודות במרחב.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'ההקלטה קצרה מה־sweep ($recorded שנ׳ מתוך $expected שנ׳). התחל להקליט לפני שאתה מנגן את האות.';
  }

  @override
  String get sessionSnapshots => 'תמונות מצב';

  @override
  String get errorTrackingUnreliable =>
      'מעקב המיקום לא אמין — הנקודה תיפול במקום אחר מזה שבו אתה עומד.';

  @override
  String errorNoSound(int seconds) {
    return 'לא הגיע שום צליל תוך $seconds שנ׳.';
  }

  @override
  String get noteSnapshotNoPose => 'תמונת מצב מהמנתח, ללא מיקום';

  @override
  String get sessionChannels => 'ערוצים';

  @override
  String get trackingOk => 'מעקב תקין';

  @override
  String get trackingLimited => 'מעקב חלש';

  @override
  String get trackingUnavailable => 'אין מעקב';

  @override
  String get poseHintFeatures =>
      'מעט מדי פרטים בתמונה — כוון את הטלפון למשהו עם מרקם, לא לקיר חלק.';

  @override
  String get poseHintMotion => 'תנועה מהירה מדי — לך לאט יותר.';

  @override
  String get poseHintLight =>
      'מעט מדי אור — הדלק אור, המצלמה לא רואה איפה היא.';

  @override
  String get poseHintInitializing => 'ARKit מתחיל לפעול, זוז קצת.';

  @override
  String get poseHintRelocalizing =>
      'מחפש שוב את הנקודה המקורית — חזור למקום שבו התחלת.';

  @override
  String get signalPhonePink => 'רעש ורוד מהטלפון';

  @override
  String get signalExternalPink => 'רעש ורוד מהרמקולים';

  @override
  String get signalExternalSweep => 'Sweep מהרמקולים';

  @override
  String get captureWarningBluetooth =>
      'מיקרופון Bluetooth: דחיסה והשהיה הורסות את המדידה. נתק את האוזניות ומדוד במיקרופון המובנה.';

  @override
  String get captureWarningProcessing =>
      'המערכת לא כיבתה את עיבוד האות (AGC / דיכוי רעש). ההפרשים הנמדדים בין מקומות יהיו מעוותים.';

  @override
  String get captureWarningMeasurementMode =>
      'לא ניתן להפעיל את measurement mode — למיקרופון יש תיקון תגובת תדר משלו.';

  @override
  String get captureRouteUnknown => 'לא ידוע';

  @override
  String get axisLength => 'אורך';

  @override
  String get axisWidth => 'רוחב';

  @override
  String get axisHeight => 'גובה';
}
