// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Swedish (`sv`).
class AppLocalizationsSv extends AppLocalizations {
  AppLocalizationsSv([String locale = 'sv']) : super(locale);

  @override
  String get tabScan => 'Skanna';

  @override
  String get tabMap => 'Karta';

  @override
  String get tabResponse => 'Respons';

  @override
  String get tabDesign => 'Design';

  @override
  String get tabSignals => 'Signaler';

  @override
  String get rtaSnapshotFailed => 'Ögonblicksbilden sparades inte.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Sparad som punkt $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Sparad som punkt $id (utan position).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punkter',
      one: '1 punkt',
    );
    return 'Kalibrering $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Filen kan inte läsas: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL-offset';

  @override
  String get rtaOffsetHelp =>
      'Spela en ton på 1 kHz, läs av nivån på en ljudnivåmätare och ange skillnaden mot det analysatorn visar. Med en offset skild från noll markeras nivåerna som SPL-uppskattning; utan den stannar de i dBFS.';

  @override
  String get commonReset => 'Nollställ';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get commonSave => 'Spara';

  @override
  String get commonStop => 'Stoppa';

  @override
  String get commonStartMic => 'Starta mikrofonen';

  @override
  String get tabAnalyzer => 'Analysator';

  @override
  String get rtaUnfreeze => 'Fortsätt';

  @override
  String get rtaFreeze => 'Frys';

  @override
  String get rtaPeakHold => 'Peak hold';

  @override
  String get rtaMaxMinTraces => 'Max-/minkurvor';

  @override
  String get rtaResetTraces => 'Nollställ kurvor';

  @override
  String get rtaSaveAsPoint => 'Spara som punkt (3 s)';

  @override
  String get rtaMicCalibration => 'Mikrofonkalibrering…';

  @override
  String get rtaRemoveCalibration => 'Ta bort kalibrering';

  @override
  String get rtaOffsetMenu => 'dB SPL-offset…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · utan signalbehandling';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punkter',
      one: '1 punkt',
    );
    return 'Kalibrering $name: $_temp0, korrigering $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (uppskattning)';

  @override
  String get rtaFrozenHint =>
      'Fryst — mikrofonen fortsätter, det ritas bara inte.';

  @override
  String get rtaRelativeHint =>
      'Nivåerna är relativa (dBFS). Konturen visas när du sparar den första punkten — den är referens för resten.';

  @override
  String get rtaReferenceHint =>
      'Fyllda staplar = här. Kontur = referenspunkt.';

  @override
  String get rtaEnvelopeHint => 'Röd = max, grön = min sedan nollställning.';

  @override
  String get rtaMicStopped => 'mikrofonen står still';

  @override
  String get rtaSilence => 'tyst — spelas någon signal?';

  @override
  String get rtaPlaceholder =>
      'Starta mikrofonen och spela en signal i rummet.';

  @override
  String rtaBandsInfo(int count) {
    return '$count tersband, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Rumsskanning';

  @override
  String scanPointCount(int count) {
    return '$count p.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofonen är inte igång';

  @override
  String get scanMicNeeded => 'Utan den mäts bara positionen, inte ljudet.';

  @override
  String get scanContinuous => 'Löpande mätning';

  @override
  String get scanContinuousHint => 'En punkt automatiskt var 0,5 m du går';

  @override
  String get scanMeasuring => 'Mäter…';

  @override
  String get scanMeasureHere => 'Mät här';

  @override
  String scanPointSaved(String id, String position) {
    return 'Punkt $id sparad vid $position';
  }

  @override
  String get scanStartTracking => 'Starta positionsspårning';

  @override
  String get scanStartTrackingHint =>
      'ARKit — så vet appen var du står i rummet.';

  @override
  String scanPosition(String position) {
    return 'Position: $position m från origo';
  }

  @override
  String get scanSetOriginHint =>
      'Ställ dig på lyssningsplatsen och sätt origo.';

  @override
  String get scanOriginHere => 'Här är origo';

  @override
  String get scanNoPoints => 'Inga punkter än.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'spridning 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Vardagsrum';

  @override
  String get scanNewMeasurement => 'Ny mätning';

  @override
  String get scanRoomName => 'Rummets namn';

  @override
  String get scanExcitation => 'Vad du ska excitera rummet med';

  @override
  String get scanPhoneNoiseHint =>
      'Bara som riktmärke — telefonens högtalare återger ingen bas alls.';

  @override
  String get scanStart => 'Börja';

  @override
  String get mapExportTooltip => 'Exportera FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Kartan behöver minst två punkter. Gå runt i rummet och mät löpande.';

  @override
  String get mapShareText =>
      'FRD per punkt (import i REW / VituixCAD) och hela sessionen som JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Jämnaste platsen: $id vid $position m (spridning $variation dB i 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Den enda signal som impulsrespons, efterklangstid och första reflexer kan räknas fram ur. Spela den från en dator eller DAC genom högtalarna och låt telefonen spela in.';

  @override
  String get signalsLength => 'Längd';

  @override
  String get signalsFrom => 'Från';

  @override
  String get signalsTo => 'Till';

  @override
  String get signalsMonoNoChannel => 'Mono (utan kanal)';

  @override
  String get signalsExportWav => 'Exportera WAV';

  @override
  String get signalsPinkNoise => 'Rosa brus';

  @override
  String get signalsPinkHelp =>
      'Samma energi i varje oktav. Ger bara frekvensgången, ingen tid eller reflexer — räcker för ett snabbt ”händer det något här?”.';

  @override
  String get signalsExportPink => 'Exportera 30 s WAV';

  @override
  String get signalsHowTo => 'Så mäter du';

  @override
  String get signalsStep1 =>
      'Spela signalen från en dator genom högtalarna, inte från telefonen.';

  @override
  String get signalsStep2 =>
      'Ställ in volymen så att analysatorn visar runt −20 dBFS. Överstyrning ser ut som en reflex.';

  @override
  String get signalsStep3 =>
      'Håll telefonen lodrätt på armlängds avstånd, med mikrofonen mot högtalarna.';

  @override
  String get signalsStep4 =>
      'Koppla från Bluetooth-hörlurar — komprimering och latens förstör mätningen.';

  @override
  String get signalsNoteMono =>
      'Mono till båda högtalarna samtidigt summerar L och R, och skillnaden försvinner i summan. Välj en kanal för att mäta kanaler.';

  @override
  String get signalsNoteStereo =>
      'Stereofil med signal i bara en kanal — allt som spelar stereo kan spela den.';

  @override
  String get signalsNoteChannel =>
      'Monofil namngiven efter kanalen. Skicka den till rätt receiveringång från en DAW eller via en flerkanalsingång; en laptop med stereoutgång får inte ut den på den här kanalen.';

  @override
  String get channelsTitle => 'Kanalmätning';

  @override
  String get channelsHelp =>
      'Ställ dig på lyssningsplatsen. För varje kanal: starta inspelningen, spela ett sweep i den från fliken Signaler och tryck på Klar. Utan de här punkterna har designen inget att räkna fram EQ och nivåer ur.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Kontroll efter att EQ angetts';

  @override
  String get channelsVerifyAfterEqHint =>
      'Punkten sparas som ”efter EQ” och skriver inte över den som EQ:n räknades fram ur.';

  @override
  String channelsRecording(String seconds) {
    return 'Spelar in $seconds s — spela sweepet nu';
  }

  @override
  String get channelsNotMeasured => 'inte uppmätt';

  @override
  String get channelsMeasuredNoise => 'uppmätt med brus';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · direktljud efter $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · direktljud efter $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Klar';

  @override
  String get channelsMeasure => 'Mät';

  @override
  String get channelsAdd => 'Lägg till';

  @override
  String get channelsAgain => 'Igen';

  @override
  String get compareTitle => 'Jämförelse';

  @override
  String get compareNeedsTwoPoints => 'Jämförelsen behöver minst två punkter.';

  @override
  String get commonWithRoom => 'med rum';

  @override
  String get commonDirectSound => 'direktljud';

  @override
  String get compareAfterEq => 'efter EQ';

  @override
  String get compareBandsA => 'A (band)';

  @override
  String get compareBandsB => 'B (band)';

  @override
  String get compareArrivalDiff => 'Ankomstskillnad A − B';

  @override
  String get compareBroadbandDiff => 'Bredbandsnivå A − B';

  @override
  String get compareWorstBelow300 => 'Största skillnad under 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB i bandet $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance och level trim jämnar ut ankomst- och nivåskillnaden. Formskillnaden under 300 Hz jämnar de inte ut — den kommer från en annan vägg på ett annat avstånd och löses genom att flytta saker.';

  @override
  String get designRt60Live => 'T20 125–500 Hz från senaste responsen';

  @override
  String get designRt60Stored => 'T20 125–500 Hz från ett sparat sweep';

  @override
  String get designRt60Guess =>
      'uppskattning — mät ett sweep, Schroeder är bara en gissning tills vidare';

  @override
  String get designExportTooltip => 'Exportera konfiguration';

  @override
  String get designCompute => 'Beräkna design';

  @override
  String get designLidarChecking => 'Kontrollerar om det finns LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR tillgänglig';

  @override
  String get designLidarMissing => 'Ingen LiDAR — ange måtten för hand';

  @override
  String get designLidarHint =>
      'Skanningen ger väggarna på centimetern, så även reflexpunkter och avstånd till gränsytor stämmer, inte bara moderna.';

  @override
  String get designManualHint =>
      'Modalberäkningen behöver bara tre tal — men du går miste om reflexpunkter och exakta avstånd till väggarna.';

  @override
  String get designStopScan => 'Avsluta skanning';

  @override
  String get designScanRoom => 'Skanna rummet';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls väggar',
      one: '1 vägg',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings öppningar',
      one: '1 öppning',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Rummets mått';

  @override
  String get designLength => 'Längd';

  @override
  String get designWidth => 'Bredd';

  @override
  String get designHeight => 'Höjd';

  @override
  String get designWhatToDo => 'Vad du kan göra';

  @override
  String get designRoomModes => 'Rumsmoder';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Över $schroeder Hz (Schroeder) är enskilda moder inte längre meningsfulla. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: uppmätt, mål, prognos';

  @override
  String get designEqHelp =>
      'Prognosen är den uppmätta responsen plus en modell av receiverns femton band. Mät kanalen igen med reglaget ”efter EQ” när EQ:n är inlagd, så ser du hur nära modellen var.';

  @override
  String get designReceiverConfig => 'Receiverkonfiguration';

  @override
  String get designGeometryOnly =>
      'Utan sweepmätningar av kanalerna finns här bara geometri: avstånd och delningsfrekvenser. EQ och nivåer tillkommer när det finns punkter per kanal.';

  @override
  String get designShareSubject => 'Konfigurationsförslag';

  @override
  String get impulseTitle => 'Impulsrespons';

  @override
  String get impulseCompareTooltip => 'Jämför punkter';

  @override
  String get impulseExportTooltip => 'Exportera FRD med fas';

  @override
  String get impulseTapToStart => 'Tryck för att starta.';

  @override
  String get impulseSweepTitle => 'Sweepet du spelar genom högtalarna';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Måste stämma med det du spelar — annars ger dekonvolutionen nonsens.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Spelar in — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Spela nu sweepet från datorn.';

  @override
  String get impulseStartRecording => 'Börja spela in, spela sedan sweepet';

  @override
  String get impulseFrequencyResponse => 'Frekvensgång';

  @override
  String get impulseWithRoom => 'med rum (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'direktljud (fönster $ms ms)';
  }

  @override
  String get impulseWindow => 'Fönster';

  @override
  String impulseWindowHelp(String hz) {
    return 'Ett längre fönster ser längre ner (nu giltigt över $hz Hz) men släpper in den första reflexen. Under gränsen varken jämnas kurvan ut eller kommenteras: det är fönstret, inte rummet.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Fram till första reflexen ($ms ms)';
  }

  @override
  String get impulseTime => 'Tid';

  @override
  String get impulseImpulse => 'impuls';

  @override
  String get impulseTimeHelp =>
      'Blått är fönstret, den orange linjen den första reflexen som hittats. Tid noll är direktljudet.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Dölj';

  @override
  String get commonShow => 'Visa';

  @override
  String get impulseSpectrogramHelp =>
      'Tid i ms från direktljudet, frekvens uppåt, färgen är nivå ner till −60 dB. En vågrät rand som överlever resten är en mod; tabellen ovan säger samma sak i siffror.';

  @override
  String get impulseDecayByOctave => 'Avklingning per oktav';

  @override
  String get impulseMidNoT20 =>
      'Mellanbanden klingade inte av tillräckligt för T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Mellanregister 125–500 Hz: T20 $seconds s — det är den RT60 som designen räknar med.';
  }

  @override
  String get impulseDecayHelp =>
      'I basen är RT60 från en telefon snarare en uppskattning: bakgrundsbruset ligger närmast där, och ”—” betyder att efterklangen inte sjönk under det. C50 över noll: direktljudet med tidiga reflexer bär mer energi än efterklangen.';

  @override
  String get impulseResult => 'Resultat';

  @override
  String get impulseDirectArrived => 'Direktljudet kom efter';

  @override
  String get impulseDirectArrivedHelp =>
      'Uppspelningsfördröjning plus gångtid — säger ingenting i sig, men skillnaden mellan vänster och höger högtalare gör det.';

  @override
  String get impulseFirstReflection => 'Första reflexen';

  @override
  String get impulseNotFound => 'hittades inte';

  @override
  String impulseAfterDirect(String time) {
    return '$time efter direktljudet';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Antingen finns det ingen, eller så gömmer den sig i direktimpulsens efterringning.';

  @override
  String impulseExtraPath(String metres) {
    return 'Extra väg ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'kan inte mätas';

  @override
  String get impulseRt60NoiseHelp =>
      'Efterklangen sjönk inte tillräckligt djupt över brusgolvet — högre, eller vid ett tystare tillfälle.';

  @override
  String get impulseRt60Help =>
      'Skillnaden mellan T20 och T30 antyder hur ren avklingningen är.';

  @override
  String get impulseGating => 'Fönster (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'giltigt över $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Under detta ser fönstret inte ens en period — kurvan där är en artefakt av fönstret, inte av rummet.';

  @override
  String get impulseSchroeder => 'Schroeders avklingningskurva';

  @override
  String impulseHdAt(int order) {
    return 'HD$order vid 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Övertonerna ligger i den negativa tiden i Farinas dekonvolution; här läses de därifrån i stället för att kastas. −40 dB är 1 %.';

  @override
  String get impulseHd3Help =>
      'Den tredje övertonen växer snabbare än den andra vid överstyrning.';

  @override
  String get impulseDistortionHot => 'Distorsion över −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Antingen är sweepet för högt, eller så är högtalaren vid sin gräns. En distorsionssvans ser ut som en reflex i impulsen — sänk volymen och mät igen innan du tror på något.';

  @override
  String get eqMeasured => 'uppmätt';

  @override
  String get eqTarget => 'mål';

  @override
  String get eqPredicted => 'prognos efter EQ';

  @override
  String get eqMeasuredAfter => 'uppmätt efter EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Avvikelse från målet 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Efter inmatning i receivern';

  @override
  String get eqPredictionVsReality => 'Prognos vs. verklighet';

  @override
  String eqStubborn(String bands) {
    return 'Ligger kvar mer än 6 dB från målet: $bands. Det är interferens, inte brist på effekt — löses genom att flytta högtalaren eller lyssnaren, inte med mer lyft.';
  }

  @override
  String get eqModelOk => 'Receiverns filter beter sig ungefär som modellen.';

  @override
  String get eqModelOff =>
      'Receiverns verkliga filter avviker mer från modellen än väntat — dess band är troligen bredare eller smalare än vad som antas här.';

  @override
  String get eqTargetCurve => 'Målkurva';

  @override
  String get eqFlat => 'platt';

  @override
  String get eqTargetHelp =>
      'Inte platt: över några kHz hör örat direktljudet, mikrofonen summerar även reflexerna, och en utjämnad mätkurva låter matt. En lätt lutning upptill och lite bas nedtill är vad folk väljer vid blindlyssning.';

  @override
  String get eqBassLift => 'Baslyft';

  @override
  String get eqBassBelow => 'Bas under';

  @override
  String get eqTilt => 'Lutning';

  @override
  String get eqDbPerOctave => 'dB/okt';

  @override
  String get eqTiltFrom => 'Lutning från';

  @override
  String get errorMicPermission =>
      'Utan åtkomst till mikrofonen går det inte att mäta. Tillåt den under Inställningar → AudioScanner → Mikrofon.';

  @override
  String errorMic(String error) {
    return 'Mikrofon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Det gick inte att starta mikrofonen: $error';
  }

  @override
  String get errorNoArkit =>
      'Den här enheten klarar inte ARKit world tracking — punkter kan inte placeras i rummet.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Inspelningen är kortare än sweepet ($recorded s av $expected s). Starta inspelningen innan du spelar signalen.';
  }

  @override
  String get sessionSnapshots => 'Ögonblicksbilder';

  @override
  String get errorTrackingUnreliable =>
      'Positionsspårningen är opålitlig — punkten skulle hamna någon annanstans än där du står.';

  @override
  String errorNoSound(int seconds) {
    return 'Inget ljud kom inom $seconds s.';
  }

  @override
  String get noteSnapshotNoPose =>
      'ögonblicksbild från analysatorn, utan position';

  @override
  String get sessionChannels => 'Kanaler';

  @override
  String get trackingOk => 'Spårning OK';

  @override
  String get trackingLimited => 'Svag spårning';

  @override
  String get trackingUnavailable => 'Ingen spårning';

  @override
  String get poseHintFeatures =>
      'För få detaljer i bilden — rikta telefonen mot något med struktur, inte en kal vägg.';

  @override
  String get poseHintMotion => 'För snabb rörelse — gå långsammare.';

  @override
  String get poseHintLight =>
      'För lite ljus — tänd, kameran ser inte var den är.';

  @override
  String get poseHintInitializing => 'ARKit startar, rör dig lite.';

  @override
  String get poseHintRelocalizing =>
      'Den ursprungliga punkten söks igen — gå tillbaka dit du började.';

  @override
  String get signalPhonePink => 'Rosa brus från telefonen';

  @override
  String get signalExternalPink => 'Rosa brus från högtalarna';

  @override
  String get signalExternalSweep => 'Sweep från högtalarna';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth-mikrofon: komprimering och latens förstör mätningen. Koppla från hörlurarna och mät med den inbyggda mikrofonen.';

  @override
  String get captureWarningProcessing =>
      'Systemet stängde inte av signalbehandlingen (AGC / brusreducering). Uppmätta skillnader mellan platser blir förvrängda.';

  @override
  String get captureWarningMeasurementMode =>
      'Measurement mode kunde inte aktiveras — mikrofonen har en egen frekvenskorrigering.';

  @override
  String get captureRouteUnknown => 'okänd';

  @override
  String get axisLength => 'längd';

  @override
  String get axisWidth => 'bredd';

  @override
  String get axisHeight => 'höjd';
}
