// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get tabScan => 'Sken';

  @override
  String get tabMap => 'Mapa';

  @override
  String get tabResponse => 'Odezva';

  @override
  String get tabDesign => 'Návrh';

  @override
  String get tabSignals => 'Signály';

  @override
  String get rtaSnapshotFailed => 'Snímek se neuložil.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Uloženo jako bod $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Uloženo jako bod $id (bez polohy).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bodů',
      many: '$count bodu',
      few: '$count body',
      one: '1 bod',
    );
    return 'Kalibrace $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Soubor nejde přečíst: $message';
  }

  @override
  String get rtaOffsetTitle => 'Offset dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Pusť tón 1 kHz, odečti hladinu na SPL metru a zadej rozdíl proti tomu, co ukazuje analyzátor. S nenulovým offsetem se hladiny značí jako odhad SPL; bez něj zůstávají dBFS.';

  @override
  String get commonReset => 'Vynulovat';

  @override
  String get commonCancel => 'Zrušit';

  @override
  String get commonSave => 'Uložit';

  @override
  String get commonStop => 'Zastavit';

  @override
  String get commonStartMic => 'Spustit mikrofon';

  @override
  String get tabAnalyzer => 'Analyzátor';

  @override
  String get rtaUnfreeze => 'Rozmrazit';

  @override
  String get rtaFreeze => 'Zmrazit';

  @override
  String get rtaPeakHold => 'Peak hold';

  @override
  String get rtaMaxMinTraces => 'Stopy max / min';

  @override
  String get rtaResetTraces => 'Vynulovat stopy';

  @override
  String get rtaSaveAsPoint => 'Uložit jako bod (3 s)';

  @override
  String get rtaMicCalibration => 'Kalibrace mikrofonu…';

  @override
  String get rtaRemoveCalibration => 'Odebrat kalibraci';

  @override
  String get rtaOffsetMenu => 'Offset dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · bez úprav signálu';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bodů',
      many: '$count bodu',
      few: '$count body',
      one: '1 bod',
    );
    return 'Kalibrace $name: $_temp0, korekce $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (odhad)';

  @override
  String get rtaFrozenHint => 'Zmrazeno — mikrofon běží dál, jen se nekreslí.';

  @override
  String get rtaRelativeHint =>
      'Hladiny jsou relativní (dBFS). Obrys se objeví, až uložíš první bod — ten je referencí pro ostatní.';

  @override
  String get rtaReferenceHint => 'Plné sloupce = tady. Obrys = referenční bod.';

  @override
  String get rtaEnvelopeHint => 'Červená = max, zelená = min od vynulování.';

  @override
  String get rtaMicStopped => 'mikrofon stojí';

  @override
  String get rtaSilence => 'ticho — hraje signál?';

  @override
  String get rtaPlaceholder => 'Spusť mikrofon a pusť do místnosti signál.';

  @override
  String rtaBandsInfo(int count) {
    return '$count třetinooktávových pásem, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Sken místnosti';

  @override
  String scanPointCount(int count) {
    return '$count b.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofon neběží';

  @override
  String get scanMicNeeded => 'Bez něj se změří jen poloha, ne zvuk.';

  @override
  String get scanContinuous => 'Průběžné měření';

  @override
  String get scanContinuousHint => 'Bod automaticky každých 0,5 m chůze';

  @override
  String get scanMeasuring => 'Měřím…';

  @override
  String get scanMeasureHere => 'Změřit tady';

  @override
  String scanPointSaved(String id, String position) {
    return 'Bod $id uložen na $position';
  }

  @override
  String get scanStartTracking => 'Spustit sledování polohy';

  @override
  String get scanStartTrackingHint =>
      'ARKit — odsud ví appka, kde v místnosti stojíš.';

  @override
  String scanPosition(String position) {
    return 'Poloha: $position m od počátku';
  }

  @override
  String get scanSetOriginHint =>
      'Postav se na místo posluchače a urči počátek.';

  @override
  String get scanOriginHere => 'Tady je počátek';

  @override
  String get scanNoPoints => 'Zatím žádný bod.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'rozptyl 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Obývák';

  @override
  String get scanNewMeasurement => 'Nové měření';

  @override
  String get scanRoomName => 'Název místnosti';

  @override
  String get scanExcitation => 'Čím budeš místnost budit';

  @override
  String get scanPhoneNoiseHint =>
      'Jen orientačně — reproduktor telefonu basy vůbec nevydá.';

  @override
  String get scanStart => 'Začít';

  @override
  String get mapExportTooltip => 'Export FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Mapa potřebuje aspoň dva body. Projdi místnost a průběžně měř.';

  @override
  String get mapShareText =>
      'FRD po bodech (import do REW / VituixCAD) a celá session v JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Nejrovnější místo: $id na $position m (rozptyl $variation dB v 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Jediný signál, ze kterého jde spočítat impulzní odezvu, doba dozvuku a první odrazy. Přehraj ho z počítače nebo DACu do beden, telefon nech nahrávat.';

  @override
  String get signalsLength => 'Délka';

  @override
  String get signalsFrom => 'Od';

  @override
  String get signalsTo => 'Do';

  @override
  String get signalsMonoNoChannel => 'Mono (bez kanálu)';

  @override
  String get signalsExportWav => 'Export WAV';

  @override
  String get signalsPinkNoise => 'Růžový šum';

  @override
  String get signalsPinkHelp =>
      'Stejná energie v každé oktávě. Dá jen frekvenční charakteristiku, žádný čas ani odrazy — na rychlé „dělá to tu něco?“ to stačí.';

  @override
  String get signalsExportPink => 'Export 30 s WAV';

  @override
  String get signalsHowTo => 'Jak měřit';

  @override
  String get signalsStep1 => 'Signál pusť z počítače do beden, ne z telefonu.';

  @override
  String get signalsStep2 =>
      'Hlasitost nastav tak, aby analyzátor ukazoval kolem −20 dBFS. Přebuzení vypadá jako odraz.';

  @override
  String get signalsStep3 =>
      'Telefon drž svisle na natažené ruce, mikrofonem k bednám.';

  @override
  String get signalsStep4 =>
      'Odpoj Bluetooth sluchátka — komprese i latence měření znehodnotí.';

  @override
  String get signalsNoteMono =>
      'Mono do obou beden najednou sečte L a R a jejich rozdíl zmizí v součtu. Pro měření kanálů vyber kanál.';

  @override
  String get signalsNoteStereo =>
      'Stereo soubor se signálem jen v jednom kanálu — pustí ho cokoli, co hraje stereo.';

  @override
  String get signalsNoteChannel =>
      'Mono soubor pojmenovaný podle kanálu. Nasměruj ho na správný vstup přijímače z DAW nebo přes vícekanálový vstup; laptop se stereo výstupem ho na tenhle kanál nedostane.';

  @override
  String get channelsTitle => 'Měření kanálů';

  @override
  String get channelsHelp =>
      'Stoupni si na místo posluchače. Pro každý kanál: začni nahrávat, pusť do něj sweep ze záložky Signály, klepni na Hotovo. Bez těchto bodů návrh nemá z čeho udělat EQ a hlasitosti.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Ověření po zadání EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Bod se uloží jako „po EQ“ a nepřepíše ten, ze kterého se EQ počítalo.';

  @override
  String channelsRecording(String seconds) {
    return 'Nahrávám $seconds s — teď pusť sweep';
  }

  @override
  String get channelsNotMeasured => 'nezměřeno';

  @override
  String get channelsMeasuredNoise => 'změřeno šumem';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · přímý zvuk za $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · přímý zvuk za $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Hotovo';

  @override
  String get channelsMeasure => 'Změřit';

  @override
  String get channelsAdd => 'Přidat';

  @override
  String get channelsAgain => 'Znovu';

  @override
  String get compareTitle => 'Srovnání';

  @override
  String get compareNeedsTwoPoints => 'Srovnání potřebuje aspoň dva body.';

  @override
  String get commonWithRoom => 's místností';

  @override
  String get commonDirectSound => 'přímý zvuk';

  @override
  String get compareAfterEq => 'po EQ';

  @override
  String get compareBandsA => 'A (pásma)';

  @override
  String get compareBandsB => 'B (pásma)';

  @override
  String get compareArrivalDiff => 'Rozdíl příchodu A − B';

  @override
  String get compareBroadbandDiff => 'Širokopásmová hladina A − B';

  @override
  String get compareWorstBelow300 => 'Největší rozdíl pod 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB v pásmu $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance a level trim srovnají rozdíl příchodu a hladiny. Rozdíl tvaru pod 300 Hz nesrovnají — ten dělá jiná stěna v jiné vzdálenosti a řeší se posunem.';

  @override
  String get designRt60Live => 'T20 125–500 Hz z poslední odezvy';

  @override
  String get designRt60Stored => 'T20 125–500 Hz z uloženého sweepu';

  @override
  String get designRt60Guess =>
      'odhad — změř sweep, Schroeder je zatím jen tip';

  @override
  String get designExportTooltip => 'Export konfigurace';

  @override
  String get designCompute => 'Spočítat návrh';

  @override
  String get designLidarChecking => 'Zjišťuju, jestli je tu LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR k dispozici';

  @override
  String get designLidarMissing => 'Bez LiDARu — rozměry zadej ručně';

  @override
  String get designLidarHint =>
      'Sken dá stěny na centimetry, takže sedí i body odrazů a vzdálenosti k hranicím, ne jen módy.';

  @override
  String get designManualHint =>
      'Modální výpočet potřebuje jen tři čísla — o body odrazů a přesné vzdálenosti ke stěnám ale přijdeš.';

  @override
  String get designStopScan => 'Ukončit sken';

  @override
  String get designScanRoom => 'Naskenovat místnost';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls stěn',
      many: '$walls stěny',
      few: '$walls stěny',
      one: '1 stěna',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings otvorů',
      many: '$openings otvoru',
      few: '$openings otvory',
      one: '1 otvor',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Rozměry místnosti';

  @override
  String get designLength => 'Délka';

  @override
  String get designWidth => 'Šířka';

  @override
  String get designHeight => 'Výška';

  @override
  String get designWhatToDo => 'Co s tím udělat';

  @override
  String get designRoomModes => 'Módy místnosti';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Nad $schroeder Hz (Schroeder) už jednotlivé módy nedávají smysl. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: změřeno, cíl, předpověď';

  @override
  String get designEqHelp =>
      'Předpověď je změřená odezva plus model patnácti pásem přijímače. Po zadání EQ změř kanál znovu s přepínačem „po EQ“, aby bylo vidět, jak blízko model byl.';

  @override
  String get designReceiverConfig => 'Konfigurace přijímače';

  @override
  String get designGeometryOnly =>
      'Bez měření kanálů sweepem je tu jen geometrie: vzdálenosti a dělicí kmitočty. EQ a hlasitosti přibudou, až budou body per kanál.';

  @override
  String get designShareSubject => 'Návrh konfigurace';

  @override
  String get impulseTitle => 'Impulzní odezva';

  @override
  String get impulseCompareTooltip => 'Srovnat body';

  @override
  String get impulseExportTooltip => 'Export FRD s fází';

  @override
  String get impulseTapToStart => 'Klepni pro spuštění.';

  @override
  String get impulseSweepTitle => 'Sweep, který pustíš do beden';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Musí sedět s tím, co přehráváš — jinak dekonvoluce vrátí nesmysl.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Nahrávám — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Teď pusť sweep z počítače.';

  @override
  String get impulseStartRecording => 'Začít nahrávat, pak pustit sweep';

  @override
  String get impulseFrequencyResponse => 'Frekvenční odezva';

  @override
  String get impulseWithRoom => 's místností (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'přímý zvuk (okno $ms ms)';
  }

  @override
  String get impulseWindow => 'Okno';

  @override
  String impulseWindowHelp(String hz) {
    return 'Delší okno vidí níž (teď platné nad $hz Hz), ale pustí dovnitř první odraz. Pod hranicí se křivka nevyhlazuje ani nekomentuje: je to okno, ne místnost.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Do prvního odrazu ($ms ms)';
  }

  @override
  String get impulseTime => 'Čas';

  @override
  String get impulseImpulse => 'impuls';

  @override
  String get impulseTimeHelp =>
      'Modré je okno, oranžová čára první nalezený odraz. Čas nula je přímý zvuk.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Skrýt';

  @override
  String get commonShow => 'Zobrazit';

  @override
  String get impulseSpectrogramHelp =>
      'Čas v ms od přímého zvuku, frekvence nahoru, barva je hladina do −60 dB. Vodorovný pruh, který přežije ostatní, je mód; tabulka nad tím říká totéž číslem.';

  @override
  String get impulseDecayByOctave => 'Doznívání po oktávách';

  @override
  String get impulseMidNoT20 => 'Střední pásma nedoklesla dost na T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Střed 125–500 Hz: T20 $seconds s — to je RT60, se kterým počítá návrh.';
  }

  @override
  String get impulseDecayHelp =>
      'V basech je RT60 z telefonu spíš odhad: šum pozadí tam bývá nejblíž a „—“ znamená, že dozvuk pod něj nedoklesl. C50 nad nulou: přímý zvuk s prvními odrazy nese víc energie než dozvuk.';

  @override
  String get impulseResult => 'Výsledek';

  @override
  String get impulseDirectArrived => 'Přímý zvuk dorazil za';

  @override
  String get impulseDirectArrivedHelp =>
      'Zpoždění přehrávání plus doba letu — samo o sobě nic neříká, ale rozdíl mezi L a R bednou ano.';

  @override
  String get impulseFirstReflection => 'První odraz';

  @override
  String get impulseNotFound => 'nenalezen';

  @override
  String impulseAfterDirect(String time) {
    return '$time po přímém zvuku';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Buď tam žádný není, nebo se schoval ve vyzvánění přímého impulsu.';

  @override
  String impulseExtraPath(String metres) {
    return 'Dráha navíc ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'nezměřitelné';

  @override
  String get impulseRt60NoiseHelp =>
      'Dozvuk nedoklesl dost hluboko nad šumové pozadí — hlasitěji, nebo v tišší chvíli.';

  @override
  String get impulseRt60Help =>
      'Rozdíl mezi T20 a T30 napovídá, jak čisté je doznívání.';

  @override
  String get impulseGating => 'Okno (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'platné nad $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Pod tím okno neuvidí ani jednu periodu — křivka tam je artefakt okna, ne místnosti.';

  @override
  String get impulseSchroeder => 'Schroederova křivka doznívání';

  @override
  String impulseHdAt(int order) {
    return 'HD$order při 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmonické leží v záporném čase Farinovy dekonvoluce; tady se z něj čtou místo zahazování. −40 dB je 1 %.';

  @override
  String get impulseHd3Help =>
      'Třetí harmonická roste s přebuzením rychleji než druhá.';

  @override
  String get impulseDistortionHot => 'Zkreslení nad −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Buď je sweep příliš nahlas, nebo je repro na hraně. Ohon zkreslení vypadá v impulzu jako odraz — uber hlasitost a změř znovu, než něčemu uvěříš.';

  @override
  String get eqMeasured => 'změřeno';

  @override
  String get eqTarget => 'cíl';

  @override
  String get eqPredicted => 'předpověď po EQ';

  @override
  String get eqMeasuredAfter => 'změřeno po EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Odchylka od cíle 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Po zadání do přijímače';

  @override
  String get eqPredictionVsReality => 'Předpověď vs. skutečnost';

  @override
  String eqStubborn(String bands) {
    return 'Zůstane dál od cíle než 6 dB: $bands. To je interference, ne nedostatek výkonu — řeší se posunem repro nebo posluchače, ne dalším zdvihem.';
  }

  @override
  String get eqModelOk => 'Filtr přijímače se chová zhruba jako model.';

  @override
  String get eqModelOff =>
      'Skutečný filtr přijímače se od modelu liší o víc, než se čekalo — jeho pásma jsou nejspíš širší nebo užší, než se tu předpokládá.';

  @override
  String get eqTargetCurve => 'Cílová křivka';

  @override
  String get eqFlat => 'plochá';

  @override
  String get eqTargetHelp =>
      'Ne rovná: nad pár kHz ucho slyší přímý zvuk, mikrofon sčítá i odrazy, a srovnaná měřená křivka zní tupě. Mírný sklon nahoře a trocha basu dole je to, co lidé v slepém poslechu volí.';

  @override
  String get eqBassLift => 'Zdvih basů';

  @override
  String get eqBassBelow => 'Basy pod';

  @override
  String get eqTilt => 'Sklon';

  @override
  String get eqDbPerOctave => 'dB/okt';

  @override
  String get eqTiltFrom => 'Sklon od';

  @override
  String get errorMicPermission =>
      'Bez přístupu k mikrofonu se měřit nedá. Povol ho v Nastavení → AudioScanner → Mikrofon.';

  @override
  String errorMic(String error) {
    return 'Mikrofon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Nepodařilo se spustit mikrofon: $error';
  }

  @override
  String get errorNoArkit =>
      'Tohle zařízení neumí ARKit world tracking — body se nedají umísťovat do prostoru.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Nahrávka je kratší než sweep ($recorded s z $expected s). Spusť nahrávání dřív, než pustíš signál.';
  }

  @override
  String get sessionSnapshots => 'Snímky';

  @override
  String get errorTrackingUnreliable =>
      'Sledování polohy není spolehlivé — bod by seděl jinde, než stojíš.';

  @override
  String errorNoSound(int seconds) {
    return 'Za $seconds s nedorazil žádný zvuk.';
  }

  @override
  String get noteSnapshotNoPose => 'snímek z analyzátoru, bez polohy';

  @override
  String get sessionChannels => 'Kanály';

  @override
  String get trackingOk => 'Sledování OK';

  @override
  String get trackingLimited => 'Slabé sledování';

  @override
  String get trackingUnavailable => 'Bez sledování';

  @override
  String get poseHintFeatures =>
      'Málo detailů v obraze — namiř telefon na něco členitého, ne na holou stěnu.';

  @override
  String get poseHintMotion => 'Moc rychlý pohyb — jdi pomaleji.';

  @override
  String get poseHintLight => 'Málo světla — rozsviť, kamera nevidí, kde je.';

  @override
  String get poseHintInitializing => 'ARKit se rozjíždí, chvíli se pohybuj.';

  @override
  String get poseHintRelocalizing =>
      'Hledá se zpět původní bod — vrať se, kde jsi začínal.';

  @override
  String get signalPhonePink => 'Růžový šum z telefonu';

  @override
  String get signalExternalPink => 'Růžový šum z beden';

  @override
  String get signalExternalSweep => 'Sweep z beden';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth mikrofon: komprese a latence měření znehodnotí. Odpoj sluchátka a měř vestavěným mikrofonem.';

  @override
  String get captureWarningProcessing =>
      'Systém nevypnul úpravy signálu (AGC / potlačení šumu). Naměřené rozdíly mezi místy budou zkreslené.';

  @override
  String get captureWarningMeasurementMode =>
      'Nepodařilo se zapnout measurement mode — mikrofon má vlastní korekci frekvenční charakteristiky.';

  @override
  String get captureRouteUnknown => 'neznámý';

  @override
  String get axisLength => 'délka';

  @override
  String get axisWidth => 'šířka';

  @override
  String get axisHeight => 'výška';
}
