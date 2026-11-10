// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Catalan Valencian (`ca`).
class AppLocalizationsCa extends AppLocalizations {
  AppLocalizationsCa([String locale = 'ca']) : super(locale);

  @override
  String get tabScan => 'Escaneig';

  @override
  String get tabMap => 'Mapa';

  @override
  String get tabResponse => 'Resposta';

  @override
  String get tabDesign => 'Disseny';

  @override
  String get tabSignals => 'Senyals';

  @override
  String get rtaSnapshotFailed => 'No s\'ha desat la captura.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Desat com a punt $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Desat com a punt $id (sense posició).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punts',
      one: '1 punt',
    );
    return 'Calibratge $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'No es pot llegir el fitxer: $message';
  }

  @override
  String get rtaOffsetTitle => 'Desplaçament dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Reprodueix un to d\'1 kHz, llegeix el nivell en un sonòmetre i introdueix la diferència respecte del que mostra l\'analitzador. Amb un desplaçament diferent de zero, els nivells es marquen com a estimació SPL; sense, es queden en dBFS.';

  @override
  String get commonReset => 'Restableix';

  @override
  String get commonCancel => 'Cancel·la';

  @override
  String get commonSave => 'Desa';

  @override
  String get commonStop => 'Atura';

  @override
  String get commonStartMic => 'Inicia el micròfon';

  @override
  String get tabAnalyzer => 'Analitzador';

  @override
  String get rtaUnfreeze => 'Reprèn';

  @override
  String get rtaFreeze => 'Congela';

  @override
  String get rtaPeakHold => 'Retenció de pics';

  @override
  String get rtaMaxMinTraces => 'Traces màx. / mín.';

  @override
  String get rtaResetTraces => 'Restableix les traces';

  @override
  String get rtaSaveAsPoint => 'Desa com a punt (3 s)';

  @override
  String get rtaMicCalibration => 'Calibratge del micròfon…';

  @override
  String get rtaRemoveCalibration => 'Elimina el calibratge';

  @override
  String get rtaOffsetMenu => 'Desplaçament dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · sense processament del senyal';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punts',
      one: '1 punt',
    );
    return 'Calibratge $name: $_temp0, correcció $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (estimació)';

  @override
  String get rtaFrozenHint =>
      'Congelat — el micròfon continua funcionant, només no es dibuixa.';

  @override
  String get rtaRelativeHint =>
      'Els nivells són relatius (dBFS). El contorn apareix quan desis el primer punt — és la referència per a la resta.';

  @override
  String get rtaReferenceHint =>
      'Barres plenes = aquí. Contorn = punt de referència.';

  @override
  String get rtaEnvelopeHint =>
      'Vermell = màx., verd = mín. des del restabliment.';

  @override
  String get rtaMicStopped => 'micròfon aturat';

  @override
  String get rtaSilence => 'silenci — sona algun senyal?';

  @override
  String get rtaPlaceholder =>
      'Inicia el micròfon i reprodueix un senyal a la sala.';

  @override
  String rtaBandsInfo(int count) {
    return '$count bandes de terç d\'octava, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Escaneig de la sala';

  @override
  String scanPointCount(int count) {
    return '$count pts';
  }

  @override
  String get commonMicNotRunning => 'El micròfon no funciona';

  @override
  String get scanMicNeeded => 'Sense ell només es mesura la posició, no el so.';

  @override
  String get scanContinuous => 'Mesura contínua';

  @override
  String get scanContinuousHint => 'Un punt automàtic cada 0,5 m de recorregut';

  @override
  String get scanMeasuring => 'Mesurant…';

  @override
  String get scanMeasureHere => 'Mesura aquí';

  @override
  String scanPointSaved(String id, String position) {
    return 'Punt $id desat a $position';
  }

  @override
  String get scanStartTracking => 'Inicia el seguiment de posició';

  @override
  String get scanStartTrackingHint =>
      'ARKit — així sap l\'app on ets a la sala.';

  @override
  String scanPosition(String position) {
    return 'Posició: $position m des de l\'origen';
  }

  @override
  String get scanSetOriginHint =>
      'Posa\'t al punt d\'escolta i fixa l\'origen.';

  @override
  String get scanOriginHere => 'L\'origen és aquí';

  @override
  String get scanNoPoints => 'Encara no hi ha cap punt.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'dispersió 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Sala d\'estar';

  @override
  String get scanNewMeasurement => 'Mesura nova';

  @override
  String get scanRoomName => 'Nom de la sala';

  @override
  String get scanExcitation => 'Amb què excitaràs la sala';

  @override
  String get scanPhoneNoiseHint =>
      'Només orientatiu — l\'altaveu del telèfon no reprodueix gens de greus.';

  @override
  String get scanStart => 'Comença';

  @override
  String get mapExportTooltip => 'Exporta FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'El mapa necessita com a mínim dos punts. Recorre la sala i mesura sobre la marxa.';

  @override
  String get mapShareText =>
      'FRD per punt (importació a REW / VituixCAD) i tota la sessió en JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Punt més uniforme: $id a $position m (dispersió $variation dB a 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'L\'únic senyal amb què es pot calcular la resposta a l\'impuls, el temps de reverberació i les primeres reflexions. Reprodueix-lo des d\'un ordinador o DAC pels altaveus i deixa que el telèfon enregistri.';

  @override
  String get signalsLength => 'Durada';

  @override
  String get signalsFrom => 'Des de';

  @override
  String get signalsTo => 'Fins a';

  @override
  String get signalsMonoNoChannel => 'Mono (sense canal)';

  @override
  String get signalsExportWav => 'Exporta WAV';

  @override
  String get signalsPinkNoise => 'Soroll rosa';

  @override
  String get signalsPinkHelp =>
      'La mateixa energia a cada octava. Només dona la resposta en freqüència, sense temps ni reflexions — prou per a un ràpid «passa alguna cosa aquí?».';

  @override
  String get signalsExportPink => 'Exporta WAV de 30 s';

  @override
  String get signalsHowTo => 'Com mesurar';

  @override
  String get signalsStep1 =>
      'Reprodueix el senyal des d\'un ordinador pels altaveus, no des del telèfon.';

  @override
  String get signalsStep2 =>
      'Ajusta el volum perquè l\'analitzador marqui uns −20 dBFS. La saturació sembla una reflexió.';

  @override
  String get signalsStep3 =>
      'Subjecta el telèfon en vertical amb el braç estirat, amb el micròfon cap als altaveus.';

  @override
  String get signalsStep4 =>
      'Desconnecta els auriculars Bluetooth — la compressió i la latència espatllen la mesura.';

  @override
  String get signalsNoteMono =>
      'Mono als dos altaveus alhora suma L i R, i la seva diferència desapareix en la suma. Per mesurar canals, tria un canal.';

  @override
  String get signalsNoteStereo =>
      'Fitxer estèreo amb el senyal només en un canal — el reprodueix qualsevol cosa que soni en estèreo.';

  @override
  String get signalsNoteChannel =>
      'Fitxer mono amb el nom del canal. Envia\'l a l\'entrada correcta del receptor des d\'una DAW o per una entrada multicanal; un portàtil amb sortida estèreo no el portarà a aquest canal.';

  @override
  String get channelsTitle => 'Mesura de canals';

  @override
  String get channelsHelp =>
      'Posa\'t al punt d\'escolta. Per a cada canal: comença a enregistrar, reprodueix-hi un sweep des de la pestanya Senyals i toca Fet. Sense aquests punts, el disseny no té d\'on treure l\'EQ i els nivells.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Verificació després d\'introduir l\'EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'El punt es desa com a «després de l\'EQ» i no sobreescriu aquell del qual es va calcular l\'EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Enregistrant $seconds s — reprodueix ara el sweep';
  }

  @override
  String get channelsNotMeasured => 'no mesurat';

  @override
  String get channelsMeasuredNoise => 'mesurat amb soroll';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · so directe als $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · so directe als $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Fet';

  @override
  String get channelsMeasure => 'Mesura';

  @override
  String get channelsAdd => 'Afegeix';

  @override
  String get channelsAgain => 'Repeteix';

  @override
  String get compareTitle => 'Comparació';

  @override
  String get compareNeedsTwoPoints =>
      'La comparació necessita com a mínim dos punts.';

  @override
  String get commonWithRoom => 'amb la sala';

  @override
  String get commonDirectSound => 'so directe';

  @override
  String get compareAfterEq => 'després de l\'EQ';

  @override
  String get compareBandsA => 'A (bandes)';

  @override
  String get compareBandsB => 'B (bandes)';

  @override
  String get compareArrivalDiff => 'Diferència d\'arribada A − B';

  @override
  String get compareBroadbandDiff => 'Nivell de banda ampla A − B';

  @override
  String get compareWorstBelow300 => 'Diferència més gran per sota de 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB a la banda de $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance i level trim igualen la diferència d\'arribada i de nivell. No igualen la diferència de forma per sota de 300 Hz — la provoca una altra paret a una altra distància i es resol movent les coses.';

  @override
  String get designRt60Live => 'T20 125–500 Hz de l\'última resposta';

  @override
  String get designRt60Stored => 'T20 125–500 Hz d\'un sweep desat';

  @override
  String get designRt60Guess =>
      'estimació — mesura un sweep, Schroeder ara com ara només és una pista';

  @override
  String get designExportTooltip => 'Exporta la configuració';

  @override
  String get designCompute => 'Calcula el disseny';

  @override
  String get designLidarChecking => 'Comprovant si hi ha LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR disponible';

  @override
  String get designLidarMissing =>
      'Sense LiDAR — introdueix les dimensions a mà';

  @override
  String get designLidarHint =>
      'L\'escaneig dona les parets al centímetre, així que també quadren els punts de reflexió i les distàncies als límits, no només els modes.';

  @override
  String get designManualHint =>
      'El càlcul modal només necessita tres nombres — però perds els punts de reflexió i les distàncies exactes a les parets.';

  @override
  String get designStopScan => 'Acaba l\'escaneig';

  @override
  String get designScanRoom => 'Escaneja la sala';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls parets',
      one: '1 paret',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings obertures',
      one: '1 obertura',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Dimensions de la sala';

  @override
  String get designLength => 'Llargada';

  @override
  String get designWidth => 'Amplada';

  @override
  String get designHeight => 'Alçada';

  @override
  String get designWhatToDo => 'Què cal fer';

  @override
  String get designRoomModes => 'Modes de la sala';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Per sobre de $schroeder Hz (Schroeder) els modes individuals ja no tenen sentit. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: mesurat, objectiu, predicció';

  @override
  String get designEqHelp =>
      'La predicció és la resposta mesurada més un model de les quinze bandes del receptor. Després d\'introduir l\'EQ, torna a mesurar el canal amb l\'interruptor «després de l\'EQ» per veure com s\'hi ha acostat el model.';

  @override
  String get designReceiverConfig => 'Configuració del receptor';

  @override
  String get designGeometryOnly =>
      'Sense mesures de canals amb sweep aquí només hi ha geometria: distàncies i freqüències de tall. L\'EQ i els nivells arribaran quan hi hagi punts per canal.';

  @override
  String get designShareSubject => 'Proposta de configuració';

  @override
  String get impulseTitle => 'Resposta a l\'impuls';

  @override
  String get impulseCompareTooltip => 'Compara punts';

  @override
  String get impulseExportTooltip => 'Exporta FRD amb fase';

  @override
  String get impulseTapToStart => 'Toca per iniciar.';

  @override
  String get impulseSweepTitle => 'El sweep que reprodueixes pels altaveus';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Ha de coincidir amb el que reprodueixes — si no, la deconvolució retorna disbarats.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Enregistrant — $seconds s';
  }

  @override
  String get impulsePlaySweepNow =>
      'Ara reprodueix el sweep des de l\'ordinador.';

  @override
  String get impulseStartRecording =>
      'Comença a enregistrar i després reprodueix el sweep';

  @override
  String get impulseFrequencyResponse => 'Resposta en freqüència';

  @override
  String get impulseWithRoom => 'amb la sala (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'so directe (finestra $ms ms)';
  }

  @override
  String get impulseWindow => 'Finestra';

  @override
  String impulseWindowHelp(String hz) {
    return 'Una finestra més llarga veu més avall (ara vàlida per sobre de $hz Hz), però deixa entrar la primera reflexió. Per sota del límit la corba no se suavitza ni es comenta: és la finestra, no la sala.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Fins a la primera reflexió ($ms ms)';
  }

  @override
  String get impulseTime => 'Temps';

  @override
  String get impulseImpulse => 'impuls';

  @override
  String get impulseTimeHelp =>
      'En blau, la finestra; la línia taronja és la primera reflexió trobada. El temps zero és el so directe.';

  @override
  String get impulseSpectrogram => 'Espectrograma';

  @override
  String get commonHide => 'Amaga';

  @override
  String get commonShow => 'Mostra';

  @override
  String get impulseSpectrogramHelp =>
      'Temps en ms des del so directe, freqüència cap amunt, el color és el nivell fins a −60 dB. Una franja horitzontal que sobreviu a les altres és un mode; la taula de dalt diu el mateix amb nombres.';

  @override
  String get impulseDecayByOctave => 'Decaïment per octaves';

  @override
  String get impulseMidNoT20 =>
      'Les bandes mitjanes no han decaigut prou per al T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Mitjos 125–500 Hz: T20 $seconds s — aquest és el RT60 amb què compta el disseny.';
  }

  @override
  String get impulseDecayHelp =>
      'Als greus, el RT60 del telèfon és més aviat una estimació: el soroll de fons hi és més a prop i «—» vol dir que la reverberació no ha baixat per sota seu. C50 per sobre de zero: el so directe amb les primeres reflexions porta més energia que la reverberació.';

  @override
  String get impulseResult => 'Resultat';

  @override
  String get impulseDirectArrived => 'El so directe ha arribat als';

  @override
  String get impulseDirectArrivedHelp =>
      'Retard de reproducció més temps de vol — per si sol no diu res, però la diferència entre l\'altaveu esquerre i el dret sí.';

  @override
  String get impulseFirstReflection => 'Primera reflexió';

  @override
  String get impulseNotFound => 'no trobada';

  @override
  String impulseAfterDirect(String time) {
    return '$time després del so directe';
  }

  @override
  String get impulseNoReflectionHelp =>
      'O no n\'hi ha cap, o s\'amaga en el ringing de l\'impuls directe.';

  @override
  String impulseExtraPath(String metres) {
    return 'Recorregut addicional ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'no mesurable';

  @override
  String get impulseRt60NoiseHelp =>
      'La reverberació no ha baixat prou per sobre del soroll de fons — més fort, o en un moment més tranquil.';

  @override
  String get impulseRt60Help =>
      'La diferència entre T20 i T30 indica com de net és el decaïment.';

  @override
  String get impulseGating => 'Finestra (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'vàlida per sobre de $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Per sota d\'això la finestra no veu ni un període — la corba allà és un artefacte de la finestra, no de la sala.';

  @override
  String get impulseSchroeder => 'Corba de decaïment de Schroeder';

  @override
  String impulseHdAt(int order) {
    return 'HD$order a 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Els harmònics són al temps negatiu de la deconvolució de Farina; aquí es llegeixen d\'allà en lloc de descartar-los. −40 dB és l\'1 %.';

  @override
  String get impulseHd3Help =>
      'El tercer harmònic creix amb la saturació més de pressa que el segon.';

  @override
  String get impulseDistortionHot => 'Distorsió per sobre de −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'O el sweep és massa fort, o l\'altaveu és al límit. Una cua de distorsió sembla una reflexió a l\'impuls — abaixa el volum i torna a mesurar abans de creure\'t res.';

  @override
  String get eqMeasured => 'mesurat';

  @override
  String get eqTarget => 'objectiu';

  @override
  String get eqPredicted => 'predicció després de l\'EQ';

  @override
  String get eqMeasuredAfter => 'mesurat després de l\'EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Desviació de l\'objectiu 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Després d\'introduir-lo al receptor';

  @override
  String get eqPredictionVsReality => 'Predicció vs. realitat';

  @override
  String eqStubborn(String bands) {
    return 'Queda a més de 6 dB de l\'objectiu: $bands. És interferència, no manca de potència — es resol movent l\'altaveu o l\'oient, no amb més realç.';
  }

  @override
  String get eqModelOk =>
      'El filtre del receptor es comporta aproximadament com el model.';

  @override
  String get eqModelOff =>
      'El filtre real del receptor s\'allunya del model més del que s\'esperava — les seves bandes probablement són més amples o més estretes del que se suposa aquí.';

  @override
  String get eqTargetCurve => 'Corba objectiu';

  @override
  String get eqFlat => 'plana';

  @override
  String get eqTargetHelp =>
      'No plana: per sobre d\'uns quants kHz l\'orella sent el so directe, el micròfon també suma les reflexions, i una corba mesurada aplanada sona apagada. Una lleugera caiguda a dalt i una mica de greus a baix és el que tria la gent en escoltes a cegues.';

  @override
  String get eqBassLift => 'Realç de greus';

  @override
  String get eqBassBelow => 'Greus per sota de';

  @override
  String get eqTilt => 'Inclinació';

  @override
  String get eqDbPerOctave => 'dB/oct';

  @override
  String get eqTiltFrom => 'Inclinació des de';

  @override
  String get errorMicPermission =>
      'Sense accés al micròfon no es pot mesurar. Permet-lo a Configuració → AudioScanner → Micròfon.';

  @override
  String errorMic(String error) {
    return 'Micròfon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'No s\'ha pogut iniciar el micròfon: $error';
  }

  @override
  String get errorNoArkit =>
      'Aquest dispositiu no admet ARKit world tracking — no es poden situar punts a l\'espai.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'L\'enregistrament és més curt que el sweep ($recorded s de $expected s). Comença a enregistrar abans de reproduir el senyal.';
  }

  @override
  String get sessionSnapshots => 'Captures';

  @override
  String get errorTrackingUnreliable =>
      'El seguiment de posició no és fiable — el punt quedaria en un altre lloc d\'on ets.';

  @override
  String errorNoSound(int seconds) {
    return 'No ha arribat cap so en $seconds s.';
  }

  @override
  String get noteSnapshotNoPose => 'captura de l\'analitzador, sense posició';

  @override
  String get sessionChannels => 'Canals';

  @override
  String get trackingOk => 'Seguiment OK';

  @override
  String get trackingLimited => 'Seguiment feble';

  @override
  String get trackingUnavailable => 'Sense seguiment';

  @override
  String get poseHintFeatures =>
      'Poc detall a la imatge — apunta el telèfon a alguna cosa amb textura, no a una paret llisa.';

  @override
  String get poseHintMotion => 'Moviment massa ràpid — camina més a poc a poc.';

  @override
  String get poseHintLight =>
      'Poca llum — encén el llum, la càmera no veu on és.';

  @override
  String get poseHintInitializing =>
      'L\'ARKit s\'està iniciant, mou-te una mica.';

  @override
  String get poseHintRelocalizing =>
      'Cercant de nou el punt original — torna on has començat.';

  @override
  String get signalPhonePink => 'Soroll rosa des del telèfon';

  @override
  String get signalExternalPink => 'Soroll rosa des dels altaveus';

  @override
  String get signalExternalSweep => 'Sweep des dels altaveus';

  @override
  String get captureWarningBluetooth =>
      'Micròfon Bluetooth: la compressió i la latència espatllen la mesura. Desconnecta els auriculars i mesura amb el micròfon integrat.';

  @override
  String get captureWarningProcessing =>
      'El sistema no ha desactivat el processament del senyal (AGC / supressió de soroll). Les diferències mesurades entre punts quedaran distorsionades.';

  @override
  String get captureWarningMeasurementMode =>
      'No s\'ha pogut activar el measurement mode — el micròfon aplica la seva pròpia correcció de resposta en freqüència.';

  @override
  String get captureRouteUnknown => 'desconegut';

  @override
  String get axisLength => 'llargada';

  @override
  String get axisWidth => 'amplada';

  @override
  String get axisHeight => 'alçada';
}
