// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get tabScan => 'Scanare';

  @override
  String get tabMap => 'Hartă';

  @override
  String get tabResponse => 'Răspuns';

  @override
  String get tabDesign => 'Proiect';

  @override
  String get tabSignals => 'Semnale';

  @override
  String get rtaSnapshotFailed => 'Instantaneul nu a fost salvat.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Salvat ca punctul $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Salvat ca punctul $id (fără poziție).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de puncte',
      few: '$count puncte',
      one: '$count punct',
    );
    return 'Calibrare $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Fișierul nu poate fi citit: $message';
  }

  @override
  String get rtaOffsetTitle => 'Decalaj dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Redă un ton de 1 kHz, citește nivelul pe un sonometru și introdu diferența față de ce arată analizorul. Cu un decalaj diferit de zero, nivelurile sunt marcate ca estimare SPL; fără el rămân în dBFS.';

  @override
  String get commonReset => 'Resetează';

  @override
  String get commonCancel => 'Anulează';

  @override
  String get commonSave => 'Salvează';

  @override
  String get commonStop => 'Oprește';

  @override
  String get commonStartMic => 'Pornește microfonul';

  @override
  String get tabAnalyzer => 'Analizor';

  @override
  String get rtaUnfreeze => 'Reia';

  @override
  String get rtaFreeze => 'Îngheață';

  @override
  String get rtaPeakHold => 'Menținere vârfuri';

  @override
  String get rtaMaxMinTraces => 'Curbe max. / min.';

  @override
  String get rtaResetTraces => 'Resetează curbele';

  @override
  String get rtaSaveAsPoint => 'Salvează ca punct (3 s)';

  @override
  String get rtaMicCalibration => 'Calibrarea microfonului…';

  @override
  String get rtaRemoveCalibration => 'Elimină calibrarea';

  @override
  String get rtaOffsetMenu => 'Decalaj dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · fără procesarea semnalului';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count de puncte',
      few: '$count puncte',
      one: '$count punct',
    );
    return 'Calibrare $name: $_temp0, corecție $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (estimare)';

  @override
  String get rtaFrozenHint =>
      'Înghețat — microfonul merge în continuare, doar nu se mai desenează.';

  @override
  String get rtaRelativeHint =>
      'Nivelurile sunt relative (dBFS). Conturul apare când salvezi primul punct — el e referința pentru celelalte.';

  @override
  String get rtaReferenceHint =>
      'Bare pline = aici. Contur = punct de referință.';

  @override
  String get rtaEnvelopeHint => 'Roșu = max., verde = min. de la resetare.';

  @override
  String get rtaMicStopped => 'microfonul e oprit';

  @override
  String get rtaSilence => 'liniște — se redă vreun semnal?';

  @override
  String get rtaPlaceholder =>
      'Pornește microfonul și redă un semnal în cameră.';

  @override
  String rtaBandsInfo(int count) {
    return '$count benzi de o treime de octavă, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Scanarea camerei';

  @override
  String scanPointCount(int count) {
    return '$count pct.';
  }

  @override
  String get commonMicNotRunning => 'Microfonul nu funcționează';

  @override
  String get scanMicNeeded => 'Fără el se măsoară doar poziția, nu și sunetul.';

  @override
  String get scanContinuous => 'Măsurare continuă';

  @override
  String get scanContinuousHint => 'Un punct automat la fiecare 0,5 m de mers';

  @override
  String get scanMeasuring => 'Măsor…';

  @override
  String get scanMeasureHere => 'Măsoară aici';

  @override
  String scanPointSaved(String id, String position) {
    return 'Punctul $id salvat la $position';
  }

  @override
  String get scanStartTracking => 'Pornește urmărirea poziției';

  @override
  String get scanStartTrackingHint =>
      'ARKit — așa știe aplicația unde stai în cameră.';

  @override
  String scanPosition(String position) {
    return 'Poziție: $position m de la origine';
  }

  @override
  String get scanSetOriginHint =>
      'Așază-te în locul de ascultare și stabilește originea.';

  @override
  String get scanOriginHere => 'Originea e aici';

  @override
  String get scanNoPoints => 'Încă niciun punct.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'dispersie 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Sufragerie';

  @override
  String get scanNewMeasurement => 'Măsurare nouă';

  @override
  String get scanRoomName => 'Numele camerei';

  @override
  String get scanExcitation => 'Cu ce vei excita camera';

  @override
  String get scanPhoneNoiseHint =>
      'Doar orientativ — difuzorul telefonului nu redă deloc basul.';

  @override
  String get scanStart => 'Începe';

  @override
  String get mapExportTooltip => 'Exportă FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Harta are nevoie de cel puțin două puncte. Parcurge camera și măsoară din mers.';

  @override
  String get mapShareText =>
      'FRD pe puncte (import în REW / VituixCAD) și întreaga sesiune în JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Cel mai uniform loc: $id la $position m (dispersie $variation dB în 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Singurul semnal din care se pot calcula răspunsul la impuls, timpul de reverberație și primele reflexii. Redă-l de pe un computer sau DAC prin boxe și lasă telefonul să înregistreze.';

  @override
  String get signalsLength => 'Durată';

  @override
  String get signalsFrom => 'De la';

  @override
  String get signalsTo => 'Până la';

  @override
  String get signalsMonoNoChannel => 'Mono (fără canal)';

  @override
  String get signalsExportWav => 'Exportă WAV';

  @override
  String get signalsPinkNoise => 'Zgomot roz';

  @override
  String get signalsPinkHelp =>
      'Aceeași energie în fiecare octavă. Dă doar răspunsul în frecvență, fără timp sau reflexii — pentru un rapid „se întâmplă ceva aici?” ajunge.';

  @override
  String get signalsExportPink => 'Exportă WAV de 30 s';

  @override
  String get signalsHowTo => 'Cum măsori';

  @override
  String get signalsStep1 =>
      'Redă semnalul de pe computer prin boxe, nu de pe telefon.';

  @override
  String get signalsStep2 =>
      'Reglează volumul astfel încât analizorul să arate circa −20 dBFS. Supramodularea arată ca o reflexie.';

  @override
  String get signalsStep3 =>
      'Ține telefonul vertical, cu brațul întins, cu microfonul spre boxe.';

  @override
  String get signalsStep4 =>
      'Deconectează căștile Bluetooth — compresia și latența strică măsurarea.';

  @override
  String get signalsNoteMono =>
      'Mono în ambele boxe deodată însumează L și R, iar diferența lor dispare în sumă. Pentru măsurarea canalelor, alege un canal.';

  @override
  String get signalsNoteStereo =>
      'Fișier stereo cu semnal doar pe un canal — îl redă orice dispozitiv care redă stereo.';

  @override
  String get signalsNoteChannel =>
      'Fișier mono denumit după canal. Direcționează-l către intrarea corectă a receiverului dintr-un DAW sau printr-o intrare multicanal; un laptop cu ieșire stereo nu îl duce pe acest canal.';

  @override
  String get channelsTitle => 'Măsurarea canalelor';

  @override
  String get channelsHelp =>
      'Așază-te în locul de ascultare. Pentru fiecare canal: pornește înregistrarea, redă un sweep în el din fila Semnale, atinge Gata. Fără aceste puncte, proiectul nu are din ce să calculeze EQ-ul și nivelurile.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Verificare după introducerea EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Punctul se salvează ca „după EQ” și nu îl suprascrie pe cel din care s-a calculat EQ-ul.';

  @override
  String channelsRecording(String seconds) {
    return 'Înregistrez $seconds s — redă acum sweep-ul';
  }

  @override
  String get channelsNotMeasured => 'nemăsurat';

  @override
  String get channelsMeasuredNoise => 'măsurat cu zgomot';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · sunet direct după $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · sunet direct după $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Gata';

  @override
  String get channelsMeasure => 'Măsoară';

  @override
  String get channelsAdd => 'Adaugă';

  @override
  String get channelsAgain => 'Din nou';

  @override
  String get compareTitle => 'Comparație';

  @override
  String get compareNeedsTwoPoints =>
      'Comparația are nevoie de cel puțin două puncte.';

  @override
  String get commonWithRoom => 'cu camera';

  @override
  String get commonDirectSound => 'sunet direct';

  @override
  String get compareAfterEq => 'după EQ';

  @override
  String get compareBandsA => 'A (benzi)';

  @override
  String get compareBandsB => 'B (benzi)';

  @override
  String get compareArrivalDiff => 'Diferența de sosire A − B';

  @override
  String get compareBroadbandDiff => 'Nivel în bandă largă A − B';

  @override
  String get compareWorstBelow300 => 'Cea mai mare diferență sub 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB în banda de $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance și level trim egalizează diferența de sosire și de nivel. Diferența de formă sub 300 Hz nu o egalizează — ea vine de la alt perete aflat la altă distanță și se rezolvă prin mutare.';

  @override
  String get designRt60Live => 'T20 125–500 Hz din ultimul răspuns';

  @override
  String get designRt60Stored => 'T20 125–500 Hz dintr-un sweep salvat';

  @override
  String get designRt60Guess =>
      'estimare — măsoară un sweep, Schroeder e deocamdată doar un indiciu';

  @override
  String get designExportTooltip => 'Exportă configurația';

  @override
  String get designCompute => 'Calculează proiectul';

  @override
  String get designLidarChecking => 'Verific dacă există LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR disponibil';

  @override
  String get designLidarMissing => 'Fără LiDAR — introdu dimensiunile manual';

  @override
  String get designLidarHint =>
      'Scanarea dă pereții la centimetru, așa că se potrivesc și punctele de reflexie și distanțele până la limite, nu doar modurile.';

  @override
  String get designManualHint =>
      'Calculul modal are nevoie doar de trei numere — dar pierzi punctele de reflexie și distanțele exacte până la pereți.';

  @override
  String get designStopScan => 'Oprește scanarea';

  @override
  String get designScanRoom => 'Scanează camera';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls de pereți',
      few: '$walls pereți',
      one: '$walls perete',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings de deschideri',
      few: '$openings deschideri',
      one: '$openings deschidere',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Dimensiunile camerei';

  @override
  String get designLength => 'Lungime';

  @override
  String get designWidth => 'Lățime';

  @override
  String get designHeight => 'Înălțime';

  @override
  String get designWhatToDo => 'Ce e de făcut';

  @override
  String get designRoomModes => 'Modurile camerei';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Peste $schroeder Hz (Schroeder) modurile individuale nu mai au sens. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: măsurat, țintă, prognoză';

  @override
  String get designEqHelp =>
      'Prognoza este răspunsul măsurat plus un model al celor cincisprezece benzi ale receiverului. După introducerea EQ-ului, măsoară din nou canalul cu comutatorul „după EQ”, ca să vezi cât de aproape a fost modelul.';

  @override
  String get designReceiverConfig => 'Configurația receiverului';

  @override
  String get designGeometryOnly =>
      'Fără măsurători ale canalelor cu sweep, aici e doar geometrie: distanțe și frecvențe de tăiere. EQ-ul și nivelurile apar când vor exista puncte pe fiecare canal.';

  @override
  String get designShareSubject => 'Propunere de configurație';

  @override
  String get impulseTitle => 'Răspuns la impuls';

  @override
  String get impulseCompareTooltip => 'Compară punctele';

  @override
  String get impulseExportTooltip => 'Exportă FRD cu fază';

  @override
  String get impulseTapToStart => 'Atinge pentru a porni.';

  @override
  String get impulseSweepTitle => 'Sweep-ul pe care îl redai prin boxe';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Trebuie să se potrivească cu ce redai — altfel deconvoluția dă prostii.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Înregistrez — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Acum redă sweep-ul de pe computer.';

  @override
  String get impulseStartRecording =>
      'Pornește înregistrarea, apoi redă sweep-ul';

  @override
  String get impulseFrequencyResponse => 'Răspuns în frecvență';

  @override
  String get impulseWithRoom => 'cu camera (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'sunet direct (fereastră $ms ms)';
  }

  @override
  String get impulseWindow => 'Fereastră';

  @override
  String impulseWindowHelp(String hz) {
    return 'O fereastră mai lungă vede mai jos (acum valabilă peste $hz Hz), dar lasă să intre prima reflexie. Sub limită curba nu se netezește și nu se comentează: e fereastra, nu camera.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Până la prima reflexie ($ms ms)';
  }

  @override
  String get impulseTime => 'Timp';

  @override
  String get impulseImpulse => 'impuls';

  @override
  String get impulseTimeHelp =>
      'Albastru e fereastra, linia portocalie e prima reflexie găsită. Timpul zero e sunetul direct.';

  @override
  String get impulseSpectrogram => 'Spectrogramă';

  @override
  String get commonHide => 'Ascunde';

  @override
  String get commonShow => 'Arată';

  @override
  String get impulseSpectrogramHelp =>
      'Timp în ms de la sunetul direct, frecvența în sus, culoarea e nivelul până la −60 dB. O bandă orizontală care le supraviețuiește celorlalte e un mod; tabelul de mai sus spune același lucru în cifre.';

  @override
  String get impulseDecayByOctave => 'Atenuare pe octave';

  @override
  String get impulseMidNoT20 =>
      'Benzile medii nu s-au atenuat destul pentru T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Mediile 125–500 Hz: T20 $seconds s — acesta e RT60 cu care calculează proiectul.';
  }

  @override
  String get impulseDecayHelp =>
      'În bas, RT60 de pe telefon e mai degrabă o estimare: zgomotul de fond e acolo cel mai aproape, iar „—” înseamnă că reverberația n-a coborât sub el. C50 peste zero: sunetul direct cu primele reflexii poartă mai multă energie decât reverberația.';

  @override
  String get impulseResult => 'Rezultat';

  @override
  String get impulseDirectArrived => 'Sunetul direct a sosit după';

  @override
  String get impulseDirectArrivedHelp =>
      'Întârzierea redării plus timpul de zbor — singur nu spune nimic, dar diferența dintre boxa stângă și cea dreaptă, da.';

  @override
  String get impulseFirstReflection => 'Prima reflexie';

  @override
  String get impulseNotFound => 'negăsită';

  @override
  String impulseAfterDirect(String time) {
    return '$time după sunetul direct';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Fie nu există, fie s-a ascuns în oscilația impulsului direct.';

  @override
  String impulseExtraPath(String metres) {
    return 'Drum suplimentar ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'nemăsurabil';

  @override
  String get impulseRt60NoiseHelp =>
      'Reverberația n-a coborât destul de adânc peste zgomotul de fond — mai tare sau într-un moment mai liniștit.';

  @override
  String get impulseRt60Help =>
      'Diferența dintre T20 și T30 sugerează cât de curată e atenuarea.';

  @override
  String get impulseGating => 'Fereastră (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'valabil peste $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Sub această valoare fereastra nu vede nicio perioadă — curba e acolo un artefact al ferestrei, nu al camerei.';

  @override
  String get impulseSchroeder => 'Curba de atenuare Schroeder';

  @override
  String impulseHdAt(int order) {
    return 'HD$order la 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Armonicele stau în timpul negativ al deconvoluției Farina; aici sunt citite de acolo în loc să fie aruncate. −40 dB înseamnă 1 %.';

  @override
  String get impulseHd3Help =>
      'A treia armonică crește la supramodulare mai repede decât a doua.';

  @override
  String get impulseDistortionHot => 'Distorsiune peste −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Fie sweep-ul e prea tare, fie boxa e la limită. Coada de distorsiune arată în impuls ca o reflexie — dă mai încet și măsoară din nou înainte să crezi ceva.';

  @override
  String get eqMeasured => 'măsurat';

  @override
  String get eqTarget => 'țintă';

  @override
  String get eqPredicted => 'prognoză după EQ';

  @override
  String get eqMeasuredAfter => 'măsurat după EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Abatere de la țintă 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'După introducerea în receiver';

  @override
  String get eqPredictionVsReality => 'Prognoză vs. realitate';

  @override
  String eqStubborn(String bands) {
    return 'Rămâne la peste 6 dB de țintă: $bands. E interferență, nu lipsă de putere — se rezolvă mutând boxa sau ascultătorul, nu cu încă o amplificare.';
  }

  @override
  String get eqModelOk =>
      'Filtrul receiverului se comportă aproximativ ca modelul.';

  @override
  String get eqModelOff =>
      'Filtrul real al receiverului diferă de model mai mult decât se aștepta — benzile lui sunt probabil mai late sau mai înguste decât se presupune aici.';

  @override
  String get eqTargetCurve => 'Curba țintă';

  @override
  String get eqFlat => 'plată';

  @override
  String get eqTargetHelp =>
      'Nu plată: peste câțiva kHz urechea aude sunetul direct, microfonul însumează și reflexiile, iar o curbă măsurată aplatizată sună înfundat. O ușoară pantă sus și puțin bas jos e ce aleg oamenii la ascultările oarbe.';

  @override
  String get eqBassLift => 'Amplificare bas';

  @override
  String get eqBassBelow => 'Bas sub';

  @override
  String get eqTilt => 'Pantă';

  @override
  String get eqDbPerOctave => 'dB/oct';

  @override
  String get eqTiltFrom => 'Pantă de la';

  @override
  String get errorMicPermission =>
      'Fără acces la microfon nu se poate măsura. Permite-l în Configurări → AudioScanner → Microfon.';

  @override
  String errorMic(String error) {
    return 'Microfon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Microfonul nu a putut fi pornit: $error';
  }

  @override
  String get errorNoArkit =>
      'Acest dispozitiv nu suportă ARKit world tracking — punctele nu pot fi plasate în spațiu.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Înregistrarea e mai scurtă decât sweep-ul ($recorded s din $expected s). Pornește înregistrarea înainte să redai semnalul.';
  }

  @override
  String get sessionSnapshots => 'Instantanee';

  @override
  String get errorTrackingUnreliable =>
      'Urmărirea poziției nu e de încredere — punctul ar ajunge în alt loc decât cel în care stai.';

  @override
  String errorNoSound(int seconds) {
    return 'În $seconds s nu a sosit niciun sunet.';
  }

  @override
  String get noteSnapshotNoPose => 'instantaneu din analizor, fără poziție';

  @override
  String get sessionChannels => 'Canale';

  @override
  String get trackingOk => 'Urmărire OK';

  @override
  String get trackingLimited => 'Urmărire slabă';

  @override
  String get trackingUnavailable => 'Fără urmărire';

  @override
  String get poseHintFeatures =>
      'Prea puține detalii în imagine — îndreaptă telefonul spre ceva cu textură, nu spre un perete gol.';

  @override
  String get poseHintMotion => 'Mișcare prea rapidă — mergi mai încet.';

  @override
  String get poseHintLight =>
      'Prea puțină lumină — aprinde lumina, camera nu vede unde e.';

  @override
  String get poseHintInitializing => 'ARKit pornește, mișcă-te puțin.';

  @override
  String get poseHintRelocalizing =>
      'Se caută din nou punctul inițial — întoarce-te unde ai început.';

  @override
  String get signalPhonePink => 'Zgomot roz de la telefon';

  @override
  String get signalExternalPink => 'Zgomot roz din boxe';

  @override
  String get signalExternalSweep => 'Sweep din boxe';

  @override
  String get captureWarningBluetooth =>
      'Microfon Bluetooth: compresia și latența strică măsurarea. Deconectează căștile și măsoară cu microfonul încorporat.';

  @override
  String get captureWarningProcessing =>
      'Sistemul nu a dezactivat procesarea semnalului (AGC / reducerea zgomotului). Diferențele măsurate între locuri vor fi distorsionate.';

  @override
  String get captureWarningMeasurementMode =>
      'Measurement mode nu a putut fi activat — microfonul are propria corecție a răspunsului în frecvență.';

  @override
  String get captureRouteUnknown => 'necunoscut';

  @override
  String get axisLength => 'lungime';

  @override
  String get axisWidth => 'lățime';

  @override
  String get axisHeight => 'înălțime';
}
