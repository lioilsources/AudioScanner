// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get tabScan => 'Скан';

  @override
  String get tabMap => 'Карта';

  @override
  String get tabResponse => 'Отклик';

  @override
  String get tabDesign => 'Проект';

  @override
  String get tabSignals => 'Сигналы';

  @override
  String get rtaSnapshotFailed => 'Снимок не сохранён.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Сохранено как точка $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Сохранено как точка $id (без позиции).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count точки',
      many: '$count точек',
      few: '$count точки',
      one: '$count точка',
    );
    return 'Калибровка $name: $_temp0, $min … $max дБ';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Не удаётся прочитать файл: $message';
  }

  @override
  String get rtaOffsetTitle => 'Смещение дБ SPL';

  @override
  String get rtaOffsetHelp =>
      'Включи тон 1 кГц, сними уровень с шумомера и введи разницу с тем, что показывает анализатор. При ненулевом смещении уровни помечаются как оценка SPL; без него остаются в dBFS.';

  @override
  String get commonReset => 'Сбросить';

  @override
  String get commonCancel => 'Отмена';

  @override
  String get commonSave => 'Сохранить';

  @override
  String get commonStop => 'Остановить';

  @override
  String get commonStartMic => 'Включить микрофон';

  @override
  String get tabAnalyzer => 'Анализатор';

  @override
  String get rtaUnfreeze => 'Продолжить';

  @override
  String get rtaFreeze => 'Заморозить';

  @override
  String get rtaPeakHold => 'Удержание пиков';

  @override
  String get rtaMaxMinTraces => 'Кривые макс. / мин.';

  @override
  String get rtaResetTraces => 'Сбросить кривые';

  @override
  String get rtaSaveAsPoint => 'Сохранить как точку (3 с)';

  @override
  String get rtaMicCalibration => 'Калибровка микрофона…';

  @override
  String get rtaRemoveCalibration => 'Удалить калибровку';

  @override
  String get rtaOffsetMenu => 'Смещение дБ SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Гц · без обработки сигнала';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count точки',
      many: '$count точек',
      few: '$count точки',
      one: '$count точка',
    );
    return 'Калибровка $name: $_temp0, коррекция $min … $max дБ';
  }

  @override
  String get rtaSplEstimate => 'дБ SPL (оценка)';

  @override
  String get rtaFrozenHint =>
      'Заморожено — микрофон продолжает работать, просто не рисуется.';

  @override
  String get rtaRelativeHint =>
      'Уровни относительные (dBFS). Контур появится, когда ты сохранишь первую точку — она будет опорной для остальных.';

  @override
  String get rtaReferenceHint =>
      'Сплошные столбцы = здесь. Контур = опорная точка.';

  @override
  String get rtaEnvelopeHint =>
      'Красный = макс., зелёный = мин. с момента сброса.';

  @override
  String get rtaMicStopped => 'микрофон остановлен';

  @override
  String get rtaSilence => 'тишина — играет ли сигнал?';

  @override
  String get rtaPlaceholder => 'Включи микрофон и подай в комнату сигнал.';

  @override
  String rtaBandsInfo(int count) {
    return 'Третьоктавных полос: $count, 20 Гц – 20 кГц';
  }

  @override
  String get scanTitle => 'Скан комнаты';

  @override
  String scanPointCount(int count) {
    return '$count т.';
  }

  @override
  String get commonMicNotRunning => 'Микрофон не работает';

  @override
  String get scanMicNeeded => 'Без него измеряется только позиция, а не звук.';

  @override
  String get scanContinuous => 'Непрерывное измерение';

  @override
  String get scanContinuousHint => 'Точка автоматически каждые 0,5 м пути';

  @override
  String get scanMeasuring => 'Измеряю…';

  @override
  String get scanMeasureHere => 'Измерить здесь';

  @override
  String scanPointSaved(String id, String position) {
    return 'Точка $id сохранена в $position';
  }

  @override
  String get scanStartTracking => 'Включить отслеживание позиции';

  @override
  String get scanStartTrackingHint =>
      'ARKit — так приложение знает, где ты стоишь в комнате.';

  @override
  String scanPosition(String position) {
    return 'Позиция: $position м от начала координат';
  }

  @override
  String get scanSetOriginHint =>
      'Встань на место слушателя и задай начало координат.';

  @override
  String get scanOriginHere => 'Начало координат здесь';

  @override
  String get scanNoPoints => 'Пока нет ни одной точки.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'разброс 40–300 Гц: $variation дБ · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Гостиная';

  @override
  String get scanNewMeasurement => 'Новое измерение';

  @override
  String get scanRoomName => 'Название комнаты';

  @override
  String get scanExcitation => 'Чем будешь возбуждать комнату';

  @override
  String get scanPhoneNoiseHint =>
      'Только ориентировочно — динамик телефона басы вообще не воспроизводит.';

  @override
  String get scanStart => 'Начать';

  @override
  String get mapExportTooltip => 'Экспорт FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Для карты нужно хотя бы две точки. Пройди по комнате, измеряя по ходу.';

  @override
  String get mapShareText =>
      'FRD по точкам (импорт в REW / VituixCAD) и вся сессия в JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Самое ровное место: $id в $position м (разброс $variation дБ в 40–300 Гц)';
  }

  @override
  String get signalsSweepHelp =>
      'Единственный сигнал, по которому можно рассчитать импульсную характеристику, время реверберации и первые отражения. Воспроизведи его с компьютера или ЦАПа через колонки, а телефон пусть записывает.';

  @override
  String get signalsLength => 'Длина';

  @override
  String get signalsFrom => 'От';

  @override
  String get signalsTo => 'До';

  @override
  String get signalsMonoNoChannel => 'Моно (без канала)';

  @override
  String get signalsExportWav => 'Экспорт WAV';

  @override
  String get signalsPinkNoise => 'Розовый шум';

  @override
  String get signalsPinkHelp =>
      'Одинаковая энергия в каждой октаве. Даёт только АЧХ, без времени и отражений — для быстрого «тут что-то происходит?» хватит.';

  @override
  String get signalsExportPink => 'Экспорт WAV 30 с';

  @override
  String get signalsHowTo => 'Как измерять';

  @override
  String get signalsStep1 =>
      'Воспроизводи сигнал с компьютера через колонки, а не с телефона.';

  @override
  String get signalsStep2 =>
      'Установи громкость так, чтобы анализатор показывал около −20 dBFS. Перегрузка выглядит как отражение.';

  @override
  String get signalsStep3 =>
      'Держи телефон вертикально на вытянутой руке, микрофоном к колонкам.';

  @override
  String get signalsStep4 =>
      'Отключи Bluetooth-наушники — сжатие и задержка портят измерение.';

  @override
  String get signalsNoteMono =>
      'Моно сразу в обе колонки суммирует L и R, и их разница исчезает в сумме. Для измерения каналов выбери канал.';

  @override
  String get signalsNoteStereo =>
      'Стереофайл с сигналом только в одном канале — его воспроизведёт всё, что играет стерео.';

  @override
  String get signalsNoteChannel =>
      'Монофайл с названием канала. Направь его на нужный вход ресивера из DAW или через многоканальный вход; ноутбук со стереовыходом на этот канал его не выведет.';

  @override
  String get channelsTitle => 'Измерение каналов';

  @override
  String get channelsHelp =>
      'Встань на место слушателя. Для каждого канала: начни запись, подай на него sweep со вкладки «Сигналы», нажми «Готово». Без этих точек проекту не из чего рассчитать EQ и уровни.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds с';
  }

  @override
  String get channelsVerifyAfterEq => 'Проверка после ввода EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Точка сохранится как «после EQ» и не перезапишет ту, по которой считался EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Запись $seconds с — сейчас включи sweep';
  }

  @override
  String get channelsNotMeasured => 'не измерено';

  @override
  String get channelsMeasuredNoise => 'измерено шумом';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · прямой звук через $ms мс';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · прямой звук через $ms мс, T20 $t20 с';
  }

  @override
  String get commonDone => 'Готово';

  @override
  String get channelsMeasure => 'Измерить';

  @override
  String get channelsAdd => 'Добавить';

  @override
  String get channelsAgain => 'Заново';

  @override
  String get compareTitle => 'Сравнение';

  @override
  String get compareNeedsTwoPoints => 'Для сравнения нужно хотя бы две точки.';

  @override
  String get commonWithRoom => 'с комнатой';

  @override
  String get commonDirectSound => 'прямой звук';

  @override
  String get compareAfterEq => 'после EQ';

  @override
  String get compareBandsA => 'A (полосы)';

  @override
  String get compareBandsB => 'B (полосы)';

  @override
  String get compareArrivalDiff => 'Разница прихода A − B';

  @override
  String get compareBroadbandDiff => 'Широкополосный уровень A − B';

  @override
  String get compareWorstBelow300 => 'Наибольшая разница ниже 300 Гц';

  @override
  String compareWorstValue(String db, String band) {
    return '$db дБ в полосе $band Гц';
  }

  @override
  String get compareTrimNote =>
      'Distance и level trim выравнивают разницу прихода и уровня. Разницу формы ниже 300 Гц они не выровняют — её создаёт другая стена на другом расстоянии, и решается она перестановкой.';

  @override
  String get designRt60Live => 'T20 125–500 Гц из последнего отклика';

  @override
  String get designRt60Stored => 'T20 125–500 Гц из сохранённого sweep';

  @override
  String get designRt60Guess =>
      'оценка — измерь sweep, Schroeder пока лишь подсказка';

  @override
  String get designExportTooltip => 'Экспорт конфигурации';

  @override
  String get designCompute => 'Рассчитать проект';

  @override
  String get designLidarChecking => 'Проверяю, есть ли LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR доступен';

  @override
  String get designLidarMissing => 'Нет LiDAR — введи размеры вручную';

  @override
  String get designLidarHint =>
      'Скан даёт стены с точностью до сантиметра, поэтому верны и точки отражений, и расстояния до границ, а не только моды.';

  @override
  String get designManualHint =>
      'Модальному расчёту нужны всего три числа — но точки отражений и точные расстояния до стен ты потеряешь.';

  @override
  String get designStopScan => 'Завершить скан';

  @override
  String get designScanRoom => 'Сканировать комнату';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls стены',
      many: '$walls стен',
      few: '$walls стены',
      one: '$walls стена',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings проёма',
      many: '$openings проёмов',
      few: '$openings проёма',
      one: '$openings проём',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Размеры комнаты';

  @override
  String get designLength => 'Длина';

  @override
  String get designWidth => 'Ширина';

  @override
  String get designHeight => 'Высота';

  @override
  String get designWhatToDo => 'Что с этим делать';

  @override
  String get designRoomModes => 'Моды комнаты';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Выше $schroeder Гц (Schroeder) отдельные моды уже не имеют смысла. RT60 $rt60 с: $source.';
  }

  @override
  String get designEqTitle => 'EQ: измерено, цель, прогноз';

  @override
  String get designEqHelp =>
      'Прогноз — это измеренный отклик плюс модель пятнадцати полос ресивера. После ввода EQ измерь канал снова с переключателем «после EQ», чтобы увидеть, насколько точной была модель.';

  @override
  String get designReceiverConfig => 'Конфигурация ресивера';

  @override
  String get designGeometryOnly =>
      'Без измерений каналов sweep-ом здесь только геометрия: расстояния и частоты раздела. EQ и уровни появятся, когда будут точки по каждому каналу.';

  @override
  String get designShareSubject => 'Проект конфигурации';

  @override
  String get impulseTitle => 'Импульсная характеристика';

  @override
  String get impulseCompareTooltip => 'Сравнить точки';

  @override
  String get impulseExportTooltip => 'Экспорт FRD с фазой';

  @override
  String get impulseTapToStart => 'Нажми, чтобы включить.';

  @override
  String get impulseSweepTitle => 'Sweep, который ты подаёшь на колонки';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Гц, $seconds с. Должен совпадать с тем, что ты воспроизводишь, — иначе деконволюция выдаст бессмыслицу.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Запись — $seconds с';
  }

  @override
  String get impulsePlaySweepNow => 'Теперь включи sweep с компьютера.';

  @override
  String get impulseStartRecording => 'Начать запись, затем включить sweep';

  @override
  String get impulseFrequencyResponse => 'АЧХ';

  @override
  String get impulseWithRoom => 'с комнатой (1 с)';

  @override
  String impulseDirectWindow(String ms) {
    return 'прямой звук (окно $ms мс)';
  }

  @override
  String get impulseWindow => 'Окно';

  @override
  String impulseWindowHelp(String hz) {
    return 'Более длинное окно видит ниже (сейчас действительно выше $hz Гц), но впускает первое отражение. Ниже границы кривая не сглаживается и не комментируется: это окно, а не комната.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'До первого отражения ($ms мс)';
  }

  @override
  String get impulseTime => 'Время';

  @override
  String get impulseImpulse => 'импульс';

  @override
  String get impulseTimeHelp =>
      'Синим — окно, оранжевая линия — первое найденное отражение. Нулевое время — прямой звук.';

  @override
  String get impulseSpectrogram => 'Спектрограмма';

  @override
  String get commonHide => 'Скрыть';

  @override
  String get commonShow => 'Показать';

  @override
  String get impulseSpectrogramHelp =>
      'Время в мс от прямого звука, частота вверх, цвет — уровень до −60 дБ. Горизонтальная полоса, которая переживает остальные, — это мода; таблица выше говорит то же числом.';

  @override
  String get impulseDecayByOctave => 'Затухание по октавам';

  @override
  String get impulseMidNoT20 => 'Средние полосы не затухли достаточно для T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Середина 125–500 Гц: T20 $seconds с — это RT60, с которым считает проект.';
  }

  @override
  String get impulseDecayHelp =>
      'В басах RT60 с телефона — скорее оценка: фоновый шум там ближе всего, а «—» значит, что реверберация не опустилась ниже него. C50 выше нуля: прямой звук с ранними отражениями несёт больше энергии, чем реверберация.';

  @override
  String get impulseResult => 'Результат';

  @override
  String get impulseDirectArrived => 'Прямой звук пришёл через';

  @override
  String get impulseDirectArrivedHelp =>
      'Задержка воспроизведения плюс время пролёта — само по себе ничего не говорит, а вот разница между левой и правой колонкой — говорит.';

  @override
  String get impulseFirstReflection => 'Первое отражение';

  @override
  String get impulseNotFound => 'не найдено';

  @override
  String impulseAfterDirect(String time) {
    return '$time после прямого звука';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Либо его нет, либо оно спряталось в звоне прямого импульса.';

  @override
  String impulseExtraPath(String metres) {
    return 'Лишний путь ≈ $metres м.';
  }

  @override
  String get impulseUnmeasurable => 'не измеряется';

  @override
  String get impulseRt60NoiseHelp =>
      'Реверберация не опустилась достаточно глубоко над уровнем шума — громче или в более тихий момент.';

  @override
  String get impulseRt60Help =>
      'Разница между T20 и T30 подсказывает, насколько чистое затухание.';

  @override
  String get impulseGating => 'Окно (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'действительно выше $hz Гц';
  }

  @override
  String get impulseGatingHelp =>
      'Ниже этого окно не видит ни одного периода — кривая там артефакт окна, а не комнаты.';

  @override
  String get impulseSchroeder => 'Кривая затухания Шрёдера';

  @override
  String impulseHdAt(int order) {
    return 'HD$order на 100 Гц / 1 кГц';
  }

  @override
  String get impulseHd2Help =>
      'Гармоники лежат в отрицательном времени деконволюции Фарины; здесь их оттуда читают, а не отбрасывают. −40 дБ — это 1 %.';

  @override
  String get impulseHd3Help =>
      'Третья гармоника растёт с перегрузкой быстрее второй.';

  @override
  String get impulseDistortionHot => 'Искажения выше −30 дБ';

  @override
  String get impulseDistortionHotHelp =>
      'Либо sweep слишком громкий, либо колонка на пределе. Хвост искажений выглядит в импульсе как отражение — убавь громкость и измерь заново, прежде чем чему-то верить.';

  @override
  String get eqMeasured => 'измерено';

  @override
  String get eqTarget => 'цель';

  @override
  String get eqPredicted => 'прогноз после EQ';

  @override
  String get eqMeasuredAfter => 'измерено после EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Отклонение от цели 40–$maxHz Гц';
  }

  @override
  String get eqAfterEntering => 'После ввода в ресивер';

  @override
  String get eqPredictionVsReality => 'Прогноз и реальность';

  @override
  String eqStubborn(String bands) {
    return 'Останется дальше 6 дБ от цели: $bands. Это интерференция, а не нехватка мощности — решается перестановкой колонки или слушателя, а не дополнительным подъёмом.';
  }

  @override
  String get eqModelOk => 'Фильтр ресивера ведёт себя примерно как модель.';

  @override
  String get eqModelOff =>
      'Реальный фильтр ресивера отличается от модели сильнее, чем ожидалось, — его полосы, вероятно, шире или уже, чем здесь предполагается.';

  @override
  String get eqTargetCurve => 'Целевая кривая';

  @override
  String get eqFlat => 'плоская';

  @override
  String get eqTargetHelp =>
      'Не плоская: выше пары кГц ухо слышит прямой звук, микрофон суммирует и отражения, и выпрямленная измеренная кривая звучит глухо. Лёгкий спад вверху и немного баса внизу — вот что выбирают люди при слепом прослушивании.';

  @override
  String get eqBassLift => 'Подъём басов';

  @override
  String get eqBassBelow => 'Басы ниже';

  @override
  String get eqTilt => 'Наклон';

  @override
  String get eqDbPerOctave => 'дБ/окт';

  @override
  String get eqTiltFrom => 'Наклон от';

  @override
  String get errorMicPermission =>
      'Без доступа к микрофону измерять нельзя. Разреши его в «Настройки» → AudioScanner → «Микрофон».';

  @override
  String errorMic(String error) {
    return 'Микрофон: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Не удалось включить микрофон: $error';
  }

  @override
  String get errorNoArkit =>
      'Это устройство не поддерживает ARKit world tracking — точки нельзя размещать в пространстве.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Запись короче sweep ($recorded с из $expected с). Начни запись до того, как включишь сигнал.';
  }

  @override
  String get sessionSnapshots => 'Снимки';

  @override
  String get errorTrackingUnreliable =>
      'Отслеживание позиции ненадёжно — точка окажется не там, где ты стоишь.';

  @override
  String errorNoSound(int seconds) {
    return 'За $seconds с не пришло никакого звука.';
  }

  @override
  String get noteSnapshotNoPose => 'снимок из анализатора, без позиции';

  @override
  String get sessionChannels => 'Каналы';

  @override
  String get trackingOk => 'Отслеживание OK';

  @override
  String get trackingLimited => 'Слабое отслеживание';

  @override
  String get trackingUnavailable => 'Нет отслеживания';

  @override
  String get poseHintFeatures =>
      'Мало деталей в кадре — наведи телефон на что-то фактурное, а не на голую стену.';

  @override
  String get poseHintMotion => 'Слишком быстрое движение — иди медленнее.';

  @override
  String get poseHintLight =>
      'Мало света — включи свет, камера не видит, где находится.';

  @override
  String get poseHintInitializing => 'ARKit запускается, немного подвигайся.';

  @override
  String get poseHintRelocalizing =>
      'Ищется исходная точка — вернись туда, откуда начинал.';

  @override
  String get signalPhonePink => 'Розовый шум из телефона';

  @override
  String get signalExternalPink => 'Розовый шум из колонок';

  @override
  String get signalExternalSweep => 'Sweep из колонок';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth-микрофон: сжатие и задержка портят измерение. Отключи наушники и измеряй встроенным микрофоном.';

  @override
  String get captureWarningProcessing =>
      'Система не отключила обработку сигнала (АРУ / шумоподавление). Измеренные разницы между точками будут искажены.';

  @override
  String get captureWarningMeasurementMode =>
      'Не удалось включить measurement mode — у микрофона своя коррекция АЧХ.';

  @override
  String get captureRouteUnknown => 'неизвестно';

  @override
  String get axisLength => 'длина';

  @override
  String get axisWidth => 'ширина';

  @override
  String get axisHeight => 'высота';
}
