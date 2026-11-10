// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get tabScan => 'Scan';

  @override
  String get tabMap => 'Kaart';

  @override
  String get tabResponse => 'Respons';

  @override
  String get tabDesign => 'Ontwerp';

  @override
  String get tabSignals => 'Signalen';

  @override
  String get rtaSnapshotFailed => 'Momentopname is niet opgeslagen.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Opgeslagen als punt $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Opgeslagen als punt $id (zonder positie).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punten',
      one: '1 punt',
    );
    return 'Kalibratie $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Bestand kan niet worden gelezen: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL-offset';

  @override
  String get rtaOffsetHelp =>
      'Speel een toon van 1 kHz af, lees het niveau af op een geluidsmeter en voer het verschil in met wat de analyzer toont. Met een offset ongelijk aan nul worden niveaus als SPL-schatting gemarkeerd; zonder blijven ze in dBFS.';

  @override
  String get commonReset => 'Resetten';

  @override
  String get commonCancel => 'Annuleren';

  @override
  String get commonSave => 'Opslaan';

  @override
  String get commonStop => 'Stoppen';

  @override
  String get commonStartMic => 'Microfoon starten';

  @override
  String get tabAnalyzer => 'Analyzer';

  @override
  String get rtaUnfreeze => 'Hervatten';

  @override
  String get rtaFreeze => 'Bevriezen';

  @override
  String get rtaPeakHold => 'Peak hold';

  @override
  String get rtaMaxMinTraces => 'Max-/min-curves';

  @override
  String get rtaResetTraces => 'Curves resetten';

  @override
  String get rtaSaveAsPoint => 'Opslaan als punt (3 s)';

  @override
  String get rtaMicCalibration => 'Microfoonkalibratie…';

  @override
  String get rtaRemoveCalibration => 'Kalibratie verwijderen';

  @override
  String get rtaOffsetMenu => 'dB SPL-offset…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · zonder signaalbewerking';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count punten',
      one: '1 punt',
    );
    return 'Kalibratie $name: $_temp0, correctie $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (schatting)';

  @override
  String get rtaFrozenHint =>
      'Bevroren — de microfoon loopt door, alleen het tekenen staat stil.';

  @override
  String get rtaRelativeHint =>
      'Niveaus zijn relatief (dBFS). De omtrek verschijnt zodra je het eerste punt opslaat — dat is de referentie voor de rest.';

  @override
  String get rtaReferenceHint =>
      'Volle balken = hier. Omtrek = referentiepunt.';

  @override
  String get rtaEnvelopeHint => 'Rood = max, groen = min sinds het resetten.';

  @override
  String get rtaMicStopped => 'microfoon staat stil';

  @override
  String get rtaSilence => 'stilte — speelt er een signaal?';

  @override
  String get rtaPlaceholder =>
      'Start de microfoon en speel een signaal af in de ruimte.';

  @override
  String rtaBandsInfo(int count) {
    return '$count terts-banden, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Ruimtescan';

  @override
  String scanPointCount(int count) {
    return '$count ptn';
  }

  @override
  String get commonMicNotRunning => 'Microfoon staat uit';

  @override
  String get scanMicNeeded =>
      'Zonder microfoon wordt alleen de positie gemeten, niet het geluid.';

  @override
  String get scanContinuous => 'Doorlopend meten';

  @override
  String get scanContinuousHint => 'Automatisch een punt per 0,5 m lopen';

  @override
  String get scanMeasuring => 'Meten…';

  @override
  String get scanMeasureHere => 'Hier meten';

  @override
  String scanPointSaved(String id, String position) {
    return 'Punt $id opgeslagen op $position';
  }

  @override
  String get scanStartTracking => 'Positietracking starten';

  @override
  String get scanStartTrackingHint =>
      'ARKit — zo weet de app waar je in de ruimte staat.';

  @override
  String scanPosition(String position) {
    return 'Positie: $position m vanaf de oorsprong';
  }

  @override
  String get scanSetOriginHint =>
      'Ga op de luisterplek staan en leg de oorsprong vast.';

  @override
  String get scanOriginHere => 'Hier is de oorsprong';

  @override
  String get scanNoPoints => 'Nog geen punten.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'spreiding 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Woonkamer';

  @override
  String get scanNewMeasurement => 'Nieuwe meting';

  @override
  String get scanRoomName => 'Naam van de ruimte';

  @override
  String get scanExcitation => 'Waarmee je de ruimte aanstoot';

  @override
  String get scanPhoneNoiseHint =>
      'Alleen als indicatie — de telefoonspeaker geeft helemaal geen bas.';

  @override
  String get scanStart => 'Beginnen';

  @override
  String get mapExportTooltip => 'FRD + JSON exporteren';

  @override
  String get mapNeedsTwoPoints =>
      'De kaart heeft minstens twee punten nodig. Loop door de ruimte en meet doorlopend.';

  @override
  String get mapShareText =>
      'FRD per punt (importeren in REW / VituixCAD) en de hele sessie als JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Vlakste plek: $id op $position m (spreiding $variation dB in 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Het enige signaal waaruit de impulsrespons, nagalmtijd en eerste reflecties te berekenen zijn. Speel het af vanaf een computer of DAC via de speakers en laat de telefoon opnemen.';

  @override
  String get signalsLength => 'Lengte';

  @override
  String get signalsFrom => 'Van';

  @override
  String get signalsTo => 'Tot';

  @override
  String get signalsMonoNoChannel => 'Mono (zonder kanaal)';

  @override
  String get signalsExportWav => 'WAV exporteren';

  @override
  String get signalsPinkNoise => 'Roze ruis';

  @override
  String get signalsPinkHelp =>
      'Gelijke energie in elk octaaf. Geeft alleen de frequentierespons, geen tijd of reflecties — genoeg voor een snelle „gebeurt hier iets?”.';

  @override
  String get signalsExportPink => 'WAV van 30 s exporteren';

  @override
  String get signalsHowTo => 'Zo meet je';

  @override
  String get signalsStep1 =>
      'Speel het signaal af vanaf een computer via de speakers, niet vanaf de telefoon.';

  @override
  String get signalsStep2 =>
      'Zet het volume zo dat de analyzer rond −20 dBFS aangeeft. Oversturing lijkt op een reflectie.';

  @override
  String get signalsStep3 =>
      'Houd de telefoon rechtop op armlengte, met de microfoon naar de speakers.';

  @override
  String get signalsStep4 =>
      'Ontkoppel Bluetooth-koptelefoons — compressie en latentie verpesten de meting.';

  @override
  String get signalsNoteMono =>
      'Mono naar beide speakers tegelijk telt L en R op, en hun verschil verdwijnt in de som. Kies een kanaal om kanalen te meten.';

  @override
  String get signalsNoteStereo =>
      'Stereobestand met het signaal op slechts één kanaal — alles wat stereo afspeelt, speelt het af.';

  @override
  String get signalsNoteChannel =>
      'Monobestand met de naam van het kanaal. Stuur het vanuit een DAW of via een meerkanaals ingang naar de juiste receiveringang; een laptop met stereo-uitgang krijgt het niet op dit kanaal.';

  @override
  String get channelsTitle => 'Kanalen meten';

  @override
  String get channelsHelp =>
      'Ga op de luisterplek staan. Per kanaal: start de opname, speel er een sweep op af vanuit het tabblad Signalen, tik op Klaar. Zonder deze punten heeft het ontwerp niets om EQ en niveaus uit te berekenen.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Controle na invoeren van EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Het punt wordt opgeslagen als „na EQ” en overschrijft niet het punt waaruit de EQ is berekend.';

  @override
  String channelsRecording(String seconds) {
    return 'Opname $seconds s — speel nu de sweep af';
  }

  @override
  String get channelsNotMeasured => 'niet gemeten';

  @override
  String get channelsMeasuredNoise => 'gemeten met ruis';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · direct geluid na $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · direct geluid na $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Klaar';

  @override
  String get channelsMeasure => 'Meten';

  @override
  String get channelsAdd => 'Toevoegen';

  @override
  String get channelsAgain => 'Opnieuw';

  @override
  String get compareTitle => 'Vergelijking';

  @override
  String get compareNeedsTwoPoints =>
      'Een vergelijking heeft minstens twee punten nodig.';

  @override
  String get commonWithRoom => 'met ruimte';

  @override
  String get commonDirectSound => 'direct geluid';

  @override
  String get compareAfterEq => 'na EQ';

  @override
  String get compareBandsA => 'A (banden)';

  @override
  String get compareBandsB => 'B (banden)';

  @override
  String get compareArrivalDiff => 'Aankomstverschil A − B';

  @override
  String get compareBroadbandDiff => 'Breedbandniveau A − B';

  @override
  String get compareWorstBelow300 => 'Grootste verschil onder 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB in de band $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance en level trim vereffenen het aankomst- en niveauverschil. Het vormverschil onder 300 Hz vereffenen ze niet — dat komt van een andere wand op een andere afstand en los je op door te verplaatsen.';

  @override
  String get designRt60Live => 'T20 125–500 Hz uit de laatste respons';

  @override
  String get designRt60Stored => 'T20 125–500 Hz uit een opgeslagen sweep';

  @override
  String get designRt60Guess =>
      'schatting — meet een sweep, Schroeder is voorlopig alleen een gok';

  @override
  String get designExportTooltip => 'Configuratie exporteren';

  @override
  String get designCompute => 'Ontwerp berekenen';

  @override
  String get designLidarChecking => 'Controleren of er LiDAR is…';

  @override
  String get designLidarAvailable => 'LiDAR beschikbaar';

  @override
  String get designLidarMissing =>
      'Geen LiDAR — voer de afmetingen handmatig in';

  @override
  String get designLidarHint =>
      'De scan meet wanden op de centimeter, dus ook reflectiepunten en afstanden tot de grenzen kloppen, niet alleen de modi.';

  @override
  String get designManualHint =>
      'De modale berekening heeft maar drie getallen nodig — maar reflectiepunten en exacte afstanden tot de wanden mis je dan.';

  @override
  String get designStopScan => 'Scan stoppen';

  @override
  String get designScanRoom => 'Ruimte scannen';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls wanden',
      one: '1 wand',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings openingen',
      one: '1 opening',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Afmetingen van de ruimte';

  @override
  String get designLength => 'Lengte';

  @override
  String get designWidth => 'Breedte';

  @override
  String get designHeight => 'Hoogte';

  @override
  String get designWhatToDo => 'Wat eraan te doen';

  @override
  String get designRoomModes => 'Ruimtemodi';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Boven $schroeder Hz (Schroeder) hebben afzonderlijke modi geen zin meer. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: gemeten, doel, voorspelling';

  @override
  String get designEqHelp =>
      'De voorspelling is de gemeten respons plus een model van de vijftien banden van de receiver. Meet het kanaal na het invoeren van de EQ opnieuw met de schakelaar „na EQ” om te zien hoe dicht het model zat.';

  @override
  String get designReceiverConfig => 'Receiverconfiguratie';

  @override
  String get designGeometryOnly =>
      'Zonder sweepmetingen per kanaal is hier alleen geometrie: afstanden en scheidingsfrequenties. EQ en niveaus komen erbij zodra er punten per kanaal zijn.';

  @override
  String get designShareSubject => 'Configuratievoorstel';

  @override
  String get impulseTitle => 'Impulsrespons';

  @override
  String get impulseCompareTooltip => 'Punten vergelijken';

  @override
  String get impulseExportTooltip => 'FRD met fase exporteren';

  @override
  String get impulseTapToStart => 'Tik om te starten.';

  @override
  String get impulseSweepTitle => 'De sweep die je via de speakers afspeelt';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Moet overeenkomen met wat je afspeelt — anders geeft de deconvolutie onzin.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Opname — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Speel nu de sweep af vanaf de computer.';

  @override
  String get impulseStartRecording => 'Opname starten, dan de sweep afspelen';

  @override
  String get impulseFrequencyResponse => 'Frequentierespons';

  @override
  String get impulseWithRoom => 'met ruimte (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'direct geluid (venster $ms ms)';
  }

  @override
  String get impulseWindow => 'Venster';

  @override
  String impulseWindowHelp(String hz) {
    return 'Een langer venster ziet lager (nu geldig boven $hz Hz), maar laat de eerste reflectie binnen. Onder de grens wordt de curve niet afgevlakt of becommentarieerd: dat is het venster, niet de ruimte.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Tot de eerste reflectie ($ms ms)';
  }

  @override
  String get impulseTime => 'Tijd';

  @override
  String get impulseImpulse => 'impuls';

  @override
  String get impulseTimeHelp =>
      'Blauw is het venster, de oranje lijn de eerste gevonden reflectie. Tijd nul is het directe geluid.';

  @override
  String get impulseSpectrogram => 'Spectrogram';

  @override
  String get commonHide => 'Verbergen';

  @override
  String get commonShow => 'Tonen';

  @override
  String get impulseSpectrogramHelp =>
      'Tijd in ms vanaf het directe geluid, frequentie omhoog, kleur is niveau tot −60 dB. Een horizontale streep die de rest overleeft is een modus; de tabel erboven zegt hetzelfde in getallen.';

  @override
  String get impulseDecayByOctave => 'Uitsterving per octaaf';

  @override
  String get impulseMidNoT20 =>
      'De middenbanden zijn niet ver genoeg uitgestorven voor T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Midden 125–500 Hz: T20 $seconds s — dat is de RT60 waarmee het ontwerp rekent.';
  }

  @override
  String get impulseDecayHelp =>
      'In het laag is de RT60 van een telefoon eerder een schatting: het achtergrondgeluid ligt daar het dichtst bij en „—” betekent dat de nagalm er niet onder is gezakt. C50 boven nul: het directe geluid met vroege reflecties draagt meer energie dan de nagalm.';

  @override
  String get impulseResult => 'Resultaat';

  @override
  String get impulseDirectArrived => 'Direct geluid kwam aan na';

  @override
  String get impulseDirectArrivedHelp =>
      'Afspeelvertraging plus looptijd — op zich zegt het niets, maar het verschil tussen de linker- en rechterspeaker wel.';

  @override
  String get impulseFirstReflection => 'Eerste reflectie';

  @override
  String get impulseNotFound => 'niet gevonden';

  @override
  String impulseAfterDirect(String time) {
    return '$time na het directe geluid';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Of er is er geen, of hij verstopt zich in het naslingeren van de directe impuls.';

  @override
  String impulseExtraPath(String metres) {
    return 'Extra weg ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'niet meetbaar';

  @override
  String get impulseRt60NoiseHelp =>
      'De nagalm is niet diep genoeg boven de ruisvloer uitgestorven — harder, of op een stiller moment.';

  @override
  String get impulseRt60Help =>
      'Het verschil tussen T20 en T30 geeft aan hoe schoon de uitsterving is.';

  @override
  String get impulseGating => 'Venster (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'geldig boven $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Daaronder ziet het venster niet eens één periode — de curve is daar een artefact van het venster, niet van de ruimte.';

  @override
  String get impulseSchroeder => 'Schroeder-uitstervingscurve';

  @override
  String impulseHdAt(int order) {
    return 'HD$order bij 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmonischen liggen in de negatieve tijd van de Farina-deconvolutie; hier worden ze daaruit gelezen in plaats van weggegooid. −40 dB is 1 %.';

  @override
  String get impulseHd3Help =>
      'De derde harmonische groeit bij oversturing sneller dan de tweede.';

  @override
  String get impulseDistortionHot => 'Vervorming boven −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Of de sweep is te hard, of de speaker zit aan zijn grens. Een vervormingsstaart lijkt in de impuls op een reflectie — zet zachter en meet opnieuw voordat je iets gelooft.';

  @override
  String get eqMeasured => 'gemeten';

  @override
  String get eqTarget => 'doel';

  @override
  String get eqPredicted => 'voorspelling na EQ';

  @override
  String get eqMeasuredAfter => 'gemeten na EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Afwijking van het doel 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Na invoeren in de receiver';

  @override
  String get eqPredictionVsReality => 'Voorspelling vs. werkelijkheid';

  @override
  String eqStubborn(String bands) {
    return 'Blijft meer dan 6 dB van het doel: $bands. Dat is interferentie, geen gebrek aan vermogen — los je op door de speaker of luisteraar te verplaatsen, niet met meer boost.';
  }

  @override
  String get eqModelOk =>
      'Het filter van de receiver gedraagt zich ongeveer als het model.';

  @override
  String get eqModelOff =>
      'Het echte filter van de receiver wijkt meer van het model af dan verwacht — de banden zijn waarschijnlijk breder of smaller dan hier aangenomen.';

  @override
  String get eqTargetCurve => 'Doelcurve';

  @override
  String get eqFlat => 'vlak';

  @override
  String get eqTargetHelp =>
      'Niet vlak: boven een paar kHz hoort het oor het directe geluid, de microfoon telt ook de reflecties op, en een rechtgetrokken meetcurve klinkt dof. Een lichte afloop boven en wat extra laag onder is wat mensen kiezen bij blind luisteren.';

  @override
  String get eqBassLift => 'Basversterking';

  @override
  String get eqBassBelow => 'Bas onder';

  @override
  String get eqTilt => 'Helling';

  @override
  String get eqDbPerOctave => 'dB/oct';

  @override
  String get eqTiltFrom => 'Helling vanaf';

  @override
  String get errorMicPermission =>
      'Zonder toegang tot de microfoon kan er niet gemeten worden. Sta het toe via Instellingen → AudioScanner → Microfoon.';

  @override
  String errorMic(String error) {
    return 'Microfoon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Kon de microfoon niet starten: $error';
  }

  @override
  String get errorNoArkit =>
      'Dit apparaat ondersteunt geen ARKit world tracking — punten kunnen niet in de ruimte worden geplaatst.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'De opname is korter dan de sweep ($recorded s van $expected s). Start de opname voordat je het signaal afspeelt.';
  }

  @override
  String get sessionSnapshots => 'Momentopnamen';

  @override
  String get errorTrackingUnreliable =>
      'Positietracking is onbetrouwbaar — het punt zou ergens anders komen dan waar je staat.';

  @override
  String errorNoSound(int seconds) {
    return 'Binnen $seconds s kwam er geen geluid binnen.';
  }

  @override
  String get noteSnapshotNoPose =>
      'momentopname uit de analyzer, zonder positie';

  @override
  String get sessionChannels => 'Kanalen';

  @override
  String get trackingOk => 'Tracking OK';

  @override
  String get trackingLimited => 'Zwakke tracking';

  @override
  String get trackingUnavailable => 'Geen tracking';

  @override
  String get poseHintFeatures =>
      'Te weinig detail in beeld — richt de telefoon op iets met structuur, niet op een kale muur.';

  @override
  String get poseHintMotion => 'Te snelle beweging — loop langzamer.';

  @override
  String get poseHintLight =>
      'Te weinig licht — doe het licht aan, de camera ziet niet waar hij is.';

  @override
  String get poseHintInitializing => 'ARKit start op, beweeg een beetje.';

  @override
  String get poseHintRelocalizing =>
      'Het oorspronkelijke punt wordt opnieuw gezocht — ga terug naar waar je begon.';

  @override
  String get signalPhonePink => 'Roze ruis van de telefoon';

  @override
  String get signalExternalPink => 'Roze ruis van de speakers';

  @override
  String get signalExternalSweep => 'Sweep van de speakers';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth-microfoon: compressie en latentie verpesten de meting. Ontkoppel de koptelefoon en meet met de ingebouwde microfoon.';

  @override
  String get captureWarningProcessing =>
      'Het systeem heeft de signaalbewerking (AGC / ruisonderdrukking) niet uitgeschakeld. Gemeten verschillen tussen plekken worden vertekend.';

  @override
  String get captureWarningMeasurementMode =>
      'Measurement mode kon niet worden ingeschakeld — de microfoon past een eigen frequentiecorrectie toe.';

  @override
  String get captureRouteUnknown => 'onbekend';

  @override
  String get axisLength => 'lengte';

  @override
  String get axisWidth => 'breedte';

  @override
  String get axisHeight => 'hoogte';
}
