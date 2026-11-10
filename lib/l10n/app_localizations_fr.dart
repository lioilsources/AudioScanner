// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get tabScan => 'Scan';

  @override
  String get tabMap => 'Carte';

  @override
  String get tabResponse => 'Réponse';

  @override
  String get tabDesign => 'Conception';

  @override
  String get tabSignals => 'Signaux';

  @override
  String get rtaSnapshotFailed => 'La capture n\'a pas été enregistrée.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Enregistré comme point $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Enregistré comme point $id (sans position).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count points',
      one: '1 point',
    );
    return 'Calibration $name : $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Impossible de lire le fichier : $message';
  }

  @override
  String get rtaOffsetTitle => 'Décalage dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Diffuse un son de 1 kHz, relève le niveau sur un sonomètre et saisis la différence avec ce qu\'affiche l\'analyseur. Avec un décalage non nul, les niveaux sont marqués comme estimation SPL ; sans décalage, ils restent en dBFS.';

  @override
  String get commonReset => 'Réinitialiser';

  @override
  String get commonCancel => 'Annuler';

  @override
  String get commonSave => 'Enregistrer';

  @override
  String get commonStop => 'Arrêter';

  @override
  String get commonStartMic => 'Démarrer le micro';

  @override
  String get tabAnalyzer => 'Analyseur';

  @override
  String get rtaUnfreeze => 'Reprendre';

  @override
  String get rtaFreeze => 'Figer';

  @override
  String get rtaPeakHold => 'Maintien des crêtes';

  @override
  String get rtaMaxMinTraces => 'Courbes max / min';

  @override
  String get rtaResetTraces => 'Réinitialiser les courbes';

  @override
  String get rtaSaveAsPoint => 'Enregistrer comme point (3 s)';

  @override
  String get rtaMicCalibration => 'Calibration du micro…';

  @override
  String get rtaRemoveCalibration => 'Retirer la calibration';

  @override
  String get rtaOffsetMenu => 'Décalage dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · sans traitement du signal';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count points',
      one: '1 point',
    );
    return 'Calibration $name : $_temp0, correction $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (estimation)';

  @override
  String get rtaFrozenHint =>
      'Figé — le micro continue de tourner, seul l\'affichage est arrêté.';

  @override
  String get rtaRelativeHint =>
      'Les niveaux sont relatifs (dBFS). Le contour apparaît dès que tu enregistres le premier point — il sert de référence aux autres.';

  @override
  String get rtaReferenceHint =>
      'Barres pleines = ici. Contour = point de référence.';

  @override
  String get rtaEnvelopeHint =>
      'Rouge = max, vert = min depuis la réinitialisation.';

  @override
  String get rtaMicStopped => 'micro arrêté';

  @override
  String get rtaSilence => 'silence — un signal est-il diffusé ?';

  @override
  String get rtaPlaceholder =>
      'Démarre le micro et diffuse un signal dans la pièce.';

  @override
  String rtaBandsInfo(int count) {
    return '$count bandes de tiers d\'octave, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Scan de la pièce';

  @override
  String scanPointCount(int count) {
    return '$count pts';
  }

  @override
  String get commonMicNotRunning => 'Le micro ne tourne pas';

  @override
  String get scanMicNeeded =>
      'Sans lui, seule la position est mesurée, pas le son.';

  @override
  String get scanContinuous => 'Mesure continue';

  @override
  String get scanContinuousHint =>
      'Un point automatiquement tous les 0,5 m de marche';

  @override
  String get scanMeasuring => 'Mesure…';

  @override
  String get scanMeasureHere => 'Mesurer ici';

  @override
  String scanPointSaved(String id, String position) {
    return 'Point $id enregistré à $position';
  }

  @override
  String get scanStartTracking => 'Démarrer le suivi de position';

  @override
  String get scanStartTrackingHint =>
      'ARKit — c\'est ainsi que l\'app sait où tu te trouves dans la pièce.';

  @override
  String scanPosition(String position) {
    return 'Position : $position m de l\'origine';
  }

  @override
  String get scanSetOriginHint =>
      'Place-toi à la position d\'écoute et définis l\'origine.';

  @override
  String get scanOriginHere => 'L\'origine est ici';

  @override
  String get scanNoPoints => 'Aucun point pour l\'instant.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'dispersion 40–300 Hz : $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Salon';

  @override
  String get scanNewMeasurement => 'Nouvelle mesure';

  @override
  String get scanRoomName => 'Nom de la pièce';

  @override
  String get scanExcitation => 'Avec quoi exciter la pièce';

  @override
  String get scanPhoneNoiseHint =>
      'À titre indicatif seulement — le haut-parleur du téléphone ne produit aucune basse.';

  @override
  String get scanStart => 'Commencer';

  @override
  String get mapExportTooltip => 'Exporter FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'La carte a besoin d\'au moins deux points. Parcours la pièce en mesurant au fur et à mesure.';

  @override
  String get mapShareText =>
      'FRD par point (import dans REW / VituixCAD) et toute la session en JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Position la plus régulière : $id à $position m (dispersion $variation dB sur 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Le seul signal qui permet de calculer la réponse impulsionnelle, le temps de réverbération et les premières réflexions. Diffuse-le depuis un ordinateur ou un DAC dans les enceintes et laisse le téléphone enregistrer.';

  @override
  String get signalsLength => 'Durée';

  @override
  String get signalsFrom => 'De';

  @override
  String get signalsTo => 'À';

  @override
  String get signalsMonoNoChannel => 'Mono (sans canal)';

  @override
  String get signalsExportWav => 'Exporter WAV';

  @override
  String get signalsPinkNoise => 'Bruit rose';

  @override
  String get signalsPinkHelp =>
      'Même énergie dans chaque octave. Ne donne que la réponse en fréquence, ni temps ni réflexions — suffisant pour un rapide « il se passe quelque chose ici ? ».';

  @override
  String get signalsExportPink => 'Exporter WAV 30 s';

  @override
  String get signalsHowTo => 'Comment mesurer';

  @override
  String get signalsStep1 =>
      'Diffuse le signal depuis un ordinateur dans les enceintes, pas depuis le téléphone.';

  @override
  String get signalsStep2 =>
      'Règle le volume pour que l\'analyseur affiche environ −20 dBFS. Une saturation ressemble à une réflexion.';

  @override
  String get signalsStep3 =>
      'Tiens le téléphone vertical à bout de bras, micro vers les enceintes.';

  @override
  String get signalsStep4 =>
      'Déconnecte les écouteurs Bluetooth — la compression et la latence faussent la mesure.';

  @override
  String get signalsNoteMono =>
      'Le mono dans les deux enceintes à la fois additionne L et R, et leur différence disparaît dans la somme. Pour mesurer les canaux, choisis un canal.';

  @override
  String get signalsNoteStereo =>
      'Fichier stéréo avec le signal sur un seul canal — tout ce qui lit de la stéréo le lira.';

  @override
  String get signalsNoteChannel =>
      'Fichier mono nommé d\'après le canal. Envoie-le vers la bonne entrée de l\'ampli depuis une DAW ou par une entrée multicanal ; un portable avec sortie stéréo ne l\'amènera pas sur ce canal.';

  @override
  String get channelsTitle => 'Mesure des canaux';

  @override
  String get channelsHelp =>
      'Place-toi à la position d\'écoute. Pour chaque canal : lance l\'enregistrement, diffuse un sweep depuis l\'onglet Signaux, touche Terminé. Sans ces points, la conception n\'a rien pour calculer l\'EQ et les niveaux.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Vérification après saisie de l\'EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Le point est enregistré comme « après EQ » et n\'écrase pas celui qui a servi au calcul de l\'EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Enregistrement $seconds s — diffuse le sweep maintenant';
  }

  @override
  String get channelsNotMeasured => 'non mesuré';

  @override
  String get channelsMeasuredNoise => 'mesuré au bruit';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · son direct après $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · son direct après $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Terminé';

  @override
  String get channelsMeasure => 'Mesurer';

  @override
  String get channelsAdd => 'Ajouter';

  @override
  String get channelsAgain => 'Refaire';

  @override
  String get compareTitle => 'Comparaison';

  @override
  String get compareNeedsTwoPoints =>
      'La comparaison a besoin d\'au moins deux points.';

  @override
  String get commonWithRoom => 'avec la pièce';

  @override
  String get commonDirectSound => 'son direct';

  @override
  String get compareAfterEq => 'après EQ';

  @override
  String get compareBandsA => 'A (bandes)';

  @override
  String get compareBandsB => 'B (bandes)';

  @override
  String get compareArrivalDiff => 'Écart d\'arrivée A − B';

  @override
  String get compareBroadbandDiff => 'Niveau large bande A − B';

  @override
  String get compareWorstBelow300 => 'Plus grand écart sous 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB dans la bande $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance et level trim compensent l\'écart d\'arrivée et de niveau. Ils ne compensent pas l\'écart de forme sous 300 Hz — il vient d\'un autre mur à une autre distance et se corrige en déplaçant les éléments.';

  @override
  String get designRt60Live => 'T20 125–500 Hz de la dernière réponse';

  @override
  String get designRt60Stored => 'T20 125–500 Hz d\'un sweep enregistré';

  @override
  String get designRt60Guess =>
      'estimation — mesure un sweep, Schroeder n\'est pour l\'instant qu\'une indication';

  @override
  String get designExportTooltip => 'Exporter la configuration';

  @override
  String get designCompute => 'Calculer la conception';

  @override
  String get designLidarChecking => 'Recherche du LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR disponible';

  @override
  String get designLidarMissing =>
      'Pas de LiDAR — saisis les dimensions à la main';

  @override
  String get designLidarHint =>
      'Le scan relève les murs au centimètre près, donc les points de réflexion et les distances aux parois sont justes aussi, pas seulement les modes.';

  @override
  String get designManualHint =>
      'Le calcul modal n\'a besoin que de trois nombres — mais tu perds les points de réflexion et les distances exactes aux murs.';

  @override
  String get designStopScan => 'Arrêter le scan';

  @override
  String get designScanRoom => 'Scanner la pièce';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls murs',
      one: '1 mur',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings ouvertures',
      one: '1 ouverture',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Dimensions de la pièce';

  @override
  String get designLength => 'Longueur';

  @override
  String get designWidth => 'Largeur';

  @override
  String get designHeight => 'Hauteur';

  @override
  String get designWhatToDo => 'Que faire';

  @override
  String get designRoomModes => 'Modes de la pièce';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Au-dessus de $schroeder Hz (Schroeder), les modes individuels n\'ont plus de sens. RT60 $rt60 s : $source.';
  }

  @override
  String get designEqTitle => 'EQ : mesuré, cible, prédiction';

  @override
  String get designEqHelp =>
      'La prédiction est la réponse mesurée plus un modèle des quinze bandes de l\'ampli. Après avoir saisi l\'EQ, mesure à nouveau le canal avec l\'interrupteur « après EQ » pour voir à quel point le modèle était proche.';

  @override
  String get designReceiverConfig => 'Configuration de l\'ampli';

  @override
  String get designGeometryOnly =>
      'Sans mesures des canaux au sweep, il n\'y a ici que la géométrie : distances et fréquences de coupure. L\'EQ et les niveaux viendront quand il y aura des points par canal.';

  @override
  String get designShareSubject => 'Proposition de configuration';

  @override
  String get impulseTitle => 'Réponse impulsionnelle';

  @override
  String get impulseCompareTooltip => 'Comparer les points';

  @override
  String get impulseExportTooltip => 'Exporter FRD avec phase';

  @override
  String get impulseTapToStart => 'Touche pour démarrer.';

  @override
  String get impulseSweepTitle => 'Le sweep que tu diffuses dans les enceintes';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Il doit correspondre à ce que tu diffuses — sinon la déconvolution renvoie n\'importe quoi.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Enregistrement — $seconds s';
  }

  @override
  String get impulsePlaySweepNow =>
      'Diffuse maintenant le sweep depuis l\'ordinateur.';

  @override
  String get impulseStartRecording =>
      'Lancer l\'enregistrement, puis diffuser le sweep';

  @override
  String get impulseFrequencyResponse => 'Réponse en fréquence';

  @override
  String get impulseWithRoom => 'avec la pièce (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'son direct (fenêtre $ms ms)';
  }

  @override
  String get impulseWindow => 'Fenêtre';

  @override
  String impulseWindowHelp(String hz) {
    return 'Une fenêtre plus longue voit plus bas (valide actuellement au-dessus de $hz Hz), mais laisse entrer la première réflexion. Sous la limite, la courbe n\'est ni lissée ni commentée : c\'est la fenêtre, pas la pièce.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Jusqu\'à la première réflexion ($ms ms)';
  }

  @override
  String get impulseTime => 'Temps';

  @override
  String get impulseImpulse => 'impulsion';

  @override
  String get impulseTimeHelp =>
      'En bleu la fenêtre, la ligne orange est la première réflexion trouvée. Le temps zéro est le son direct.';

  @override
  String get impulseSpectrogram => 'Spectrogramme';

  @override
  String get commonHide => 'Masquer';

  @override
  String get commonShow => 'Afficher';

  @override
  String get impulseSpectrogramHelp =>
      'Temps en ms depuis le son direct, fréquence vers le haut, la couleur est le niveau jusqu\'à −60 dB. Une bande horizontale qui survit aux autres est un mode ; le tableau au-dessus dit la même chose en chiffres.';

  @override
  String get impulseDecayByOctave => 'Décroissance par octave';

  @override
  String get impulseMidNoT20 =>
      'Les bandes médianes ne sont pas assez descendues pour T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Médium 125–500 Hz : T20 $seconds s — c\'est le RT60 utilisé par la conception.';
  }

  @override
  String get impulseDecayHelp =>
      'Dans le grave, le RT60 mesuré au téléphone est plutôt une estimation : le bruit de fond y est le plus proche et « — » signifie que la réverbération n\'est pas descendue en dessous. C50 au-dessus de zéro : le son direct avec les premières réflexions porte plus d\'énergie que la réverbération.';

  @override
  String get impulseResult => 'Résultat';

  @override
  String get impulseDirectArrived => 'Le son direct est arrivé après';

  @override
  String get impulseDirectArrivedHelp =>
      'Latence de lecture plus temps de vol — sans signification en soi, mais l\'écart entre l\'enceinte G et D compte.';

  @override
  String get impulseFirstReflection => 'Première réflexion';

  @override
  String get impulseNotFound => 'introuvable';

  @override
  String impulseAfterDirect(String time) {
    return '$time après le son direct';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Soit il n\'y en a pas, soit elle se cache dans le ringing de l\'impulsion directe.';

  @override
  String impulseExtraPath(String metres) {
    return 'Trajet supplémentaire ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'non mesurable';

  @override
  String get impulseRt60NoiseHelp =>
      'La réverbération n\'est pas descendue assez bas au-dessus du bruit de fond — plus fort, ou à un moment plus calme.';

  @override
  String get impulseRt60Help =>
      'L\'écart entre T20 et T30 indique à quel point la décroissance est propre.';

  @override
  String get impulseGating => 'Fenêtre (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'valide au-dessus de $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'En dessous, la fenêtre ne voit même pas une période — la courbe y est un artefact de la fenêtre, pas de la pièce.';

  @override
  String get impulseSchroeder => 'Courbe de décroissance de Schroeder';

  @override
  String impulseHdAt(int order) {
    return 'HD$order à 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Les harmoniques se trouvent dans le temps négatif de la déconvolution de Farina ; ici, on les y lit au lieu de les jeter. −40 dB, c\'est 1 %.';

  @override
  String get impulseHd3Help =>
      'La troisième harmonique croît plus vite que la deuxième avec la saturation.';

  @override
  String get impulseDistortionHot => 'Distorsion au-dessus de −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Soit le sweep est trop fort, soit l\'enceinte est à sa limite. Une traîne de distorsion ressemble à une réflexion dans l\'impulsion — baisse le volume et mesure à nouveau avant de croire quoi que ce soit.';

  @override
  String get eqMeasured => 'mesuré';

  @override
  String get eqTarget => 'cible';

  @override
  String get eqPredicted => 'prédiction après EQ';

  @override
  String get eqMeasuredAfter => 'mesuré après EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Écart à la cible 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Après saisie dans l\'ampli';

  @override
  String get eqPredictionVsReality => 'Prédiction vs réalité';

  @override
  String eqStubborn(String bands) {
    return 'Reste à plus de 6 dB de la cible : $bands. C\'est de l\'interférence, pas un manque de puissance — on corrige en déplaçant l\'enceinte ou l\'auditeur, pas avec plus de gain.';
  }

  @override
  String get eqModelOk =>
      'Le filtre de l\'ampli se comporte à peu près comme le modèle.';

  @override
  String get eqModelOff =>
      'Le filtre réel de l\'ampli diffère du modèle plus que prévu — ses bandes sont sans doute plus larges ou plus étroites que supposé ici.';

  @override
  String get eqTargetCurve => 'Courbe cible';

  @override
  String get eqFlat => 'plate';

  @override
  String get eqTargetHelp =>
      'Pas plate : au-dessus de quelques kHz, l\'oreille entend le son direct, le micro additionne aussi les réflexions, et une courbe mesurée aplatie sonne terne. Une légère pente dans l\'aigu et un peu de grave en bas, c\'est ce que les gens choisissent en écoute à l\'aveugle.';

  @override
  String get eqBassLift => 'Renfort de grave';

  @override
  String get eqBassBelow => 'Grave sous';

  @override
  String get eqTilt => 'Pente';

  @override
  String get eqDbPerOctave => 'dB/oct';

  @override
  String get eqTiltFrom => 'Pente dès';

  @override
  String get errorMicPermission =>
      'Impossible de mesurer sans accès au micro. Autorise-le dans Réglages → AudioScanner → Micro.';

  @override
  String errorMic(String error) {
    return 'Micro : $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Impossible de démarrer le micro : $error';
  }

  @override
  String get errorNoArkit =>
      'Cet appareil ne gère pas le world tracking ARKit — impossible de placer des points dans l\'espace.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'L\'enregistrement est plus court que le sweep ($recorded s sur $expected s). Lance l\'enregistrement avant de diffuser le signal.';
  }

  @override
  String get sessionSnapshots => 'Captures';

  @override
  String get errorTrackingUnreliable =>
      'Le suivi de position n\'est pas fiable — le point se placerait ailleurs que là où tu te trouves.';

  @override
  String errorNoSound(int seconds) {
    return 'Aucun son reçu en $seconds s.';
  }

  @override
  String get noteSnapshotNoPose => 'capture de l\'analyseur, sans position';

  @override
  String get sessionChannels => 'Canaux';

  @override
  String get trackingOk => 'Suivi OK';

  @override
  String get trackingLimited => 'Suivi faible';

  @override
  String get trackingUnavailable => 'Pas de suivi';

  @override
  String get poseHintFeatures =>
      'Trop peu de détails dans l\'image — vise quelque chose de texturé, pas un mur nu.';

  @override
  String get poseHintMotion => 'Mouvement trop rapide — avance plus lentement.';

  @override
  String get poseHintLight =>
      'Trop peu de lumière — allume, la caméra ne voit pas où elle est.';

  @override
  String get poseHintInitializing => 'ARKit démarre, bouge un peu.';

  @override
  String get poseHintRelocalizing =>
      'Recherche du point d\'origine — reviens là où tu as commencé.';

  @override
  String get signalPhonePink => 'Bruit rose depuis le téléphone';

  @override
  String get signalExternalPink => 'Bruit rose depuis les enceintes';

  @override
  String get signalExternalSweep => 'Sweep depuis les enceintes';

  @override
  String get captureWarningBluetooth =>
      'Micro Bluetooth : la compression et la latence faussent la mesure. Déconnecte les écouteurs et mesure avec le micro intégré.';

  @override
  String get captureWarningProcessing =>
      'Le système n\'a pas désactivé le traitement du signal (AGC / réduction de bruit). Les écarts mesurés entre positions seront faussés.';

  @override
  String get captureWarningMeasurementMode =>
      'Impossible d\'activer le measurement mode — le micro applique sa propre correction de réponse en fréquence.';

  @override
  String get captureRouteUnknown => 'inconnu';

  @override
  String get axisLength => 'longueur';

  @override
  String get axisWidth => 'largeur';

  @override
  String get axisHeight => 'hauteur';
}
