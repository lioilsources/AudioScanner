// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get tabScan => 'Scan';

  @override
  String get tabMap => 'Karte';

  @override
  String get tabResponse => 'Antwort';

  @override
  String get tabDesign => 'Entwurf';

  @override
  String get tabSignals => 'Signale';

  @override
  String get rtaSnapshotFailed => 'Momentaufnahme wurde nicht gespeichert.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Als Punkt $id gespeichert.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Als Punkt $id gespeichert (ohne Position).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Punkte',
      one: '1 Punkt',
    );
    return 'Kalibrierung $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Datei kann nicht gelesen werden: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB-SPL-Offset';

  @override
  String get rtaOffsetHelp =>
      'Spiele einen 1-kHz-Ton ab, lies den Pegel am SPL-Messgerät ab und gib die Differenz zu dem ein, was der Analysator anzeigt. Mit einem Offset ungleich null werden Pegel als SPL-Schätzung gekennzeichnet; ohne bleiben sie in dBFS.';

  @override
  String get commonReset => 'Zurücksetzen';

  @override
  String get commonCancel => 'Abbrechen';

  @override
  String get commonSave => 'Speichern';

  @override
  String get commonStop => 'Stoppen';

  @override
  String get commonStartMic => 'Mikrofon starten';

  @override
  String get tabAnalyzer => 'Analysator';

  @override
  String get rtaUnfreeze => 'Fortsetzen';

  @override
  String get rtaFreeze => 'Einfrieren';

  @override
  String get rtaPeakHold => 'Peak Hold';

  @override
  String get rtaMaxMinTraces => 'Max-/Min-Kurven';

  @override
  String get rtaResetTraces => 'Kurven zurücksetzen';

  @override
  String get rtaSaveAsPoint => 'Als Punkt speichern (3 s)';

  @override
  String get rtaMicCalibration => 'Mikrofonkalibrierung…';

  @override
  String get rtaRemoveCalibration => 'Kalibrierung entfernen';

  @override
  String get rtaOffsetMenu => 'dB-SPL-Offset…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · ohne Signalbearbeitung';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count Punkte',
      one: '1 Punkt',
    );
    return 'Kalibrierung $name: $_temp0, Korrektur $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (Schätzung)';

  @override
  String get rtaFrozenHint =>
      'Eingefroren — das Mikrofon läuft weiter, es wird nur nicht gezeichnet.';

  @override
  String get rtaRelativeHint =>
      'Pegel sind relativ (dBFS). Die Kontur erscheint, sobald du den ersten Punkt speicherst — er ist die Referenz für alle anderen.';

  @override
  String get rtaReferenceHint => 'Volle Balken = hier. Kontur = Referenzpunkt.';

  @override
  String get rtaEnvelopeHint => 'Rot = Max, Grün = Min seit dem Zurücksetzen.';

  @override
  String get rtaMicStopped => 'Mikrofon gestoppt';

  @override
  String get rtaSilence => 'Stille — läuft ein Signal?';

  @override
  String get rtaPlaceholder =>
      'Starte das Mikrofon und spiele ein Signal in den Raum.';

  @override
  String rtaBandsInfo(int count) {
    return '$count Terzbänder, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Raumscan';

  @override
  String scanPointCount(int count) {
    return '$count Pkt.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofon läuft nicht';

  @override
  String get scanMicNeeded =>
      'Ohne es wird nur die Position gemessen, nicht der Klang.';

  @override
  String get scanContinuous => 'Fortlaufende Messung';

  @override
  String get scanContinuousHint => 'Automatisch ein Punkt alle 0,5 m Gehweg';

  @override
  String get scanMeasuring => 'Messe…';

  @override
  String get scanMeasureHere => 'Hier messen';

  @override
  String scanPointSaved(String id, String position) {
    return 'Punkt $id gespeichert bei $position';
  }

  @override
  String get scanStartTracking => 'Positionsverfolgung starten';

  @override
  String get scanStartTrackingHint =>
      'ARKit — so weiß die App, wo du im Raum stehst.';

  @override
  String scanPosition(String position) {
    return 'Position: $position m vom Ursprung';
  }

  @override
  String get scanSetOriginHint =>
      'Stell dich auf den Hörplatz und lege den Ursprung fest.';

  @override
  String get scanOriginHere => 'Hier ist der Ursprung';

  @override
  String get scanNoPoints => 'Noch keine Punkte.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'Streuung 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Wohnzimmer';

  @override
  String get scanNewMeasurement => 'Neue Messung';

  @override
  String get scanRoomName => 'Raumname';

  @override
  String get scanExcitation => 'Womit du den Raum anregst';

  @override
  String get scanPhoneNoiseHint =>
      'Nur zur Orientierung — der Handylautsprecher gibt überhaupt keinen Bass wieder.';

  @override
  String get scanStart => 'Starten';

  @override
  String get mapExportTooltip => 'FRD + JSON exportieren';

  @override
  String get mapNeedsTwoPoints =>
      'Die Karte braucht mindestens zwei Punkte. Geh durch den Raum und miss fortlaufend.';

  @override
  String get mapShareText =>
      'FRD pro Punkt (Import in REW / VituixCAD) und die ganze Session als JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Ausgeglichenster Platz: $id bei $position m (Streuung $variation dB in 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Das einzige Signal, aus dem sich Impulsantwort, Nachhallzeit und erste Reflexionen berechnen lassen. Spiele es vom Computer oder DAC über die Lautsprecher ab und lass das Handy aufnehmen.';

  @override
  String get signalsLength => 'Länge';

  @override
  String get signalsFrom => 'Von';

  @override
  String get signalsTo => 'Bis';

  @override
  String get signalsMonoNoChannel => 'Mono (ohne Kanal)';

  @override
  String get signalsExportWav => 'WAV exportieren';

  @override
  String get signalsPinkNoise => 'Rosa Rauschen';

  @override
  String get signalsPinkHelp =>
      'Gleiche Energie in jeder Oktave. Liefert nur den Frequenzgang, keine Zeit und keine Reflexionen — für ein schnelles „tut sich hier was?“ reicht es.';

  @override
  String get signalsExportPink => '30-s-WAV exportieren';

  @override
  String get signalsHowTo => 'So misst du';

  @override
  String get signalsStep1 =>
      'Spiele das Signal vom Computer über die Lautsprecher ab, nicht vom Handy.';

  @override
  String get signalsStep2 =>
      'Stell die Lautstärke so ein, dass der Analysator etwa −20 dBFS zeigt. Übersteuerung sieht aus wie eine Reflexion.';

  @override
  String get signalsStep3 =>
      'Halte das Handy senkrecht mit ausgestrecktem Arm, Mikrofon zu den Lautsprechern.';

  @override
  String get signalsStep4 =>
      'Trenne Bluetooth-Kopfhörer — Kompression und Latenz verderben die Messung.';

  @override
  String get signalsNoteMono =>
      'Mono auf beide Lautsprecher gleichzeitig summiert L und R, und ihr Unterschied verschwindet in der Summe. Für Kanalmessungen wähle einen Kanal.';

  @override
  String get signalsNoteStereo =>
      'Stereodatei mit dem Signal nur auf einem Kanal — jedes Gerät, das Stereo abspielt, kann sie wiedergeben.';

  @override
  String get signalsNoteChannel =>
      'Monodatei, benannt nach dem Kanal. Leite sie aus einer DAW oder über einen Mehrkanaleingang auf den richtigen Receiver-Eingang; ein Laptop mit Stereoausgang bringt sie nicht auf diesen Kanal.';

  @override
  String get channelsTitle => 'Kanalmessung';

  @override
  String get channelsHelp =>
      'Stell dich auf den Hörplatz. Für jeden Kanal: Aufnahme starten, aus dem Tab Signale einen Sweep darauf abspielen, auf Fertig tippen. Ohne diese Punkte hat der Entwurf nichts, woraus er EQ und Pegel berechnen kann.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Prüfung nach Eingabe des EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Der Punkt wird als „nach EQ“ gespeichert und überschreibt nicht den, aus dem der EQ berechnet wurde.';

  @override
  String channelsRecording(String seconds) {
    return 'Aufnahme $seconds s — jetzt den Sweep abspielen';
  }

  @override
  String get channelsNotMeasured => 'nicht gemessen';

  @override
  String get channelsMeasuredNoise => 'mit Rauschen gemessen';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · Direktschall nach $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · Direktschall nach $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Fertig';

  @override
  String get channelsMeasure => 'Messen';

  @override
  String get channelsAdd => 'Hinzufügen';

  @override
  String get channelsAgain => 'Neu';

  @override
  String get compareTitle => 'Vergleich';

  @override
  String get compareNeedsTwoPoints =>
      'Der Vergleich braucht mindestens zwei Punkte.';

  @override
  String get commonWithRoom => 'mit Raum';

  @override
  String get commonDirectSound => 'Direktschall';

  @override
  String get compareAfterEq => 'nach EQ';

  @override
  String get compareBandsA => 'A (Bänder)';

  @override
  String get compareBandsB => 'B (Bänder)';

  @override
  String get compareArrivalDiff => 'Laufzeitdifferenz A − B';

  @override
  String get compareBroadbandDiff => 'Breitbandpegel A − B';

  @override
  String get compareWorstBelow300 => 'Größte Differenz unter 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB im Band $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance und Level Trim gleichen Laufzeit- und Pegeldifferenz aus. Den Formunterschied unter 300 Hz gleichen sie nicht aus — der kommt von einer anderen Wand in anderer Entfernung und wird durch Verschieben gelöst.';

  @override
  String get designRt60Live => 'T20 125–500 Hz aus der letzten Antwort';

  @override
  String get designRt60Stored => 'T20 125–500 Hz aus einem gespeicherten Sweep';

  @override
  String get designRt60Guess =>
      'Schätzung — miss einen Sweep, Schroeder ist vorerst nur ein Tipp';

  @override
  String get designExportTooltip => 'Konfiguration exportieren';

  @override
  String get designCompute => 'Entwurf berechnen';

  @override
  String get designLidarChecking => 'Prüfe, ob LiDAR vorhanden ist…';

  @override
  String get designLidarAvailable => 'LiDAR verfügbar';

  @override
  String get designLidarMissing => 'Kein LiDAR — Maße von Hand eingeben';

  @override
  String get designLidarHint =>
      'Der Scan erfasst Wände auf den Zentimeter, damit stimmen auch Reflexionspunkte und Abstände zu den Begrenzungen, nicht nur die Moden.';

  @override
  String get designManualHint =>
      'Die Modalberechnung braucht nur drei Zahlen — Reflexionspunkte und genaue Wandabstände entgehen dir aber.';

  @override
  String get designStopScan => 'Scan beenden';

  @override
  String get designScanRoom => 'Raum scannen';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls Wände',
      one: '1 Wand',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings Öffnungen',
      one: '1 Öffnung',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Raummaße';

  @override
  String get designLength => 'Länge';

  @override
  String get designWidth => 'Breite';

  @override
  String get designHeight => 'Höhe';

  @override
  String get designWhatToDo => 'Was dagegen tun';

  @override
  String get designRoomModes => 'Raummoden';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Über $schroeder Hz (Schroeder) ergeben einzelne Moden keinen Sinn mehr. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: gemessen, Ziel, Vorhersage';

  @override
  String get designEqHelp =>
      'Die Vorhersage ist die gemessene Antwort plus ein Modell der fünfzehn Receiver-Bänder. Miss den Kanal nach Eingabe des EQ erneut mit dem Schalter „nach EQ“, um zu sehen, wie nah das Modell lag.';

  @override
  String get designReceiverConfig => 'Receiver-Konfiguration';

  @override
  String get designGeometryOnly =>
      'Ohne Sweep-Messungen der Kanäle gibt es hier nur Geometrie: Abstände und Trennfrequenzen. EQ und Pegel kommen hinzu, sobald es Punkte pro Kanal gibt.';

  @override
  String get designShareSubject => 'Konfigurationsentwurf';

  @override
  String get impulseTitle => 'Impulsantwort';

  @override
  String get impulseCompareTooltip => 'Punkte vergleichen';

  @override
  String get impulseExportTooltip => 'FRD mit Phase exportieren';

  @override
  String get impulseTapToStart => 'Zum Starten tippen.';

  @override
  String get impulseSweepTitle =>
      'Der Sweep, den du über die Lautsprecher abspielst';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Muss zu dem passen, was du abspielst — sonst liefert die Dekonvolution Unsinn.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Aufnahme — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Jetzt den Sweep vom Computer abspielen.';

  @override
  String get impulseStartRecording => 'Aufnahme starten, dann Sweep abspielen';

  @override
  String get impulseFrequencyResponse => 'Frequenzgang';

  @override
  String get impulseWithRoom => 'mit Raum (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'Direktschall (Fenster $ms ms)';
  }

  @override
  String get impulseWindow => 'Fenster';

  @override
  String impulseWindowHelp(String hz) {
    return 'Ein längeres Fenster sieht tiefer (jetzt gültig über $hz Hz), lässt aber die erste Reflexion herein. Unterhalb der Grenze wird die Kurve weder geglättet noch kommentiert: das ist das Fenster, nicht der Raum.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Bis zur ersten Reflexion ($ms ms)';
  }

  @override
  String get impulseTime => 'Zeit';

  @override
  String get impulseImpulse => 'Impuls';

  @override
  String get impulseTimeHelp =>
      'Blau ist das Fenster, die orange Linie die erste gefundene Reflexion. Zeit null ist der Direktschall.';

  @override
  String get impulseSpectrogram => 'Spektrogramm';

  @override
  String get commonHide => 'Ausblenden';

  @override
  String get commonShow => 'Anzeigen';

  @override
  String get impulseSpectrogramHelp =>
      'Zeit in ms ab Direktschall, Frequenz nach oben, Farbe ist der Pegel bis −60 dB. Ein waagerechter Streifen, der die anderen überdauert, ist eine Mode; die Tabelle oben sagt dasselbe in Zahlen.';

  @override
  String get impulseDecayByOctave => 'Abklingen nach Oktaven';

  @override
  String get impulseMidNoT20 =>
      'Die mittleren Bänder sind für T20 nicht weit genug abgeklungen.';

  @override
  String impulseMidT20(String seconds) {
    return 'Mitte 125–500 Hz: T20 $seconds s — das ist die RT60, mit der der Entwurf rechnet.';
  }

  @override
  String get impulseDecayHelp =>
      'Im Bass ist die RT60 vom Handy eher eine Schätzung: Das Hintergrundrauschen liegt dort am nächsten, und „—“ heißt, dass der Nachhall nicht darunter abgeklungen ist. C50 über null: Direktschall mit frühen Reflexionen trägt mehr Energie als der Nachhall.';

  @override
  String get impulseResult => 'Ergebnis';

  @override
  String get impulseDirectArrived => 'Direktschall kam an nach';

  @override
  String get impulseDirectArrivedHelp =>
      'Wiedergabeverzögerung plus Laufzeit — für sich allein bedeutungslos, aber der Unterschied zwischen linkem und rechtem Lautsprecher zählt.';

  @override
  String get impulseFirstReflection => 'Erste Reflexion';

  @override
  String get impulseNotFound => 'nicht gefunden';

  @override
  String impulseAfterDirect(String time) {
    return '$time nach dem Direktschall';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Entweder gibt es keine, oder sie versteckt sich im Nachschwingen des Direktimpulses.';

  @override
  String impulseExtraPath(String metres) {
    return 'Umweg ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'nicht messbar';

  @override
  String get impulseRt60NoiseHelp =>
      'Der Nachhall ist nicht tief genug über den Rauschpegel abgeklungen — lauter, oder in einem ruhigeren Moment.';

  @override
  String get impulseRt60Help =>
      'Der Unterschied zwischen T20 und T30 zeigt, wie sauber das Abklingen ist.';

  @override
  String get impulseGating => 'Fenster (Gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'gültig über $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Darunter sieht das Fenster nicht einmal eine Periode — die Kurve ist dort ein Artefakt des Fensters, nicht des Raums.';

  @override
  String get impulseSchroeder => 'Schroeder-Abklingkurve';

  @override
  String impulseHdAt(int order) {
    return 'HD$order bei 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Die Harmonischen liegen in der negativen Zeit der Farina-Dekonvolution; hier werden sie daraus gelesen statt verworfen. −40 dB sind 1 %.';

  @override
  String get impulseHd3Help =>
      'Die dritte Harmonische wächst bei Übersteuerung schneller als die zweite.';

  @override
  String get impulseDistortionHot => 'Verzerrung über −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Entweder ist der Sweep zu laut oder der Lautsprecher am Limit. Ein Verzerrungsausläufer sieht im Impuls wie eine Reflexion aus — dreh leiser und miss neu, bevor du irgendetwas glaubst.';

  @override
  String get eqMeasured => 'gemessen';

  @override
  String get eqTarget => 'Ziel';

  @override
  String get eqPredicted => 'Vorhersage nach EQ';

  @override
  String get eqMeasuredAfter => 'gemessen nach EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Abweichung vom Ziel 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Nach Eingabe in den Receiver';

  @override
  String get eqPredictionVsReality => 'Vorhersage vs. Realität';

  @override
  String eqStubborn(String bands) {
    return 'Bleibt mehr als 6 dB vom Ziel entfernt: $bands. Das ist Interferenz, kein Leistungsmangel — lösbar durch Verschieben von Lautsprecher oder Hörer, nicht durch mehr Anhebung.';
  }

  @override
  String get eqModelOk =>
      'Der Filter des Receivers verhält sich ungefähr wie das Modell.';

  @override
  String get eqModelOff =>
      'Der tatsächliche Filter des Receivers weicht stärker als erwartet vom Modell ab — seine Bänder sind wohl breiter oder schmaler als hier angenommen.';

  @override
  String get eqTargetCurve => 'Zielkurve';

  @override
  String get eqFlat => 'linear';

  @override
  String get eqTargetHelp =>
      'Nicht linear: Über ein paar kHz hört das Ohr den Direktschall, das Mikrofon summiert auch die Reflexionen, und eine begradigte Messkurve klingt dumpf. Eine leichte Neigung oben und etwas Bass unten wählen Menschen im Blindtest.';

  @override
  String get eqBassLift => 'Bassanhebung';

  @override
  String get eqBassBelow => 'Bass unter';

  @override
  String get eqTilt => 'Neigung';

  @override
  String get eqDbPerOctave => 'dB/Okt.';

  @override
  String get eqTiltFrom => 'Neigung ab';

  @override
  String get errorMicPermission =>
      'Ohne Mikrofonzugriff kann nicht gemessen werden. Erlaube ihn unter Einstellungen → AudioScanner → Mikrofon.';

  @override
  String errorMic(String error) {
    return 'Mikrofon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Mikrofon konnte nicht gestartet werden: $error';
  }

  @override
  String get errorNoArkit =>
      'Dieses Gerät beherrscht kein ARKit World Tracking — Punkte lassen sich nicht im Raum platzieren.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Die Aufnahme ist kürzer als der Sweep ($recorded s von $expected s). Starte die Aufnahme, bevor du das Signal abspielst.';
  }

  @override
  String get sessionSnapshots => 'Momentaufnahmen';

  @override
  String get errorTrackingUnreliable =>
      'Die Positionsverfolgung ist unzuverlässig — der Punkt läge woanders, als du stehst.';

  @override
  String errorNoSound(int seconds) {
    return 'Innerhalb von $seconds s kam kein Ton an.';
  }

  @override
  String get noteSnapshotNoPose =>
      'Momentaufnahme aus dem Analysator, ohne Position';

  @override
  String get sessionChannels => 'Kanäle';

  @override
  String get trackingOk => 'Tracking OK';

  @override
  String get trackingLimited => 'Schwaches Tracking';

  @override
  String get trackingUnavailable => 'Kein Tracking';

  @override
  String get poseHintFeatures =>
      'Zu wenig Details im Bild — richte das Handy auf etwas Strukturiertes, nicht auf eine kahle Wand.';

  @override
  String get poseHintMotion => 'Zu schnelle Bewegung — geh langsamer.';

  @override
  String get poseHintLight =>
      'Zu wenig Licht — mach Licht an, die Kamera sieht nicht, wo sie ist.';

  @override
  String get poseHintInitializing => 'ARKit startet, beweg dich ein wenig.';

  @override
  String get poseHintRelocalizing =>
      'Der ursprüngliche Punkt wird wieder gesucht — geh dorthin zurück, wo du angefangen hast.';

  @override
  String get signalPhonePink => 'Rosa Rauschen vom Handy';

  @override
  String get signalExternalPink => 'Rosa Rauschen von den Lautsprechern';

  @override
  String get signalExternalSweep => 'Sweep von den Lautsprechern';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth-Mikrofon: Kompression und Latenz verderben die Messung. Trenne die Kopfhörer und miss mit dem eingebauten Mikrofon.';

  @override
  String get captureWarningProcessing =>
      'Das System hat die Signalbearbeitung (AGC / Rauschunterdrückung) nicht abgeschaltet. Gemessene Unterschiede zwischen Plätzen werden verfälscht.';

  @override
  String get captureWarningMeasurementMode =>
      'Measurement Mode ließ sich nicht aktivieren — das Mikrofon hat eine eigene Frequenzgangkorrektur.';

  @override
  String get captureRouteUnknown => 'unbekannt';

  @override
  String get axisLength => 'Länge';

  @override
  String get axisWidth => 'Breite';

  @override
  String get axisHeight => 'Höhe';
}
