// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Slovak (`sk`).
class AppLocalizationsSk extends AppLocalizations {
  AppLocalizationsSk([String locale = 'sk']) : super(locale);

  @override
  String get tabScan => 'Sken';

  @override
  String get tabMap => 'Mapa';

  @override
  String get tabResponse => 'Odozva';

  @override
  String get tabDesign => 'Návrh';

  @override
  String get tabSignals => 'Signály';

  @override
  String get rtaSnapshotFailed => 'Snímka sa neuložila.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Uložené ako bod $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Uložené ako bod $id (bez polohy).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count bodov',
      many: '$count bodu',
      few: '$count body',
      one: '1 bod',
    );
    return 'Kalibrácia $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Súbor sa nedá prečítať: $message';
  }

  @override
  String get rtaOffsetTitle => 'Offset dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Pusti tón 1 kHz, odčítaj hladinu na SPL metri a zadaj rozdiel oproti tomu, čo ukazuje analyzátor. S nenulovým offsetom sa hladiny označujú ako odhad SPL; bez neho zostávajú v dBFS.';

  @override
  String get commonReset => 'Vynulovať';

  @override
  String get commonCancel => 'Zrušiť';

  @override
  String get commonSave => 'Uložiť';

  @override
  String get commonStop => 'Zastaviť';

  @override
  String get commonStartMic => 'Spustiť mikrofón';

  @override
  String get tabAnalyzer => 'Analyzátor';

  @override
  String get rtaUnfreeze => 'Rozmraziť';

  @override
  String get rtaFreeze => 'Zmraziť';

  @override
  String get rtaPeakHold => 'Peak hold';

  @override
  String get rtaMaxMinTraces => 'Stopy max / min';

  @override
  String get rtaResetTraces => 'Vynulovať stopy';

  @override
  String get rtaSaveAsPoint => 'Uložiť ako bod (3 s)';

  @override
  String get rtaMicCalibration => 'Kalibrácia mikrofónu…';

  @override
  String get rtaRemoveCalibration => 'Odobrať kalibráciu';

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
      other: '$count bodov',
      many: '$count bodu',
      few: '$count body',
      one: '1 bod',
    );
    return 'Kalibrácia $name: $_temp0, korekcia $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (odhad)';

  @override
  String get rtaFrozenHint =>
      'Zmrazené — mikrofón beží ďalej, len sa nekreslí.';

  @override
  String get rtaRelativeHint =>
      'Hladiny sú relatívne (dBFS). Obrys sa objaví, keď uložíš prvý bod — ten je referenciou pre ostatné.';

  @override
  String get rtaReferenceHint => 'Plné stĺpce = tu. Obrys = referenčný bod.';

  @override
  String get rtaEnvelopeHint => 'Červená = max, zelená = min od vynulovania.';

  @override
  String get rtaMicStopped => 'mikrofón stojí';

  @override
  String get rtaSilence => 'ticho — hrá signál?';

  @override
  String get rtaPlaceholder => 'Spusti mikrofón a pusti do miestnosti signál.';

  @override
  String rtaBandsInfo(int count) {
    return '$count tretinooktávových pásiem, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Sken miestnosti';

  @override
  String scanPointCount(int count) {
    return '$count b.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofón nebeží';

  @override
  String get scanMicNeeded => 'Bez neho sa zmeria len poloha, nie zvuk.';

  @override
  String get scanContinuous => 'Priebežné meranie';

  @override
  String get scanContinuousHint => 'Bod automaticky každých 0,5 m chôdze';

  @override
  String get scanMeasuring => 'Meriam…';

  @override
  String get scanMeasureHere => 'Zmerať tu';

  @override
  String scanPointSaved(String id, String position) {
    return 'Bod $id uložený na $position';
  }

  @override
  String get scanStartTracking => 'Spustiť sledovanie polohy';

  @override
  String get scanStartTrackingHint =>
      'ARKit — odtiaľto appka vie, kde v miestnosti stojíš.';

  @override
  String scanPosition(String position) {
    return 'Poloha: $position m od počiatku';
  }

  @override
  String get scanSetOriginHint =>
      'Postav sa na miesto poslucháča a urč počiatok.';

  @override
  String get scanOriginHere => 'Tu je počiatok';

  @override
  String get scanNoPoints => 'Zatiaľ žiadny bod.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'rozptyl 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Obývačka';

  @override
  String get scanNewMeasurement => 'Nové meranie';

  @override
  String get scanRoomName => 'Názov miestnosti';

  @override
  String get scanExcitation => 'Čím budeš miestnosť budiť';

  @override
  String get scanPhoneNoiseHint =>
      'Len orientačne — reproduktor telefónu basy vôbec nevydá.';

  @override
  String get scanStart => 'Začať';

  @override
  String get mapExportTooltip => 'Export FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Mapa potrebuje aspoň dva body. Prejdi miestnosť a priebežne meraj.';

  @override
  String get mapShareText =>
      'FRD po bodoch (import do REW / VituixCAD) a celá session v JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Najrovnejšie miesto: $id na $position m (rozptyl $variation dB v 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Jediný signál, z ktorého sa dá vypočítať impulzná odozva, doba dozvuku a prvé odrazy. Prehraj ho z počítača alebo DACu do reproduktorov, telefón nechaj nahrávať.';

  @override
  String get signalsLength => 'Dĺžka';

  @override
  String get signalsFrom => 'Od';

  @override
  String get signalsTo => 'Do';

  @override
  String get signalsMonoNoChannel => 'Mono (bez kanála)';

  @override
  String get signalsExportWav => 'Export WAV';

  @override
  String get signalsPinkNoise => 'Ružový šum';

  @override
  String get signalsPinkHelp =>
      'Rovnaká energia v každej oktáve. Dá len frekvenčnú charakteristiku, žiadny čas ani odrazy — na rýchle „robí to tu niečo?“ to stačí.';

  @override
  String get signalsExportPink => 'Export 30 s WAV';

  @override
  String get signalsHowTo => 'Ako merať';

  @override
  String get signalsStep1 =>
      'Signál pusti z počítača do reproduktorov, nie z telefónu.';

  @override
  String get signalsStep2 =>
      'Hlasitosť nastav tak, aby analyzátor ukazoval okolo −20 dBFS. Prebudenie vyzerá ako odraz.';

  @override
  String get signalsStep3 =>
      'Telefón drž zvisle na natiahnutej ruke, mikrofónom k reproduktorom.';

  @override
  String get signalsStep4 =>
      'Odpoj Bluetooth slúchadlá — kompresia aj latencia meranie znehodnotia.';

  @override
  String get signalsNoteMono =>
      'Mono do oboch reproduktorov naraz sčíta L a R a ich rozdiel v súčte zmizne. Na meranie kanálov vyber kanál.';

  @override
  String get signalsNoteStereo =>
      'Stereo súbor so signálom len v jednom kanáli — pustí ho čokoľvek, čo hrá stereo.';

  @override
  String get signalsNoteChannel =>
      'Mono súbor pomenovaný podľa kanála. Nasmeruj ho na správny vstup prijímača z DAW alebo cez viackanálový vstup; laptop so stereo výstupom ho na tento kanál nedostane.';

  @override
  String get channelsTitle => 'Meranie kanálov';

  @override
  String get channelsHelp =>
      'Postav sa na miesto poslucháča. Pre každý kanál: začni nahrávať, pusti doň sweep zo záložky Signály, ťukni na Hotovo. Bez týchto bodov návrh nemá z čoho urobiť EQ a hlasitosti.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Overenie po zadaní EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Bod sa uloží ako „po EQ“ a neprepíše ten, z ktorého sa EQ počítalo.';

  @override
  String channelsRecording(String seconds) {
    return 'Nahrávam $seconds s — teraz pusti sweep';
  }

  @override
  String get channelsNotMeasured => 'nezmerané';

  @override
  String get channelsMeasuredNoise => 'zmerané šumom';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · priamy zvuk za $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · priamy zvuk za $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Hotovo';

  @override
  String get channelsMeasure => 'Zmerať';

  @override
  String get channelsAdd => 'Pridať';

  @override
  String get channelsAgain => 'Znova';

  @override
  String get compareTitle => 'Porovnanie';

  @override
  String get compareNeedsTwoPoints => 'Porovnanie potrebuje aspoň dva body.';

  @override
  String get commonWithRoom => 's miestnosťou';

  @override
  String get commonDirectSound => 'priamy zvuk';

  @override
  String get compareAfterEq => 'po EQ';

  @override
  String get compareBandsA => 'A (pásma)';

  @override
  String get compareBandsB => 'B (pásma)';

  @override
  String get compareArrivalDiff => 'Rozdiel príchodu A − B';

  @override
  String get compareBroadbandDiff => 'Širokopásmová hladina A − B';

  @override
  String get compareWorstBelow300 => 'Najväčší rozdiel pod 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB v pásme $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance a level trim vyrovnajú rozdiel príchodu a hladiny. Rozdiel tvaru pod 300 Hz nevyrovnajú — ten robí iná stena v inej vzdialenosti a rieši sa posunom.';

  @override
  String get designRt60Live => 'T20 125–500 Hz z poslednej odozvy';

  @override
  String get designRt60Stored => 'T20 125–500 Hz z uloženého sweepu';

  @override
  String get designRt60Guess =>
      'odhad — zmeraj sweep, Schroeder je zatiaľ len tip';

  @override
  String get designExportTooltip => 'Export konfigurácie';

  @override
  String get designCompute => 'Vypočítať návrh';

  @override
  String get designLidarChecking => 'Zisťujem, či je tu LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR k dispozícii';

  @override
  String get designLidarMissing => 'Bez LiDARu — rozmery zadaj ručne';

  @override
  String get designLidarHint =>
      'Sken dá steny na centimetre, takže sedia aj body odrazov a vzdialenosti k hraniciam, nielen módy.';

  @override
  String get designManualHint =>
      'Modálny výpočet potrebuje len tri čísla — o body odrazov a presné vzdialenosti k stenám však prídeš.';

  @override
  String get designStopScan => 'Ukončiť sken';

  @override
  String get designScanRoom => 'Naskenovať miestnosť';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls stien',
      many: '$walls steny',
      few: '$walls steny',
      one: '1 stena',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings otvorov',
      many: '$openings otvoru',
      few: '$openings otvory',
      one: '1 otvor',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Rozmery miestnosti';

  @override
  String get designLength => 'Dĺžka';

  @override
  String get designWidth => 'Šírka';

  @override
  String get designHeight => 'Výška';

  @override
  String get designWhatToDo => 'Čo s tým urobiť';

  @override
  String get designRoomModes => 'Módy miestnosti';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Nad $schroeder Hz (Schroeder) už jednotlivé módy nedávajú zmysel. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: zmerané, cieľ, predpoveď';

  @override
  String get designEqHelp =>
      'Predpoveď je zmeraná odozva plus model pätnástich pásiem prijímača. Po zadaní EQ zmeraj kanál znova s prepínačom „po EQ“, aby bolo vidieť, ako blízko model bol.';

  @override
  String get designReceiverConfig => 'Konfigurácia prijímača';

  @override
  String get designGeometryOnly =>
      'Bez merania kanálov sweepom je tu len geometria: vzdialenosti a deliace frekvencie. EQ a hlasitosti pribudnú, keď budú body pre každý kanál.';

  @override
  String get designShareSubject => 'Návrh konfigurácie';

  @override
  String get impulseTitle => 'Impulzná odozva';

  @override
  String get impulseCompareTooltip => 'Porovnať body';

  @override
  String get impulseExportTooltip => 'Export FRD s fázou';

  @override
  String get impulseTapToStart => 'Ťukni pre spustenie.';

  @override
  String get impulseSweepTitle => 'Sweep, ktorý pustíš do reproduktorov';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Musí sedieť s tým, čo prehrávaš — inak dekonvolúcia vráti nezmysel.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Nahrávam — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Teraz pusti sweep z počítača.';

  @override
  String get impulseStartRecording => 'Začať nahrávať, potom pustiť sweep';

  @override
  String get impulseFrequencyResponse => 'Frekvenčná odozva';

  @override
  String get impulseWithRoom => 's miestnosťou (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'priamy zvuk (okno $ms ms)';
  }

  @override
  String get impulseWindow => 'Okno';

  @override
  String impulseWindowHelp(String hz) {
    return 'Dlhšie okno vidí nižšie (teraz platné nad $hz Hz), ale pustí dnu prvý odraz. Pod hranicou sa krivka nevyhladzuje ani nekomentuje: je to okno, nie miestnosť.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Po prvý odraz ($ms ms)';
  }

  @override
  String get impulseTime => 'Čas';

  @override
  String get impulseImpulse => 'impulz';

  @override
  String get impulseTimeHelp =>
      'Modré je okno, oranžová čiara prvý nájdený odraz. Čas nula je priamy zvuk.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Skryť';

  @override
  String get commonShow => 'Zobraziť';

  @override
  String get impulseSpectrogramHelp =>
      'Čas v ms od priameho zvuku, frekvencia nahor, farba je hladina do −60 dB. Vodorovný pruh, ktorý prežije ostatné, je mód; tabuľka nad tým hovorí to isté číslom.';

  @override
  String get impulseDecayByOctave => 'Doznievanie po oktávach';

  @override
  String get impulseMidNoT20 => 'Stredné pásma nedoznievali dosť na T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Stred 125–500 Hz: T20 $seconds s — to je RT60, s ktorým počíta návrh.';
  }

  @override
  String get impulseDecayHelp =>
      'V basoch je RT60 z telefónu skôr odhad: šum pozadia tam býva najbližšie a „—“ znamená, že dozvuk podeň neklesol. C50 nad nulou: priamy zvuk s prvými odrazmi nesie viac energie ako dozvuk.';

  @override
  String get impulseResult => 'Výsledok';

  @override
  String get impulseDirectArrived => 'Priamy zvuk dorazil za';

  @override
  String get impulseDirectArrivedHelp =>
      'Oneskorenie prehrávania plus doba letu — samo osebe nič nehovorí, ale rozdiel medzi ľavým a pravým reproduktorom áno.';

  @override
  String get impulseFirstReflection => 'Prvý odraz';

  @override
  String get impulseNotFound => 'nenájdený';

  @override
  String impulseAfterDirect(String time) {
    return '$time po priamom zvuku';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Buď tam žiadny nie je, alebo sa skryl vo vyzváňaní priameho impulzu.';

  @override
  String impulseExtraPath(String metres) {
    return 'Dráha navyše ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'nezmerateľné';

  @override
  String get impulseRt60NoiseHelp =>
      'Dozvuk neklesol dosť hlboko nad šumové pozadie — hlasnejšie, alebo v tichšej chvíli.';

  @override
  String get impulseRt60Help =>
      'Rozdiel medzi T20 a T30 naznačuje, aké čisté je doznievanie.';

  @override
  String get impulseGating => 'Okno (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'platné nad $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Pod tým okno neuvidí ani jednu periódu — krivka je tam artefakt okna, nie miestnosti.';

  @override
  String get impulseSchroeder => 'Schroederova krivka doznievania';

  @override
  String impulseHdAt(int order) {
    return 'HD$order pri 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmonické ležia v zápornom čase Farinovej dekonvolúcie; tu sa z neho čítajú namiesto zahadzovania. −40 dB je 1 %.';

  @override
  String get impulseHd3Help =>
      'Tretia harmonická rastie s prebudením rýchlejšie ako druhá.';

  @override
  String get impulseDistortionHot => 'Skreslenie nad −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Buď je sweep príliš nahlas, alebo je reproduktor na hrane. Chvost skreslenia vyzerá v impulze ako odraz — uber hlasitosť a zmeraj znova, než niečomu uveríš.';

  @override
  String get eqMeasured => 'zmerané';

  @override
  String get eqTarget => 'cieľ';

  @override
  String get eqPredicted => 'predpoveď po EQ';

  @override
  String get eqMeasuredAfter => 'zmerané po EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Odchýlka od cieľa 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Po zadaní do prijímača';

  @override
  String get eqPredictionVsReality => 'Predpoveď vs. skutočnosť';

  @override
  String eqStubborn(String bands) {
    return 'Zostane ďalej od cieľa než 6 dB: $bands. To je interferencia, nie nedostatok výkonu — rieši sa posunom reproduktora alebo poslucháča, nie ďalším zdvihom.';
  }

  @override
  String get eqModelOk => 'Filter prijímača sa správa zhruba ako model.';

  @override
  String get eqModelOff =>
      'Skutočný filter prijímača sa od modelu líši viac, než sa čakalo — jeho pásma sú najskôr širšie alebo užšie, než sa tu predpokladá.';

  @override
  String get eqTargetCurve => 'Cieľová krivka';

  @override
  String get eqFlat => 'plochá';

  @override
  String get eqTargetHelp =>
      'Nie rovná: nad pár kHz ucho počuje priamy zvuk, mikrofón sčíta aj odrazy, a vyrovnaná meraná krivka znie tupo. Mierny sklon hore a trocha basov dole je to, čo ľudia volia pri slepom počúvaní.';

  @override
  String get eqBassLift => 'Zdvih basov';

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
      'Bez prístupu k mikrofónu sa merať nedá. Povoľ ho v Nastavenia → AudioScanner → Mikrofón.';

  @override
  String errorMic(String error) {
    return 'Mikrofón: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Nepodarilo sa spustiť mikrofón: $error';
  }

  @override
  String get errorNoArkit =>
      'Toto zariadenie nevie ARKit world tracking — body sa nedajú umiestňovať do priestoru.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Nahrávka je kratšia ako sweep ($recorded s z $expected s). Spusti nahrávanie skôr, než pustíš signál.';
  }

  @override
  String get sessionSnapshots => 'Snímky';

  @override
  String get errorTrackingUnreliable =>
      'Sledovanie polohy nie je spoľahlivé — bod by sedel inde, než stojíš.';

  @override
  String errorNoSound(int seconds) {
    return 'Za $seconds s neprišiel žiadny zvuk.';
  }

  @override
  String get noteSnapshotNoPose => 'snímka z analyzátora, bez polohy';

  @override
  String get sessionChannels => 'Kanály';

  @override
  String get trackingOk => 'Sledovanie OK';

  @override
  String get trackingLimited => 'Slabé sledovanie';

  @override
  String get trackingUnavailable => 'Bez sledovania';

  @override
  String get poseHintFeatures =>
      'Málo detailov v obraze — namier telefón na niečo členité, nie na holú stenu.';

  @override
  String get poseHintMotion => 'Príliš rýchly pohyb — choď pomalšie.';

  @override
  String get poseHintLight => 'Málo svetla — rozsvieť, kamera nevidí, kde je.';

  @override
  String get poseHintInitializing => 'ARKit sa rozbieha, chvíľu sa pohybuj.';

  @override
  String get poseHintRelocalizing =>
      'Hľadá sa späť pôvodný bod — vráť sa, kde si začínal.';

  @override
  String get signalPhonePink => 'Ružový šum z telefónu';

  @override
  String get signalExternalPink => 'Ružový šum z reproduktorov';

  @override
  String get signalExternalSweep => 'Sweep z reproduktorov';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth mikrofón: kompresia a latencia meranie znehodnotia. Odpoj slúchadlá a meraj vstavaným mikrofónom.';

  @override
  String get captureWarningProcessing =>
      'Systém nevypol úpravy signálu (AGC / potlačenie šumu). Namerané rozdiely medzi miestami budú skreslené.';

  @override
  String get captureWarningMeasurementMode =>
      'Nepodarilo sa zapnúť measurement mode — mikrofón má vlastnú korekciu frekvenčnej charakteristiky.';

  @override
  String get captureRouteUnknown => 'neznámy';

  @override
  String get axisLength => 'dĺžka';

  @override
  String get axisWidth => 'šírka';

  @override
  String get axisHeight => 'výška';
}
