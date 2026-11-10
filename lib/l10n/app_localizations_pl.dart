// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get tabScan => 'Skan';

  @override
  String get tabMap => 'Mapa';

  @override
  String get tabResponse => 'Odpowiedź';

  @override
  String get tabDesign => 'Projekt';

  @override
  String get tabSignals => 'Sygnały';

  @override
  String get rtaSnapshotFailed => 'Migawka nie została zapisana.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Zapisano jako punkt $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Zapisano jako punkt $id (bez pozycji).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punktu',
      many: '$count punktów',
      few: '$count punkty',
      one: '1 punkt',
    );
    return 'Kalibracja $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Nie można odczytać pliku: $message';
  }

  @override
  String get rtaOffsetTitle => 'Offset dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Odtwórz ton 1 kHz, odczytaj poziom na mierniku SPL i wpisz różnicę względem tego, co pokazuje analizator. Przy niezerowym offsecie poziomy są oznaczane jako szacunek SPL; bez niego pozostają w dBFS.';

  @override
  String get commonReset => 'Wyzeruj';

  @override
  String get commonCancel => 'Anuluj';

  @override
  String get commonSave => 'Zapisz';

  @override
  String get commonStop => 'Zatrzymaj';

  @override
  String get commonStartMic => 'Włącz mikrofon';

  @override
  String get tabAnalyzer => 'Analizator';

  @override
  String get rtaUnfreeze => 'Wznów';

  @override
  String get rtaFreeze => 'Zamroź';

  @override
  String get rtaPeakHold => 'Peak hold';

  @override
  String get rtaMaxMinTraces => 'Krzywe maks. / min.';

  @override
  String get rtaResetTraces => 'Wyzeruj krzywe';

  @override
  String get rtaSaveAsPoint => 'Zapisz jako punkt (3 s)';

  @override
  String get rtaMicCalibration => 'Kalibracja mikrofonu…';

  @override
  String get rtaRemoveCalibration => 'Usuń kalibrację';

  @override
  String get rtaOffsetMenu => 'Offset dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · bez przetwarzania sygnału';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punktu',
      many: '$count punktów',
      few: '$count punkty',
      one: '1 punkt',
    );
    return 'Kalibracja $name: $_temp0, korekcja $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (szacunek)';

  @override
  String get rtaFrozenHint =>
      'Zamrożono — mikrofon działa dalej, tylko nie jest rysowany.';

  @override
  String get rtaRelativeHint =>
      'Poziomy są względne (dBFS). Obrys pojawi się, gdy zapiszesz pierwszy punkt — będzie on odniesieniem dla pozostałych.';

  @override
  String get rtaReferenceHint =>
      'Pełne słupki = tutaj. Obrys = punkt odniesienia.';

  @override
  String get rtaEnvelopeHint =>
      'Czerwony = maks., zielony = min. od wyzerowania.';

  @override
  String get rtaMicStopped => 'mikrofon zatrzymany';

  @override
  String get rtaSilence => 'cisza — czy gra sygnał?';

  @override
  String get rtaPlaceholder => 'Włącz mikrofon i puść sygnał do pomieszczenia.';

  @override
  String rtaBandsInfo(int count) {
    return '$count pasm tercjowych, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Skan pomieszczenia';

  @override
  String scanPointCount(int count) {
    return '$count pkt';
  }

  @override
  String get commonMicNotRunning => 'Mikrofon nie działa';

  @override
  String get scanMicNeeded =>
      'Bez niego mierzona jest tylko pozycja, nie dźwięk.';

  @override
  String get scanContinuous => 'Pomiar ciągły';

  @override
  String get scanContinuousHint => 'Punkt automatycznie co 0,5 m marszu';

  @override
  String get scanMeasuring => 'Mierzę…';

  @override
  String get scanMeasureHere => 'Zmierz tutaj';

  @override
  String scanPointSaved(String id, String position) {
    return 'Punkt $id zapisany w $position';
  }

  @override
  String get scanStartTracking => 'Włącz śledzenie pozycji';

  @override
  String get scanStartTrackingHint =>
      'ARKit — dzięki temu aplikacja wie, gdzie stoisz w pomieszczeniu.';

  @override
  String scanPosition(String position) {
    return 'Pozycja: $position m od początku układu';
  }

  @override
  String get scanSetOriginHint =>
      'Stań w miejscu odsłuchu i ustaw początek układu.';

  @override
  String get scanOriginHere => 'Tu jest początek';

  @override
  String get scanNoPoints => 'Na razie brak punktów.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'rozrzut 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Salon';

  @override
  String get scanNewMeasurement => 'Nowy pomiar';

  @override
  String get scanRoomName => 'Nazwa pomieszczenia';

  @override
  String get scanExcitation => 'Czym pobudzisz pomieszczenie';

  @override
  String get scanPhoneNoiseHint =>
      'Tylko orientacyjnie — głośnik telefonu w ogóle nie odtwarza basu.';

  @override
  String get scanStart => 'Zacznij';

  @override
  String get mapExportTooltip => 'Eksport FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Mapa potrzebuje co najmniej dwóch punktów. Przejdź przez pomieszczenie i mierz na bieżąco.';

  @override
  String get mapShareText =>
      'FRD dla każdego punktu (import do REW / VituixCAD) i cała sesja w JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Najbardziej wyrównane miejsce: $id w $position m (rozrzut $variation dB w 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Jedyny sygnał, z którego da się obliczyć odpowiedź impulsową, czas pogłosu i pierwsze odbicia. Odtwórz go z komputera lub DAC-a przez kolumny, a telefon niech nagrywa.';

  @override
  String get signalsLength => 'Długość';

  @override
  String get signalsFrom => 'Od';

  @override
  String get signalsTo => 'Do';

  @override
  String get signalsMonoNoChannel => 'Mono (bez kanału)';

  @override
  String get signalsExportWav => 'Eksport WAV';

  @override
  String get signalsPinkNoise => 'Szum różowy';

  @override
  String get signalsPinkHelp =>
      'Ta sama energia w każdej oktawie. Daje tylko charakterystykę częstotliwościową, bez czasu i odbić — na szybkie „czy coś się tu dzieje?” wystarczy.';

  @override
  String get signalsExportPink => 'Eksport WAV 30 s';

  @override
  String get signalsHowTo => 'Jak mierzyć';

  @override
  String get signalsStep1 =>
      'Odtwarzaj sygnał z komputera przez kolumny, nie z telefonu.';

  @override
  String get signalsStep2 =>
      'Ustaw głośność tak, by analizator pokazywał około −20 dBFS. Przesterowanie wygląda jak odbicie.';

  @override
  String get signalsStep3 =>
      'Trzymaj telefon pionowo na wyciągniętej ręce, mikrofonem w stronę kolumn.';

  @override
  String get signalsStep4 =>
      'Odłącz słuchawki Bluetooth — kompresja i opóźnienie psują pomiar.';

  @override
  String get signalsNoteMono =>
      'Mono do obu kolumn naraz sumuje L i R, a różnica między nimi znika w sumie. Do pomiaru kanałów wybierz kanał.';

  @override
  String get signalsNoteStereo =>
      'Plik stereo z sygnałem tylko w jednym kanale — odtworzy go wszystko, co gra w stereo.';

  @override
  String get signalsNoteChannel =>
      'Plik mono nazwany według kanału. Skieruj go na właściwe wejście amplitunera z DAW lub przez wejście wielokanałowe; laptop z wyjściem stereo nie dostarczy go na ten kanał.';

  @override
  String get channelsTitle => 'Pomiar kanałów';

  @override
  String get channelsHelp =>
      'Stań w miejscu odsłuchu. Dla każdego kanału: zacznij nagrywanie, puść na niego sweep z karty Sygnały, stuknij Gotowe. Bez tych punktów projekt nie ma z czego wyliczyć EQ i poziomów.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Weryfikacja po wprowadzeniu EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Punkt zostanie zapisany jako „po EQ” i nie nadpisze tego, z którego liczono EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Nagrywam $seconds s — teraz puść sweep';
  }

  @override
  String get channelsNotMeasured => 'niezmierzony';

  @override
  String get channelsMeasuredNoise => 'zmierzony szumem';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · dźwięk bezpośredni po $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · dźwięk bezpośredni po $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Gotowe';

  @override
  String get channelsMeasure => 'Zmierz';

  @override
  String get channelsAdd => 'Dodaj';

  @override
  String get channelsAgain => 'Ponownie';

  @override
  String get compareTitle => 'Porównanie';

  @override
  String get compareNeedsTwoPoints =>
      'Porównanie potrzebuje co najmniej dwóch punktów.';

  @override
  String get commonWithRoom => 'z pomieszczeniem';

  @override
  String get commonDirectSound => 'dźwięk bezpośredni';

  @override
  String get compareAfterEq => 'po EQ';

  @override
  String get compareBandsA => 'A (pasma)';

  @override
  String get compareBandsB => 'B (pasma)';

  @override
  String get compareArrivalDiff => 'Różnica dotarcia A − B';

  @override
  String get compareBroadbandDiff => 'Poziom szerokopasmowy A − B';

  @override
  String get compareWorstBelow300 => 'Największa różnica poniżej 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB w paśmie $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance i level trim wyrównają różnicę dotarcia i poziomu. Różnicy kształtu poniżej 300 Hz nie wyrównają — powoduje ją inna ściana w innej odległości i rozwiązuje się ją przesunięciem.';

  @override
  String get designRt60Live => 'T20 125–500 Hz z ostatniej odpowiedzi';

  @override
  String get designRt60Stored => 'T20 125–500 Hz z zapisanego sweepu';

  @override
  String get designRt60Guess =>
      'szacunek — zmierz sweep, Schroeder to na razie tylko wskazówka';

  @override
  String get designExportTooltip => 'Eksport konfiguracji';

  @override
  String get designCompute => 'Oblicz projekt';

  @override
  String get designLidarChecking => 'Sprawdzam, czy jest LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR dostępny';

  @override
  String get designLidarMissing => 'Brak LiDAR-u — wpisz wymiary ręcznie';

  @override
  String get designLidarHint =>
      'Skan daje ściany z dokładnością do centymetra, więc zgadzają się też punkty odbić i odległości od granic, nie tylko mody.';

  @override
  String get designManualHint =>
      'Obliczenie modalne potrzebuje tylko trzech liczb — ale tracisz punkty odbić i dokładne odległości od ścian.';

  @override
  String get designStopScan => 'Zakończ skan';

  @override
  String get designScanRoom => 'Zeskanuj pomieszczenie';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls ściany',
      many: '$walls ścian',
      few: '$walls ściany',
      one: '1 ściana',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings otworu',
      many: '$openings otworów',
      few: '$openings otwory',
      one: '1 otwór',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Wymiary pomieszczenia';

  @override
  String get designLength => 'Długość';

  @override
  String get designWidth => 'Szerokość';

  @override
  String get designHeight => 'Wysokość';

  @override
  String get designWhatToDo => 'Co z tym zrobić';

  @override
  String get designRoomModes => 'Mody pomieszczenia';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Powyżej $schroeder Hz (Schroeder) pojedyncze mody nie mają już sensu. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: zmierzone, cel, prognoza';

  @override
  String get designEqHelp =>
      'Prognoza to zmierzona odpowiedź plus model piętnastu pasm amplitunera. Po wprowadzeniu EQ zmierz kanał ponownie z przełącznikiem „po EQ”, aby zobaczyć, jak blisko był model.';

  @override
  String get designReceiverConfig => 'Konfiguracja amplitunera';

  @override
  String get designGeometryOnly =>
      'Bez pomiarów kanałów sweepem jest tu tylko geometria: odległości i częstotliwości podziału. EQ i poziomy pojawią się, gdy będą punkty dla każdego kanału.';

  @override
  String get designShareSubject => 'Propozycja konfiguracji';

  @override
  String get impulseTitle => 'Odpowiedź impulsowa';

  @override
  String get impulseCompareTooltip => 'Porównaj punkty';

  @override
  String get impulseExportTooltip => 'Eksport FRD z fazą';

  @override
  String get impulseTapToStart => 'Stuknij, aby włączyć.';

  @override
  String get impulseSweepTitle => 'Sweep, który puścisz przez kolumny';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Musi się zgadzać z tym, co odtwarzasz — inaczej dekonwolucja zwróci bzdury.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Nagrywam — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Teraz puść sweep z komputera.';

  @override
  String get impulseStartRecording => 'Zacznij nagrywać, potem puść sweep';

  @override
  String get impulseFrequencyResponse => 'Charakterystyka częstotliwościowa';

  @override
  String get impulseWithRoom => 'z pomieszczeniem (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'dźwięk bezpośredni (okno $ms ms)';
  }

  @override
  String get impulseWindow => 'Okno';

  @override
  String impulseWindowHelp(String hz) {
    return 'Dłuższe okno widzi niżej (teraz ważne powyżej $hz Hz), ale wpuszcza pierwsze odbicie. Poniżej granicy krzywa nie jest wygładzana ani komentowana: to okno, nie pomieszczenie.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Do pierwszego odbicia ($ms ms)';
  }

  @override
  String get impulseTime => 'Czas';

  @override
  String get impulseImpulse => 'impuls';

  @override
  String get impulseTimeHelp =>
      'Niebieskie jest okno, pomarańczowa linia to pierwsze znalezione odbicie. Czas zero to dźwięk bezpośredni.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Ukryj';

  @override
  String get commonShow => 'Pokaż';

  @override
  String get impulseSpectrogramHelp =>
      'Czas w ms od dźwięku bezpośredniego, częstotliwość w górę, kolor to poziom do −60 dB. Poziomy pas, który przetrwa pozostałe, to mod; tabela powyżej mówi to samo liczbami.';

  @override
  String get impulseDecayByOctave => 'Zanikanie w oktawach';

  @override
  String get impulseMidNoT20 =>
      'Środkowe pasma nie zanikły wystarczająco dla T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Środek 125–500 Hz: T20 $seconds s — to RT60, z którym liczy projekt.';
  }

  @override
  String get impulseDecayHelp =>
      'W basie RT60 z telefonu to raczej szacunek: szum tła jest tam najbliżej, a „—” oznacza, że pogłos nie opadł poniżej niego. C50 powyżej zera: dźwięk bezpośredni z wczesnymi odbiciami niesie więcej energii niż pogłos.';

  @override
  String get impulseResult => 'Wynik';

  @override
  String get impulseDirectArrived => 'Dźwięk bezpośredni dotarł po';

  @override
  String get impulseDirectArrivedHelp =>
      'Opóźnienie odtwarzania plus czas przelotu — samo w sobie nic nie mówi, ale różnica między lewą a prawą kolumną już tak.';

  @override
  String get impulseFirstReflection => 'Pierwsze odbicie';

  @override
  String get impulseNotFound => 'nie znaleziono';

  @override
  String impulseAfterDirect(String time) {
    return '$time po dźwięku bezpośrednim';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Albo go nie ma, albo ukrył się w dzwonieniu impulsu bezpośredniego.';

  @override
  String impulseExtraPath(String metres) {
    return 'Dodatkowa droga ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'niemierzalne';

  @override
  String get impulseRt60NoiseHelp =>
      'Pogłos nie opadł wystarczająco nisko ponad szum tła — głośniej albo w cichszej chwili.';

  @override
  String get impulseRt60Help =>
      'Różnica między T20 a T30 podpowiada, jak czyste jest zanikanie.';

  @override
  String get impulseGating => 'Okno (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'ważne powyżej $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Poniżej tego okno nie zobaczy nawet jednego okresu — krzywa jest tam artefaktem okna, nie pomieszczenia.';

  @override
  String get impulseSchroeder => 'Krzywa zaniku Schroedera';

  @override
  String impulseHdAt(int order) {
    return 'HD$order przy 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmoniczne leżą w ujemnym czasie dekonwolucji Fariny; tutaj są z niego odczytywane zamiast odrzucane. −40 dB to 1 %.';

  @override
  String get impulseHd3Help =>
      'Trzecia harmoniczna rośnie przy przesterowaniu szybciej niż druga.';

  @override
  String get impulseDistortionHot => 'Zniekształcenia powyżej −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Albo sweep jest za głośny, albo kolumna jest na granicy. Ogon zniekształceń wygląda w impulsie jak odbicie — ścisz i zmierz ponownie, zanim w cokolwiek uwierzysz.';

  @override
  String get eqMeasured => 'zmierzone';

  @override
  String get eqTarget => 'cel';

  @override
  String get eqPredicted => 'prognoza po EQ';

  @override
  String get eqMeasuredAfter => 'zmierzone po EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Odchyłka od celu 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Po wprowadzeniu do amplitunera';

  @override
  String get eqPredictionVsReality => 'Prognoza a rzeczywistość';

  @override
  String eqStubborn(String bands) {
    return 'Pozostanie dalej od celu niż 6 dB: $bands. To interferencja, nie brak mocy — rozwiązuje się ją przesunięciem kolumny lub słuchacza, nie kolejnym podbiciem.';
  }

  @override
  String get eqModelOk =>
      'Filtr amplitunera zachowuje się mniej więcej jak model.';

  @override
  String get eqModelOff =>
      'Rzeczywisty filtr amplitunera różni się od modelu bardziej, niż oczekiwano — jego pasma są pewnie szersze lub węższe, niż tu założono.';

  @override
  String get eqTargetCurve => 'Krzywa docelowa';

  @override
  String get eqFlat => 'płaska';

  @override
  String get eqTargetHelp =>
      'Nie płaska: powyżej kilku kHz ucho słyszy dźwięk bezpośredni, mikrofon sumuje też odbicia, a wyprostowana krzywa pomiarowa brzmi głucho. Lekkie nachylenie na górze i trochę basu na dole — to wybierają ludzie w ślepych odsłuchach.';

  @override
  String get eqBassLift => 'Podbicie basu';

  @override
  String get eqBassBelow => 'Bas poniżej';

  @override
  String get eqTilt => 'Nachylenie';

  @override
  String get eqDbPerOctave => 'dB/okt.';

  @override
  String get eqTiltFrom => 'Nachylenie od';

  @override
  String get errorMicPermission =>
      'Bez dostępu do mikrofonu nie da się mierzyć. Zezwól na niego w Ustawienia → AudioScanner → Mikrofon.';

  @override
  String errorMic(String error) {
    return 'Mikrofon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Nie udało się włączyć mikrofonu: $error';
  }

  @override
  String get errorNoArkit =>
      'To urządzenie nie obsługuje ARKit world tracking — punktów nie da się umieszczać w przestrzeni.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Nagranie jest krótsze niż sweep ($recorded s z $expected s). Zacznij nagrywać, zanim puścisz sygnał.';
  }

  @override
  String get sessionSnapshots => 'Migawki';

  @override
  String get errorTrackingUnreliable =>
      'Śledzenie pozycji jest niewiarygodne — punkt znalazłby się gdzie indziej, niż stoisz.';

  @override
  String errorNoSound(int seconds) {
    return 'W ciągu $seconds s nie dotarł żaden dźwięk.';
  }

  @override
  String get noteSnapshotNoPose => 'migawka z analizatora, bez pozycji';

  @override
  String get sessionChannels => 'Kanały';

  @override
  String get trackingOk => 'Śledzenie OK';

  @override
  String get trackingLimited => 'Słabe śledzenie';

  @override
  String get trackingUnavailable => 'Brak śledzenia';

  @override
  String get poseHintFeatures =>
      'Za mało szczegółów w obrazie — skieruj telefon na coś urozmaiconego, nie na gołą ścianę.';

  @override
  String get poseHintMotion => 'Za szybki ruch — idź wolniej.';

  @override
  String get poseHintLight =>
      'Za mało światła — zapal je, kamera nie widzi, gdzie jest.';

  @override
  String get poseHintInitializing => 'ARKit się uruchamia, porusz się chwilę.';

  @override
  String get poseHintRelocalizing =>
      'Szukam z powrotem punktu początkowego — wróć tam, gdzie zaczynałeś.';

  @override
  String get signalPhonePink => 'Szum różowy z telefonu';

  @override
  String get signalExternalPink => 'Szum różowy z kolumn';

  @override
  String get signalExternalSweep => 'Sweep z kolumn';

  @override
  String get captureWarningBluetooth =>
      'Mikrofon Bluetooth: kompresja i opóźnienie psują pomiar. Odłącz słuchawki i mierz wbudowanym mikrofonem.';

  @override
  String get captureWarningProcessing =>
      'System nie wyłączył przetwarzania sygnału (AGC / tłumienie szumów). Zmierzone różnice między miejscami będą zniekształcone.';

  @override
  String get captureWarningMeasurementMode =>
      'Nie udało się włączyć measurement mode — mikrofon ma własną korekcję charakterystyki częstotliwościowej.';

  @override
  String get captureRouteUnknown => 'nieznane';

  @override
  String get axisLength => 'długość';

  @override
  String get axisWidth => 'szerokość';

  @override
  String get axisHeight => 'wysokość';
}
