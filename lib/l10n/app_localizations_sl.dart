// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovenian (`sl`).
class AppLocalizationsSl extends AppLocalizations {
  AppLocalizationsSl([String locale = 'sl']) : super(locale);

  @override
  String get tabScan => 'Skeniranje';

  @override
  String get tabMap => 'Zemljevid';

  @override
  String get tabResponse => 'Odziv';

  @override
  String get tabDesign => 'Načrt';

  @override
  String get tabSignals => 'Signali';

  @override
  String get rtaSnapshotFailed => 'Posnetek ni bil shranjen.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Shranjeno kot točka $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Shranjeno kot točka $id (brez položaja).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count točk',
      few: '$count točke',
      two: '$count točki',
      one: '$count točka',
    );
    return 'Kalibracija $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Datoteke ni mogoče prebrati: $message';
  }

  @override
  String get rtaOffsetTitle => 'Odmik dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Predvajaj ton 1 kHz, odčitaj raven na merilniku zvočnega tlaka in vnesi razliko glede na to, kar kaže analizator. Z neničelnim odmikom so ravni označene kot ocena SPL; brez njega ostanejo v dBFS.';

  @override
  String get commonReset => 'Ponastavi';

  @override
  String get commonCancel => 'Prekliči';

  @override
  String get commonSave => 'Shrani';

  @override
  String get commonStop => 'Ustavi';

  @override
  String get commonStartMic => 'Zaženi mikrofon';

  @override
  String get tabAnalyzer => 'Analizator';

  @override
  String get rtaUnfreeze => 'Nadaljuj';

  @override
  String get rtaFreeze => 'Zamrzni';

  @override
  String get rtaPeakHold => 'Zadrževanje vrhov';

  @override
  String get rtaMaxMinTraces => 'Krivulje maks. / min.';

  @override
  String get rtaResetTraces => 'Ponastavi krivulje';

  @override
  String get rtaSaveAsPoint => 'Shrani kot točko (3 s)';

  @override
  String get rtaMicCalibration => 'Kalibracija mikrofona…';

  @override
  String get rtaRemoveCalibration => 'Odstrani kalibracijo';

  @override
  String get rtaOffsetMenu => 'Odmik dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · brez obdelave signala';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count točk',
      few: '$count točke',
      two: '$count točki',
      one: '$count točka',
    );
    return 'Kalibracija $name: $_temp0, korekcija $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (ocena)';

  @override
  String get rtaFrozenHint =>
      'Zamrznjeno — mikrofon teče naprej, le izrisuje se ne.';

  @override
  String get rtaRelativeHint =>
      'Ravni so relativne (dBFS). Obris se pokaže, ko shraniš prvo točko — ta je referenca za ostale.';

  @override
  String get rtaReferenceHint =>
      'Polni stolpci = tukaj. Obris = referenčna točka.';

  @override
  String get rtaEnvelopeHint => 'Rdeča = maks., zelena = min. od ponastavitve.';

  @override
  String get rtaMicStopped => 'mikrofon je ustavljen';

  @override
  String get rtaSilence => 'tišina — ali signal igra?';

  @override
  String get rtaPlaceholder => 'Zaženi mikrofon in predvajaj signal v prostor.';

  @override
  String rtaBandsInfo(int count) {
    return 'Tretjinskooktavnih pasov: $count, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Skeniranje prostora';

  @override
  String scanPointCount(int count) {
    return '$count t.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofon ne deluje';

  @override
  String get scanMicNeeded => 'Brez njega se izmeri le položaj, ne zvok.';

  @override
  String get scanContinuous => 'Sprotno merjenje';

  @override
  String get scanContinuousHint => 'Točka samodejno na vsakih 0,5 m hoje';

  @override
  String get scanMeasuring => 'Merim…';

  @override
  String get scanMeasureHere => 'Izmeri tukaj';

  @override
  String scanPointSaved(String id, String position) {
    return 'Točka $id shranjena na $position';
  }

  @override
  String get scanStartTracking => 'Zaženi sledenje položaju';

  @override
  String get scanStartTrackingHint =>
      'ARKit — tako aplikacija ve, kje v prostoru stojiš.';

  @override
  String scanPosition(String position) {
    return 'Položaj: $position m od izhodišča';
  }

  @override
  String get scanSetOriginHint =>
      'Postavi se na mesto poslušalca in določi izhodišče.';

  @override
  String get scanOriginHere => 'Tukaj je izhodišče';

  @override
  String get scanNoPoints => 'Še ni točk.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'razpršenost 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Dnevna soba';

  @override
  String get scanNewMeasurement => 'Novo merjenje';

  @override
  String get scanRoomName => 'Ime prostora';

  @override
  String get scanExcitation => 'S čim boš vzbujal prostor';

  @override
  String get scanPhoneNoiseHint =>
      'Le okvirno — zvočnik telefona basov sploh ne predvaja.';

  @override
  String get scanStart => 'Začni';

  @override
  String get mapExportTooltip => 'Izvoz FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Zemljevid potrebuje vsaj dve točki. Prehodi prostor in sproti meri.';

  @override
  String get mapShareText =>
      'FRD po točkah (uvoz v REW / VituixCAD) in celotna seja v JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Najbolj enakomerno mesto: $id na $position m (razpršenost $variation dB v 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Edini signal, iz katerega je mogoče izračunati impulzni odziv, odmevni čas in prve odboje. Predvajaj ga iz računalnika ali DAC-a skozi zvočnike, telefon pa naj snema.';

  @override
  String get signalsLength => 'Dolžina';

  @override
  String get signalsFrom => 'Od';

  @override
  String get signalsTo => 'Do';

  @override
  String get signalsMonoNoChannel => 'Mono (brez kanala)';

  @override
  String get signalsExportWav => 'Izvoz WAV';

  @override
  String get signalsPinkNoise => 'Rožnati šum';

  @override
  String get signalsPinkHelp =>
      'Enaka energija v vsaki oktavi. Da le frekvenčni odziv, brez časa in odbojev — za hiter „se tu kaj dogaja?“ zadošča.';

  @override
  String get signalsExportPink => 'Izvoz WAV 30 s';

  @override
  String get signalsHowTo => 'Kako meriti';

  @override
  String get signalsStep1 =>
      'Signal predvajaj iz računalnika skozi zvočnike, ne iz telefona.';

  @override
  String get signalsStep2 =>
      'Glasnost nastavi tako, da analizator kaže okoli −20 dBFS. Prekrmiljenje je videti kot odboj.';

  @override
  String get signalsStep3 =>
      'Telefon drži pokončno na iztegnjeni roki, z mikrofonom proti zvočnikom.';

  @override
  String get signalsStep4 =>
      'Odklopi slušalke Bluetooth — stiskanje in zakasnitev pokvarita meritev.';

  @override
  String get signalsNoteMono =>
      'Mono v oba zvočnika hkrati sešteje L in R, njuna razlika pa v vsoti izgine. Za merjenje kanalov izberi kanal.';

  @override
  String get signalsNoteStereo =>
      'Stereo datoteka s signalom le v enem kanalu — predvaja jo vse, kar predvaja stereo.';

  @override
  String get signalsNoteChannel =>
      'Mono datoteka, poimenovana po kanalu. Usmeri jo na pravi vhod sprejemnika iz DAW ali prek večkanalnega vhoda; prenosnik s stereo izhodom je na ta kanal ne pripelje.';

  @override
  String get channelsTitle => 'Merjenje kanalov';

  @override
  String get channelsHelp =>
      'Postavi se na mesto poslušalca. Za vsak kanal: začni snemati, predvajaj vanj sweep z zavihka Signali in tapni Končano. Brez teh točk načrt nima iz česa izračunati EQ in ravni.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Preverjanje po vnosu EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Točka se shrani kot „po EQ“ in ne prepiše tiste, iz katere je bil EQ izračunan.';

  @override
  String channelsRecording(String seconds) {
    return 'Snemam $seconds s — zdaj predvajaj sweep';
  }

  @override
  String get channelsNotMeasured => 'ni izmerjeno';

  @override
  String get channelsMeasuredNoise => 'izmerjeno s šumom';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · neposredni zvok po $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · neposredni zvok po $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Končano';

  @override
  String get channelsMeasure => 'Izmeri';

  @override
  String get channelsAdd => 'Dodaj';

  @override
  String get channelsAgain => 'Znova';

  @override
  String get compareTitle => 'Primerjava';

  @override
  String get compareNeedsTwoPoints => 'Primerjava potrebuje vsaj dve točki.';

  @override
  String get commonWithRoom => 's prostorom';

  @override
  String get commonDirectSound => 'neposredni zvok';

  @override
  String get compareAfterEq => 'po EQ';

  @override
  String get compareBandsA => 'A (pasovi)';

  @override
  String get compareBandsB => 'B (pasovi)';

  @override
  String get compareArrivalDiff => 'Razlika prihoda A − B';

  @override
  String get compareBroadbandDiff => 'Širokopasovna raven A − B';

  @override
  String get compareWorstBelow300 => 'Največja razlika pod 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB v pasu $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance in level trim izravnata razliko prihoda in ravni. Razlike oblike pod 300 Hz ne izravnata — to povzroča druga stena na drugi razdalji in se rešuje s premikanjem.';

  @override
  String get designRt60Live => 'T20 125–500 Hz iz zadnjega odziva';

  @override
  String get designRt60Stored => 'T20 125–500 Hz iz shranjenega sweepa';

  @override
  String get designRt60Guess =>
      'ocena — izmeri sweep, Schroeder je zaenkrat le namig';

  @override
  String get designExportTooltip => 'Izvoz konfiguracije';

  @override
  String get designCompute => 'Izračunaj načrt';

  @override
  String get designLidarChecking => 'Preverjam, ali je LiDAR na voljo…';

  @override
  String get designLidarAvailable => 'LiDAR je na voljo';

  @override
  String get designLidarMissing => 'Brez LiDAR-ja — mere vnesi ročno';

  @override
  String get designLidarHint =>
      'Skeniranje da stene na centimeter natančno, zato se ujemajo tudi točke odbojev in razdalje do mej, ne le modi.';

  @override
  String get designManualHint =>
      'Modalni izračun potrebuje le tri številke — ob točke odbojev in natančne razdalje do sten pa prideš.';

  @override
  String get designStopScan => 'Končaj skeniranje';

  @override
  String get designScanRoom => 'Skeniraj prostor';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls sten',
      few: '$walls stene',
      two: '$walls steni',
      one: '$walls stena',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings odprtin',
      few: '$openings odprtine',
      two: '$openings odprtini',
      one: '$openings odprtina',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Mere prostora';

  @override
  String get designLength => 'Dolžina';

  @override
  String get designWidth => 'Širina';

  @override
  String get designHeight => 'Višina';

  @override
  String get designWhatToDo => 'Kaj storiti';

  @override
  String get designRoomModes => 'Modi prostora';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Nad $schroeder Hz (Schroeder) posamezni modi nimajo več smisla. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: izmerjeno, cilj, napoved';

  @override
  String get designEqHelp =>
      'Napoved je izmerjeni odziv plus model petnajstih pasov sprejemnika. Po vnosu EQ znova izmeri kanal s stikalom „po EQ“, da vidiš, kako blizu je bil model.';

  @override
  String get designReceiverConfig => 'Konfiguracija sprejemnika';

  @override
  String get designGeometryOnly =>
      'Brez meritev kanalov s sweepom je tu le geometrija: razdalje in delilne frekvence. EQ in ravni pridejo, ko bodo točke za vsak kanal.';

  @override
  String get designShareSubject => 'Predlog konfiguracije';

  @override
  String get impulseTitle => 'Impulzni odziv';

  @override
  String get impulseCompareTooltip => 'Primerjaj točke';

  @override
  String get impulseExportTooltip => 'Izvoz FRD s fazo';

  @override
  String get impulseTapToStart => 'Tapni za zagon.';

  @override
  String get impulseSweepTitle => 'Sweep, ki ga predvajaš skozi zvočnike';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Ujemati se mora s tem, kar predvajaš — sicer dekonvolucija vrne nesmisel.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Snemam — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Zdaj predvajaj sweep iz računalnika.';

  @override
  String get impulseStartRecording => 'Začni snemati, nato predvajaj sweep';

  @override
  String get impulseFrequencyResponse => 'Frekvenčni odziv';

  @override
  String get impulseWithRoom => 's prostorom (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'neposredni zvok (okno $ms ms)';
  }

  @override
  String get impulseWindow => 'Okno';

  @override
  String impulseWindowHelp(String hz) {
    return 'Daljše okno vidi nižje (zdaj veljavno nad $hz Hz), a spusti noter prvi odboj. Pod mejo se krivulja ne gladi in ne komentira: to je okno, ne prostor.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Do prvega odboja ($ms ms)';
  }

  @override
  String get impulseTime => 'Čas';

  @override
  String get impulseImpulse => 'impulz';

  @override
  String get impulseTimeHelp =>
      'Modro je okno, oranžna črta prvi najdeni odboj. Čas nič je neposredni zvok.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Skrij';

  @override
  String get commonShow => 'Prikaži';

  @override
  String get impulseSpectrogramHelp =>
      'Čas v ms od neposrednega zvoka, frekvenca navzgor, barva je raven do −60 dB. Vodoravni pas, ki preživi ostale, je mod; tabela zgoraj pove isto s številko.';

  @override
  String get impulseDecayByOctave => 'Upadanje po oktavah';

  @override
  String get impulseMidNoT20 => 'Srednji pasovi niso dovolj upadli za T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Sredina 125–500 Hz: T20 $seconds s — to je RT60, s katerim računa načrt.';
  }

  @override
  String get impulseDecayHelp =>
      'V basih je RT60 s telefona bolj ocena: šum ozadja je tam najbližje, „—“ pa pomeni, da odmev ni padel pod njega. C50 nad ničlo: neposredni zvok z zgodnjimi odboji nosi več energije kot odmev.';

  @override
  String get impulseResult => 'Rezultat';

  @override
  String get impulseDirectArrived => 'Neposredni zvok je prispel po';

  @override
  String get impulseDirectArrivedHelp =>
      'Zakasnitev predvajanja plus čas potovanja — samo po sebi ne pove nič, razlika med levim in desnim zvočnikom pa.';

  @override
  String get impulseFirstReflection => 'Prvi odboj';

  @override
  String get impulseNotFound => 'ni najden';

  @override
  String impulseAfterDirect(String time) {
    return '$time po neposrednem zvoku';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Ali ga ni, ali pa se je skril v zvonjenju neposrednega impulza.';

  @override
  String impulseExtraPath(String metres) {
    return 'Dodatna pot ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'ni merljivo';

  @override
  String get impulseRt60NoiseHelp =>
      'Odmev ni padel dovolj globoko nad raven šuma — glasneje ali v tišjem trenutku.';

  @override
  String get impulseRt60Help =>
      'Razlika med T20 in T30 namiguje, kako čisto je upadanje.';

  @override
  String get impulseGating => 'Okno (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'veljavno nad $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Pod tem okno ne vidi niti ene periode — krivulja je tam artefakt okna, ne prostora.';

  @override
  String get impulseSchroeder => 'Schroederjeva krivulja upadanja';

  @override
  String impulseHdAt(int order) {
    return 'HD$order pri 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmoniki ležijo v negativnem času Farinine dekonvolucije; tu se od tam berejo, namesto da bi jih zavrgli. −40 dB je 1 %.';

  @override
  String get impulseHd3Help =>
      'Tretji harmonik s prekrmiljenjem raste hitreje kot drugi.';

  @override
  String get impulseDistortionHot => 'Popačenje nad −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Ali je sweep preglasen ali pa je zvočnik na meji. Rep popačenja je v impulzu videti kot odboj — zmanjšaj glasnost in izmeri znova, preden čemur koli verjameš.';

  @override
  String get eqMeasured => 'izmerjeno';

  @override
  String get eqTarget => 'cilj';

  @override
  String get eqPredicted => 'napoved po EQ';

  @override
  String get eqMeasuredAfter => 'izmerjeno po EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Odstopanje od cilja 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Po vnosu v sprejemnik';

  @override
  String get eqPredictionVsReality => 'Napoved in resničnost';

  @override
  String eqStubborn(String bands) {
    return 'Ostane dlje od cilja kot 6 dB: $bands. To je interferenca, ne pomanjkanje moči — rešuje se s premikom zvočnika ali poslušalca, ne z dodatnim dvigom.';
  }

  @override
  String get eqModelOk => 'Filter sprejemnika se obnaša približno kot model.';

  @override
  String get eqModelOff =>
      'Dejanski filter sprejemnika odstopa od modela bolj, kot je bilo pričakovano — njegovi pasovi so verjetno širši ali ožji, kot se tu predpostavlja.';

  @override
  String get eqTargetCurve => 'Ciljna krivulja';

  @override
  String get eqFlat => 'ravna';

  @override
  String get eqTargetHelp =>
      'Ne ravna: nad nekaj kHz uho sliši neposredni zvok, mikrofon sešteva tudi odboje, poravnana izmerjena krivulja pa zveni topo. Rahel naklon zgoraj in malo basov spodaj — to ljudje izberejo pri slepem poslušanju.';

  @override
  String get eqBassLift => 'Dvig basov';

  @override
  String get eqBassBelow => 'Basi pod';

  @override
  String get eqTilt => 'Naklon';

  @override
  String get eqDbPerOctave => 'dB/okt';

  @override
  String get eqTiltFrom => 'Naklon od';

  @override
  String get errorMicPermission =>
      'Brez dostopa do mikrofona merjenje ni mogoče. Dovoli ga v Nastavitve → AudioScanner → Mikrofon.';

  @override
  String errorMic(String error) {
    return 'Mikrofon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Mikrofona ni bilo mogoče zagnati: $error';
  }

  @override
  String get errorNoArkit =>
      'Ta naprava ne podpira ARKit world tracking — točk ni mogoče postavljati v prostor.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Posnetek je krajši od sweepa ($recorded s od $expected s). Začni snemati, preden predvajaš signal.';
  }

  @override
  String get sessionSnapshots => 'Posnetki';

  @override
  String get errorTrackingUnreliable =>
      'Sledenje položaju ni zanesljivo — točka bi pristala drugje, kot stojiš.';

  @override
  String errorNoSound(int seconds) {
    return 'V $seconds s ni prispel noben zvok.';
  }

  @override
  String get noteSnapshotNoPose => 'posnetek iz analizatorja, brez položaja';

  @override
  String get sessionChannels => 'Kanali';

  @override
  String get trackingOk => 'Sledenje OK';

  @override
  String get trackingLimited => 'Šibko sledenje';

  @override
  String get trackingUnavailable => 'Brez sledenja';

  @override
  String get poseHintFeatures =>
      'Premalo podrobnosti v sliki — usmeri telefon v nekaj razgibanega, ne v golo steno.';

  @override
  String get poseHintMotion => 'Prehiter gib — hodi počasneje.';

  @override
  String get poseHintLight =>
      'Premalo svetlobe — prižgi luč, kamera ne vidi, kje je.';

  @override
  String get poseHintInitializing => 'ARKit se zaganja, malo se premikaj.';

  @override
  String get poseHintRelocalizing =>
      'Znova iščem izvirno točko — vrni se tja, kjer si začel.';

  @override
  String get signalPhonePink => 'Rožnati šum iz telefona';

  @override
  String get signalExternalPink => 'Rožnati šum iz zvočnikov';

  @override
  String get signalExternalSweep => 'Sweep iz zvočnikov';

  @override
  String get captureWarningBluetooth =>
      'Mikrofon Bluetooth: stiskanje in zakasnitev pokvarita meritev. Odklopi slušalke in meri z vgrajenim mikrofonom.';

  @override
  String get captureWarningProcessing =>
      'Sistem ni izklopil obdelave signala (AGC / dušenje šuma). Izmerjene razlike med mesti bodo popačene.';

  @override
  String get captureWarningMeasurementMode =>
      'Measurement mode ni bilo mogoče vklopiti — mikrofon ima lastno korekcijo frekvenčnega odziva.';

  @override
  String get captureRouteUnknown => 'neznano';

  @override
  String get axisLength => 'dolžina';

  @override
  String get axisWidth => 'širina';

  @override
  String get axisHeight => 'višina';
}
