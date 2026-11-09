// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Modern Greek (`el`).
class AppLocalizationsEl extends AppLocalizations {
  AppLocalizationsEl([String locale = 'el']) : super(locale);

  @override
  String get tabScan => 'Σάρωση';

  @override
  String get tabMap => 'Χάρτης';

  @override
  String get tabResponse => 'Απόκριση';

  @override
  String get tabDesign => 'Σχεδιασμός';

  @override
  String get tabSignals => 'Σήματα';

  @override
  String get rtaSnapshotFailed => 'Το στιγμιότυπο δεν αποθηκεύτηκε.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Αποθηκεύτηκε ως σημείο $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Αποθηκεύτηκε ως σημείο $id (χωρίς θέση).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count σημεία',
      one: '1 σημείο',
    );
    return 'Βαθμονόμηση $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Δεν είναι δυνατή η ανάγνωση του αρχείου: $message';
  }

  @override
  String get rtaOffsetTitle => 'Μετατόπιση dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Παίξε έναν τόνο 1 kHz, διάβασε τη στάθμη σε ηχόμετρο και εισήγαγε τη διαφορά από ό,τι δείχνει ο αναλυτής. Με μη μηδενική μετατόπιση οι στάθμες σημειώνονται ως εκτίμηση SPL· χωρίς αυτή παραμένουν σε dBFS.';

  @override
  String get commonReset => 'Μηδενισμός';

  @override
  String get commonCancel => 'Ακύρωση';

  @override
  String get commonSave => 'Αποθήκευση';

  @override
  String get commonStop => 'Διακοπή';

  @override
  String get commonStartMic => 'Έναρξη μικροφώνου';

  @override
  String get tabAnalyzer => 'Αναλυτής';

  @override
  String get rtaUnfreeze => 'Συνέχεια';

  @override
  String get rtaFreeze => 'Πάγωμα';

  @override
  String get rtaPeakHold => 'Διατήρηση κορυφών';

  @override
  String get rtaMaxMinTraces => 'Καμπύλες μέγ. / ελάχ.';

  @override
  String get rtaResetTraces => 'Μηδενισμός καμπυλών';

  @override
  String get rtaSaveAsPoint => 'Αποθήκευση ως σημείο (3 s)';

  @override
  String get rtaMicCalibration => 'Βαθμονόμηση μικροφώνου…';

  @override
  String get rtaRemoveCalibration => 'Αφαίρεση βαθμονόμησης';

  @override
  String get rtaOffsetMenu => 'Μετατόπιση dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · χωρίς επεξεργασία σήματος';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count σημεία',
      one: '1 σημείο',
    );
    return 'Βαθμονόμηση $name: $_temp0, διόρθωση $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (εκτίμηση)';

  @override
  String get rtaFrozenHint =>
      'Παγωμένο — το μικρόφωνο συνεχίζει να λειτουργεί, απλώς δεν σχεδιάζεται.';

  @override
  String get rtaRelativeHint =>
      'Οι στάθμες είναι σχετικές (dBFS). Το περίγραμμα εμφανίζεται μόλις αποθηκεύσεις το πρώτο σημείο — αυτό είναι η αναφορά για τα υπόλοιπα.';

  @override
  String get rtaReferenceHint =>
      'Γεμάτες μπάρες = εδώ. Περίγραμμα = σημείο αναφοράς.';

  @override
  String get rtaEnvelopeHint =>
      'Κόκκινο = μέγ., πράσινο = ελάχ. από τον μηδενισμό.';

  @override
  String get rtaMicStopped => 'το μικρόφωνο είναι σταματημένο';

  @override
  String get rtaSilence => 'σιωπή — παίζει κάποιο σήμα;';

  @override
  String get rtaPlaceholder =>
      'Ξεκίνα το μικρόφωνο και παίξε ένα σήμα στον χώρο.';

  @override
  String rtaBandsInfo(int count) {
    return '$count ζώνες τρίτου οκτάβας, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Σάρωση χώρου';

  @override
  String scanPointCount(int count) {
    return '$count σημ.';
  }

  @override
  String get commonMicNotRunning => 'Το μικρόφωνο δεν λειτουργεί';

  @override
  String get scanMicNeeded => 'Χωρίς αυτό μετριέται μόνο η θέση, όχι ο ήχος.';

  @override
  String get scanContinuous => 'Συνεχής μέτρηση';

  @override
  String get scanContinuousHint => 'Ένα σημείο αυτόματα κάθε 0,5 m βαδίσματος';

  @override
  String get scanMeasuring => 'Μέτρηση…';

  @override
  String get scanMeasureHere => 'Μέτρηση εδώ';

  @override
  String scanPointSaved(String id, String position) {
    return 'Το σημείο $id αποθηκεύτηκε στο $position';
  }

  @override
  String get scanStartTracking => 'Έναρξη παρακολούθησης θέσης';

  @override
  String get scanStartTrackingHint =>
      'ARKit — έτσι η εφαρμογή ξέρει πού στέκεσαι στον χώρο.';

  @override
  String scanPosition(String position) {
    return 'Θέση: $position m από την αρχή';
  }

  @override
  String get scanSetOriginHint =>
      'Στάσου στη θέση ακρόασης και όρισε την αρχή.';

  @override
  String get scanOriginHere => 'Εδώ είναι η αρχή';

  @override
  String get scanNoPoints => 'Δεν υπάρχουν ακόμη σημεία.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'διασπορά 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Σαλόνι';

  @override
  String get scanNewMeasurement => 'Νέα μέτρηση';

  @override
  String get scanRoomName => 'Όνομα χώρου';

  @override
  String get scanExcitation => 'Με τι θα διεγείρεις τον χώρο';

  @override
  String get scanPhoneNoiseHint =>
      'Μόνο ενδεικτικά — το ηχείο του τηλεφώνου δεν αποδίδει καθόλου μπάσα.';

  @override
  String get scanStart => 'Έναρξη';

  @override
  String get mapExportTooltip => 'Εξαγωγή FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Ο χάρτης χρειάζεται τουλάχιστον δύο σημεία. Περπάτα στον χώρο και μέτρα συνεχώς.';

  @override
  String get mapShareText =>
      'FRD ανά σημείο (εισαγωγή σε REW / VituixCAD) και ολόκληρη η συνεδρία σε JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Πιο ομοιόμορφο σημείο: $id στο $position m (διασπορά $variation dB στα 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Το μόνο σήμα από το οποίο υπολογίζονται η κρουστική απόκριση, ο χρόνος αντήχησης και οι πρώτες ανακλάσεις. Παίξ\' το από υπολογιστή ή DAC στα ηχεία και άφησε το τηλέφωνο να ηχογραφεί.';

  @override
  String get signalsLength => 'Διάρκεια';

  @override
  String get signalsFrom => 'Από';

  @override
  String get signalsTo => 'Έως';

  @override
  String get signalsMonoNoChannel => 'Mono (χωρίς κανάλι)';

  @override
  String get signalsExportWav => 'Εξαγωγή WAV';

  @override
  String get signalsPinkNoise => 'Ροζ θόρυβος';

  @override
  String get signalsPinkHelp =>
      'Ίδια ενέργεια σε κάθε οκτάβα. Δίνει μόνο απόκριση συχνότητας, χωρίς χρόνο ή ανακλάσεις — αρκεί για ένα γρήγορο «συμβαίνει κάτι εδώ;».';

  @override
  String get signalsExportPink => 'Εξαγωγή WAV 30 s';

  @override
  String get signalsHowTo => 'Πώς να μετρήσεις';

  @override
  String get signalsStep1 =>
      'Παίξε το σήμα από υπολογιστή στα ηχεία, όχι από το τηλέφωνο.';

  @override
  String get signalsStep2 =>
      'Ρύθμισε την ένταση ώστε ο αναλυτής να δείχνει περίπου −20 dBFS. Η υπεροδήγηση μοιάζει με ανάκλαση.';

  @override
  String get signalsStep3 =>
      'Κράτα το τηλέφωνο όρθιο με τεντωμένο χέρι, με το μικρόφωνο προς τα ηχεία.';

  @override
  String get signalsStep4 =>
      'Αποσύνδεσε τα ακουστικά Bluetooth — η συμπίεση και η καθυστέρηση χαλάνε τη μέτρηση.';

  @override
  String get signalsNoteMono =>
      'Mono και στα δύο ηχεία ταυτόχρονα αθροίζει L και R, και η διαφορά τους χάνεται στο άθροισμα. Για μέτρηση καναλιών διάλεξε κανάλι.';

  @override
  String get signalsNoteStereo =>
      'Στερεοφωνικό αρχείο με σήμα μόνο σε ένα κανάλι — το παίζει οτιδήποτε παίζει στερεοφωνικά.';

  @override
  String get signalsNoteChannel =>
      'Mono αρχείο με το όνομα του καναλιού. Δρομολόγησέ το στη σωστή είσοδο του ενισχυτή από DAW ή μέσω πολυκαναλικής εισόδου· ένα laptop με στερεοφωνική έξοδο δεν θα το φέρει σε αυτό το κανάλι.';

  @override
  String get channelsTitle => 'Μέτρηση καναλιών';

  @override
  String get channelsHelp =>
      'Στάσου στη θέση ακρόασης. Για κάθε κανάλι: ξεκίνα την ηχογράφηση, παίξε σε αυτό ένα sweep από την καρτέλα Σήματα, πάτα Τέλος. Χωρίς αυτά τα σημεία ο σχεδιασμός δεν έχει από πού να βγάλει EQ και στάθμες.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Επαλήθευση μετά την εισαγωγή του EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Το σημείο αποθηκεύεται ως «μετά το EQ» και δεν αντικαθιστά εκείνο από το οποίο υπολογίστηκε το EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Ηχογράφηση $seconds s — παίξε τώρα το sweep';
  }

  @override
  String get channelsNotMeasured => 'δεν μετρήθηκε';

  @override
  String get channelsMeasuredNoise => 'μετρήθηκε με θόρυβο';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · άμεσος ήχος μετά από $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · άμεσος ήχος μετά από $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Τέλος';

  @override
  String get channelsMeasure => 'Μέτρηση';

  @override
  String get channelsAdd => 'Προσθήκη';

  @override
  String get channelsAgain => 'Ξανά';

  @override
  String get compareTitle => 'Σύγκριση';

  @override
  String get compareNeedsTwoPoints =>
      'Η σύγκριση χρειάζεται τουλάχιστον δύο σημεία.';

  @override
  String get commonWithRoom => 'με τον χώρο';

  @override
  String get commonDirectSound => 'άμεσος ήχος';

  @override
  String get compareAfterEq => 'μετά το EQ';

  @override
  String get compareBandsA => 'A (ζώνες)';

  @override
  String get compareBandsB => 'B (ζώνες)';

  @override
  String get compareArrivalDiff => 'Διαφορά άφιξης A − B';

  @override
  String get compareBroadbandDiff => 'Ευρυζωνική στάθμη A − B';

  @override
  String get compareWorstBelow300 => 'Μεγαλύτερη διαφορά κάτω από 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB στη ζώνη $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Τα distance και level trim εξισώνουν τη διαφορά άφιξης και στάθμης. Τη διαφορά μορφής κάτω από 300 Hz δεν την εξισώνουν — τη δημιουργεί άλλος τοίχος σε άλλη απόσταση και λύνεται με μετακίνηση.';

  @override
  String get designRt60Live => 'T20 125–500 Hz από την τελευταία απόκριση';

  @override
  String get designRt60Stored => 'T20 125–500 Hz από αποθηκευμένο sweep';

  @override
  String get designRt60Guess =>
      'εκτίμηση — μέτρησε ένα sweep, το Schroeder είναι προς το παρόν μόνο ένδειξη';

  @override
  String get designExportTooltip => 'Εξαγωγή διαμόρφωσης';

  @override
  String get designCompute => 'Υπολογισμός σχεδιασμού';

  @override
  String get designLidarChecking => 'Έλεγχος για LiDAR…';

  @override
  String get designLidarAvailable => 'Διαθέσιμο LiDAR';

  @override
  String get designLidarMissing =>
      'Χωρίς LiDAR — εισήγαγε τις διαστάσεις με το χέρι';

  @override
  String get designLidarHint =>
      'Η σάρωση δίνει τους τοίχους με ακρίβεια εκατοστού, οπότε ταιριάζουν και τα σημεία ανάκλασης και οι αποστάσεις από τα όρια, όχι μόνο οι ρυθμοί.';

  @override
  String get designManualHint =>
      'Ο υπολογισμός ρυθμών χρειάζεται μόνο τρεις αριθμούς — χάνεις όμως τα σημεία ανάκλασης και τις ακριβείς αποστάσεις από τους τοίχους.';

  @override
  String get designStopScan => 'Τέλος σάρωσης';

  @override
  String get designScanRoom => 'Σάρωση χώρου';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls τοίχοι',
      one: '1 τοίχος',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings ανοίγματα',
      one: '1 άνοιγμα',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Διαστάσεις χώρου';

  @override
  String get designLength => 'Μήκος';

  @override
  String get designWidth => 'Πλάτος';

  @override
  String get designHeight => 'Ύψος';

  @override
  String get designWhatToDo => 'Τι να κάνεις';

  @override
  String get designRoomModes => 'Ρυθμοί χώρου';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Πάνω από $schroeder Hz (Schroeder) οι μεμονωμένοι ρυθμοί δεν έχουν πια νόημα. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: μετρημένο, στόχος, πρόβλεψη';

  @override
  String get designEqHelp =>
      'Η πρόβλεψη είναι η μετρημένη απόκριση συν ένα μοντέλο των δεκαπέντε ζωνών του ενισχυτή. Μετά την εισαγωγή του EQ, μέτρησε ξανά το κανάλι με τον διακόπτη «μετά το EQ» για να δεις πόσο κοντά ήταν το μοντέλο.';

  @override
  String get designReceiverConfig => 'Διαμόρφωση ενισχυτή';

  @override
  String get designGeometryOnly =>
      'Χωρίς μετρήσεις καναλιών με sweep, εδώ υπάρχει μόνο γεωμετρία: αποστάσεις και συχνότητες διαχωρισμού. EQ και στάθμες θα έρθουν όταν υπάρχουν σημεία ανά κανάλι.';

  @override
  String get designShareSubject => 'Πρόταση διαμόρφωσης';

  @override
  String get impulseTitle => 'Κρουστική απόκριση';

  @override
  String get impulseCompareTooltip => 'Σύγκριση σημείων';

  @override
  String get impulseExportTooltip => 'Εξαγωγή FRD με φάση';

  @override
  String get impulseTapToStart => 'Πάτα για έναρξη.';

  @override
  String get impulseSweepTitle => 'Το sweep που παίζεις στα ηχεία';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Πρέπει να ταιριάζει με αυτό που παίζεις — αλλιώς η αποσυνέλιξη βγάζει ανοησίες.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Ηχογράφηση — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Τώρα παίξε το sweep από τον υπολογιστή.';

  @override
  String get impulseStartRecording =>
      'Ξεκίνα την ηχογράφηση, μετά παίξε το sweep';

  @override
  String get impulseFrequencyResponse => 'Απόκριση συχνότητας';

  @override
  String get impulseWithRoom => 'με τον χώρο (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'άμεσος ήχος (παράθυρο $ms ms)';
  }

  @override
  String get impulseWindow => 'Παράθυρο';

  @override
  String impulseWindowHelp(String hz) {
    return 'Ένα μακρύτερο παράθυρο βλέπει χαμηλότερα (τώρα ισχύει πάνω από $hz Hz), αλλά αφήνει να μπει η πρώτη ανάκλαση. Κάτω από το όριο η καμπύλη δεν εξομαλύνεται ούτε σχολιάζεται: είναι το παράθυρο, όχι ο χώρος.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Έως την πρώτη ανάκλαση ($ms ms)';
  }

  @override
  String get impulseTime => 'Χρόνος';

  @override
  String get impulseImpulse => 'ώση';

  @override
  String get impulseTimeHelp =>
      'Μπλε είναι το παράθυρο, η πορτοκαλί γραμμή η πρώτη ανάκλαση που βρέθηκε. Χρόνος μηδέν είναι ο άμεσος ήχος.';

  @override
  String get impulseSpectrogram => 'Φασματογράφημα';

  @override
  String get commonHide => 'Απόκρυψη';

  @override
  String get commonShow => 'Εμφάνιση';

  @override
  String get impulseSpectrogramHelp =>
      'Χρόνος σε ms από τον άμεσο ήχο, συχνότητα προς τα πάνω, το χρώμα είναι η στάθμη έως −60 dB. Μια οριζόντια λωρίδα που επιβιώνει από τις άλλες είναι ρυθμός· ο πίνακας από πάνω λέει το ίδιο με αριθμούς.';

  @override
  String get impulseDecayByOctave => 'Απόσβεση ανά οκτάβα';

  @override
  String get impulseMidNoT20 =>
      'Οι μεσαίες ζώνες δεν αποσβέστηκαν αρκετά για T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Μεσαία 125–500 Hz: T20 $seconds s — αυτός είναι ο RT60 με τον οποίο υπολογίζει ο σχεδιασμός.';
  }

  @override
  String get impulseDecayHelp =>
      'Στα μπάσα ο RT60 από τηλέφωνο είναι περισσότερο εκτίμηση: ο θόρυβος υποβάθρου είναι εκεί πιο κοντά και το «—» σημαίνει ότι η αντήχηση δεν έπεσε κάτω από αυτόν. C50 πάνω από το μηδέν: ο άμεσος ήχος με τις πρώιμες ανακλάσεις μεταφέρει περισσότερη ενέργεια από την αντήχηση.';

  @override
  String get impulseResult => 'Αποτέλεσμα';

  @override
  String get impulseDirectArrived => 'Ο άμεσος ήχος έφτασε μετά από';

  @override
  String get impulseDirectArrivedHelp =>
      'Καθυστέρηση αναπαραγωγής συν χρόνος διάδοσης — μόνο του δεν λέει τίποτα, η διαφορά όμως ανάμεσα στο αριστερό και το δεξί ηχείο λέει.';

  @override
  String get impulseFirstReflection => 'Πρώτη ανάκλαση';

  @override
  String get impulseNotFound => 'δεν βρέθηκε';

  @override
  String impulseAfterDirect(String time) {
    return '$time μετά τον άμεσο ήχο';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Ή δεν υπάρχει καμία, ή κρύβεται στο κουδούνισμα της άμεσης ώσης.';

  @override
  String impulseExtraPath(String metres) {
    return 'Επιπλέον διαδρομή ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'μη μετρήσιμο';

  @override
  String get impulseRt60NoiseHelp =>
      'Η αντήχηση δεν έπεσε αρκετά βαθιά πάνω από τον θόρυβο υποβάθρου — πιο δυνατά ή σε πιο ήσυχη στιγμή.';

  @override
  String get impulseRt60Help =>
      'Η διαφορά μεταξύ T20 και T30 δείχνει πόσο καθαρή είναι η απόσβεση.';

  @override
  String get impulseGating => 'Παράθυρο (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'ισχύει πάνω από $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Κάτω από αυτό το παράθυρο δεν βλέπει ούτε μία περίοδο — η καμπύλη εκεί είναι τεχνούργημα του παραθύρου, όχι του χώρου.';

  @override
  String get impulseSchroeder => 'Καμπύλη απόσβεσης Schroeder';

  @override
  String impulseHdAt(int order) {
    return 'HD$order στα 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Οι αρμονικές βρίσκονται στον αρνητικό χρόνο της αποσυνέλιξης Farina· εδώ διαβάζονται από εκεί αντί να πετιούνται. −40 dB είναι 1 %.';

  @override
  String get impulseHd3Help =>
      'Η τρίτη αρμονική αυξάνεται με την υπεροδήγηση γρηγορότερα από τη δεύτερη.';

  @override
  String get impulseDistortionHot => 'Παραμόρφωση πάνω από −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Ή το sweep είναι πολύ δυνατό, ή το ηχείο είναι στο όριο. Η ουρά παραμόρφωσης μοιάζει στην ώση με ανάκλαση — χαμήλωσε την ένταση και μέτρησε ξανά πριν πιστέψεις οτιδήποτε.';

  @override
  String get eqMeasured => 'μετρημένο';

  @override
  String get eqTarget => 'στόχος';

  @override
  String get eqPredicted => 'πρόβλεψη μετά το EQ';

  @override
  String get eqMeasuredAfter => 'μετρημένο μετά το EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Απόκλιση από τον στόχο 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Μετά την εισαγωγή στον ενισχυτή';

  @override
  String get eqPredictionVsReality => 'Πρόβλεψη έναντι πραγματικότητας';

  @override
  String eqStubborn(String bands) {
    return 'Μένει πάνω από 6 dB μακριά από τον στόχο: $bands. Είναι συμβολή, όχι έλλειψη ισχύος — λύνεται μετακινώντας το ηχείο ή τον ακροατή, όχι με περισσότερη ενίσχυση.';
  }

  @override
  String get eqModelOk =>
      'Το φίλτρο του ενισχυτή συμπεριφέρεται περίπου όπως το μοντέλο.';

  @override
  String get eqModelOff =>
      'Το πραγματικό φίλτρο του ενισχυτή αποκλίνει από το μοντέλο περισσότερο απ\' ό,τι αναμενόταν — οι ζώνες του είναι μάλλον φαρδύτερες ή στενότερες απ\' ό,τι υποτίθεται εδώ.';

  @override
  String get eqTargetCurve => 'Καμπύλη στόχου';

  @override
  String get eqFlat => 'επίπεδη';

  @override
  String get eqTargetHelp =>
      'Όχι επίπεδη: πάνω από μερικά kHz το αυτί ακούει τον άμεσο ήχο, το μικρόφωνο αθροίζει και τις ανακλάσεις, και μια ισιωμένη μετρημένη καμπύλη ακούγεται θαμπή. Μια ελαφριά κλίση πάνω και λίγο μπάσο κάτω είναι αυτό που επιλέγουν οι άνθρωποι σε τυφλές ακροάσεις.';

  @override
  String get eqBassLift => 'Ενίσχυση μπάσων';

  @override
  String get eqBassBelow => 'Μπάσα κάτω από';

  @override
  String get eqTilt => 'Κλίση';

  @override
  String get eqDbPerOctave => 'dB/οκτ.';

  @override
  String get eqTiltFrom => 'Κλίση από';

  @override
  String get errorMicPermission =>
      'Χωρίς πρόσβαση στο μικρόφωνο δεν γίνεται μέτρηση. Επίτρεψέ την στις Ρυθμίσεις → AudioScanner → Μικρόφωνο.';

  @override
  String errorMic(String error) {
    return 'Μικρόφωνο: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Δεν ήταν δυνατή η έναρξη του μικροφώνου: $error';
  }

  @override
  String get errorNoArkit =>
      'Αυτή η συσκευή δεν υποστηρίζει ARKit world tracking — τα σημεία δεν μπορούν να τοποθετηθούν στον χώρο.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Η ηχογράφηση είναι μικρότερη από το sweep ($recorded s από $expected s). Ξεκίνα την ηχογράφηση πριν παίξεις το σήμα.';
  }

  @override
  String get sessionSnapshots => 'Στιγμιότυπα';

  @override
  String get errorTrackingUnreliable =>
      'Η παρακολούθηση θέσης δεν είναι αξιόπιστη — το σημείο θα κατέληγε αλλού από εκεί που στέκεσαι.';

  @override
  String errorNoSound(int seconds) {
    return 'Δεν έφτασε κανένας ήχος μέσα σε $seconds s.';
  }

  @override
  String get noteSnapshotNoPose => 'στιγμιότυπο από τον αναλυτή, χωρίς θέση';

  @override
  String get sessionChannels => 'Κανάλια';

  @override
  String get trackingOk => 'Παρακολούθηση OK';

  @override
  String get trackingLimited => 'Αδύναμη παρακολούθηση';

  @override
  String get trackingUnavailable => 'Χωρίς παρακολούθηση';

  @override
  String get poseHintFeatures =>
      'Πολύ λίγες λεπτομέρειες στην εικόνα — στρέψε το τηλέφωνο σε κάτι με υφή, όχι σε γυμνό τοίχο.';

  @override
  String get poseHintMotion => 'Πολύ γρήγορη κίνηση — περπάτα πιο αργά.';

  @override
  String get poseHintLight =>
      'Πολύ λίγο φως — άναψε το φως, η κάμερα δεν βλέπει πού βρίσκεται.';

  @override
  String get poseHintInitializing => 'Το ARKit ξεκινά, κουνήσου λίγο.';

  @override
  String get poseHintRelocalizing =>
      'Αναζητείται ξανά το αρχικό σημείο — γύρνα εκεί που ξεκίνησες.';

  @override
  String get signalPhonePink => 'Ροζ θόρυβος από το τηλέφωνο';

  @override
  String get signalExternalPink => 'Ροζ θόρυβος από τα ηχεία';

  @override
  String get signalExternalSweep => 'Sweep από τα ηχεία';

  @override
  String get captureWarningBluetooth =>
      'Μικρόφωνο Bluetooth: η συμπίεση και η καθυστέρηση χαλάνε τη μέτρηση. Αποσύνδεσε τα ακουστικά και μέτρα με το ενσωματωμένο μικρόφωνο.';

  @override
  String get captureWarningProcessing =>
      'Το σύστημα δεν απενεργοποίησε την επεξεργασία σήματος (AGC / καταστολή θορύβου). Οι μετρημένες διαφορές μεταξύ θέσεων θα είναι αλλοιωμένες.';

  @override
  String get captureWarningMeasurementMode =>
      'Δεν ήταν δυνατή η ενεργοποίηση του measurement mode — το μικρόφωνο έχει δική του διόρθωση απόκρισης συχνότητας.';

  @override
  String get captureRouteUnknown => 'άγνωστο';

  @override
  String get axisLength => 'μήκος';

  @override
  String get axisWidth => 'πλάτος';

  @override
  String get axisHeight => 'ύψος';
}
