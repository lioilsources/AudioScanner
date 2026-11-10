// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get tabScan => 'Скан';

  @override
  String get tabMap => 'Мапа';

  @override
  String get tabResponse => 'Відгук';

  @override
  String get tabDesign => 'Проєкт';

  @override
  String get tabSignals => 'Сигнали';

  @override
  String get rtaSnapshotFailed => 'Знімок не збережено.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Збережено як точку $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Збережено як точку $id (без позиції).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count точки',
      many: '$count точок',
      few: '$count точки',
      one: '$count точка',
    );
    return 'Калібрування $name: $_temp0, $min … $max дБ';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Не вдається прочитати файл: $message';
  }

  @override
  String get rtaOffsetTitle => 'Зсув дБ SPL';

  @override
  String get rtaOffsetHelp =>
      'Увімкни тон 1 кГц, зніми рівень із шумоміра та введи різницю з тим, що показує аналізатор. З ненульовим зсувом рівні позначаються як оцінка SPL; без нього лишаються в dBFS.';

  @override
  String get commonReset => 'Скинути';

  @override
  String get commonCancel => 'Скасувати';

  @override
  String get commonSave => 'Зберегти';

  @override
  String get commonStop => 'Зупинити';

  @override
  String get commonStartMic => 'Увімкнути мікрофон';

  @override
  String get tabAnalyzer => 'Аналізатор';

  @override
  String get rtaUnfreeze => 'Продовжити';

  @override
  String get rtaFreeze => 'Заморозити';

  @override
  String get rtaPeakHold => 'Утримання піків';

  @override
  String get rtaMaxMinTraces => 'Криві макс. / мін.';

  @override
  String get rtaResetTraces => 'Скинути криві';

  @override
  String get rtaSaveAsPoint => 'Зберегти як точку (3 с)';

  @override
  String get rtaMicCalibration => 'Калібрування мікрофона…';

  @override
  String get rtaRemoveCalibration => 'Видалити калібрування';

  @override
  String get rtaOffsetMenu => 'Зсув дБ SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Гц · без обробки сигналу';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count точки',
      many: '$count точок',
      few: '$count точки',
      one: '$count точка',
    );
    return 'Калібрування $name: $_temp0, корекція $min … $max дБ';
  }

  @override
  String get rtaSplEstimate => 'дБ SPL (оцінка)';

  @override
  String get rtaFrozenHint =>
      'Заморожено — мікрофон працює далі, просто не малюється.';

  @override
  String get rtaRelativeHint =>
      'Рівні відносні (dBFS). Контур з\'явиться, коли збережеш першу точку — вона буде опорною для решти.';

  @override
  String get rtaReferenceHint =>
      'Суцільні стовпці = тут. Контур = опорна точка.';

  @override
  String get rtaEnvelopeHint =>
      'Червоний = макс., зелений = мін. від скидання.';

  @override
  String get rtaMicStopped => 'мікрофон зупинено';

  @override
  String get rtaSilence => 'тиша — чи грає сигнал?';

  @override
  String get rtaPlaceholder => 'Увімкни мікрофон і подай у кімнату сигнал.';

  @override
  String rtaBandsInfo(int count) {
    return 'Третьоктавних смуг: $count, 20 Гц – 20 кГц';
  }

  @override
  String get scanTitle => 'Скан кімнати';

  @override
  String scanPointCount(int count) {
    return '$count т.';
  }

  @override
  String get commonMicNotRunning => 'Мікрофон не працює';

  @override
  String get scanMicNeeded => 'Без нього вимірюється лише позиція, а не звук.';

  @override
  String get scanContinuous => 'Безперервне вимірювання';

  @override
  String get scanContinuousHint => 'Точка автоматично кожні 0,5 м ходу';

  @override
  String get scanMeasuring => 'Вимірюю…';

  @override
  String get scanMeasureHere => 'Виміряти тут';

  @override
  String scanPointSaved(String id, String position) {
    return 'Точку $id збережено в $position';
  }

  @override
  String get scanStartTracking => 'Увімкнути відстеження позиції';

  @override
  String get scanStartTrackingHint =>
      'ARKit — так застосунок знає, де ти стоїш у кімнаті.';

  @override
  String scanPosition(String position) {
    return 'Позиція: $position м від початку координат';
  }

  @override
  String get scanSetOriginHint =>
      'Стань на місце слухача й задай початок координат.';

  @override
  String get scanOriginHere => 'Початок координат тут';

  @override
  String get scanNoPoints => 'Поки що жодної точки.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'розкид 40–300 Гц: $variation дБ · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Вітальня';

  @override
  String get scanNewMeasurement => 'Нове вимірювання';

  @override
  String get scanRoomName => 'Назва кімнати';

  @override
  String get scanExcitation => 'Чим збуджуватимеш кімнату';

  @override
  String get scanPhoneNoiseHint =>
      'Лише орієнтовно — динамік телефона баси взагалі не відтворює.';

  @override
  String get scanStart => 'Почати';

  @override
  String get mapExportTooltip => 'Експорт FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Для мапи потрібно щонайменше дві точки. Пройди кімнатою, вимірюючи дорогою.';

  @override
  String get mapShareText =>
      'FRD за точками (імпорт у REW / VituixCAD) і вся сесія в JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Найрівніше місце: $id у $position м (розкид $variation дБ у 40–300 Гц)';
  }

  @override
  String get signalsSweepHelp =>
      'Єдиний сигнал, з якого можна обчислити імпульсну характеристику, час реверберації та перші відбиття. Відтвори його з комп\'ютера чи ЦАПа через колонки, а телефон хай записує.';

  @override
  String get signalsLength => 'Тривалість';

  @override
  String get signalsFrom => 'Від';

  @override
  String get signalsTo => 'До';

  @override
  String get signalsMonoNoChannel => 'Моно (без каналу)';

  @override
  String get signalsExportWav => 'Експорт WAV';

  @override
  String get signalsPinkNoise => 'Рожевий шум';

  @override
  String get signalsPinkHelp =>
      'Однакова енергія в кожній октаві. Дає лише АЧХ, без часу й відбиттів — для швидкого «тут щось відбувається?» вистачить.';

  @override
  String get signalsExportPink => 'Експорт WAV 30 с';

  @override
  String get signalsHowTo => 'Як вимірювати';

  @override
  String get signalsStep1 =>
      'Відтворюй сигнал із комп\'ютера через колонки, а не з телефона.';

  @override
  String get signalsStep2 =>
      'Встанови гучність так, щоб аналізатор показував близько −20 dBFS. Перевантаження виглядає як відбиття.';

  @override
  String get signalsStep3 =>
      'Тримай телефон вертикально на витягнутій руці, мікрофоном до колонок.';

  @override
  String get signalsStep4 =>
      'Від\'єднай Bluetooth-навушники — стиснення й затримка псують вимірювання.';

  @override
  String get signalsNoteMono =>
      'Моно одразу в обидві колонки сумує L і R, і їхня різниця зникає в сумі. Для вимірювання каналів вибери канал.';

  @override
  String get signalsNoteStereo =>
      'Стереофайл із сигналом лише в одному каналі — його відтворить усе, що грає стерео.';

  @override
  String get signalsNoteChannel =>
      'Монофайл із назвою каналу. Спрямуй його на потрібний вхід ресивера з DAW або через багатоканальний вхід; ноутбук зі стереовиходом на цей канал його не виведе.';

  @override
  String get channelsTitle => 'Вимірювання каналів';

  @override
  String get channelsHelp =>
      'Стань на місце слухача. Для кожного каналу: почни запис, подай на нього sweep із вкладки «Сигнали», натисни «Готово». Без цих точок проєкту нема з чого обчислити EQ і рівні.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds с';
  }

  @override
  String get channelsVerifyAfterEq => 'Перевірка після введення EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Точку буде збережено як «після EQ», і вона не перезапише ту, з якої рахувався EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Запис $seconds с — зараз увімкни sweep';
  }

  @override
  String get channelsNotMeasured => 'не виміряно';

  @override
  String get channelsMeasuredNoise => 'виміряно шумом';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · прямий звук через $ms мс';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · прямий звук через $ms мс, T20 $t20 с';
  }

  @override
  String get commonDone => 'Готово';

  @override
  String get channelsMeasure => 'Виміряти';

  @override
  String get channelsAdd => 'Додати';

  @override
  String get channelsAgain => 'Знову';

  @override
  String get compareTitle => 'Порівняння';

  @override
  String get compareNeedsTwoPoints =>
      'Для порівняння потрібно щонайменше дві точки.';

  @override
  String get commonWithRoom => 'з кімнатою';

  @override
  String get commonDirectSound => 'прямий звук';

  @override
  String get compareAfterEq => 'після EQ';

  @override
  String get compareBandsA => 'A (смуги)';

  @override
  String get compareBandsB => 'B (смуги)';

  @override
  String get compareArrivalDiff => 'Різниця приходу A − B';

  @override
  String get compareBroadbandDiff => 'Широкосмуговий рівень A − B';

  @override
  String get compareWorstBelow300 => 'Найбільша різниця нижче 300 Гц';

  @override
  String compareWorstValue(String db, String band) {
    return '$db дБ у смузі $band Гц';
  }

  @override
  String get compareTrimNote =>
      'Distance і level trim вирівнюють різницю приходу й рівня. Різницю форми нижче 300 Гц вони не вирівняють — її створює інша стіна на іншій відстані, і розв\'язується вона переставлянням.';

  @override
  String get designRt60Live => 'T20 125–500 Гц з останнього відгуку';

  @override
  String get designRt60Stored => 'T20 125–500 Гц зі збереженого sweep';

  @override
  String get designRt60Guess =>
      'оцінка — виміряй sweep, Schroeder поки лише підказка';

  @override
  String get designExportTooltip => 'Експорт конфігурації';

  @override
  String get designCompute => 'Обчислити проєкт';

  @override
  String get designLidarChecking => 'Перевіряю, чи є LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR доступний';

  @override
  String get designLidarMissing => 'Без LiDAR — введи розміри вручну';

  @override
  String get designLidarHint =>
      'Скан дає стіни з точністю до сантиметра, тож правильні й точки відбиттів, і відстані до меж, а не лише моди.';

  @override
  String get designManualHint =>
      'Модальному розрахунку потрібні лише три числа — але точки відбиттів і точні відстані до стін ти втратиш.';

  @override
  String get designStopScan => 'Завершити скан';

  @override
  String get designScanRoom => 'Сканувати кімнату';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls стіни',
      many: '$walls стін',
      few: '$walls стіни',
      one: '$walls стіна',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings прорізу',
      many: '$openings прорізів',
      few: '$openings прорізи',
      one: '$openings проріз',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Розміри кімнати';

  @override
  String get designLength => 'Довжина';

  @override
  String get designWidth => 'Ширина';

  @override
  String get designHeight => 'Висота';

  @override
  String get designWhatToDo => 'Що з цим робити';

  @override
  String get designRoomModes => 'Моди кімнати';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Вище $schroeder Гц (Schroeder) окремі моди вже не мають сенсу. RT60 $rt60 с: $source.';
  }

  @override
  String get designEqTitle => 'EQ: виміряно, ціль, прогноз';

  @override
  String get designEqHelp =>
      'Прогноз — це виміряний відгук плюс модель п\'ятнадцяти смуг ресивера. Після введення EQ виміряй канал знову з перемикачем «після EQ», щоб побачити, наскільки точною була модель.';

  @override
  String get designReceiverConfig => 'Конфігурація ресивера';

  @override
  String get designGeometryOnly =>
      'Без вимірювань каналів sweep-ом тут лише геометрія: відстані й частоти розділу. EQ і рівні з\'являться, коли будуть точки для кожного каналу.';

  @override
  String get designShareSubject => 'Проєкт конфігурації';

  @override
  String get impulseTitle => 'Імпульсна характеристика';

  @override
  String get impulseCompareTooltip => 'Порівняти точки';

  @override
  String get impulseExportTooltip => 'Експорт FRD з фазою';

  @override
  String get impulseTapToStart => 'Торкнись, щоб увімкнути.';

  @override
  String get impulseSweepTitle => 'Sweep, який ти подаєш на колонки';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Гц, $seconds с. Має збігатися з тим, що ти відтворюєш, — інакше деконволюція видасть нісенітницю.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Запис — $seconds с';
  }

  @override
  String get impulsePlaySweepNow => 'Тепер увімкни sweep із комп\'ютера.';

  @override
  String get impulseStartRecording => 'Почати запис, потім увімкнути sweep';

  @override
  String get impulseFrequencyResponse => 'АЧХ';

  @override
  String get impulseWithRoom => 'з кімнатою (1 с)';

  @override
  String impulseDirectWindow(String ms) {
    return 'прямий звук (вікно $ms мс)';
  }

  @override
  String get impulseWindow => 'Вікно';

  @override
  String impulseWindowHelp(String hz) {
    return 'Довше вікно бачить нижче (зараз дійсне вище $hz Гц), але впускає перше відбиття. Нижче межі крива не згладжується й не коментується: це вікно, а не кімната.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'До першого відбиття ($ms мс)';
  }

  @override
  String get impulseTime => 'Час';

  @override
  String get impulseImpulse => 'імпульс';

  @override
  String get impulseTimeHelp =>
      'Синім — вікно, помаранчева лінія — перше знайдене відбиття. Нульовий час — прямий звук.';

  @override
  String get impulseSpectrogram => 'Спектрограма';

  @override
  String get commonHide => 'Сховати';

  @override
  String get commonShow => 'Показати';

  @override
  String get impulseSpectrogramHelp =>
      'Час у мс від прямого звуку, частота вгору, колір — рівень до −60 дБ. Горизонтальна смуга, що переживає решту, — це мода; таблиця вище каже те саме числом.';

  @override
  String get impulseDecayByOctave => 'Згасання за октавами';

  @override
  String get impulseMidNoT20 => 'Середні смуги не згасли достатньо для T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Середина 125–500 Гц: T20 $seconds с — це RT60, з яким рахує проєкт.';
  }

  @override
  String get impulseDecayHelp =>
      'У басах RT60 з телефона — радше оцінка: фоновий шум там найближче, а «—» означає, що реверберація не опустилася нижче нього. C50 вище нуля: прямий звук із ранніми відбиттями несе більше енергії, ніж реверберація.';

  @override
  String get impulseResult => 'Результат';

  @override
  String get impulseDirectArrived => 'Прямий звук прийшов через';

  @override
  String get impulseDirectArrivedHelp =>
      'Затримка відтворення плюс час прольоту — саме по собі нічого не каже, а от різниця між лівою і правою колонкою — каже.';

  @override
  String get impulseFirstReflection => 'Перше відбиття';

  @override
  String get impulseNotFound => 'не знайдено';

  @override
  String impulseAfterDirect(String time) {
    return '$time після прямого звуку';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Або його немає, або воно сховалося в дзвоні прямого імпульсу.';

  @override
  String impulseExtraPath(String metres) {
    return 'Додатковий шлях ≈ $metres м.';
  }

  @override
  String get impulseUnmeasurable => 'не вимірюється';

  @override
  String get impulseRt60NoiseHelp =>
      'Реверберація не опустилася достатньо глибоко над рівнем шуму — гучніше або в тихішу хвилину.';

  @override
  String get impulseRt60Help =>
      'Різниця між T20 і T30 підказує, наскільки чисте згасання.';

  @override
  String get impulseGating => 'Вікно (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'дійсне вище $hz Гц';
  }

  @override
  String get impulseGatingHelp =>
      'Нижче цього вікно не бачить жодного періоду — крива там артефакт вікна, а не кімнати.';

  @override
  String get impulseSchroeder => 'Крива згасання Шредера';

  @override
  String impulseHdAt(int order) {
    return 'HD$order на 100 Гц / 1 кГц';
  }

  @override
  String get impulseHd2Help =>
      'Гармоніки лежать у від\'ємному часі деконволюції Фаріни; тут їх звідти читають, а не відкидають. −40 дБ — це 1 %.';

  @override
  String get impulseHd3Help =>
      'Третя гармоніка зростає з перевантаженням швидше за другу.';

  @override
  String get impulseDistortionHot => 'Спотворення вище −30 дБ';

  @override
  String get impulseDistortionHotHelp =>
      'Або sweep надто гучний, або колонка на межі. Хвіст спотворень виглядає в імпульсі як відбиття — зменш гучність і виміряй знову, перш ніж чомусь вірити.';

  @override
  String get eqMeasured => 'виміряно';

  @override
  String get eqTarget => 'ціль';

  @override
  String get eqPredicted => 'прогноз після EQ';

  @override
  String get eqMeasuredAfter => 'виміряно після EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Відхилення від цілі 40–$maxHz Гц';
  }

  @override
  String get eqAfterEntering => 'Після введення в ресивер';

  @override
  String get eqPredictionVsReality => 'Прогноз і реальність';

  @override
  String eqStubborn(String bands) {
    return 'Лишиться далі ніж 6 дБ від цілі: $bands. Це інтерференція, а не брак потужності — розв\'язується переставлянням колонки чи слухача, а не додатковим підйомом.';
  }

  @override
  String get eqModelOk => 'Фільтр ресивера поводиться приблизно як модель.';

  @override
  String get eqModelOff =>
      'Справжній фільтр ресивера відрізняється від моделі більше, ніж очікувалося, — його смуги, мабуть, ширші або вужчі, ніж тут припускається.';

  @override
  String get eqTargetCurve => 'Цільова крива';

  @override
  String get eqFlat => 'пласка';

  @override
  String get eqTargetHelp =>
      'Не пласка: вище кількох кГц вухо чує прямий звук, мікрофон сумує й відбиття, і вирівняна виміряна крива звучить глухо. Легкий спад угорі й трохи басу внизу — ось що обирають люди під час сліпого прослуховування.';

  @override
  String get eqBassLift => 'Підйом басів';

  @override
  String get eqBassBelow => 'Баси нижче';

  @override
  String get eqTilt => 'Нахил';

  @override
  String get eqDbPerOctave => 'дБ/окт';

  @override
  String get eqTiltFrom => 'Нахил від';

  @override
  String get errorMicPermission =>
      'Без доступу до мікрофона вимірювати неможливо. Дозволь його в «Параметри» → AudioScanner → «Мікрофон».';

  @override
  String errorMic(String error) {
    return 'Мікрофон: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Не вдалося увімкнути мікрофон: $error';
  }

  @override
  String get errorNoArkit =>
      'Цей пристрій не підтримує ARKit world tracking — точки не можна розміщувати в просторі.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Запис коротший за sweep ($recorded с з $expected с). Почни запис, перш ніж увімкнеш сигнал.';
  }

  @override
  String get sessionSnapshots => 'Знімки';

  @override
  String get errorTrackingUnreliable =>
      'Відстеження позиції ненадійне — точка опиниться не там, де ти стоїш.';

  @override
  String errorNoSound(int seconds) {
    return 'За $seconds с не надійшло жодного звуку.';
  }

  @override
  String get noteSnapshotNoPose => 'знімок з аналізатора, без позиції';

  @override
  String get sessionChannels => 'Канали';

  @override
  String get trackingOk => 'Відстеження OK';

  @override
  String get trackingLimited => 'Слабке відстеження';

  @override
  String get trackingUnavailable => 'Немає відстеження';

  @override
  String get poseHintFeatures =>
      'Замало деталей у кадрі — наведи телефон на щось фактурне, а не на голу стіну.';

  @override
  String get poseHintMotion => 'Надто швидкий рух — іди повільніше.';

  @override
  String get poseHintLight =>
      'Замало світла — увімкни світло, камера не бачить, де вона.';

  @override
  String get poseHintInitializing => 'ARKit запускається, трохи порухайся.';

  @override
  String get poseHintRelocalizing =>
      'Шукаю початкову точку — повернися туди, звідки починав.';

  @override
  String get signalPhonePink => 'Рожевий шум із телефона';

  @override
  String get signalExternalPink => 'Рожевий шум із колонок';

  @override
  String get signalExternalSweep => 'Sweep із колонок';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth-мікрофон: стиснення й затримка псують вимірювання. Від\'єднай навушники й вимірюй вбудованим мікрофоном.';

  @override
  String get captureWarningProcessing =>
      'Система не вимкнула обробку сигналу (АРП / шумозаглушення). Виміряні різниці між точками будуть спотворені.';

  @override
  String get captureWarningMeasurementMode =>
      'Не вдалося увімкнути measurement mode — мікрофон має власну корекцію АЧХ.';

  @override
  String get captureRouteUnknown => 'невідомо';

  @override
  String get axisLength => 'довжина';

  @override
  String get axisWidth => 'ширина';

  @override
  String get axisHeight => 'висота';
}
