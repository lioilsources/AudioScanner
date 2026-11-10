// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hungarian (`hu`).
class AppLocalizationsHu extends AppLocalizations {
  AppLocalizationsHu([String locale = 'hu']) : super(locale);

  @override
  String get tabScan => 'Szkennelés';

  @override
  String get tabMap => 'Térkép';

  @override
  String get tabResponse => 'Válasz';

  @override
  String get tabDesign => 'Terv';

  @override
  String get tabSignals => 'Jelek';

  @override
  String get rtaSnapshotFailed => 'A pillanatkép nem mentődött el.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Mentve $id pontként.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Mentve $id pontként (pozíció nélkül).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pont',
      one: '1 pont',
    );
    return 'Kalibráció $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'A fájl nem olvasható: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL eltolás';

  @override
  String get rtaOffsetHelp =>
      'Játssz le egy 1 kHz-es hangot, olvasd le a szintet egy hangnyomásmérőn, és add meg az eltérést attól, amit az analizátor mutat. Nem nulla eltolással a szintek SPL-becslésként jelennek meg; nélküle dBFS-ben maradnak.';

  @override
  String get commonReset => 'Nullázás';

  @override
  String get commonCancel => 'Mégse';

  @override
  String get commonSave => 'Mentés';

  @override
  String get commonStop => 'Leállítás';

  @override
  String get commonStartMic => 'Mikrofon indítása';

  @override
  String get tabAnalyzer => 'Analizátor';

  @override
  String get rtaUnfreeze => 'Folytatás';

  @override
  String get rtaFreeze => 'Kimerevítés';

  @override
  String get rtaPeakHold => 'Csúcstartás';

  @override
  String get rtaMaxMinTraces => 'Max. / min. görbék';

  @override
  String get rtaResetTraces => 'Görbék nullázása';

  @override
  String get rtaSaveAsPoint => 'Mentés pontként (3 s)';

  @override
  String get rtaMicCalibration => 'Mikrofon kalibrálása…';

  @override
  String get rtaRemoveCalibration => 'Kalibráció eltávolítása';

  @override
  String get rtaOffsetMenu => 'dB SPL eltolás…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · jelfeldolgozás nélkül';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pont',
      one: '1 pont',
    );
    return 'Kalibráció $name: $_temp0, korrekció $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (becslés)';

  @override
  String get rtaFrozenHint =>
      'Kimerevítve — a mikrofon tovább fut, csak nem rajzolódik ki.';

  @override
  String get rtaRelativeHint =>
      'A szintek relatívak (dBFS). A körvonal akkor jelenik meg, amikor elmented az első pontot — az lesz a többi referenciája.';

  @override
  String get rtaReferenceHint =>
      'Teli oszlopok = itt. Körvonal = referenciapont.';

  @override
  String get rtaEnvelopeHint => 'Piros = max., zöld = min. a nullázás óta.';

  @override
  String get rtaMicStopped => 'a mikrofon áll';

  @override
  String get rtaSilence => 'csend — szól valamilyen jel?';

  @override
  String get rtaPlaceholder =>
      'Indítsd el a mikrofont, és játssz le jelet a helyiségben.';

  @override
  String rtaBandsInfo(int count) {
    return '$count terzsáv, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Helyiség szkennelése';

  @override
  String scanPointCount(int count) {
    return '$count p.';
  }

  @override
  String get commonMicNotRunning => 'A mikrofon nem fut';

  @override
  String get scanMicNeeded => 'Nélküle csak a pozíció mérhető, a hang nem.';

  @override
  String get scanContinuous => 'Folyamatos mérés';

  @override
  String get scanContinuousHint =>
      'Automatikusan egy pont minden 0,5 m séta után';

  @override
  String get scanMeasuring => 'Mérés…';

  @override
  String get scanMeasureHere => 'Mérés itt';

  @override
  String scanPointSaved(String id, String position) {
    return '$id pont mentve itt: $position';
  }

  @override
  String get scanStartTracking => 'Pozíciókövetés indítása';

  @override
  String get scanStartTrackingHint =>
      'ARKit — ebből tudja az app, hol állsz a helyiségben.';

  @override
  String scanPosition(String position) {
    return 'Pozíció: $position m az origótól';
  }

  @override
  String get scanSetOriginHint =>
      'Állj a hallgatási pontra, és jelöld ki az origót.';

  @override
  String get scanOriginHere => 'Itt az origó';

  @override
  String get scanNoPoints => 'Még nincs pont.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'szórás 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Nappali';

  @override
  String get scanNewMeasurement => 'Új mérés';

  @override
  String get scanRoomName => 'A helyiség neve';

  @override
  String get scanExcitation => 'Mivel gerjeszted a helyiséget';

  @override
  String get scanPhoneNoiseHint =>
      'Csak tájékoztató jellegű — a telefon hangszórója egyáltalán nem ad ki basszust.';

  @override
  String get scanStart => 'Kezdés';

  @override
  String get mapExportTooltip => 'FRD + JSON exportálása';

  @override
  String get mapNeedsTwoPoints =>
      'A térképhez legalább két pont kell. Járd be a helyiséget, és mérj folyamatosan.';

  @override
  String get mapShareText =>
      'FRD pontonként (importálás REW-be / VituixCAD-be) és a teljes munkamenet JSON-ban.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Legkiegyenlítettebb hely: $id itt: $position m (szórás $variation dB 40–300 Hz-en)';
  }

  @override
  String get signalsSweepHelp =>
      'Az egyetlen jel, amelyből kiszámítható az impulzusválasz, az utózengési idő és az első reflexiók. Játszd le számítógépről vagy DAC-ről a hangfalakon, a telefon pedig rögzítsen.';

  @override
  String get signalsLength => 'Hossz';

  @override
  String get signalsFrom => 'Ettől';

  @override
  String get signalsTo => 'Eddig';

  @override
  String get signalsMonoNoChannel => 'Mono (csatorna nélkül)';

  @override
  String get signalsExportWav => 'WAV exportálása';

  @override
  String get signalsPinkNoise => 'Rózsaszín zaj';

  @override
  String get signalsPinkHelp =>
      'Minden oktávban azonos energia. Csak frekvenciamenetet ad, időt és reflexiókat nem — egy gyors „történik itt valami?” kérdéshez elég.';

  @override
  String get signalsExportPink => '30 s-os WAV exportálása';

  @override
  String get signalsHowTo => 'Hogyan mérj';

  @override
  String get signalsStep1 =>
      'A jelet számítógépről játszd le a hangfalakon, ne a telefonról.';

  @override
  String get signalsStep2 =>
      'Állítsd úgy a hangerőt, hogy az analizátor kb. −20 dBFS-t mutasson. A túlvezérlés reflexiónak tűnik.';

  @override
  String get signalsStep3 =>
      'A telefont tartsd függőlegesen kinyújtott karral, mikrofonnal a hangfalak felé.';

  @override
  String get signalsStep4 =>
      'Válaszd le a Bluetooth-fejhallgatót — a tömörítés és a késleltetés tönkreteszi a mérést.';

  @override
  String get signalsNoteMono =>
      'A mono egyszerre mindkét hangfalra összeadja L-t és R-t, és a különbségük eltűnik az összegben. Csatornaméréshez válassz csatornát.';

  @override
  String get signalsNoteStereo =>
      'Sztereó fájl, a jel csak az egyik csatornán — bármi lejátssza, ami sztereót szól.';

  @override
  String get signalsNoteChannel =>
      'A csatornáról elnevezett mono fájl. Irányítsd a receiver megfelelő bemenetére egy DAW-ból vagy többcsatornás bemeneten át; egy sztereó kimenetű laptop nem juttatja erre a csatornára.';

  @override
  String get channelsTitle => 'Csatornák mérése';

  @override
  String get channelsHelp =>
      'Állj a hallgatási pontra. Minden csatornánál: indítsd a felvételt, játssz le rá egy sweepet a Jelek fülről, majd koppints a Kész gombra. Ezek nélkül a pontok nélkül a tervnek nincs miből EQ-t és szinteket számolnia.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Ellenőrzés az EQ beállítása után';

  @override
  String get channelsVerifyAfterEqHint =>
      'A pont „EQ után” néven mentődik, és nem írja felül azt, amelyből az EQ számolódott.';

  @override
  String channelsRecording(String seconds) {
    return 'Felvétel $seconds s — most játszd le a sweepet';
  }

  @override
  String get channelsNotMeasured => 'nincs mérve';

  @override
  String get channelsMeasuredNoise => 'zajjal mérve';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · közvetlen hang $ms ms után';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · közvetlen hang $ms ms után, T20 $t20 s';
  }

  @override
  String get commonDone => 'Kész';

  @override
  String get channelsMeasure => 'Mérés';

  @override
  String get channelsAdd => 'Hozzáadás';

  @override
  String get channelsAgain => 'Újra';

  @override
  String get compareTitle => 'Összehasonlítás';

  @override
  String get compareNeedsTwoPoints =>
      'Az összehasonlításhoz legalább két pont kell.';

  @override
  String get commonWithRoom => 'helyiséggel';

  @override
  String get commonDirectSound => 'közvetlen hang';

  @override
  String get compareAfterEq => 'EQ után';

  @override
  String get compareBandsA => 'A (sávok)';

  @override
  String get compareBandsB => 'B (sávok)';

  @override
  String get compareArrivalDiff => 'Érkezési különbség A − B';

  @override
  String get compareBroadbandDiff => 'Szélessávú szint A − B';

  @override
  String get compareWorstBelow300 => 'Legnagyobb eltérés 300 Hz alatt';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB a(z) $band Hz-es sávban';
  }

  @override
  String get compareTrimNote =>
      'A distance és a level trim kiegyenlíti az érkezési és a szintkülönbséget. A 300 Hz alatti alakbeli különbséget nem — azt egy másik fal okozza más távolságban, és áthelyezéssel oldható meg.';

  @override
  String get designRt60Live => 'T20 125–500 Hz a legutóbbi válaszból';

  @override
  String get designRt60Stored => 'T20 125–500 Hz egy mentett sweepből';

  @override
  String get designRt60Guess =>
      'becslés — mérj sweepet, a Schroeder egyelőre csak tipp';

  @override
  String get designExportTooltip => 'Konfiguráció exportálása';

  @override
  String get designCompute => 'Terv kiszámítása';

  @override
  String get designLidarChecking => 'LiDAR keresése…';

  @override
  String get designLidarAvailable => 'LiDAR elérhető';

  @override
  String get designLidarMissing => 'Nincs LiDAR — add meg kézzel a méreteket';

  @override
  String get designLidarHint =>
      'A szkennelés centiméterre adja meg a falakat, így a reflexiós pontok és a határfelületektől mért távolságok is stimmelnek, nem csak a módusok.';

  @override
  String get designManualHint =>
      'A módusszámításhoz elég három szám — de elveszíted a reflexiós pontokat és a falaktól mért pontos távolságokat.';

  @override
  String get designStopScan => 'Szkennelés befejezése';

  @override
  String get designScanRoom => 'Helyiség szkennelése';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls fal',
      one: '1 fal',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings nyílás',
      one: '1 nyílás',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'A helyiség méretei';

  @override
  String get designLength => 'Hossz';

  @override
  String get designWidth => 'Szélesség';

  @override
  String get designHeight => 'Magasság';

  @override
  String get designWhatToDo => 'Mit lehet tenni';

  @override
  String get designRoomModes => 'A helyiség módusai';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (Schroeder) felett az egyes módusoknak már nincs értelme. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: mért, cél, előrejelzés';

  @override
  String get designEqHelp =>
      'Az előrejelzés a mért válasz plusz a receiver tizenöt sávjának modellje. Az EQ beállítása után mérd újra a csatornát az „EQ után” kapcsolóval, hogy lásd, mennyire volt pontos a modell.';

  @override
  String get designReceiverConfig => 'Receiver-konfiguráció';

  @override
  String get designGeometryOnly =>
      'A csatornák sweepes mérése nélkül itt csak geometria van: távolságok és keresztezési frekvenciák. EQ és szintek akkor jönnek, ha lesznek csatornánkénti pontok.';

  @override
  String get designShareSubject => 'Konfigurációs javaslat';

  @override
  String get impulseTitle => 'Impulzusválasz';

  @override
  String get impulseCompareTooltip => 'Pontok összehasonlítása';

  @override
  String get impulseExportTooltip => 'FRD exportálása fázissal';

  @override
  String get impulseTapToStart => 'Koppints az indításhoz.';

  @override
  String get impulseSweepTitle => 'A sweep, amelyet a hangfalakon lejátszol';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Egyeznie kell azzal, amit lejátszol — különben a dekonvolúció értelmetlen eredményt ad.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Felvétel — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Most játszd le a sweepet a számítógépről.';

  @override
  String get impulseStartRecording =>
      'Felvétel indítása, aztán a sweep lejátszása';

  @override
  String get impulseFrequencyResponse => 'Frekvenciamenet';

  @override
  String get impulseWithRoom => 'helyiséggel (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'közvetlen hang ($ms ms-os ablak)';
  }

  @override
  String get impulseWindow => 'Ablak';

  @override
  String impulseWindowHelp(String hz) {
    return 'A hosszabb ablak mélyebbre lát (most $hz Hz felett érvényes), de beengedi az első reflexiót. A határ alatt a görbe nincs simítva és kommentálva: az az ablak, nem a helyiség.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Az első reflexióig ($ms ms)';
  }

  @override
  String get impulseTime => 'Idő';

  @override
  String get impulseImpulse => 'impulzus';

  @override
  String get impulseTimeHelp =>
      'Kék az ablak, a narancssárga vonal az első talált reflexió. A nulla idő a közvetlen hang.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Elrejtés';

  @override
  String get commonShow => 'Megjelenítés';

  @override
  String get impulseSpectrogramHelp =>
      'Idő ms-ban a közvetlen hangtól, frekvencia felfelé, a szín a szint −60 dB-ig. A többinél tovább kitartó vízszintes sáv egy módus; a fenti táblázat ugyanezt mondja számokkal.';

  @override
  String get impulseDecayByOctave => 'Lecsengés oktávonként';

  @override
  String get impulseMidNoT20 =>
      'A középsávok nem csengtek le eléggé a T20-hoz.';

  @override
  String impulseMidT20(String seconds) {
    return 'Közép 125–500 Hz: T20 $seconds s — ezzel az RT60-nal számol a terv.';
  }

  @override
  String get impulseDecayHelp =>
      'Basszusban a telefonos RT60 inkább becslés: ott a legközelebbi a háttérzaj, és a „—” azt jelenti, hogy az utózengés nem csökkent alá. C50 nulla felett: a közvetlen hang a korai reflexiókkal több energiát hordoz, mint az utózengés.';

  @override
  String get impulseResult => 'Eredmény';

  @override
  String get impulseDirectArrived => 'A közvetlen hang megérkezett';

  @override
  String get impulseDirectArrivedHelp =>
      'Lejátszási késleltetés plusz terjedési idő — önmagában semmit sem mond, de a bal és jobb hangfal közötti különbség igen.';

  @override
  String get impulseFirstReflection => 'Első reflexió';

  @override
  String get impulseNotFound => 'nem található';

  @override
  String impulseAfterDirect(String time) {
    return '$time a közvetlen hang után';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Vagy nincs, vagy elbújt a közvetlen impulzus utócsengésében.';

  @override
  String impulseExtraPath(String metres) {
    return 'Többletút ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'nem mérhető';

  @override
  String get impulseRt60NoiseHelp =>
      'Az utózengés nem csökkent elég mélyre a zajpadló felett — hangosabban, vagy csendesebb pillanatban.';

  @override
  String get impulseRt60Help =>
      'A T20 és T30 közti különbség jelzi, mennyire tiszta a lecsengés.';

  @override
  String get impulseGating => 'Ablak (gating)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz felett érvényes';
  }

  @override
  String get impulseGatingHelp =>
      'Ez alatt az ablak egyetlen periódust sem lát — a görbe ott az ablak műterméke, nem a helyiségé.';

  @override
  String get impulseSchroeder => 'Schroeder-féle lecsengési görbe';

  @override
  String impulseHdAt(int order) {
    return 'HD$order 100 Hz / 1 kHz-en';
  }

  @override
  String get impulseHd2Help =>
      'A felharmonikusok a Farina-dekonvolúció negatív idejében vannak; itt onnan olvassuk ki őket ahelyett, hogy eldobnánk. −40 dB = 1 %.';

  @override
  String get impulseHd3Help =>
      'A harmadik felharmonikus túlvezérléskor gyorsabban nő, mint a második.';

  @override
  String get impulseDistortionHot => 'Torzítás −30 dB felett';

  @override
  String get impulseDistortionHotHelp =>
      'Vagy túl hangos a sweep, vagy a hangfal a határán van. A torzítási farok az impulzusban reflexiónak tűnik — vedd lejjebb a hangerőt, és mérj újra, mielőtt bármit elhiszel.';

  @override
  String get eqMeasured => 'mért';

  @override
  String get eqTarget => 'cél';

  @override
  String get eqPredicted => 'előrejelzés EQ után';

  @override
  String get eqMeasuredAfter => 'mért EQ után';

  @override
  String eqDeviation(int maxHz) {
    return 'Eltérés a céltól 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'A receiverbe való beállítás után';

  @override
  String get eqPredictionVsReality => 'Előrejelzés vs. valóság';

  @override
  String eqStubborn(String bands) {
    return '6 dB-nél messzebb marad a céltól: $bands. Ez interferencia, nem teljesítményhiány — a hangfal vagy a hallgató áthelyezésével oldható meg, nem további kiemeléssel.';
  }

  @override
  String get eqModelOk =>
      'A receiver szűrője nagyjából a modell szerint viselkedik.';

  @override
  String get eqModelOff =>
      'A receiver valódi szűrője a vártnál jobban eltér a modelltől — a sávjai valószínűleg szélesebbek vagy keskenyebbek, mint amit itt feltételezünk.';

  @override
  String get eqTargetCurve => 'Célgörbe';

  @override
  String get eqFlat => 'lineáris';

  @override
  String get eqTargetHelp =>
      'Nem lineáris: néhány kHz felett a fül a közvetlen hangot hallja, a mikrofon a reflexiókat is összeadja, és egy kiegyenesített mérési görbe tompán szól. Enyhe lejtés felül és egy kis basszus alul — ezt választják az emberek vakteszten.';

  @override
  String get eqBassLift => 'Basszuskiemelés';

  @override
  String get eqBassBelow => 'Basszus ez alatt';

  @override
  String get eqTilt => 'Lejtés';

  @override
  String get eqDbPerOctave => 'dB/okt.';

  @override
  String get eqTiltFrom => 'Lejtés ettől';

  @override
  String get errorMicPermission =>
      'Mikrofon-hozzáférés nélkül nem lehet mérni. Engedélyezd itt: Beállítások → AudioScanner → Mikrofon.';

  @override
  String errorMic(String error) {
    return 'Mikrofon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Nem sikerült elindítani a mikrofont: $error';
  }

  @override
  String get errorNoArkit =>
      'Ez az eszköz nem támogatja az ARKit world trackinget — a pontokat nem lehet a térben elhelyezni.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'A felvétel rövidebb a sweepnél ($recorded s / $expected s). Indítsd a felvételt, mielőtt lejátszod a jelet.';
  }

  @override
  String get sessionSnapshots => 'Pillanatképek';

  @override
  String get errorTrackingUnreliable =>
      'A pozíciókövetés megbízhatatlan — a pont máshová kerülne, mint ahol állsz.';

  @override
  String errorNoSound(int seconds) {
    return '$seconds s alatt nem érkezett hang.';
  }

  @override
  String get noteSnapshotNoPose =>
      'pillanatkép az analizátorból, pozíció nélkül';

  @override
  String get sessionChannels => 'Csatornák';

  @override
  String get trackingOk => 'Követés OK';

  @override
  String get trackingLimited => 'Gyenge követés';

  @override
  String get trackingUnavailable => 'Nincs követés';

  @override
  String get poseHintFeatures =>
      'Túl kevés részlet a képen — fordítsd a telefont valami tagolt felé, ne csupasz falra.';

  @override
  String get poseHintMotion => 'Túl gyors mozgás — lassabban menj.';

  @override
  String get poseHintLight =>
      'Túl kevés a fény — kapcsold fel, a kamera nem látja, hol van.';

  @override
  String get poseHintInitializing => 'Az ARKit indul, mozogj egy kicsit.';

  @override
  String get poseHintRelocalizing =>
      'Az eredeti pont újrakeresése — menj vissza oda, ahol kezdtél.';

  @override
  String get signalPhonePink => 'Rózsaszín zaj a telefonból';

  @override
  String get signalExternalPink => 'Rózsaszín zaj a hangfalakból';

  @override
  String get signalExternalSweep => 'Sweep a hangfalakból';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth-mikrofon: a tömörítés és a késleltetés tönkreteszi a mérést. Válaszd le a fejhallgatót, és mérj a beépített mikrofonnal.';

  @override
  String get captureWarningProcessing =>
      'A rendszer nem kapcsolta ki a jelfeldolgozást (AGC / zajszűrés). A helyek között mért különbségek torzulni fognak.';

  @override
  String get captureWarningMeasurementMode =>
      'Nem sikerült bekapcsolni a measurement mode-ot — a mikrofon saját frekvenciamenet-korrekciót alkalmaz.';

  @override
  String get captureRouteUnknown => 'ismeretlen';

  @override
  String get axisLength => 'hossz';

  @override
  String get axisWidth => 'szélesség';

  @override
  String get axisHeight => 'magasság';
}
