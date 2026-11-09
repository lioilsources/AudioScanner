// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian Bokmål (`nb`).
class AppLocalizationsNb extends AppLocalizations {
  AppLocalizationsNb([String locale = 'nb']) : super(locale);

  @override
  String get tabScan => 'Skann';

  @override
  String get tabMap => 'Kart';

  @override
  String get tabResponse => 'Respons';

  @override
  String get tabDesign => 'Design';

  @override
  String get tabSignals => 'Signaler';

  @override
  String get rtaSnapshotFailed => 'Øyeblikksbildet ble ikke lagret.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Lagret som punkt $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Lagret som punkt $id (uten posisjon).';
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
    return 'Filen kan ikke leses: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL-offset';

  @override
  String get rtaOffsetHelp =>
      'Spill av en tone på 1 kHz, les av nivået på en lydnivåmåler og skriv inn forskjellen fra det analysatoren viser. Med en offset ulik null markeres nivåene som SPL-anslag; uten den forblir de i dBFS.';

  @override
  String get commonReset => 'Nullstill';

  @override
  String get commonCancel => 'Avbryt';

  @override
  String get commonSave => 'Lagre';

  @override
  String get commonStop => 'Stopp';

  @override
  String get commonStartMic => 'Start mikrofonen';

  @override
  String get tabAnalyzer => 'Analysator';

  @override
  String get rtaUnfreeze => 'Fortsett';

  @override
  String get rtaFreeze => 'Frys';

  @override
  String get rtaPeakHold => 'Peak hold';

  @override
  String get rtaMaxMinTraces => 'Maks-/minkurver';

  @override
  String get rtaResetTraces => 'Nullstill kurver';

  @override
  String get rtaSaveAsPoint => 'Lagre som punkt (3 s)';

  @override
  String get rtaMicCalibration => 'Mikrofonkalibrering…';

  @override
  String get rtaRemoveCalibration => 'Fjern kalibrering';

  @override
  String get rtaOffsetMenu => 'dB SPL-offset…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · uten signalbehandling';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punkter',
      one: '1 punkt',
    );
    return 'Kalibrering $name: $_temp0, korreksjon $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (anslag)';

  @override
  String get rtaFrozenHint =>
      'Fryst — mikrofonen går videre, det tegnes bare ikke.';

  @override
  String get rtaRelativeHint =>
      'Nivåene er relative (dBFS). Omrisset vises når du lagrer det første punktet — det er referansen for resten.';

  @override
  String get rtaReferenceHint => 'Fylte søyler = her. Omriss = referansepunkt.';

  @override
  String get rtaEnvelopeHint => 'Rød = maks, grønn = min siden nullstilling.';

  @override
  String get rtaMicStopped => 'mikrofonen står stille';

  @override
  String get rtaSilence => 'stille — spilles det et signal?';

  @override
  String get rtaPlaceholder =>
      'Start mikrofonen og spill av et signal i rommet.';

  @override
  String rtaBandsInfo(int count) {
    return '$count tersbånd, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Romskanning';

  @override
  String scanPointCount(int count) {
    return '$count pkt.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofonen er ikke i gang';

  @override
  String get scanMicNeeded => 'Uten den måles bare posisjonen, ikke lyden.';

  @override
  String get scanContinuous => 'Løpende måling';

  @override
  String get scanContinuousHint => 'Et punkt automatisk for hver 0,5 m du går';

  @override
  String get scanMeasuring => 'Måler…';

  @override
  String get scanMeasureHere => 'Mål her';

  @override
  String scanPointSaved(String id, String position) {
    return 'Punkt $id lagret ved $position';
  }

  @override
  String get scanStartTracking => 'Start posisjonssporing';

  @override
  String get scanStartTrackingHint =>
      'ARKit — slik vet appen hvor du står i rommet.';

  @override
  String scanPosition(String position) {
    return 'Posisjon: $position m fra origo';
  }

  @override
  String get scanSetOriginHint => 'Still deg på lytteplassen og sett origo.';

  @override
  String get scanOriginHere => 'Her er origo';

  @override
  String get scanNoPoints => 'Ingen punkter ennå.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'spredning 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Stue';

  @override
  String get scanNewMeasurement => 'Ny måling';

  @override
  String get scanRoomName => 'Navn på rommet';

  @override
  String get scanExcitation => 'Hva du skal eksitere rommet med';

  @override
  String get scanPhoneNoiseHint =>
      'Bare veiledende — telefonhøyttaleren gjengir ingen bass i det hele tatt.';

  @override
  String get scanStart => 'Start';

  @override
  String get mapExportTooltip => 'Eksporter FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Kartet trenger minst to punkter. Gå gjennom rommet og mål underveis.';

  @override
  String get mapShareText =>
      'FRD per punkt (import i REW / VituixCAD) og hele økten som JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Jevneste sted: $id ved $position m (spredning $variation dB i 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Det eneste signalet impulsrespons, etterklangstid og første refleksjoner kan regnes ut fra. Spill det fra en datamaskin eller DAC gjennom høyttalerne og la telefonen ta opp.';

  @override
  String get signalsLength => 'Lengde';

  @override
  String get signalsFrom => 'Fra';

  @override
  String get signalsTo => 'Til';

  @override
  String get signalsMonoNoChannel => 'Mono (uten kanal)';

  @override
  String get signalsExportWav => 'Eksporter WAV';

  @override
  String get signalsPinkNoise => 'Rosa støy';

  @override
  String get signalsPinkHelp =>
      'Lik energi i hver oktav. Gir bare frekvensresponsen, ingen tid eller refleksjoner — nok til et raskt «skjer det noe her?».';

  @override
  String get signalsExportPink => 'Eksporter 30 s WAV';

  @override
  String get signalsHowTo => 'Slik måler du';

  @override
  String get signalsStep1 =>
      'Spill signalet fra en datamaskin gjennom høyttalerne, ikke fra telefonen.';

  @override
  String get signalsStep2 =>
      'Still volumet slik at analysatoren viser rundt −20 dBFS. Overstyring ser ut som en refleksjon.';

  @override
  String get signalsStep3 =>
      'Hold telefonen loddrett på strak arm, med mikrofonen mot høyttalerne.';

  @override
  String get signalsStep4 =>
      'Koble fra Bluetooth-hodetelefoner — komprimering og forsinkelse ødelegger målingen.';

  @override
  String get signalsNoteMono =>
      'Mono til begge høyttalerne samtidig summerer L og R, og forskjellen forsvinner i summen. Velg en kanal for å måle kanaler.';

  @override
  String get signalsNoteStereo =>
      'Stereofil med signal i bare én kanal — alt som spiller stereo, kan spille den.';

  @override
  String get signalsNoteChannel =>
      'Monofil oppkalt etter kanalen. Send den til riktig receiverinngang fra en DAW eller via en flerkanalsinngang; en bærbar med stereoutgang får den ikke ut på denne kanalen.';

  @override
  String get channelsTitle => 'Kanalmåling';

  @override
  String get channelsHelp =>
      'Still deg på lytteplassen. For hver kanal: start opptaket, spill en sweep i den fra fanen Signaler, og trykk på Ferdig. Uten disse punktene har designet ingenting å regne EQ og nivåer ut fra.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Kontroll etter at EQ er lagt inn';

  @override
  String get channelsVerifyAfterEqHint =>
      'Punktet lagres som «etter EQ» og overskriver ikke det EQ-en ble regnet ut fra.';

  @override
  String channelsRecording(String seconds) {
    return 'Tar opp $seconds s — spill sweepen nå';
  }

  @override
  String get channelsNotMeasured => 'ikke målt';

  @override
  String get channelsMeasuredNoise => 'målt med støy';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · direktelyd etter $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · direktelyd etter $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Ferdig';

  @override
  String get channelsMeasure => 'Mål';

  @override
  String get channelsAdd => 'Legg til';

  @override
  String get channelsAgain => 'På nytt';

  @override
  String get compareTitle => 'Sammenligning';

  @override
  String get compareNeedsTwoPoints =>
      'Sammenligningen trenger minst to punkter.';

  @override
  String get commonWithRoom => 'med rom';

  @override
  String get commonDirectSound => 'direktelyd';

  @override
  String get compareAfterEq => 'etter EQ';

  @override
  String get compareBandsA => 'A (bånd)';

  @override
  String get compareBandsB => 'B (bånd)';

  @override
  String get compareArrivalDiff => 'Ankomstforskjell A − B';

  @override
  String get compareBroadbandDiff => 'Bredbåndsnivå A − B';

  @override
  String get compareWorstBelow300 => 'Største forskjell under 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB i båndet $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance og level trim jevner ut ankomst- og nivåforskjellen. Formforskjellen under 300 Hz jevner de ikke ut — den kommer fra en annen vegg på en annen avstand og løses ved å flytte ting.';

  @override
  String get designRt60Live => 'T20 125–500 Hz fra siste respons';

  @override
  String get designRt60Stored => 'T20 125–500 Hz fra en lagret sweep';

  @override
  String get designRt60Guess =>
      'anslag — mål en sweep, Schroeder er foreløpig bare et tips';

  @override
  String get designExportTooltip => 'Eksporter konfigurasjon';

  @override
  String get designCompute => 'Beregn design';

  @override
  String get designLidarChecking => 'Sjekker om det finnes LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR tilgjengelig';

  @override
  String get designLidarMissing => 'Ingen LiDAR — legg inn målene for hånd';

  @override
  String get designLidarHint =>
      'Skanningen gir veggene på centimeteren, så også refleksjonspunkter og avstander til grenseflater stemmer, ikke bare modene.';

  @override
  String get designManualHint =>
      'Den modale beregningen trenger bare tre tall — men du mister refleksjonspunkter og nøyaktige avstander til veggene.';

  @override
  String get designStopScan => 'Avslutt skanning';

  @override
  String get designScanRoom => 'Skann rommet';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls vegger',
      one: '1 vegg',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings åpninger',
      one: '1 åpning',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Rommets mål';

  @override
  String get designLength => 'Lengde';

  @override
  String get designWidth => 'Bredde';

  @override
  String get designHeight => 'Høyde';

  @override
  String get designWhatToDo => 'Hva du kan gjøre';

  @override
  String get designRoomModes => 'Romresonanser';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Over $schroeder Hz (Schroeder) gir enkeltmoder ikke lenger mening. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: målt, mål, prognose';

  @override
  String get designEqHelp =>
      'Prognosen er den målte responsen pluss en modell av receiverens femten bånd. Mål kanalen på nytt med bryteren «etter EQ» når EQ-en er lagt inn, så ser du hvor nær modellen var.';

  @override
  String get designReceiverConfig => 'Receiverkonfigurasjon';

  @override
  String get designGeometryOnly =>
      'Uten sweepmålinger av kanalene er det bare geometri her: avstander og delefrekvenser. EQ og nivåer kommer når det finnes punkter per kanal.';

  @override
  String get designShareSubject => 'Konfigurasjonsforslag';

  @override
  String get impulseTitle => 'Impulsrespons';

  @override
  String get impulseCompareTooltip => 'Sammenlign punkter';

  @override
  String get impulseExportTooltip => 'Eksporter FRD med fase';

  @override
  String get impulseTapToStart => 'Trykk for å starte.';

  @override
  String get impulseSweepTitle => 'Sweepen du spiller gjennom høyttalerne';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Den må stemme med det du spiller — ellers gir dekonvolusjonen tull.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Tar opp — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Spill nå sweepen fra datamaskinen.';

  @override
  String get impulseStartRecording => 'Start opptak, spill så sweepen';

  @override
  String get impulseFrequencyResponse => 'Frekvensrespons';

  @override
  String get impulseWithRoom => 'med rom (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'direktelyd (vindu $ms ms)';
  }

  @override
  String get impulseWindow => 'Vindu';

  @override
  String impulseWindowHelp(String hz) {
    return 'Et lengre vindu ser lenger ned (nå gyldig over $hz Hz), men slipper inn den første refleksjonen. Under grensen verken glattes eller kommenteres kurven: det er vinduet, ikke rommet.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Til første refleksjon ($ms ms)';
  }

  @override
  String get impulseTime => 'Tid';

  @override
  String get impulseImpulse => 'impuls';

  @override
  String get impulseTimeHelp =>
      'Blått er vinduet, den oransje linjen den første refleksjonen som ble funnet. Tid null er direktelyden.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Skjul';

  @override
  String get commonShow => 'Vis';

  @override
  String get impulseSpectrogramHelp =>
      'Tid i ms fra direktelyden, frekvens oppover, fargen er nivå ned til −60 dB. En vannrett stripe som overlever resten, er en mode; tabellen over sier det samme med tall.';

  @override
  String get impulseDecayByOctave => 'Utklinging per oktav';

  @override
  String get impulseMidNoT20 => 'Mellombåndene klinget ikke ut nok for T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Mellomtone 125–500 Hz: T20 $seconds s — det er RT60-en designet regner med.';
  }

  @override
  String get impulseDecayHelp =>
      'I bassen er RT60 fra en telefon mer et anslag: bakgrunnsstøyen ligger nærmest der, og «—» betyr at etterklangen ikke sank under den. C50 over null: direktelyden med tidlige refleksjoner bærer mer energi enn etterklangen.';

  @override
  String get impulseResult => 'Resultat';

  @override
  String get impulseDirectArrived => 'Direktelyden kom etter';

  @override
  String get impulseDirectArrivedHelp =>
      'Avspillingsforsinkelse pluss gangtid — sier ingenting alene, men forskjellen mellom venstre og høyre høyttaler gjør det.';

  @override
  String get impulseFirstReflection => 'Første refleksjon';

  @override
  String get impulseNotFound => 'ikke funnet';

  @override
  String impulseAfterDirect(String time) {
    return '$time etter direktelyden';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Enten finnes det ingen, eller så skjuler den seg i etterringingen fra direkteimpulsen.';

  @override
  String impulseExtraPath(String metres) {
    return 'Ekstra vei ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'kan ikke måles';

  @override
  String get impulseRt60NoiseHelp =>
      'Etterklangen sank ikke dypt nok over støygulvet — høyere, eller på et roligere tidspunkt.';

  @override
  String get impulseRt60Help =>
      'Forskjellen mellom T20 og T30 antyder hvor ren utklingingen er.';

  @override
  String get impulseGating => 'Vindu (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'gyldig over $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Under dette ser vinduet ikke engang én periode — kurven der er en artefakt av vinduet, ikke av rommet.';

  @override
  String get impulseSchroeder => 'Schroeders utklingingskurve';

  @override
  String impulseHdAt(int order) {
    return 'HD$order ved 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmoniske ligger i den negative tiden i Farina-dekonvolusjonen; her leses de derfra i stedet for å kastes. −40 dB er 1 %.';

  @override
  String get impulseHd3Help =>
      'Den tredje harmoniske vokser raskere enn den andre ved overstyring.';

  @override
  String get impulseDistortionHot => 'Forvrengning over −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Enten er sweepen for høy, eller så er høyttaleren ved grensen. En forvrengningshale ser ut som en refleksjon i impulsen — skru ned og mål på nytt før du tror på noe.';

  @override
  String get eqMeasured => 'målt';

  @override
  String get eqTarget => 'mål';

  @override
  String get eqPredicted => 'prognose etter EQ';

  @override
  String get eqMeasuredAfter => 'målt etter EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Avvik fra målet 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Etter innlegging i receiveren';

  @override
  String get eqPredictionVsReality => 'Prognose vs. virkelighet';

  @override
  String eqStubborn(String bands) {
    return 'Blir liggende mer enn 6 dB fra målet: $bands. Det er interferens, ikke mangel på effekt — løses ved å flytte høyttaleren eller lytteren, ikke med mer løft.';
  }

  @override
  String get eqModelOk =>
      'Receiverens filter oppfører seg omtrent som modellen.';

  @override
  String get eqModelOff =>
      'Receiverens faktiske filter avviker mer fra modellen enn ventet — båndene er trolig bredere eller smalere enn det som antas her.';

  @override
  String get eqTargetCurve => 'Målkurve';

  @override
  String get eqFlat => 'flat';

  @override
  String get eqTargetHelp =>
      'Ikke flat: over noen kHz hører øret direktelyden, mikrofonen summerer også refleksjonene, og en utjevnet målekurve låter matt. En svak helning øverst og litt bass nederst er det folk velger i blindtester.';

  @override
  String get eqBassLift => 'Bassløft';

  @override
  String get eqBassBelow => 'Bass under';

  @override
  String get eqTilt => 'Helning';

  @override
  String get eqDbPerOctave => 'dB/okt';

  @override
  String get eqTiltFrom => 'Helning fra';

  @override
  String get errorMicPermission =>
      'Uten tilgang til mikrofonen kan det ikke måles. Tillat den under Innstillinger → AudioScanner → Mikrofon.';

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
      'Denne enheten støtter ikke ARKit world tracking — punkter kan ikke plasseres i rommet.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Opptaket er kortere enn sweepen ($recorded s av $expected s). Start opptaket før du spiller signalet.';
  }

  @override
  String get sessionSnapshots => 'Øyeblikksbilder';

  @override
  String get errorTrackingUnreliable =>
      'Posisjonssporingen er upålitelig — punktet ville havnet et annet sted enn der du står.';

  @override
  String errorNoSound(int seconds) {
    return 'Det kom ingen lyd innen $seconds s.';
  }

  @override
  String get noteSnapshotNoPose =>
      'øyeblikksbilde fra analysatoren, uten posisjon';

  @override
  String get sessionChannels => 'Kanaler';

  @override
  String get trackingOk => 'Sporing OK';

  @override
  String get trackingLimited => 'Svak sporing';

  @override
  String get trackingUnavailable => 'Ingen sporing';

  @override
  String get poseHintFeatures =>
      'For få detaljer i bildet — rett telefonen mot noe med struktur, ikke en bar vegg.';

  @override
  String get poseHintMotion => 'For rask bevegelse — gå saktere.';

  @override
  String get poseHintLight =>
      'For lite lys — slå på lyset, kameraet ser ikke hvor det er.';

  @override
  String get poseHintInitializing => 'ARKit starter, beveg deg litt.';

  @override
  String get poseHintRelocalizing =>
      'Leter etter det opprinnelige punktet igjen — gå tilbake dit du startet.';

  @override
  String get signalPhonePink => 'Rosa støy fra telefonen';

  @override
  String get signalExternalPink => 'Rosa støy fra høyttalerne';

  @override
  String get signalExternalSweep => 'Sweep fra høyttalerne';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth-mikrofon: komprimering og forsinkelse ødelegger målingen. Koble fra hodetelefonene og mål med den innebygde mikrofonen.';

  @override
  String get captureWarningProcessing =>
      'Systemet slo ikke av signalbehandlingen (AGC / støydemping). Målte forskjeller mellom steder blir forvrengt.';

  @override
  String get captureWarningMeasurementMode =>
      'Measurement mode kunne ikke slås på — mikrofonen har sin egen frekvenskorreksjon.';

  @override
  String get captureRouteUnknown => 'ukjent';

  @override
  String get axisLength => 'lengde';

  @override
  String get axisWidth => 'bredde';

  @override
  String get axisHeight => 'høyde';
}
