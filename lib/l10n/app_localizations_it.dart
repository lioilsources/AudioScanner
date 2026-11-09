// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get tabScan => 'Scansione';

  @override
  String get tabMap => 'Mappa';

  @override
  String get tabResponse => 'Risposta';

  @override
  String get tabDesign => 'Progetto';

  @override
  String get tabSignals => 'Segnali';

  @override
  String get rtaSnapshotFailed => 'Istantanea non salvata.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Salvato come punto $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Salvato come punto $id (senza posizione).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punti',
      one: '1 punto',
    );
    return 'Calibrazione $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Impossibile leggere il file: $message';
  }

  @override
  String get rtaOffsetTitle => 'Offset dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Riproduci un tono a 1 kHz, leggi il livello su un fonometro e inserisci la differenza rispetto a ciò che mostra l\'analizzatore. Con un offset diverso da zero i livelli sono indicati come stima SPL; senza, restano in dBFS.';

  @override
  String get commonReset => 'Azzera';

  @override
  String get commonCancel => 'Annulla';

  @override
  String get commonSave => 'Salva';

  @override
  String get commonStop => 'Ferma';

  @override
  String get commonStartMic => 'Avvia microfono';

  @override
  String get tabAnalyzer => 'Analizzatore';

  @override
  String get rtaUnfreeze => 'Sblocca';

  @override
  String get rtaFreeze => 'Blocca';

  @override
  String get rtaPeakHold => 'Tenuta picchi';

  @override
  String get rtaMaxMinTraces => 'Tracce max / min';

  @override
  String get rtaResetTraces => 'Azzera tracce';

  @override
  String get rtaSaveAsPoint => 'Salva come punto (3 s)';

  @override
  String get rtaMicCalibration => 'Calibrazione microfono…';

  @override
  String get rtaRemoveCalibration => 'Rimuovi calibrazione';

  @override
  String get rtaOffsetMenu => 'Offset dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · senza elaborazione del segnale';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punti',
      one: '1 punto',
    );
    return 'Calibrazione $name: $_temp0, correzione $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (stima)';

  @override
  String get rtaFrozenHint =>
      'Bloccato — il microfono continua a funzionare, semplicemente non viene disegnato.';

  @override
  String get rtaRelativeHint =>
      'I livelli sono relativi (dBFS). Il contorno compare quando salvi il primo punto — è il riferimento per gli altri.';

  @override
  String get rtaReferenceHint =>
      'Barre piene = qui. Contorno = punto di riferimento.';

  @override
  String get rtaEnvelopeHint => 'Rosso = max, verde = min dall\'azzeramento.';

  @override
  String get rtaMicStopped => 'microfono fermo';

  @override
  String get rtaSilence => 'silenzio — c\'è un segnale in riproduzione?';

  @override
  String get rtaPlaceholder =>
      'Avvia il microfono e riproduci un segnale nella stanza.';

  @override
  String rtaBandsInfo(int count) {
    return '$count bande in terzi d\'ottava, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Scansione della stanza';

  @override
  String scanPointCount(int count) {
    return '$count pt.';
  }

  @override
  String get commonMicNotRunning => 'Il microfono non è attivo';

  @override
  String get scanMicNeeded =>
      'Senza di esso si misura solo la posizione, non il suono.';

  @override
  String get scanContinuous => 'Misura continua';

  @override
  String get scanContinuousHint => 'Un punto automatico ogni 0,5 m di cammino';

  @override
  String get scanMeasuring => 'Misuro…';

  @override
  String get scanMeasureHere => 'Misura qui';

  @override
  String scanPointSaved(String id, String position) {
    return 'Punto $id salvato in $position';
  }

  @override
  String get scanStartTracking => 'Avvia il tracciamento della posizione';

  @override
  String get scanStartTrackingHint =>
      'ARKit — così l\'app sa dove ti trovi nella stanza.';

  @override
  String scanPosition(String position) {
    return 'Posizione: $position m dall\'origine';
  }

  @override
  String get scanSetOriginHint =>
      'Mettiti al punto d\'ascolto e fissa l\'origine.';

  @override
  String get scanOriginHere => 'L\'origine è qui';

  @override
  String get scanNoPoints => 'Ancora nessun punto.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'dispersione 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Soggiorno';

  @override
  String get scanNewMeasurement => 'Nuova misura';

  @override
  String get scanRoomName => 'Nome della stanza';

  @override
  String get scanExcitation => 'Con cosa ecciterai la stanza';

  @override
  String get scanPhoneNoiseHint =>
      'Solo indicativo — l\'altoparlante del telefono non riproduce affatto i bassi.';

  @override
  String get scanStart => 'Inizia';

  @override
  String get mapExportTooltip => 'Esporta FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'La mappa richiede almeno due punti. Percorri la stanza misurando man mano.';

  @override
  String get mapShareText =>
      'FRD per punto (import in REW / VituixCAD) e l\'intera sessione in JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Punto più uniforme: $id a $position m (dispersione $variation dB in 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'L\'unico segnale da cui si possono calcolare la risposta all\'impulso, il tempo di riverberazione e le prime riflessioni. Riproducilo da un computer o DAC sui diffusori e lascia registrare il telefono.';

  @override
  String get signalsLength => 'Durata';

  @override
  String get signalsFrom => 'Da';

  @override
  String get signalsTo => 'A';

  @override
  String get signalsMonoNoChannel => 'Mono (senza canale)';

  @override
  String get signalsExportWav => 'Esporta WAV';

  @override
  String get signalsPinkNoise => 'Rumore rosa';

  @override
  String get signalsPinkHelp =>
      'Stessa energia in ogni ottava. Dà solo la risposta in frequenza, niente tempo né riflessioni — per un rapido «succede qualcosa qui?» basta.';

  @override
  String get signalsExportPink => 'Esporta WAV da 30 s';

  @override
  String get signalsHowTo => 'Come misurare';

  @override
  String get signalsStep1 =>
      'Riproduci il segnale dal computer sui diffusori, non dal telefono.';

  @override
  String get signalsStep2 =>
      'Regola il volume in modo che l\'analizzatore mostri circa −20 dBFS. La saturazione sembra una riflessione.';

  @override
  String get signalsStep3 =>
      'Tieni il telefono verticale a braccio teso, con il microfono verso i diffusori.';

  @override
  String get signalsStep4 =>
      'Scollega le cuffie Bluetooth — compressione e latenza rovinano la misura.';

  @override
  String get signalsNoteMono =>
      'Il mono su entrambi i diffusori insieme somma L e R, e la loro differenza sparisce nella somma. Per misurare i canali scegli un canale.';

  @override
  String get signalsNoteStereo =>
      'File stereo con il segnale su un solo canale — lo riproduce qualsiasi cosa suoni in stereo.';

  @override
  String get signalsNoteChannel =>
      'File mono con il nome del canale. Instradalo sull\'ingresso giusto del sintoamplificatore da una DAW o tramite un ingresso multicanale; un portatile con uscita stereo non lo porterà su questo canale.';

  @override
  String get channelsTitle => 'Misura dei canali';

  @override
  String get channelsHelp =>
      'Mettiti al punto d\'ascolto. Per ogni canale: avvia la registrazione, riproduci uno sweep dalla scheda Segnali, tocca Fatto. Senza questi punti il progetto non ha da cosa ricavare EQ e livelli.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Verifica dopo l\'inserimento dell\'EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Il punto viene salvato come «dopo EQ» e non sovrascrive quello da cui è stato calcolato l\'EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Registro $seconds s — riproduci ora lo sweep';
  }

  @override
  String get channelsNotMeasured => 'non misurato';

  @override
  String get channelsMeasuredNoise => 'misurato con rumore';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · suono diretto dopo $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · suono diretto dopo $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Fatto';

  @override
  String get channelsMeasure => 'Misura';

  @override
  String get channelsAdd => 'Aggiungi';

  @override
  String get channelsAgain => 'Rifai';

  @override
  String get compareTitle => 'Confronto';

  @override
  String get compareNeedsTwoPoints => 'Il confronto richiede almeno due punti.';

  @override
  String get commonWithRoom => 'con la stanza';

  @override
  String get commonDirectSound => 'suono diretto';

  @override
  String get compareAfterEq => 'dopo EQ';

  @override
  String get compareBandsA => 'A (bande)';

  @override
  String get compareBandsB => 'B (bande)';

  @override
  String get compareArrivalDiff => 'Differenza di arrivo A − B';

  @override
  String get compareBroadbandDiff => 'Livello a banda larga A − B';

  @override
  String get compareWorstBelow300 => 'Massima differenza sotto 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB nella banda $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance e level trim compensano la differenza di arrivo e di livello. Non compensano la differenza di forma sotto 300 Hz — quella la fa un\'altra parete a un\'altra distanza e si risolve spostando.';

  @override
  String get designRt60Live => 'T20 125–500 Hz dall\'ultima risposta';

  @override
  String get designRt60Stored => 'T20 125–500 Hz da uno sweep salvato';

  @override
  String get designRt60Guess =>
      'stima — misura uno sweep, Schroeder per ora è solo un\'indicazione';

  @override
  String get designExportTooltip => 'Esporta configurazione';

  @override
  String get designCompute => 'Calcola progetto';

  @override
  String get designLidarChecking => 'Verifico se c\'è il LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR disponibile';

  @override
  String get designLidarMissing => 'Niente LiDAR — inserisci le misure a mano';

  @override
  String get designLidarHint =>
      'La scansione rileva le pareti al centimetro, quindi tornano anche i punti di riflessione e le distanze dai confini, non solo i modi.';

  @override
  String get designManualHint =>
      'Il calcolo modale richiede solo tre numeri — ma perdi i punti di riflessione e le distanze esatte dalle pareti.';

  @override
  String get designStopScan => 'Termina scansione';

  @override
  String get designScanRoom => 'Scansiona la stanza';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls pareti',
      one: '1 parete',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings aperture',
      one: '1 apertura',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Dimensioni della stanza';

  @override
  String get designLength => 'Lunghezza';

  @override
  String get designWidth => 'Larghezza';

  @override
  String get designHeight => 'Altezza';

  @override
  String get designWhatToDo => 'Cosa fare';

  @override
  String get designRoomModes => 'Modi della stanza';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Sopra $schroeder Hz (Schroeder) i singoli modi non hanno più senso. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: misurato, obiettivo, previsione';

  @override
  String get designEqHelp =>
      'La previsione è la risposta misurata più un modello delle quindici bande del sintoamplificatore. Dopo aver inserito l\'EQ, rimisura il canale con l\'interruttore «dopo EQ» per vedere quanto era vicino il modello.';

  @override
  String get designReceiverConfig => 'Configurazione del sintoamplificatore';

  @override
  String get designGeometryOnly =>
      'Senza misure dei canali con sweep qui c\'è solo la geometria: distanze e frequenze di crossover. EQ e livelli arriveranno quando ci saranno punti per canale.';

  @override
  String get designShareSubject => 'Proposta di configurazione';

  @override
  String get impulseTitle => 'Risposta all\'impulso';

  @override
  String get impulseCompareTooltip => 'Confronta punti';

  @override
  String get impulseExportTooltip => 'Esporta FRD con fase';

  @override
  String get impulseTapToStart => 'Tocca per avviare.';

  @override
  String get impulseSweepTitle => 'Lo sweep che riproduci sui diffusori';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Deve corrispondere a ciò che riproduci — altrimenti la deconvoluzione restituisce assurdità.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Registro — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Ora riproduci lo sweep dal computer.';

  @override
  String get impulseStartRecording =>
      'Avvia la registrazione, poi riproduci lo sweep';

  @override
  String get impulseFrequencyResponse => 'Risposta in frequenza';

  @override
  String get impulseWithRoom => 'con la stanza (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'suono diretto (finestra $ms ms)';
  }

  @override
  String get impulseWindow => 'Finestra';

  @override
  String impulseWindowHelp(String hz) {
    return 'Una finestra più lunga vede più in basso (ora valida sopra $hz Hz), ma lascia entrare la prima riflessione. Sotto il limite la curva non viene né smussata né commentata: è la finestra, non la stanza.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Fino alla prima riflessione ($ms ms)';
  }

  @override
  String get impulseTime => 'Tempo';

  @override
  String get impulseImpulse => 'impulso';

  @override
  String get impulseTimeHelp =>
      'In blu la finestra, la linea arancione è la prima riflessione trovata. Il tempo zero è il suono diretto.';

  @override
  String get impulseSpectrogram => 'Spettrogramma';

  @override
  String get commonHide => 'Nascondi';

  @override
  String get commonShow => 'Mostra';

  @override
  String get impulseSpectrogramHelp =>
      'Tempo in ms dal suono diretto, frequenza verso l\'alto, il colore è il livello fino a −60 dB. Una striscia orizzontale che sopravvive alle altre è un modo; la tabella sopra dice lo stesso in numeri.';

  @override
  String get impulseDecayByOctave => 'Decadimento per ottava';

  @override
  String get impulseMidNoT20 =>
      'Le bande medie non sono decadute abbastanza per T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Medie 125–500 Hz: T20 $seconds s — è l\'RT60 su cui si basa il progetto.';
  }

  @override
  String get impulseDecayHelp =>
      'Sui bassi l\'RT60 dal telefono è più una stima: lì il rumore di fondo è più vicino e «—» significa che la riverberazione non è scesa sotto di esso. C50 sopra zero: il suono diretto con le prime riflessioni porta più energia della riverberazione.';

  @override
  String get impulseResult => 'Risultato';

  @override
  String get impulseDirectArrived => 'Il suono diretto è arrivato dopo';

  @override
  String get impulseDirectArrivedHelp =>
      'Ritardo di riproduzione più tempo di volo — da solo non dice nulla, ma la differenza tra diffusore sinistro e destro sì.';

  @override
  String get impulseFirstReflection => 'Prima riflessione';

  @override
  String get impulseNotFound => 'non trovata';

  @override
  String impulseAfterDirect(String time) {
    return '$time dopo il suono diretto';
  }

  @override
  String get impulseNoReflectionHelp =>
      'O non ce n\'è nessuna, o si nasconde nel ringing dell\'impulso diretto.';

  @override
  String impulseExtraPath(String metres) {
    return 'Percorso in più ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'non misurabile';

  @override
  String get impulseRt60NoiseHelp =>
      'La riverberazione non è scesa abbastanza sopra il rumore di fondo — più forte, o in un momento più silenzioso.';

  @override
  String get impulseRt60Help =>
      'La differenza tra T20 e T30 indica quanto è pulito il decadimento.';

  @override
  String get impulseGating => 'Finestra (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'valida sopra $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Sotto questo valore la finestra non vede nemmeno un periodo — lì la curva è un artefatto della finestra, non della stanza.';

  @override
  String get impulseSchroeder => 'Curva di decadimento di Schroeder';

  @override
  String impulseHdAt(int order) {
    return 'HD$order a 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Le armoniche si trovano nel tempo negativo della deconvoluzione di Farina; qui vengono lette invece di essere scartate. −40 dB è l\'1 %.';

  @override
  String get impulseHd3Help =>
      'La terza armonica cresce con la saturazione più rapidamente della seconda.';

  @override
  String get impulseDistortionHot => 'Distorsione sopra −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'O lo sweep è troppo forte, o il diffusore è al limite. Una coda di distorsione sembra una riflessione nell\'impulso — abbassa il volume e rimisura prima di credere a qualcosa.';

  @override
  String get eqMeasured => 'misurato';

  @override
  String get eqTarget => 'obiettivo';

  @override
  String get eqPredicted => 'previsione dopo EQ';

  @override
  String get eqMeasuredAfter => 'misurato dopo EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Scostamento dall\'obiettivo 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Dopo l\'inserimento nel sintoamplificatore';

  @override
  String get eqPredictionVsReality => 'Previsione vs realtà';

  @override
  String eqStubborn(String bands) {
    return 'Resta a più di 6 dB dall\'obiettivo: $bands. È interferenza, non mancanza di potenza — si risolve spostando il diffusore o l\'ascoltatore, non con altra enfasi.';
  }

  @override
  String get eqModelOk =>
      'Il filtro del sintoamplificatore si comporta più o meno come il modello.';

  @override
  String get eqModelOff =>
      'Il filtro reale del sintoamplificatore si discosta dal modello più del previsto — le sue bande sono probabilmente più larghe o più strette di quanto qui ipotizzato.';

  @override
  String get eqTargetCurve => 'Curva obiettivo';

  @override
  String get eqFlat => 'piatta';

  @override
  String get eqTargetHelp =>
      'Non piatta: sopra qualche kHz l\'orecchio sente il suono diretto, il microfono somma anche le riflessioni, e una curva misurata appiattita suona spenta. Una leggera pendenza in alto e un po\' di bassi in basso è ciò che la gente sceglie negli ascolti alla cieca.';

  @override
  String get eqBassLift => 'Enfasi bassi';

  @override
  String get eqBassBelow => 'Bassi sotto';

  @override
  String get eqTilt => 'Pendenza';

  @override
  String get eqDbPerOctave => 'dB/ott';

  @override
  String get eqTiltFrom => 'Pendenza da';

  @override
  String get errorMicPermission =>
      'Senza accesso al microfono non si può misurare. Consentilo in Impostazioni → AudioScanner → Microfono.';

  @override
  String errorMic(String error) {
    return 'Microfono: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Impossibile avviare il microfono: $error';
  }

  @override
  String get errorNoArkit =>
      'Questo dispositivo non supporta il world tracking ARKit — i punti non possono essere collocati nello spazio.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'La registrazione è più corta dello sweep ($recorded s su $expected s). Avvia la registrazione prima di riprodurre il segnale.';
  }

  @override
  String get sessionSnapshots => 'Istantanee';

  @override
  String get errorTrackingUnreliable =>
      'Il tracciamento della posizione non è affidabile — il punto finirebbe altrove rispetto a dove sei.';

  @override
  String errorNoSound(int seconds) {
    return 'Nessun suono arrivato in $seconds s.';
  }

  @override
  String get noteSnapshotNoPose =>
      'istantanea dall\'analizzatore, senza posizione';

  @override
  String get sessionChannels => 'Canali';

  @override
  String get trackingOk => 'Tracciamento OK';

  @override
  String get trackingLimited => 'Tracciamento debole';

  @override
  String get trackingUnavailable => 'Nessun tracciamento';

  @override
  String get poseHintFeatures =>
      'Pochi dettagli nell\'immagine — punta il telefono su qualcosa di articolato, non su una parete spoglia.';

  @override
  String get poseHintMotion => 'Movimento troppo rapido — cammina più piano.';

  @override
  String get poseHintLight =>
      'Poca luce — accendi, la fotocamera non vede dov\'è.';

  @override
  String get poseHintInitializing => 'ARKit si sta avviando, muoviti un po\'.';

  @override
  String get poseHintRelocalizing =>
      'Sto ritrovando il punto originale — torna dove hai iniziato.';

  @override
  String get signalPhonePink => 'Rumore rosa dal telefono';

  @override
  String get signalExternalPink => 'Rumore rosa dai diffusori';

  @override
  String get signalExternalSweep => 'Sweep dai diffusori';

  @override
  String get captureWarningBluetooth =>
      'Microfono Bluetooth: compressione e latenza rovinano la misura. Scollega le cuffie e misura con il microfono integrato.';

  @override
  String get captureWarningProcessing =>
      'Il sistema non ha disattivato l\'elaborazione del segnale (AGC / soppressione del rumore). Le differenze misurate tra i punti saranno falsate.';

  @override
  String get captureWarningMeasurementMode =>
      'Impossibile attivare il measurement mode — il microfono applica una propria correzione della risposta in frequenza.';

  @override
  String get captureRouteUnknown => 'sconosciuto';

  @override
  String get axisLength => 'lunghezza';

  @override
  String get axisWidth => 'larghezza';

  @override
  String get axisHeight => 'altezza';
}
