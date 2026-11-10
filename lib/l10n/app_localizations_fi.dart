// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Finnish (`fi`).
class AppLocalizationsFi extends AppLocalizations {
  AppLocalizationsFi([String locale = 'fi']) : super(locale);

  @override
  String get tabScan => 'Skannaus';

  @override
  String get tabMap => 'Kartta';

  @override
  String get tabResponse => 'Vaste';

  @override
  String get tabDesign => 'Suunnitelma';

  @override
  String get tabSignals => 'Signaalit';

  @override
  String get rtaSnapshotFailed => 'Tilannekuvaa ei tallennettu.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Tallennettu pisteeksi $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Tallennettu pisteeksi $id (ilman sijaintia).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pistettä',
      one: '1 piste',
    );
    return 'Kalibrointi $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Tiedostoa ei voi lukea: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL -siirtymä';

  @override
  String get rtaOffsetHelp =>
      'Soita 1 kHz:n ääni, lue taso äänitasomittarista ja syötä ero siihen, mitä analysaattori näyttää. Nollasta poikkeavalla siirtymällä tasot merkitään SPL-arvioksi; ilman sitä ne pysyvät dBFS-arvoina.';

  @override
  String get commonReset => 'Nollaa';

  @override
  String get commonCancel => 'Peruuta';

  @override
  String get commonSave => 'Tallenna';

  @override
  String get commonStop => 'Pysäytä';

  @override
  String get commonStartMic => 'Käynnistä mikrofoni';

  @override
  String get tabAnalyzer => 'Analysaattori';

  @override
  String get rtaUnfreeze => 'Jatka';

  @override
  String get rtaFreeze => 'Pysäytä kuva';

  @override
  String get rtaPeakHold => 'Huippupito';

  @override
  String get rtaMaxMinTraces => 'Maks./min.-käyrät';

  @override
  String get rtaResetTraces => 'Nollaa käyrät';

  @override
  String get rtaSaveAsPoint => 'Tallenna pisteeksi (3 s)';

  @override
  String get rtaMicCalibration => 'Mikrofonin kalibrointi…';

  @override
  String get rtaRemoveCalibration => 'Poista kalibrointi';

  @override
  String get rtaOffsetMenu => 'dB SPL -siirtymä…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · ei signaalinkäsittelyä';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pistettä',
      one: '1 piste',
    );
    return 'Kalibrointi $name: $_temp0, korjaus $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (arvio)';

  @override
  String get rtaFrozenHint =>
      'Pysäytetty — mikrofoni toimii edelleen, kuvaa ei vain piirretä.';

  @override
  String get rtaRelativeHint =>
      'Tasot ovat suhteellisia (dBFS). Ääriviiva tulee näkyviin, kun tallennat ensimmäisen pisteen — se on muiden vertailukohta.';

  @override
  String get rtaReferenceHint =>
      'Täydet palkit = tässä. Ääriviiva = vertailupiste.';

  @override
  String get rtaEnvelopeHint =>
      'Punainen = maks., vihreä = min. nollauksesta lähtien.';

  @override
  String get rtaMicStopped => 'mikrofoni pysäytetty';

  @override
  String get rtaSilence => 'hiljaista — soiko signaali?';

  @override
  String get rtaPlaceholder =>
      'Käynnistä mikrofoni ja soita huoneeseen signaali.';

  @override
  String rtaBandsInfo(int count) {
    return '$count terssikaistaa, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Huoneen skannaus';

  @override
  String scanPointCount(int count) {
    return '$count p.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofoni ei ole käynnissä';

  @override
  String get scanMicNeeded => 'Ilman sitä mitataan vain sijainti, ei ääntä.';

  @override
  String get scanContinuous => 'Jatkuva mittaus';

  @override
  String get scanContinuousHint =>
      'Piste automaattisesti 0,5 metrin välein kävellessä';

  @override
  String get scanMeasuring => 'Mitataan…';

  @override
  String get scanMeasureHere => 'Mittaa tässä';

  @override
  String scanPointSaved(String id, String position) {
    return 'Piste $id tallennettu kohtaan $position';
  }

  @override
  String get scanStartTracking => 'Käynnistä sijainnin seuranta';

  @override
  String get scanStartTrackingHint =>
      'ARKit — näin sovellus tietää, missä seisot huoneessa.';

  @override
  String scanPosition(String position) {
    return 'Sijainti: $position m origosta';
  }

  @override
  String get scanSetOriginHint => 'Asetu kuuntelupaikalle ja aseta origo.';

  @override
  String get scanOriginHere => 'Origo on tässä';

  @override
  String get scanNoPoints => 'Ei vielä pisteitä.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'hajonta 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Olohuone';

  @override
  String get scanNewMeasurement => 'Uusi mittaus';

  @override
  String get scanRoomName => 'Huoneen nimi';

  @override
  String get scanExcitation => 'Millä herätät huoneen';

  @override
  String get scanPhoneNoiseHint =>
      'Vain suuntaa antava — puhelimen kaiutin ei toista bassoa lainkaan.';

  @override
  String get scanStart => 'Aloita';

  @override
  String get mapExportTooltip => 'Vie FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Kartta tarvitsee vähintään kaksi pistettä. Kulje huoneessa ja mittaa samalla.';

  @override
  String get mapShareText =>
      'FRD pisteittäin (tuonti REW:hen / VituixCADiin) ja koko istunto JSON-muodossa.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Tasaisin kohta: $id kohdassa $position m (hajonta $variation dB välillä 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Ainoa signaali, josta voi laskea impulssivasteen, jälkikaiunta-ajan ja ensimmäiset heijastukset. Soita se tietokoneelta tai DAC:lta kaiuttimiin ja anna puhelimen nauhoittaa.';

  @override
  String get signalsLength => 'Pituus';

  @override
  String get signalsFrom => 'Alku';

  @override
  String get signalsTo => 'Loppu';

  @override
  String get signalsMonoNoChannel => 'Mono (ei kanavaa)';

  @override
  String get signalsExportWav => 'Vie WAV';

  @override
  String get signalsPinkNoise => 'Vaaleanpunainen kohina';

  @override
  String get signalsPinkHelp =>
      'Sama energia joka oktaavissa. Antaa vain taajuusvasteen, ei aikaa eikä heijastuksia — riittää nopeaan ”tapahtuuko täällä jotain?” -tarkistukseen.';

  @override
  String get signalsExportPink => 'Vie 30 s WAV';

  @override
  String get signalsHowTo => 'Näin mittaat';

  @override
  String get signalsStep1 =>
      'Soita signaali tietokoneelta kaiuttimiin, ei puhelimesta.';

  @override
  String get signalsStep2 =>
      'Säädä äänenvoimakkuus niin, että analysaattori näyttää noin −20 dBFS. Ylioharjautuminen näyttää heijastukselta.';

  @override
  String get signalsStep3 =>
      'Pidä puhelinta pystyssä käsivarren mitan päässä, mikrofoni kaiuttimiin päin.';

  @override
  String get signalsStep4 =>
      'Irrota Bluetooth-kuulokkeet — pakkaus ja viive pilaavat mittauksen.';

  @override
  String get signalsNoteMono =>
      'Mono molempiin kaiuttimiin yhtä aikaa summaa L:n ja R:n, ja niiden ero katoaa summaan. Valitse kanava mitataksesi kanavia.';

  @override
  String get signalsNoteStereo =>
      'Stereotiedosto, jossa signaali on vain yhdellä kanavalla — mikä tahansa stereota toistava laite soittaa sen.';

  @override
  String get signalsNoteChannel =>
      'Kanavan mukaan nimetty monotiedosto. Ohjaa se vastaanottimen oikeaan tuloon DAW:sta tai monikanavaisen tulon kautta; stereolähtöinen kannettava ei saa sitä tälle kanavalle.';

  @override
  String get channelsTitle => 'Kanavien mittaus';

  @override
  String get channelsHelp =>
      'Asetu kuuntelupaikalle. Jokaiselle kanavalle: aloita nauhoitus, soita siihen sweep Signaalit-välilehdeltä ja napauta Valmis. Ilman näitä pisteitä suunnitelmalla ei ole mistä laskea EQ:ta ja tasoja.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Tarkistus EQ:n syöttämisen jälkeen';

  @override
  String get channelsVerifyAfterEqHint =>
      'Piste tallennetaan nimellä ”EQ:n jälkeen”, eikä se korvaa pistettä, josta EQ laskettiin.';

  @override
  String channelsRecording(String seconds) {
    return 'Nauhoitetaan $seconds s — soita sweep nyt';
  }

  @override
  String get channelsNotMeasured => 'ei mitattu';

  @override
  String get channelsMeasuredNoise => 'mitattu kohinalla';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · suora ääni $ms ms:n jälkeen';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · suora ääni $ms ms:n jälkeen, T20 $t20 s';
  }

  @override
  String get commonDone => 'Valmis';

  @override
  String get channelsMeasure => 'Mittaa';

  @override
  String get channelsAdd => 'Lisää';

  @override
  String get channelsAgain => 'Uudelleen';

  @override
  String get compareTitle => 'Vertailu';

  @override
  String get compareNeedsTwoPoints =>
      'Vertailu tarvitsee vähintään kaksi pistettä.';

  @override
  String get commonWithRoom => 'huoneen kanssa';

  @override
  String get commonDirectSound => 'suora ääni';

  @override
  String get compareAfterEq => 'EQ:n jälkeen';

  @override
  String get compareBandsA => 'A (kaistat)';

  @override
  String get compareBandsB => 'B (kaistat)';

  @override
  String get compareArrivalDiff => 'Saapumisero A − B';

  @override
  String get compareBroadbandDiff => 'Laajakaistainen taso A − B';

  @override
  String get compareWorstBelow300 => 'Suurin ero alle 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB kaistalla $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance ja level trim tasaavat saapumis- ja tasoeron. Ne eivät tasaa muotoeroa alle 300 Hz:n — sen aiheuttaa eri seinä eri etäisyydellä, ja se korjataan siirtämällä.';

  @override
  String get designRt60Live => 'T20 125–500 Hz viimeisimmästä vasteesta';

  @override
  String get designRt60Stored => 'T20 125–500 Hz tallennetusta sweepistä';

  @override
  String get designRt60Guess =>
      'arvio — mittaa sweep, Schroeder on toistaiseksi vain vihje';

  @override
  String get designExportTooltip => 'Vie kokoonpano';

  @override
  String get designCompute => 'Laske suunnitelma';

  @override
  String get designLidarChecking => 'Tarkistetaan, onko LiDAR käytettävissä…';

  @override
  String get designLidarAvailable => 'LiDAR käytettävissä';

  @override
  String get designLidarMissing => 'Ei LiDARia — syötä mitat käsin';

  @override
  String get designLidarHint =>
      'Skannaus antaa seinät senttimetrin tarkkuudella, joten myös heijastuspisteet ja etäisyydet rajapintoihin täsmäävät, eivät vain moodit.';

  @override
  String get designManualHint =>
      'Moodilaskenta tarvitsee vain kolme lukua — mutta menetät heijastuspisteet ja tarkat etäisyydet seiniin.';

  @override
  String get designStopScan => 'Lopeta skannaus';

  @override
  String get designScanRoom => 'Skannaa huone';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls seinää',
      one: '1 seinä',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings aukkoa',
      one: '1 aukko',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Huoneen mitat';

  @override
  String get designLength => 'Pituus';

  @override
  String get designWidth => 'Leveys';

  @override
  String get designHeight => 'Korkeus';

  @override
  String get designWhatToDo => 'Mitä asialle voi tehdä';

  @override
  String get designRoomModes => 'Huonemoodit';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Yli $schroeder Hz:n (Schroeder) yksittäisillä moodeilla ei ole enää merkitystä. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: mitattu, tavoite, ennuste';

  @override
  String get designEqHelp =>
      'Ennuste on mitattu vaste plus malli vastaanottimen viidestätoista kaistasta. Kun EQ on syötetty, mittaa kanava uudelleen ”EQ:n jälkeen” -kytkimellä nähdäksesi, kuinka lähelle malli osui.';

  @override
  String get designReceiverConfig => 'Vastaanottimen kokoonpano';

  @override
  String get designGeometryOnly =>
      'Ilman kanavien sweep-mittauksia tässä on vain geometriaa: etäisyydet ja jakotaajuudet. EQ ja tasot tulevat, kun pisteitä on kanavakohtaisesti.';

  @override
  String get designShareSubject => 'Kokoonpanoehdotus';

  @override
  String get impulseTitle => 'Impulssivaste';

  @override
  String get impulseCompareTooltip => 'Vertaa pisteitä';

  @override
  String get impulseExportTooltip => 'Vie FRD vaiheineen';

  @override
  String get impulseTapToStart => 'Napauta käynnistääksesi.';

  @override
  String get impulseSweepTitle => 'Sweep, jonka soitat kaiuttimiin';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Sen täytyy vastata sitä, mitä soitat — muuten dekonvoluutio antaa hölynpölyä.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Nauhoitetaan — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Soita nyt sweep tietokoneelta.';

  @override
  String get impulseStartRecording => 'Aloita nauhoitus ja soita sitten sweep';

  @override
  String get impulseFrequencyResponse => 'Taajuusvaste';

  @override
  String get impulseWithRoom => 'huoneen kanssa (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'suora ääni (ikkuna $ms ms)';
  }

  @override
  String get impulseWindow => 'Ikkuna';

  @override
  String impulseWindowHelp(String hz) {
    return 'Pidempi ikkuna näkee matalammalle (nyt pätevä yli $hz Hz), mutta päästää sisään ensimmäisen heijastuksen. Rajan alapuolella käyrää ei tasoiteta eikä kommentoida: se on ikkuna, ei huone.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Ensimmäiseen heijastukseen ($ms ms)';
  }

  @override
  String get impulseTime => 'Aika';

  @override
  String get impulseImpulse => 'impulssi';

  @override
  String get impulseTimeHelp =>
      'Sininen on ikkuna, oranssi viiva ensimmäinen löydetty heijastus. Aika nolla on suora ääni.';

  @override
  String get impulseSpectrogram => 'Spektrogrammi';

  @override
  String get commonHide => 'Piilota';

  @override
  String get commonShow => 'Näytä';

  @override
  String get impulseSpectrogramHelp =>
      'Aika ms:nä suorasta äänestä, taajuus ylöspäin, väri on taso −60 dB:iin asti. Vaakasuora raita, joka kestää muita pidempään, on moodi; yllä oleva taulukko kertoo saman numeroina.';

  @override
  String get impulseDecayByOctave => 'Vaimeneminen oktaaveittain';

  @override
  String get impulseMidNoT20 =>
      'Keskikaistat eivät vaimenneet tarpeeksi T20:tä varten.';

  @override
  String impulseMidT20(String seconds) {
    return 'Keskialue 125–500 Hz: T20 $seconds s — tätä RT60:tä suunnitelma käyttää.';
  }

  @override
  String get impulseDecayHelp =>
      'Bassossa puhelimen RT60 on lähinnä arvio: taustakohina on siellä lähimpänä, ja ”—” tarkoittaa, ettei jälkikaiunta laskenut sen alle. C50 yli nollan: suora ääni varhaisine heijastuksineen kantaa enemmän energiaa kuin jälkikaiunta.';

  @override
  String get impulseResult => 'Tulos';

  @override
  String get impulseDirectArrived => 'Suora ääni saapui';

  @override
  String get impulseDirectArrivedHelp =>
      'Toistoviive plus kulkuaika — ei kerro yksinään mitään, mutta vasemman ja oikean kaiuttimen ero kertoo.';

  @override
  String get impulseFirstReflection => 'Ensimmäinen heijastus';

  @override
  String get impulseNotFound => 'ei löytynyt';

  @override
  String impulseAfterDirect(String time) {
    return '$time suoran äänen jälkeen';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Joko heijastusta ei ole, tai se piiloutuu suoran impulssin soimiseen.';

  @override
  String impulseExtraPath(String metres) {
    return 'Lisämatka ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'ei mitattavissa';

  @override
  String get impulseRt60NoiseHelp =>
      'Jälkikaiunta ei laskenut tarpeeksi syvälle kohinatason yläpuolella — kovempaa, tai hiljaisempana hetkenä.';

  @override
  String get impulseRt60Help =>
      'T20:n ja T30:n ero kertoo, kuinka puhdasta vaimeneminen on.';

  @override
  String get impulseGating => 'Ikkuna (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'pätevä yli $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Tämän alapuolella ikkuna ei näe yhtäkään jaksoa — käyrä on siellä ikkunan artefakti, ei huoneen.';

  @override
  String get impulseSchroeder => 'Schroederin vaimenemiskäyrä';

  @override
  String impulseHdAt(int order) {
    return 'HD$order taajuuksilla 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmoniset ovat Farinan dekonvoluution negatiivisessa ajassa; tässä ne luetaan sieltä sen sijaan, että ne heitettäisiin pois. −40 dB on 1 %.';

  @override
  String get impulseHd3Help =>
      'Kolmas harmoninen kasvaa ylioharjauksessa nopeammin kuin toinen.';

  @override
  String get impulseDistortionHot => 'Särö yli −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Joko sweep on liian kova tai kaiutin on rajoillaan. Säröhäntä näyttää impulssissa heijastukselta — pienennä äänenvoimakkuutta ja mittaa uudelleen, ennen kuin uskot mihinkään.';

  @override
  String get eqMeasured => 'mitattu';

  @override
  String get eqTarget => 'tavoite';

  @override
  String get eqPredicted => 'ennuste EQ:n jälkeen';

  @override
  String get eqMeasuredAfter => 'mitattu EQ:n jälkeen';

  @override
  String eqDeviation(int maxHz) {
    return 'Poikkeama tavoitteesta 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Vastaanottimeen syöttämisen jälkeen';

  @override
  String get eqPredictionVsReality => 'Ennuste vs. todellisuus';

  @override
  String eqStubborn(String bands) {
    return 'Jää yli 6 dB:n päähän tavoitteesta: $bands. Se on interferenssiä, ei tehon puutetta — korjataan siirtämällä kaiutinta tai kuuntelijaa, ei lisäkorostuksella.';
  }

  @override
  String get eqModelOk =>
      'Vastaanottimen suodin käyttäytyy suunnilleen kuten malli.';

  @override
  String get eqModelOff =>
      'Vastaanottimen todellinen suodin poikkeaa mallista odotettua enemmän — sen kaistat ovat luultavasti leveämpiä tai kapeampia kuin tässä oletetaan.';

  @override
  String get eqTargetCurve => 'Tavoitekäyrä';

  @override
  String get eqFlat => 'tasainen';

  @override
  String get eqTargetHelp =>
      'Ei tasainen: muutaman kHz:n yläpuolella korva kuulee suoran äänen, mikrofoni summaa myös heijastukset, ja suoristettu mittauskäyrä kuulostaa tylsältä. Loiva lasku ylhäällä ja hieman bassoa alhaalla on se, mitä ihmiset valitsevat sokkokuuntelussa.';

  @override
  String get eqBassLift => 'Bassokorostus';

  @override
  String get eqBassBelow => 'Basso alle';

  @override
  String get eqTilt => 'Kallistus';

  @override
  String get eqDbPerOctave => 'dB/okt';

  @override
  String get eqTiltFrom => 'Kallistus alkaen';

  @override
  String get errorMicPermission =>
      'Ilman mikrofonin käyttöoikeutta ei voi mitata. Salli se kohdassa Asetukset → AudioScanner → Mikrofoni.';

  @override
  String errorMic(String error) {
    return 'Mikrofoni: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Mikrofonia ei voitu käynnistää: $error';
  }

  @override
  String get errorNoArkit =>
      'Tämä laite ei tue ARKitin world trackingia — pisteitä ei voi sijoittaa tilaan.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Nauhoitus on sweepiä lyhyempi ($recorded s / $expected s). Aloita nauhoitus ennen kuin soitat signaalin.';
  }

  @override
  String get sessionSnapshots => 'Tilannekuvat';

  @override
  String get errorTrackingUnreliable =>
      'Sijainnin seuranta on epäluotettava — piste osuisi muualle kuin missä seisot.';

  @override
  String errorNoSound(int seconds) {
    return 'Ääntä ei tullut $seconds sekunnissa.';
  }

  @override
  String get noteSnapshotNoPose =>
      'analysaattorin tilannekuva, ilman sijaintia';

  @override
  String get sessionChannels => 'Kanavat';

  @override
  String get trackingOk => 'Seuranta OK';

  @override
  String get trackingLimited => 'Heikko seuranta';

  @override
  String get trackingUnavailable => 'Ei seurantaa';

  @override
  String get poseHintFeatures =>
      'Kuvassa on liian vähän yksityiskohtia — suuntaa puhelin johonkin kuvioituun, ei paljaaseen seinään.';

  @override
  String get poseHintMotion => 'Liian nopea liike — kävele hitaammin.';

  @override
  String get poseHintLight =>
      'Liian vähän valoa — sytytä valot, kamera ei näe missä se on.';

  @override
  String get poseHintInitializing => 'ARKit käynnistyy, liiku hieman.';

  @override
  String get poseHintRelocalizing =>
      'Alkuperäistä pistettä etsitään uudelleen — palaa sinne, mistä aloitit.';

  @override
  String get signalPhonePink => 'Vaaleanpunainen kohina puhelimesta';

  @override
  String get signalExternalPink => 'Vaaleanpunainen kohina kaiuttimista';

  @override
  String get signalExternalSweep => 'Sweep kaiuttimista';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth-mikrofoni: pakkaus ja viive pilaavat mittauksen. Irrota kuulokkeet ja mittaa sisäänrakennetulla mikrofonilla.';

  @override
  String get captureWarningProcessing =>
      'Järjestelmä ei kytkenyt signaalinkäsittelyä pois (AGC / kohinanvaimennus). Mitatut erot paikkojen välillä vääristyvät.';

  @override
  String get captureWarningMeasurementMode =>
      'Measurement modea ei voitu ottaa käyttöön — mikrofonilla on oma taajuusvasteen korjaus.';

  @override
  String get captureRouteUnknown => 'tuntematon';

  @override
  String get axisLength => 'pituus';

  @override
  String get axisWidth => 'leveys';

  @override
  String get axisHeight => 'korkeus';
}
