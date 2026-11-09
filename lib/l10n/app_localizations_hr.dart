// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Croatian (`hr`).
class AppLocalizationsHr extends AppLocalizations {
  AppLocalizationsHr([String locale = 'hr']) : super(locale);

  @override
  String get tabScan => 'Skeniranje';

  @override
  String get tabMap => 'Karta';

  @override
  String get tabResponse => 'Odziv';

  @override
  String get tabDesign => 'Dizajn';

  @override
  String get tabSignals => 'Signali';

  @override
  String get rtaSnapshotFailed => 'Snimka nije spremljena.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Spremljeno kao točka $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Spremljeno kao točka $id (bez položaja).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count točaka',
      few: '$count točke',
      one: '$count točka',
    );
    return 'Kalibracija $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Datoteka se ne može pročitati: $message';
  }

  @override
  String get rtaOffsetTitle => 'Pomak dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Pusti ton od 1 kHz, očitaj razinu na mjeraču zvučnog tlaka i upiši razliku u odnosu na ono što prikazuje analizator. S pomakom različitim od nule razine se označavaju kao procjena SPL; bez njega ostaju u dBFS.';

  @override
  String get commonReset => 'Poništi';

  @override
  String get commonCancel => 'Odustani';

  @override
  String get commonSave => 'Spremi';

  @override
  String get commonStop => 'Zaustavi';

  @override
  String get commonStartMic => 'Pokreni mikrofon';

  @override
  String get tabAnalyzer => 'Analizator';

  @override
  String get rtaUnfreeze => 'Nastavi';

  @override
  String get rtaFreeze => 'Zamrzni';

  @override
  String get rtaPeakHold => 'Zadržavanje vršnih vrijednosti';

  @override
  String get rtaMaxMinTraces => 'Krivulje maks. / min.';

  @override
  String get rtaResetTraces => 'Poništi krivulje';

  @override
  String get rtaSaveAsPoint => 'Spremi kao točku (3 s)';

  @override
  String get rtaMicCalibration => 'Kalibracija mikrofona…';

  @override
  String get rtaRemoveCalibration => 'Ukloni kalibraciju';

  @override
  String get rtaOffsetMenu => 'Pomak dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · bez obrade signala';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count točaka',
      few: '$count točke',
      one: '$count točka',
    );
    return 'Kalibracija $name: $_temp0, korekcija $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (procjena)';

  @override
  String get rtaFrozenHint =>
      'Zamrznuto — mikrofon radi dalje, samo se ne iscrtava.';

  @override
  String get rtaRelativeHint =>
      'Razine su relativne (dBFS). Obris se pojavljuje kad spremiš prvu točku — ona je referenca za ostale.';

  @override
  String get rtaReferenceHint =>
      'Puni stupci = ovdje. Obris = referentna točka.';

  @override
  String get rtaEnvelopeHint =>
      'Crveno = maks., zeleno = min. od poništavanja.';

  @override
  String get rtaMicStopped => 'mikrofon je zaustavljen';

  @override
  String get rtaSilence => 'tišina — svira li signal?';

  @override
  String get rtaPlaceholder => 'Pokreni mikrofon i pusti signal u prostoriju.';

  @override
  String rtaBandsInfo(int count) {
    return 'Tercnih pojaseva: $count, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Skeniranje prostorije';

  @override
  String scanPointCount(int count) {
    return '$count t.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofon ne radi';

  @override
  String get scanMicNeeded => 'Bez njega se mjeri samo položaj, ne zvuk.';

  @override
  String get scanContinuous => 'Kontinuirano mjerenje';

  @override
  String get scanContinuousHint => 'Točka automatski svakih 0,5 m hoda';

  @override
  String get scanMeasuring => 'Mjerim…';

  @override
  String get scanMeasureHere => 'Izmjeri ovdje';

  @override
  String scanPointSaved(String id, String position) {
    return 'Točka $id spremljena na $position';
  }

  @override
  String get scanStartTracking => 'Pokreni praćenje položaja';

  @override
  String get scanStartTrackingHint =>
      'ARKit — tako aplikacija zna gdje u prostoriji stojiš.';

  @override
  String scanPosition(String position) {
    return 'Položaj: $position m od ishodišta';
  }

  @override
  String get scanSetOriginHint =>
      'Stani na mjesto slušatelja i odredi ishodište.';

  @override
  String get scanOriginHere => 'Ovdje je ishodište';

  @override
  String get scanNoPoints => 'Još nema točaka.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'raspršenost 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Dnevni boravak';

  @override
  String get scanNewMeasurement => 'Novo mjerenje';

  @override
  String get scanRoomName => 'Naziv prostorije';

  @override
  String get scanExcitation => 'Čime ćeš pobuditi prostoriju';

  @override
  String get scanPhoneNoiseHint =>
      'Samo okvirno — zvučnik telefona uopće ne daje bas.';

  @override
  String get scanStart => 'Započni';

  @override
  String get mapExportTooltip => 'Izvoz FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Karta treba barem dvije točke. Prođi prostorijom i mjeri usput.';

  @override
  String get mapShareText =>
      'FRD po točkama (uvoz u REW / VituixCAD) i cijela sesija u JSON-u.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Najujednačenije mjesto: $id na $position m (raspršenost $variation dB u 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Jedini signal iz kojeg se mogu izračunati impulsni odziv, vrijeme odjeka i prve refleksije. Pusti ga s računala ili DAC-a kroz zvučnike, a telefon neka snima.';

  @override
  String get signalsLength => 'Trajanje';

  @override
  String get signalsFrom => 'Od';

  @override
  String get signalsTo => 'Do';

  @override
  String get signalsMonoNoChannel => 'Mono (bez kanala)';

  @override
  String get signalsExportWav => 'Izvoz WAV';

  @override
  String get signalsPinkNoise => 'Ružičasti šum';

  @override
  String get signalsPinkHelp =>
      'Jednaka energija u svakoj oktavi. Daje samo frekvencijski odziv, bez vremena i refleksija — za brzo „događa li se tu nešto?” dovoljno je.';

  @override
  String get signalsExportPink => 'Izvoz WAV 30 s';

  @override
  String get signalsHowTo => 'Kako mjeriti';

  @override
  String get signalsStep1 =>
      'Signal puštaj s računala kroz zvučnike, ne s telefona.';

  @override
  String get signalsStep2 =>
      'Glasnoću namjesti tako da analizator pokazuje oko −20 dBFS. Preopterećenje izgleda kao refleksija.';

  @override
  String get signalsStep3 =>
      'Drži telefon uspravno na ispruženoj ruci, mikrofonom prema zvučnicima.';

  @override
  String get signalsStep4 =>
      'Odspoji Bluetooth slušalice — kompresija i kašnjenje kvare mjerenje.';

  @override
  String get signalsNoteMono =>
      'Mono u oba zvučnika odjednom zbraja L i R, a njihova razlika nestaje u zbroju. Za mjerenje kanala odaberi kanal.';

  @override
  String get signalsNoteStereo =>
      'Stereo datoteka sa signalom samo u jednom kanalu — pustit će je sve što svira stereo.';

  @override
  String get signalsNoteChannel =>
      'Mono datoteka nazvana po kanalu. Usmjeri je na pravi ulaz prijamnika iz DAW-a ili kroz višekanalni ulaz; prijenosnik sa stereo izlazom neće je dovesti na taj kanal.';

  @override
  String get channelsTitle => 'Mjerenje kanala';

  @override
  String get channelsHelp =>
      'Stani na mjesto slušatelja. Za svaki kanal: počni snimati, pusti na njega sweep s kartice Signali, dodirni Gotovo. Bez tih točaka dizajn nema iz čega izračunati EQ i razine.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Provjera nakon unosa EQ-a';

  @override
  String get channelsVerifyAfterEqHint =>
      'Točka se sprema kao „nakon EQ-a” i ne prepisuje onu iz koje je EQ izračunat.';

  @override
  String channelsRecording(String seconds) {
    return 'Snimam $seconds s — sada pusti sweep';
  }

  @override
  String get channelsNotMeasured => 'nije izmjereno';

  @override
  String get channelsMeasuredNoise => 'izmjereno šumom';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · izravni zvuk nakon $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · izravni zvuk nakon $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Gotovo';

  @override
  String get channelsMeasure => 'Izmjeri';

  @override
  String get channelsAdd => 'Dodaj';

  @override
  String get channelsAgain => 'Ponovno';

  @override
  String get compareTitle => 'Usporedba';

  @override
  String get compareNeedsTwoPoints => 'Usporedba treba barem dvije točke.';

  @override
  String get commonWithRoom => 's prostorijom';

  @override
  String get commonDirectSound => 'izravni zvuk';

  @override
  String get compareAfterEq => 'nakon EQ-a';

  @override
  String get compareBandsA => 'A (pojasevi)';

  @override
  String get compareBandsB => 'B (pojasevi)';

  @override
  String get compareArrivalDiff => 'Razlika dolaska A − B';

  @override
  String get compareBroadbandDiff => 'Širokopojasna razina A − B';

  @override
  String get compareWorstBelow300 => 'Najveća razlika ispod 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB u pojasu $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance i level trim izjednačuju razliku dolaska i razine. Razliku oblika ispod 300 Hz ne izjednačuju — nju stvara drugi zid na drugoj udaljenosti i rješava se pomicanjem.';

  @override
  String get designRt60Live => 'T20 125–500 Hz iz posljednjeg odziva';

  @override
  String get designRt60Stored => 'T20 125–500 Hz iz spremljenog sweepa';

  @override
  String get designRt60Guess =>
      'procjena — izmjeri sweep, Schroeder je zasad samo naznaka';

  @override
  String get designExportTooltip => 'Izvoz konfiguracije';

  @override
  String get designCompute => 'Izračunaj dizajn';

  @override
  String get designLidarChecking => 'Provjeravam ima li LiDAR-a…';

  @override
  String get designLidarAvailable => 'LiDAR dostupan';

  @override
  String get designLidarMissing => 'Bez LiDAR-a — unesi dimenzije ručno';

  @override
  String get designLidarHint =>
      'Skeniranje daje zidove na centimetar, pa se slažu i točke refleksije i udaljenosti do granica, ne samo modovi.';

  @override
  String get designManualHint =>
      'Modalnom izračunu trebaju samo tri broja — ali gubiš točke refleksije i točne udaljenosti do zidova.';

  @override
  String get designStopScan => 'Završi skeniranje';

  @override
  String get designScanRoom => 'Skeniraj prostoriju';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls zidova',
      few: '$walls zida',
      one: '$walls zid',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings otvora',
      few: '$openings otvora',
      one: '$openings otvor',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Dimenzije prostorije';

  @override
  String get designLength => 'Duljina';

  @override
  String get designWidth => 'Širina';

  @override
  String get designHeight => 'Visina';

  @override
  String get designWhatToDo => 'Što učiniti';

  @override
  String get designRoomModes => 'Modovi prostorije';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Iznad $schroeder Hz (Schroeder) pojedinačni modovi više nemaju smisla. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: izmjereno, cilj, predviđanje';

  @override
  String get designEqHelp =>
      'Predviđanje je izmjereni odziv plus model petnaest pojaseva prijamnika. Nakon unosa EQ-a ponovno izmjeri kanal s prekidačem „nakon EQ-a” da vidiš koliko je model bio blizu.';

  @override
  String get designReceiverConfig => 'Konfiguracija prijamnika';

  @override
  String get designGeometryOnly =>
      'Bez mjerenja kanala sweepom ovdje je samo geometrija: udaljenosti i frekvencije skretnice. EQ i razine dolaze kad budu točke po kanalu.';

  @override
  String get designShareSubject => 'Prijedlog konfiguracije';

  @override
  String get impulseTitle => 'Impulsni odziv';

  @override
  String get impulseCompareTooltip => 'Usporedi točke';

  @override
  String get impulseExportTooltip => 'Izvoz FRD s fazom';

  @override
  String get impulseTapToStart => 'Dodirni za pokretanje.';

  @override
  String get impulseSweepTitle => 'Sweep koji puštaš kroz zvučnike';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Mora odgovarati onome što puštaš — inače dekonvolucija vraća besmislice.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Snimam — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Sada pusti sweep s računala.';

  @override
  String get impulseStartRecording => 'Počni snimati, zatim pusti sweep';

  @override
  String get impulseFrequencyResponse => 'Frekvencijski odziv';

  @override
  String get impulseWithRoom => 's prostorijom (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'izravni zvuk (prozor $ms ms)';
  }

  @override
  String get impulseWindow => 'Prozor';

  @override
  String impulseWindowHelp(String hz) {
    return 'Duži prozor vidi niže (sada vrijedi iznad $hz Hz), ali propušta prvu refleksiju. Ispod granice krivulja se ne zaglađuje ni ne komentira: to je prozor, ne prostorija.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Do prve refleksije ($ms ms)';
  }

  @override
  String get impulseTime => 'Vrijeme';

  @override
  String get impulseImpulse => 'impuls';

  @override
  String get impulseTimeHelp =>
      'Plavo je prozor, narančasta linija prva pronađena refleksija. Vrijeme nula je izravni zvuk.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Sakrij';

  @override
  String get commonShow => 'Prikaži';

  @override
  String get impulseSpectrogramHelp =>
      'Vrijeme u ms od izravnog zvuka, frekvencija prema gore, boja je razina do −60 dB. Vodoravna traka koja nadživi ostale je mod; tablica iznad kaže isto brojem.';

  @override
  String get impulseDecayByOctave => 'Opadanje po oktavama';

  @override
  String get impulseMidNoT20 => 'Srednji pojasevi nisu dovoljno opali za T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Sredina 125–500 Hz: T20 $seconds s — to je RT60 s kojim računa dizajn.';
  }

  @override
  String get impulseDecayHelp =>
      'U basu je RT60 s telefona prije procjena: pozadinski šum je ondje najbliže, a „—” znači da odjek nije pao ispod njega. C50 iznad nule: izravni zvuk s ranim refleksijama nosi više energije od odjeka.';

  @override
  String get impulseResult => 'Rezultat';

  @override
  String get impulseDirectArrived => 'Izravni zvuk stigao je nakon';

  @override
  String get impulseDirectArrivedHelp =>
      'Kašnjenje reprodukcije plus vrijeme putovanja — samo po sebi ne govori ništa, ali razlika između lijevog i desnog zvučnika govori.';

  @override
  String get impulseFirstReflection => 'Prva refleksija';

  @override
  String get impulseNotFound => 'nije pronađena';

  @override
  String impulseAfterDirect(String time) {
    return '$time nakon izravnog zvuka';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Ili je nema, ili se skrila u titranju izravnog impulsa.';

  @override
  String impulseExtraPath(String metres) {
    return 'Dodatni put ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'nije mjerljivo';

  @override
  String get impulseRt60NoiseHelp =>
      'Odjek nije pao dovoljno duboko iznad razine šuma — glasnije ili u tišem trenutku.';

  @override
  String get impulseRt60Help =>
      'Razlika između T20 i T30 nagovješćuje koliko je opadanje čisto.';

  @override
  String get impulseGating => 'Prozor (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'vrijedi iznad $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Ispod toga prozor ne vidi ni jednu periodu — krivulja je ondje artefakt prozora, ne prostorije.';

  @override
  String get impulseSchroeder => 'Schroederova krivulja opadanja';

  @override
  String impulseHdAt(int order) {
    return 'HD$order na 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmonici leže u negativnom vremenu Farinine dekonvolucije; ovdje se odande čitaju umjesto da se odbace. −40 dB je 1 %.';

  @override
  String get impulseHd3Help =>
      'Treći harmonik raste s preopterećenjem brže od drugog.';

  @override
  String get impulseDistortionHot => 'Izobličenje iznad −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Ili je sweep preglasan, ili je zvučnik na granici. Rep izobličenja u impulsu izgleda kao refleksija — smanji glasnoću i izmjeri ponovno prije nego što ičemu povjeruješ.';

  @override
  String get eqMeasured => 'izmjereno';

  @override
  String get eqTarget => 'cilj';

  @override
  String get eqPredicted => 'predviđanje nakon EQ-a';

  @override
  String get eqMeasuredAfter => 'izmjereno nakon EQ-a';

  @override
  String eqDeviation(int maxHz) {
    return 'Odstupanje od cilja 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Nakon unosa u prijamnik';

  @override
  String get eqPredictionVsReality => 'Predviđanje i stvarnost';

  @override
  String eqStubborn(String bands) {
    return 'Ostaje dalje od cilja od 6 dB: $bands. To je interferencija, ne manjak snage — rješava se pomicanjem zvučnika ili slušatelja, ne dodatnim pojačanjem.';
  }

  @override
  String get eqModelOk => 'Filtar prijamnika ponaša se otprilike kao model.';

  @override
  String get eqModelOff =>
      'Stvarni filtar prijamnika odstupa od modela više nego što se očekivalo — pojasevi su mu vjerojatno širi ili uži nego što se ovdje pretpostavlja.';

  @override
  String get eqTargetCurve => 'Ciljna krivulja';

  @override
  String get eqFlat => 'ravna';

  @override
  String get eqTargetHelp =>
      'Ne ravna: iznad nekoliko kHz uho čuje izravni zvuk, mikrofon zbraja i refleksije, a izravnana izmjerena krivulja zvuči tupo. Blagi nagib gore i malo basa dolje — to ljudi biraju u slijepom slušanju.';

  @override
  String get eqBassLift => 'Pojačanje basa';

  @override
  String get eqBassBelow => 'Bas ispod';

  @override
  String get eqTilt => 'Nagib';

  @override
  String get eqDbPerOctave => 'dB/okt';

  @override
  String get eqTiltFrom => 'Nagib od';

  @override
  String get errorMicPermission =>
      'Bez pristupa mikrofonu ne može se mjeriti. Dopusti ga u Postavke → AudioScanner → Mikrofon.';

  @override
  String errorMic(String error) {
    return 'Mikrofon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Pokretanje mikrofona nije uspjelo: $error';
  }

  @override
  String get errorNoArkit =>
      'Ovaj uređaj ne podržava ARKit world tracking — točke se ne mogu smještati u prostor.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Snimka je kraća od sweepa ($recorded s od $expected s). Počni snimati prije nego što pustiš signal.';
  }

  @override
  String get sessionSnapshots => 'Snimke';

  @override
  String get errorTrackingUnreliable =>
      'Praćenje položaja nije pouzdano — točka bi završila negdje drugdje nego gdje stojiš.';

  @override
  String errorNoSound(int seconds) {
    return 'U $seconds s nije stigao nikakav zvuk.';
  }

  @override
  String get noteSnapshotNoPose => 'snimka iz analizatora, bez položaja';

  @override
  String get sessionChannels => 'Kanali';

  @override
  String get trackingOk => 'Praćenje OK';

  @override
  String get trackingLimited => 'Slabo praćenje';

  @override
  String get trackingUnavailable => 'Bez praćenja';

  @override
  String get poseHintFeatures =>
      'Premalo detalja u slici — usmjeri telefon prema nečemu razvedenom, ne prema golom zidu.';

  @override
  String get poseHintMotion => 'Prebrz pokret — hodaj sporije.';

  @override
  String get poseHintLight =>
      'Premalo svjetla — upali svjetlo, kamera ne vidi gdje je.';

  @override
  String get poseHintInitializing => 'ARKit se pokreće, malo se pomiči.';

  @override
  String get poseHintRelocalizing =>
      'Ponovno se traži izvorna točka — vrati se gdje si počeo.';

  @override
  String get signalPhonePink => 'Ružičasti šum s telefona';

  @override
  String get signalExternalPink => 'Ružičasti šum iz zvučnika';

  @override
  String get signalExternalSweep => 'Sweep iz zvučnika';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth mikrofon: kompresija i kašnjenje kvare mjerenje. Odspoji slušalice i mjeri ugrađenim mikrofonom.';

  @override
  String get captureWarningProcessing =>
      'Sustav nije isključio obradu signala (AGC / potiskivanje šuma). Izmjerene razlike između mjesta bit će iskrivljene.';

  @override
  String get captureWarningMeasurementMode =>
      'Nije uspjelo uključiti measurement mode — mikrofon ima vlastitu korekciju frekvencijskog odziva.';

  @override
  String get captureRouteUnknown => 'nepoznato';

  @override
  String get axisLength => 'duljina';

  @override
  String get axisWidth => 'širina';

  @override
  String get axisHeight => 'visina';
}
