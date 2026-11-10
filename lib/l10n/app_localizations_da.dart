// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Danish (`da`).
class AppLocalizationsDa extends AppLocalizations {
  AppLocalizationsDa([String locale = 'da']) : super(locale);

  @override
  String get tabScan => 'Scan';

  @override
  String get tabMap => 'Kort';

  @override
  String get tabResponse => 'Respons';

  @override
  String get tabDesign => 'Design';

  @override
  String get tabSignals => 'Signaler';

  @override
  String get rtaSnapshotFailed => 'Øjebliksbilledet blev ikke gemt.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Gemt som punkt $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Gemt som punkt $id (uden position).';
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
    return 'Filen kan ikke læses: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL-offset';

  @override
  String get rtaOffsetHelp =>
      'Afspil en 1 kHz-tone, aflæs niveauet på en lydtrykmåler, og indtast forskellen til det, analysatoren viser. Med et offset forskelligt fra nul markeres niveauerne som SPL-estimat; uden forbliver de i dBFS.';

  @override
  String get commonReset => 'Nulstil';

  @override
  String get commonCancel => 'Annuller';

  @override
  String get commonSave => 'Gem';

  @override
  String get commonStop => 'Stop';

  @override
  String get commonStartMic => 'Start mikrofon';

  @override
  String get tabAnalyzer => 'Analysator';

  @override
  String get rtaUnfreeze => 'Genoptag';

  @override
  String get rtaFreeze => 'Frys';

  @override
  String get rtaPeakHold => 'Peak hold';

  @override
  String get rtaMaxMinTraces => 'Maks./min.-kurver';

  @override
  String get rtaResetTraces => 'Nulstil kurver';

  @override
  String get rtaSaveAsPoint => 'Gem som punkt (3 s)';

  @override
  String get rtaMicCalibration => 'Mikrofonkalibrering…';

  @override
  String get rtaRemoveCalibration => 'Fjern kalibrering';

  @override
  String get rtaOffsetMenu => 'dB SPL-offset…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · uden signalbehandling';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punkter',
      one: '1 punkt',
    );
    return 'Kalibrering $name: $_temp0, korrektion $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (estimat)';

  @override
  String get rtaFrozenHint =>
      'Frosset — mikrofonen kører videre, den tegnes bare ikke.';

  @override
  String get rtaRelativeHint =>
      'Niveauerne er relative (dBFS). Omridset vises, når du gemmer det første punkt — det er referencen for resten.';

  @override
  String get rtaReferenceHint =>
      'Fyldte søjler = her. Omrids = referencepunkt.';

  @override
  String get rtaEnvelopeHint => 'Rød = maks., grøn = min. siden nulstilling.';

  @override
  String get rtaMicStopped => 'mikrofonen er stoppet';

  @override
  String get rtaSilence => 'stilhed — spiller der et signal?';

  @override
  String get rtaPlaceholder =>
      'Start mikrofonen, og afspil et signal i rummet.';

  @override
  String rtaBandsInfo(int count) {
    return '$count tredjedelsoktavbånd, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Rumscanning';

  @override
  String scanPointCount(int count) {
    return '$count pkt.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofonen kører ikke';

  @override
  String get scanMicNeeded => 'Uden den måles kun positionen, ikke lyden.';

  @override
  String get scanContinuous => 'Løbende måling';

  @override
  String get scanContinuousHint => 'Et punkt automatisk for hver 0,5 m gang';

  @override
  String get scanMeasuring => 'Måler…';

  @override
  String get scanMeasureHere => 'Mål her';

  @override
  String scanPointSaved(String id, String position) {
    return 'Punkt $id gemt ved $position';
  }

  @override
  String get scanStartTracking => 'Start positionssporing';

  @override
  String get scanStartTrackingHint =>
      'ARKit — sådan ved appen, hvor du står i rummet.';

  @override
  String scanPosition(String position) {
    return 'Position: $position m fra origo';
  }

  @override
  String get scanSetOriginHint => 'Stil dig på lyttepladsen, og fastlæg origo.';

  @override
  String get scanOriginHere => 'Her er origo';

  @override
  String get scanNoPoints => 'Endnu ingen punkter.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'spredning 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Stue';

  @override
  String get scanNewMeasurement => 'Ny måling';

  @override
  String get scanRoomName => 'Rummets navn';

  @override
  String get scanExcitation => 'Hvad du vil anslå rummet med';

  @override
  String get scanPhoneNoiseHint =>
      'Kun vejledende — telefonens højttaler gengiver slet ingen bas.';

  @override
  String get scanStart => 'Start';

  @override
  String get mapExportTooltip => 'Eksportér FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Kortet kræver mindst to punkter. Gå rundt i rummet, og mål løbende.';

  @override
  String get mapShareText =>
      'FRD pr. punkt (import i REW / VituixCAD) og hele sessionen som JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Jævneste sted: $id ved $position m (spredning $variation dB i 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Det eneste signal, hvorfra impulsrespons, efterklangstid og første refleksioner kan beregnes. Afspil det fra en computer eller DAC gennem højttalerne, og lad telefonen optage.';

  @override
  String get signalsLength => 'Længde';

  @override
  String get signalsFrom => 'Fra';

  @override
  String get signalsTo => 'Til';

  @override
  String get signalsMonoNoChannel => 'Mono (uden kanal)';

  @override
  String get signalsExportWav => 'Eksportér WAV';

  @override
  String get signalsPinkNoise => 'Lyserød støj';

  @override
  String get signalsPinkHelp =>
      'Samme energi i hver oktav. Giver kun frekvensgangen, ingen tid eller refleksioner — nok til et hurtigt „sker der noget her?“.';

  @override
  String get signalsExportPink => 'Eksportér 30 s WAV';

  @override
  String get signalsHowTo => 'Sådan måler du';

  @override
  String get signalsStep1 =>
      'Afspil signalet fra en computer gennem højttalerne, ikke fra telefonen.';

  @override
  String get signalsStep2 =>
      'Indstil lydstyrken, så analysatoren viser omkring −20 dBFS. Overstyring ligner en refleksion.';

  @override
  String get signalsStep3 =>
      'Hold telefonen lodret i strakt arm med mikrofonen mod højttalerne.';

  @override
  String get signalsStep4 =>
      'Afbryd Bluetooth-hovedtelefoner — komprimering og latens ødelægger målingen.';

  @override
  String get signalsNoteMono =>
      'Mono til begge højttalere på én gang lægger L og R sammen, og forskellen forsvinder i summen. Vælg en kanal for at måle kanaler.';

  @override
  String get signalsNoteStereo =>
      'Stereofil med signal i kun én kanal — alt, der afspiller stereo, kan afspille den.';

  @override
  String get signalsNoteChannel =>
      'Monofil navngivet efter kanalen. Send den til den rigtige receiverindgang fra en DAW eller via en flerkanalsindgang; en bærbar med stereoudgang kan ikke få den ud på denne kanal.';

  @override
  String get channelsTitle => 'Kanalmåling';

  @override
  String get channelsHelp =>
      'Stil dig på lyttepladsen. For hver kanal: start optagelsen, afspil en sweep i den fra fanen Signaler, og tryk på Færdig. Uden disse punkter har designet intet at beregne EQ og niveauer ud fra.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Kontrol efter indtastning af EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Punktet gemmes som „efter EQ“ og overskriver ikke det, EQ\'en blev beregnet ud fra.';

  @override
  String channelsRecording(String seconds) {
    return 'Optager $seconds s — afspil sweepen nu';
  }

  @override
  String get channelsNotMeasured => 'ikke målt';

  @override
  String get channelsMeasuredNoise => 'målt med støj';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · direkte lyd efter $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · direkte lyd efter $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Færdig';

  @override
  String get channelsMeasure => 'Mål';

  @override
  String get channelsAdd => 'Tilføj';

  @override
  String get channelsAgain => 'Igen';

  @override
  String get compareTitle => 'Sammenligning';

  @override
  String get compareNeedsTwoPoints => 'Sammenligning kræver mindst to punkter.';

  @override
  String get commonWithRoom => 'med rum';

  @override
  String get commonDirectSound => 'direkte lyd';

  @override
  String get compareAfterEq => 'efter EQ';

  @override
  String get compareBandsA => 'A (bånd)';

  @override
  String get compareBandsB => 'B (bånd)';

  @override
  String get compareArrivalDiff => 'Ankomstforskel A − B';

  @override
  String get compareBroadbandDiff => 'Bredbåndsniveau A − B';

  @override
  String get compareWorstBelow300 => 'Største forskel under 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB i båndet $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance og level trim udligner ankomst- og niveauforskellen. Formforskellen under 300 Hz udligner de ikke — den skyldes en anden væg i en anden afstand og løses ved at flytte tingene.';

  @override
  String get designRt60Live => 'T20 125–500 Hz fra seneste respons';

  @override
  String get designRt60Stored => 'T20 125–500 Hz fra en gemt sweep';

  @override
  String get designRt60Guess =>
      'estimat — mål en sweep, Schroeder er indtil videre kun et gæt';

  @override
  String get designExportTooltip => 'Eksportér konfiguration';

  @override
  String get designCompute => 'Beregn design';

  @override
  String get designLidarChecking => 'Undersøger, om der er LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR tilgængelig';

  @override
  String get designLidarMissing => 'Ingen LiDAR — indtast målene manuelt';

  @override
  String get designLidarHint =>
      'Scanningen giver væggene på centimeteren, så refleksionspunkter og afstande til grænseflader passer også, ikke kun modi.';

  @override
  String get designManualHint =>
      'Den modale beregning kræver kun tre tal — men du mister refleksionspunkter og præcise afstande til væggene.';

  @override
  String get designStopScan => 'Stop scanning';

  @override
  String get designScanRoom => 'Scan rummet';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls vægge',
      one: '1 væg',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings åbninger',
      one: '1 åbning',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Rummets mål';

  @override
  String get designLength => 'Længde';

  @override
  String get designWidth => 'Bredde';

  @override
  String get designHeight => 'Højde';

  @override
  String get designWhatToDo => 'Hvad du kan gøre';

  @override
  String get designRoomModes => 'Rummodi';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Over $schroeder Hz (Schroeder) giver enkelte modi ikke længere mening. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: målt, mål, forudsigelse';

  @override
  String get designEqHelp =>
      'Forudsigelsen er den målte respons plus en model af receiverens femten bånd. Når EQ\'en er indtastet, så mål kanalen igen med kontakten „efter EQ“ for at se, hvor tæt modellen var på.';

  @override
  String get designReceiverConfig => 'Receiverkonfiguration';

  @override
  String get designGeometryOnly =>
      'Uden sweepmålinger af kanalerne er der kun geometri her: afstande og delefrekvenser. EQ og niveauer kommer, når der er punkter pr. kanal.';

  @override
  String get designShareSubject => 'Konfigurationsforslag';

  @override
  String get impulseTitle => 'Impulsrespons';

  @override
  String get impulseCompareTooltip => 'Sammenlign punkter';

  @override
  String get impulseExportTooltip => 'Eksportér FRD med fase';

  @override
  String get impulseTapToStart => 'Tryk for at starte.';

  @override
  String get impulseSweepTitle => 'Den sweep, du afspiller gennem højttalerne';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Den skal passe med det, du afspiller — ellers giver dekonvolutionen nonsens.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Optager — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Afspil nu sweepen fra computeren.';

  @override
  String get impulseStartRecording =>
      'Start optagelse, og afspil derefter sweepen';

  @override
  String get impulseFrequencyResponse => 'Frekvensgang';

  @override
  String get impulseWithRoom => 'med rum (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'direkte lyd (vindue $ms ms)';
  }

  @override
  String get impulseWindow => 'Vindue';

  @override
  String impulseWindowHelp(String hz) {
    return 'Et længere vindue ser længere ned (nu gyldigt over $hz Hz), men lukker den første refleksion ind. Under grænsen hverken udglattes eller kommenteres kurven: det er vinduet, ikke rummet.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Til første refleksion ($ms ms)';
  }

  @override
  String get impulseTime => 'Tid';

  @override
  String get impulseImpulse => 'impuls';

  @override
  String get impulseTimeHelp =>
      'Blå er vinduet, den orange linje er den første fundne refleksion. Tid nul er den direkte lyd.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Skjul';

  @override
  String get commonShow => 'Vis';

  @override
  String get impulseSpectrogramHelp =>
      'Tid i ms fra den direkte lyd, frekvens opad, farven er niveau ned til −60 dB. En vandret stribe, der overlever resten, er en modus; tabellen ovenfor siger det samme i tal.';

  @override
  String get impulseDecayByOctave => 'Henfald pr. oktav';

  @override
  String get impulseMidNoT20 =>
      'Mellembåndene henfaldt ikke langt nok til T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Mellemtone 125–500 Hz: T20 $seconds s — det er den RT60, designet regner med.';
  }

  @override
  String get impulseDecayHelp =>
      'I bassen er RT60 fra en telefon mere et skøn: baggrundsstøjen ligger tættest der, og „—“ betyder, at efterklangen ikke faldt under den. C50 over nul: den direkte lyd med tidlige refleksioner bærer mere energi end efterklangen.';

  @override
  String get impulseResult => 'Resultat';

  @override
  String get impulseDirectArrived => 'Direkte lyd ankom efter';

  @override
  String get impulseDirectArrivedHelp =>
      'Afspilningsforsinkelse plus løbetid — siger intet i sig selv, men forskellen mellem venstre og højre højttaler gør.';

  @override
  String get impulseFirstReflection => 'Første refleksion';

  @override
  String get impulseNotFound => 'ikke fundet';

  @override
  String impulseAfterDirect(String time) {
    return '$time efter den direkte lyd';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Enten er der ingen, eller også gemmer den sig i den direkte impuls\' efterklingen.';

  @override
  String impulseExtraPath(String metres) {
    return 'Ekstra vej ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'kan ikke måles';

  @override
  String get impulseRt60NoiseHelp =>
      'Efterklangen faldt ikke dybt nok over støjgulvet — højere, eller på et mere stille tidspunkt.';

  @override
  String get impulseRt60Help =>
      'Forskellen mellem T20 og T30 antyder, hvor rent henfaldet er.';

  @override
  String get impulseGating => 'Vindue (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'gyldigt over $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Herunder ser vinduet ikke engang én periode — kurven er dér en artefakt af vinduet, ikke af rummet.';

  @override
  String get impulseSchroeder => 'Schroeder-henfaldskurve';

  @override
  String impulseHdAt(int order) {
    return 'HD$order ved 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmoniske ligger i den negative tid af Farina-dekonvolutionen; her aflæses de i stedet for at blive kasseret. −40 dB er 1 %.';

  @override
  String get impulseHd3Help =>
      'Den tredje harmoniske vokser hurtigere end den anden ved overstyring.';

  @override
  String get impulseDistortionHot => 'Forvrængning over −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Enten er sweepen for høj, eller også er højttaleren ved sin grænse. En forvrængningshale ligner en refleksion i impulsen — skru ned, og mål igen, før du tror på noget.';

  @override
  String get eqMeasured => 'målt';

  @override
  String get eqTarget => 'mål';

  @override
  String get eqPredicted => 'forudsigelse efter EQ';

  @override
  String get eqMeasuredAfter => 'målt efter EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Afvigelse fra mål 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Efter indtastning i receiveren';

  @override
  String get eqPredictionVsReality => 'Forudsigelse vs. virkelighed';

  @override
  String eqStubborn(String bands) {
    return 'Forbliver mere end 6 dB fra målet: $bands. Det er interferens, ikke mangel på effekt — løses ved at flytte højttaler eller lytter, ikke med mere løft.';
  }

  @override
  String get eqModelOk =>
      'Receiverens filter opfører sig nogenlunde som modellen.';

  @override
  String get eqModelOff =>
      'Receiverens faktiske filter afviger mere fra modellen end forventet — dets bånd er nok bredere eller smallere end antaget her.';

  @override
  String get eqTargetCurve => 'Målkurve';

  @override
  String get eqFlat => 'flad';

  @override
  String get eqTargetHelp =>
      'Ikke flad: over et par kHz hører øret den direkte lyd, mikrofonen lægger også refleksionerne sammen, og en udglattet målekurve lyder mat. En svag hældning i toppen og lidt bas i bunden er, hvad folk vælger ved blindlytning.';

  @override
  String get eqBassLift => 'Basløft';

  @override
  String get eqBassBelow => 'Bas under';

  @override
  String get eqTilt => 'Hældning';

  @override
  String get eqDbPerOctave => 'dB/okt.';

  @override
  String get eqTiltFrom => 'Hældning fra';

  @override
  String get errorMicPermission =>
      'Uden adgang til mikrofonen kan der ikke måles. Tillad det under Indstillinger → AudioScanner → Mikrofon.';

  @override
  String errorMic(String error) {
    return 'Mikrofon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Kunne ikke starte mikrofonen: $error';
  }

  @override
  String get errorNoArkit =>
      'Denne enhed understøtter ikke ARKit world tracking — punkter kan ikke placeres i rummet.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Optagelsen er kortere end sweepen ($recorded s af $expected s). Start optagelsen, før du afspiller signalet.';
  }

  @override
  String get sessionSnapshots => 'Øjebliksbilleder';

  @override
  String get errorTrackingUnreliable =>
      'Positionssporingen er upålidelig — punktet ville havne et andet sted, end du står.';

  @override
  String errorNoSound(int seconds) {
    return 'Der kom ingen lyd inden for $seconds s.';
  }

  @override
  String get noteSnapshotNoPose =>
      'øjebliksbillede fra analysatoren, uden position';

  @override
  String get sessionChannels => 'Kanaler';

  @override
  String get trackingOk => 'Sporing OK';

  @override
  String get trackingLimited => 'Svag sporing';

  @override
  String get trackingUnavailable => 'Ingen sporing';

  @override
  String get poseHintFeatures =>
      'For få detaljer i billedet — ret telefonen mod noget med struktur, ikke en bar væg.';

  @override
  String get poseHintMotion => 'For hurtig bevægelse — gå langsommere.';

  @override
  String get poseHintLight =>
      'For lidt lys — tænd lyset, kameraet kan ikke se, hvor det er.';

  @override
  String get poseHintInitializing => 'ARKit starter op, bevæg dig lidt.';

  @override
  String get poseHintRelocalizing =>
      'Det oprindelige punkt søges igen — gå tilbage til, hvor du startede.';

  @override
  String get signalPhonePink => 'Lyserød støj fra telefonen';

  @override
  String get signalExternalPink => 'Lyserød støj fra højttalerne';

  @override
  String get signalExternalSweep => 'Sweep fra højttalerne';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth-mikrofon: komprimering og latens ødelægger målingen. Afbryd hovedtelefonerne, og mål med den indbyggede mikrofon.';

  @override
  String get captureWarningProcessing =>
      'Systemet slog ikke signalbehandlingen fra (AGC / støjdæmpning). Målte forskelle mellem steder bliver forvrængede.';

  @override
  String get captureWarningMeasurementMode =>
      'Measurement mode kunne ikke slås til — mikrofonen har sin egen frekvenskorrektion.';

  @override
  String get captureRouteUnknown => 'ukendt';

  @override
  String get axisLength => 'længde';

  @override
  String get axisWidth => 'bredde';

  @override
  String get axisHeight => 'højde';
}
