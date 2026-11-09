import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ca.dart';
import 'app_localizations_cs.dart';
import 'app_localizations_da.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fi.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hr.dart';
import 'app_localizations_hu.dart';
import 'app_localizations_it.dart';
import 'app_localizations_nb.dart';
import 'app_localizations_nl.dart';
import 'app_localizations_pl.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ro.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_sk.dart';
import 'app_localizations_sl.dart';
import 'app_localizations_sv.dart';
import 'app_localizations_uk.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ca'),
    Locale('cs'),
    Locale('da'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fi'),
    Locale('fr'),
    Locale('hr'),
    Locale('hu'),
    Locale('it'),
    Locale('nb'),
    Locale('nl'),
    Locale('pl'),
    Locale('pt'),
    Locale('pt', 'BR'),
    Locale('ro'),
    Locale('ru'),
    Locale('sk'),
    Locale('sl'),
    Locale('sv'),
    Locale('uk'),
  ];

  /// No description provided for @tabScan.
  ///
  /// In cs, this message translates to:
  /// **'Sken'**
  String get tabScan;

  /// No description provided for @tabMap.
  ///
  /// In cs, this message translates to:
  /// **'Mapa'**
  String get tabMap;

  /// No description provided for @tabResponse.
  ///
  /// In cs, this message translates to:
  /// **'Odezva'**
  String get tabResponse;

  /// No description provided for @tabDesign.
  ///
  /// In cs, this message translates to:
  /// **'Návrh'**
  String get tabDesign;

  /// No description provided for @tabSignals.
  ///
  /// In cs, this message translates to:
  /// **'Signály'**
  String get tabSignals;

  /// No description provided for @rtaSnapshotFailed.
  ///
  /// In cs, this message translates to:
  /// **'Snímek se neuložil.'**
  String get rtaSnapshotFailed;

  /// No description provided for @rtaSavedAsPoint.
  ///
  /// In cs, this message translates to:
  /// **'Uloženo jako bod {id}.'**
  String rtaSavedAsPoint(String id);

  /// No description provided for @rtaSavedAsPointNoPose.
  ///
  /// In cs, this message translates to:
  /// **'Uloženo jako bod {id} (bez polohy).'**
  String rtaSavedAsPointNoPose(String id);

  /// No description provided for @rtaCalibrationLoaded.
  ///
  /// In cs, this message translates to:
  /// **'Kalibrace {name}: {count, plural, =1{1 bod} few{{count} body} many{{count} bodu} other{{count} bodů}}, {min} … {max} dB'**
  String rtaCalibrationLoaded(String name, int count, String min, String max);

  /// No description provided for @rtaFileUnreadable.
  ///
  /// In cs, this message translates to:
  /// **'Soubor nejde přečíst: {message}'**
  String rtaFileUnreadable(String message);

  /// No description provided for @rtaOffsetTitle.
  ///
  /// In cs, this message translates to:
  /// **'Offset dB SPL'**
  String get rtaOffsetTitle;

  /// No description provided for @rtaOffsetHelp.
  ///
  /// In cs, this message translates to:
  /// **'Pusť tón 1 kHz, odečti hladinu na SPL metru a zadej rozdíl proti tomu, co ukazuje analyzátor. S nenulovým offsetem se hladiny značí jako odhad SPL; bez něj zůstávají dBFS.'**
  String get rtaOffsetHelp;

  /// No description provided for @commonReset.
  ///
  /// In cs, this message translates to:
  /// **'Vynulovat'**
  String get commonReset;

  /// No description provided for @commonCancel.
  ///
  /// In cs, this message translates to:
  /// **'Zrušit'**
  String get commonCancel;

  /// No description provided for @commonSave.
  ///
  /// In cs, this message translates to:
  /// **'Uložit'**
  String get commonSave;

  /// No description provided for @commonStop.
  ///
  /// In cs, this message translates to:
  /// **'Zastavit'**
  String get commonStop;

  /// No description provided for @commonStartMic.
  ///
  /// In cs, this message translates to:
  /// **'Spustit mikrofon'**
  String get commonStartMic;

  /// No description provided for @tabAnalyzer.
  ///
  /// In cs, this message translates to:
  /// **'Analyzátor'**
  String get tabAnalyzer;

  /// No description provided for @rtaUnfreeze.
  ///
  /// In cs, this message translates to:
  /// **'Rozmrazit'**
  String get rtaUnfreeze;

  /// No description provided for @rtaFreeze.
  ///
  /// In cs, this message translates to:
  /// **'Zmrazit'**
  String get rtaFreeze;

  /// No description provided for @rtaPeakHold.
  ///
  /// In cs, this message translates to:
  /// **'Peak hold'**
  String get rtaPeakHold;

  /// No description provided for @rtaMaxMinTraces.
  ///
  /// In cs, this message translates to:
  /// **'Stopy max / min'**
  String get rtaMaxMinTraces;

  /// No description provided for @rtaResetTraces.
  ///
  /// In cs, this message translates to:
  /// **'Vynulovat stopy'**
  String get rtaResetTraces;

  /// No description provided for @rtaSaveAsPoint.
  ///
  /// In cs, this message translates to:
  /// **'Uložit jako bod (3 s)'**
  String get rtaSaveAsPoint;

  /// No description provided for @rtaMicCalibration.
  ///
  /// In cs, this message translates to:
  /// **'Kalibrace mikrofonu…'**
  String get rtaMicCalibration;

  /// No description provided for @rtaRemoveCalibration.
  ///
  /// In cs, this message translates to:
  /// **'Odebrat kalibraci'**
  String get rtaRemoveCalibration;

  /// No description provided for @rtaOffsetMenu.
  ///
  /// In cs, this message translates to:
  /// **'Offset dB SPL…'**
  String get rtaOffsetMenu;

  /// No description provided for @rtaRouteChip.
  ///
  /// In cs, this message translates to:
  /// **'{route} · {rate} Hz · bez úprav signálu'**
  String rtaRouteChip(String route, String rate);

  /// No description provided for @rtaCalibrationChip.
  ///
  /// In cs, this message translates to:
  /// **'Kalibrace {name}: {count, plural, =1{1 bod} few{{count} body} many{{count} bodu} other{{count} bodů}}, korekce {min} … {max} dB'**
  String rtaCalibrationChip(String name, int count, String min, String max);

  /// No description provided for @rtaSplEstimate.
  ///
  /// In cs, this message translates to:
  /// **'dB SPL (odhad)'**
  String get rtaSplEstimate;

  /// No description provided for @rtaFrozenHint.
  ///
  /// In cs, this message translates to:
  /// **'Zmrazeno — mikrofon běží dál, jen se nekreslí.'**
  String get rtaFrozenHint;

  /// No description provided for @rtaRelativeHint.
  ///
  /// In cs, this message translates to:
  /// **'Hladiny jsou relativní (dBFS). Obrys se objeví, až uložíš první bod — ten je referencí pro ostatní.'**
  String get rtaRelativeHint;

  /// No description provided for @rtaReferenceHint.
  ///
  /// In cs, this message translates to:
  /// **'Plné sloupce = tady. Obrys = referenční bod.'**
  String get rtaReferenceHint;

  /// No description provided for @rtaEnvelopeHint.
  ///
  /// In cs, this message translates to:
  /// **'Červená = max, zelená = min od vynulování.'**
  String get rtaEnvelopeHint;

  /// No description provided for @rtaMicStopped.
  ///
  /// In cs, this message translates to:
  /// **'mikrofon stojí'**
  String get rtaMicStopped;

  /// No description provided for @rtaSilence.
  ///
  /// In cs, this message translates to:
  /// **'ticho — hraje signál?'**
  String get rtaSilence;

  /// No description provided for @rtaPlaceholder.
  ///
  /// In cs, this message translates to:
  /// **'Spusť mikrofon a pusť do místnosti signál.'**
  String get rtaPlaceholder;

  /// No description provided for @rtaBandsInfo.
  ///
  /// In cs, this message translates to:
  /// **'{count} třetinooktávových pásem, 20 Hz – 20 kHz'**
  String rtaBandsInfo(int count);

  /// No description provided for @scanTitle.
  ///
  /// In cs, this message translates to:
  /// **'Sken místnosti'**
  String get scanTitle;

  /// No description provided for @scanPointCount.
  ///
  /// In cs, this message translates to:
  /// **'{count} b.'**
  String scanPointCount(int count);

  /// No description provided for @commonMicNotRunning.
  ///
  /// In cs, this message translates to:
  /// **'Mikrofon neběží'**
  String get commonMicNotRunning;

  /// No description provided for @scanMicNeeded.
  ///
  /// In cs, this message translates to:
  /// **'Bez něj se změří jen poloha, ne zvuk.'**
  String get scanMicNeeded;

  /// No description provided for @scanContinuous.
  ///
  /// In cs, this message translates to:
  /// **'Průběžné měření'**
  String get scanContinuous;

  /// No description provided for @scanContinuousHint.
  ///
  /// In cs, this message translates to:
  /// **'Bod automaticky každých 0,5 m chůze'**
  String get scanContinuousHint;

  /// No description provided for @scanMeasuring.
  ///
  /// In cs, this message translates to:
  /// **'Měřím…'**
  String get scanMeasuring;

  /// No description provided for @scanMeasureHere.
  ///
  /// In cs, this message translates to:
  /// **'Změřit tady'**
  String get scanMeasureHere;

  /// No description provided for @scanPointSaved.
  ///
  /// In cs, this message translates to:
  /// **'Bod {id} uložen na {position}'**
  String scanPointSaved(String id, String position);

  /// No description provided for @scanStartTracking.
  ///
  /// In cs, this message translates to:
  /// **'Spustit sledování polohy'**
  String get scanStartTracking;

  /// No description provided for @scanStartTrackingHint.
  ///
  /// In cs, this message translates to:
  /// **'ARKit — odsud ví appka, kde v místnosti stojíš.'**
  String get scanStartTrackingHint;

  /// No description provided for @scanPosition.
  ///
  /// In cs, this message translates to:
  /// **'Poloha: {position} m od počátku'**
  String scanPosition(String position);

  /// No description provided for @scanSetOriginHint.
  ///
  /// In cs, this message translates to:
  /// **'Postav se na místo posluchače a urči počátek.'**
  String get scanSetOriginHint;

  /// No description provided for @scanOriginHere.
  ///
  /// In cs, this message translates to:
  /// **'Tady je počátek'**
  String get scanOriginHere;

  /// No description provided for @scanNoPoints.
  ///
  /// In cs, this message translates to:
  /// **'Zatím žádný bod.'**
  String get scanNoPoints;

  /// No description provided for @scanPointStats.
  ///
  /// In cs, this message translates to:
  /// **'rozptyl 40–300 Hz: {variation} dB · {rms} dBFS'**
  String scanPointStats(String variation, String rms);

  /// No description provided for @scanDefaultRoomName.
  ///
  /// In cs, this message translates to:
  /// **'Obývák'**
  String get scanDefaultRoomName;

  /// No description provided for @scanNewMeasurement.
  ///
  /// In cs, this message translates to:
  /// **'Nové měření'**
  String get scanNewMeasurement;

  /// No description provided for @scanRoomName.
  ///
  /// In cs, this message translates to:
  /// **'Název místnosti'**
  String get scanRoomName;

  /// No description provided for @scanExcitation.
  ///
  /// In cs, this message translates to:
  /// **'Čím budeš místnost budit'**
  String get scanExcitation;

  /// No description provided for @scanPhoneNoiseHint.
  ///
  /// In cs, this message translates to:
  /// **'Jen orientačně — reproduktor telefonu basy vůbec nevydá.'**
  String get scanPhoneNoiseHint;

  /// No description provided for @scanStart.
  ///
  /// In cs, this message translates to:
  /// **'Začít'**
  String get scanStart;

  /// No description provided for @mapExportTooltip.
  ///
  /// In cs, this message translates to:
  /// **'Export FRD + JSON'**
  String get mapExportTooltip;

  /// No description provided for @mapNeedsTwoPoints.
  ///
  /// In cs, this message translates to:
  /// **'Mapa potřebuje aspoň dva body. Projdi místnost a průběžně měř.'**
  String get mapNeedsTwoPoints;

  /// No description provided for @mapShareText.
  ///
  /// In cs, this message translates to:
  /// **'FRD po bodech (import do REW / VituixCAD) a celá session v JSON.'**
  String get mapShareText;

  /// No description provided for @mapFlattestSpot.
  ///
  /// In cs, this message translates to:
  /// **'Nejrovnější místo: {id} na {position} m (rozptyl {variation} dB v 40–300 Hz)'**
  String mapFlattestSpot(String id, String position, String variation);

  /// No description provided for @signalsSweepHelp.
  ///
  /// In cs, this message translates to:
  /// **'Jediný signál, ze kterého jde spočítat impulzní odezvu, doba dozvuku a první odrazy. Přehraj ho z počítače nebo DACu do beden, telefon nech nahrávat.'**
  String get signalsSweepHelp;

  /// No description provided for @signalsLength.
  ///
  /// In cs, this message translates to:
  /// **'Délka'**
  String get signalsLength;

  /// No description provided for @signalsFrom.
  ///
  /// In cs, this message translates to:
  /// **'Od'**
  String get signalsFrom;

  /// No description provided for @signalsTo.
  ///
  /// In cs, this message translates to:
  /// **'Do'**
  String get signalsTo;

  /// No description provided for @signalsMonoNoChannel.
  ///
  /// In cs, this message translates to:
  /// **'Mono (bez kanálu)'**
  String get signalsMonoNoChannel;

  /// No description provided for @signalsExportWav.
  ///
  /// In cs, this message translates to:
  /// **'Export WAV'**
  String get signalsExportWav;

  /// No description provided for @signalsPinkNoise.
  ///
  /// In cs, this message translates to:
  /// **'Růžový šum'**
  String get signalsPinkNoise;

  /// No description provided for @signalsPinkHelp.
  ///
  /// In cs, this message translates to:
  /// **'Stejná energie v každé oktávě. Dá jen frekvenční charakteristiku, žádný čas ani odrazy — na rychlé „dělá to tu něco?“ to stačí.'**
  String get signalsPinkHelp;

  /// No description provided for @signalsExportPink.
  ///
  /// In cs, this message translates to:
  /// **'Export 30 s WAV'**
  String get signalsExportPink;

  /// No description provided for @signalsHowTo.
  ///
  /// In cs, this message translates to:
  /// **'Jak měřit'**
  String get signalsHowTo;

  /// No description provided for @signalsStep1.
  ///
  /// In cs, this message translates to:
  /// **'Signál pusť z počítače do beden, ne z telefonu.'**
  String get signalsStep1;

  /// No description provided for @signalsStep2.
  ///
  /// In cs, this message translates to:
  /// **'Hlasitost nastav tak, aby analyzátor ukazoval kolem −20 dBFS. Přebuzení vypadá jako odraz.'**
  String get signalsStep2;

  /// No description provided for @signalsStep3.
  ///
  /// In cs, this message translates to:
  /// **'Telefon drž svisle na natažené ruce, mikrofonem k bednám.'**
  String get signalsStep3;

  /// No description provided for @signalsStep4.
  ///
  /// In cs, this message translates to:
  /// **'Odpoj Bluetooth sluchátka — komprese i latence měření znehodnotí.'**
  String get signalsStep4;

  /// No description provided for @signalsNoteMono.
  ///
  /// In cs, this message translates to:
  /// **'Mono do obou beden najednou sečte L a R a jejich rozdíl zmizí v součtu. Pro měření kanálů vyber kanál.'**
  String get signalsNoteMono;

  /// No description provided for @signalsNoteStereo.
  ///
  /// In cs, this message translates to:
  /// **'Stereo soubor se signálem jen v jednom kanálu — pustí ho cokoli, co hraje stereo.'**
  String get signalsNoteStereo;

  /// No description provided for @signalsNoteChannel.
  ///
  /// In cs, this message translates to:
  /// **'Mono soubor pojmenovaný podle kanálu. Nasměruj ho na správný vstup přijímače z DAW nebo přes vícekanálový vstup; laptop se stereo výstupem ho na tenhle kanál nedostane.'**
  String get signalsNoteChannel;

  /// No description provided for @channelsTitle.
  ///
  /// In cs, this message translates to:
  /// **'Měření kanálů'**
  String get channelsTitle;

  /// No description provided for @channelsHelp.
  ///
  /// In cs, this message translates to:
  /// **'Stoupni si na místo posluchače. Pro každý kanál: začni nahrávat, pusť do něj sweep ze záložky Signály, klepni na Hotovo. Bez těchto bodů návrh nemá z čeho udělat EQ a hlasitosti.'**
  String get channelsHelp;

  /// No description provided for @channelsSweepLength.
  ///
  /// In cs, this message translates to:
  /// **'Sweep {seconds} s'**
  String channelsSweepLength(int seconds);

  /// No description provided for @channelsVerifyAfterEq.
  ///
  /// In cs, this message translates to:
  /// **'Ověření po zadání EQ'**
  String get channelsVerifyAfterEq;

  /// No description provided for @channelsVerifyAfterEqHint.
  ///
  /// In cs, this message translates to:
  /// **'Bod se uloží jako „po EQ“ a nepřepíše ten, ze kterého se EQ počítalo.'**
  String get channelsVerifyAfterEqHint;

  /// No description provided for @channelsRecording.
  ///
  /// In cs, this message translates to:
  /// **'Nahrávám {seconds} s — teď pusť sweep'**
  String channelsRecording(String seconds);

  /// No description provided for @channelsNotMeasured.
  ///
  /// In cs, this message translates to:
  /// **'nezměřeno'**
  String get channelsNotMeasured;

  /// No description provided for @channelsMeasuredNoise.
  ///
  /// In cs, this message translates to:
  /// **'změřeno šumem'**
  String get channelsMeasuredNoise;

  /// No description provided for @channelsSummary.
  ///
  /// In cs, this message translates to:
  /// **'{count}× · přímý zvuk za {ms} ms'**
  String channelsSummary(int count, String ms);

  /// No description provided for @channelsSummaryT20.
  ///
  /// In cs, this message translates to:
  /// **'{count}× · přímý zvuk za {ms} ms, T20 {t20} s'**
  String channelsSummaryT20(int count, String ms, String t20);

  /// No description provided for @commonDone.
  ///
  /// In cs, this message translates to:
  /// **'Hotovo'**
  String get commonDone;

  /// No description provided for @channelsMeasure.
  ///
  /// In cs, this message translates to:
  /// **'Změřit'**
  String get channelsMeasure;

  /// No description provided for @channelsAdd.
  ///
  /// In cs, this message translates to:
  /// **'Přidat'**
  String get channelsAdd;

  /// No description provided for @channelsAgain.
  ///
  /// In cs, this message translates to:
  /// **'Znovu'**
  String get channelsAgain;

  /// No description provided for @compareTitle.
  ///
  /// In cs, this message translates to:
  /// **'Srovnání'**
  String get compareTitle;

  /// No description provided for @compareNeedsTwoPoints.
  ///
  /// In cs, this message translates to:
  /// **'Srovnání potřebuje aspoň dva body.'**
  String get compareNeedsTwoPoints;

  /// No description provided for @commonWithRoom.
  ///
  /// In cs, this message translates to:
  /// **'s místností'**
  String get commonWithRoom;

  /// No description provided for @commonDirectSound.
  ///
  /// In cs, this message translates to:
  /// **'přímý zvuk'**
  String get commonDirectSound;

  /// No description provided for @compareAfterEq.
  ///
  /// In cs, this message translates to:
  /// **'po EQ'**
  String get compareAfterEq;

  /// No description provided for @compareBandsA.
  ///
  /// In cs, this message translates to:
  /// **'A (pásma)'**
  String get compareBandsA;

  /// No description provided for @compareBandsB.
  ///
  /// In cs, this message translates to:
  /// **'B (pásma)'**
  String get compareBandsB;

  /// No description provided for @compareArrivalDiff.
  ///
  /// In cs, this message translates to:
  /// **'Rozdíl příchodu A − B'**
  String get compareArrivalDiff;

  /// No description provided for @compareBroadbandDiff.
  ///
  /// In cs, this message translates to:
  /// **'Širokopásmová hladina A − B'**
  String get compareBroadbandDiff;

  /// No description provided for @compareWorstBelow300.
  ///
  /// In cs, this message translates to:
  /// **'Největší rozdíl pod 300 Hz'**
  String get compareWorstBelow300;

  /// No description provided for @compareWorstValue.
  ///
  /// In cs, this message translates to:
  /// **'{db} dB v pásmu {band} Hz'**
  String compareWorstValue(String db, String band);

  /// No description provided for @compareTrimNote.
  ///
  /// In cs, this message translates to:
  /// **'Distance a level trim srovnají rozdíl příchodu a hladiny. Rozdíl tvaru pod 300 Hz nesrovnají — ten dělá jiná stěna v jiné vzdálenosti a řeší se posunem.'**
  String get compareTrimNote;

  /// No description provided for @designRt60Live.
  ///
  /// In cs, this message translates to:
  /// **'T20 125–500 Hz z poslední odezvy'**
  String get designRt60Live;

  /// No description provided for @designRt60Stored.
  ///
  /// In cs, this message translates to:
  /// **'T20 125–500 Hz z uloženého sweepu'**
  String get designRt60Stored;

  /// No description provided for @designRt60Guess.
  ///
  /// In cs, this message translates to:
  /// **'odhad — změř sweep, Schroeder je zatím jen tip'**
  String get designRt60Guess;

  /// No description provided for @designExportTooltip.
  ///
  /// In cs, this message translates to:
  /// **'Export konfigurace'**
  String get designExportTooltip;

  /// No description provided for @designCompute.
  ///
  /// In cs, this message translates to:
  /// **'Spočítat návrh'**
  String get designCompute;

  /// No description provided for @designLidarChecking.
  ///
  /// In cs, this message translates to:
  /// **'Zjišťuju, jestli je tu LiDAR…'**
  String get designLidarChecking;

  /// No description provided for @designLidarAvailable.
  ///
  /// In cs, this message translates to:
  /// **'LiDAR k dispozici'**
  String get designLidarAvailable;

  /// No description provided for @designLidarMissing.
  ///
  /// In cs, this message translates to:
  /// **'Bez LiDARu — rozměry zadej ručně'**
  String get designLidarMissing;

  /// No description provided for @designLidarHint.
  ///
  /// In cs, this message translates to:
  /// **'Sken dá stěny na centimetry, takže sedí i body odrazů a vzdálenosti k hranicím, ne jen módy.'**
  String get designLidarHint;

  /// No description provided for @designManualHint.
  ///
  /// In cs, this message translates to:
  /// **'Modální výpočet potřebuje jen tři čísla — o body odrazů a přesné vzdálenosti ke stěnám ale přijdeš.'**
  String get designManualHint;

  /// No description provided for @designStopScan.
  ///
  /// In cs, this message translates to:
  /// **'Ukončit sken'**
  String get designStopScan;

  /// No description provided for @designScanRoom.
  ///
  /// In cs, this message translates to:
  /// **'Naskenovat místnost'**
  String get designScanRoom;

  /// No description provided for @designWallsOpenings.
  ///
  /// In cs, this message translates to:
  /// **'{walls, plural, =1{1 stěna} few{{walls} stěny} many{{walls} stěny} other{{walls} stěn}}, {openings, plural, =1{1 otvor} few{{openings} otvory} many{{openings} otvoru} other{{openings} otvorů}}'**
  String designWallsOpenings(int walls, int openings);

  /// No description provided for @designRoomDimensions.
  ///
  /// In cs, this message translates to:
  /// **'Rozměry místnosti'**
  String get designRoomDimensions;

  /// No description provided for @designLength.
  ///
  /// In cs, this message translates to:
  /// **'Délka'**
  String get designLength;

  /// No description provided for @designWidth.
  ///
  /// In cs, this message translates to:
  /// **'Šířka'**
  String get designWidth;

  /// No description provided for @designHeight.
  ///
  /// In cs, this message translates to:
  /// **'Výška'**
  String get designHeight;

  /// No description provided for @designWhatToDo.
  ///
  /// In cs, this message translates to:
  /// **'Co s tím udělat'**
  String get designWhatToDo;

  /// No description provided for @designRoomModes.
  ///
  /// In cs, this message translates to:
  /// **'Módy místnosti'**
  String get designRoomModes;

  /// No description provided for @designModesNote.
  ///
  /// In cs, this message translates to:
  /// **'Nad {schroeder} Hz (Schroeder) už jednotlivé módy nedávají smysl. RT60 {rt60} s: {source}.'**
  String designModesNote(String schroeder, String rt60, String source);

  /// No description provided for @designEqTitle.
  ///
  /// In cs, this message translates to:
  /// **'EQ: změřeno, cíl, předpověď'**
  String get designEqTitle;

  /// No description provided for @designEqHelp.
  ///
  /// In cs, this message translates to:
  /// **'Předpověď je změřená odezva plus model patnácti pásem přijímače. Po zadání EQ změř kanál znovu s přepínačem „po EQ“, aby bylo vidět, jak blízko model byl.'**
  String get designEqHelp;

  /// No description provided for @designReceiverConfig.
  ///
  /// In cs, this message translates to:
  /// **'Konfigurace přijímače'**
  String get designReceiverConfig;

  /// No description provided for @designGeometryOnly.
  ///
  /// In cs, this message translates to:
  /// **'Bez měření kanálů sweepem je tu jen geometrie: vzdálenosti a dělicí kmitočty. EQ a hlasitosti přibudou, až budou body per kanál.'**
  String get designGeometryOnly;

  /// No description provided for @designShareSubject.
  ///
  /// In cs, this message translates to:
  /// **'Návrh konfigurace'**
  String get designShareSubject;

  /// No description provided for @impulseTitle.
  ///
  /// In cs, this message translates to:
  /// **'Impulzní odezva'**
  String get impulseTitle;

  /// No description provided for @impulseCompareTooltip.
  ///
  /// In cs, this message translates to:
  /// **'Srovnat body'**
  String get impulseCompareTooltip;

  /// No description provided for @impulseExportTooltip.
  ///
  /// In cs, this message translates to:
  /// **'Export FRD s fází'**
  String get impulseExportTooltip;

  /// No description provided for @impulseTapToStart.
  ///
  /// In cs, this message translates to:
  /// **'Klepni pro spuštění.'**
  String get impulseTapToStart;

  /// No description provided for @impulseSweepTitle.
  ///
  /// In cs, this message translates to:
  /// **'Sweep, který pustíš do beden'**
  String get impulseSweepTitle;

  /// No description provided for @impulseSweepHelp.
  ///
  /// In cs, this message translates to:
  /// **'{startHz} – {endHz} Hz, {seconds} s. Musí sedět s tím, co přehráváš — jinak dekonvoluce vrátí nesmysl.'**
  String impulseSweepHelp(int startHz, int endHz, int seconds);

  /// No description provided for @impulseRecording.
  ///
  /// In cs, this message translates to:
  /// **'Nahrávám — {seconds} s'**
  String impulseRecording(String seconds);

  /// No description provided for @impulsePlaySweepNow.
  ///
  /// In cs, this message translates to:
  /// **'Teď pusť sweep z počítače.'**
  String get impulsePlaySweepNow;

  /// No description provided for @impulseStartRecording.
  ///
  /// In cs, this message translates to:
  /// **'Začít nahrávat, pak pustit sweep'**
  String get impulseStartRecording;

  /// No description provided for @impulseFrequencyResponse.
  ///
  /// In cs, this message translates to:
  /// **'Frekvenční odezva'**
  String get impulseFrequencyResponse;

  /// No description provided for @impulseWithRoom.
  ///
  /// In cs, this message translates to:
  /// **'s místností (1 s)'**
  String get impulseWithRoom;

  /// No description provided for @impulseDirectWindow.
  ///
  /// In cs, this message translates to:
  /// **'přímý zvuk (okno {ms} ms)'**
  String impulseDirectWindow(String ms);

  /// No description provided for @impulseWindow.
  ///
  /// In cs, this message translates to:
  /// **'Okno'**
  String get impulseWindow;

  /// No description provided for @impulseWindowHelp.
  ///
  /// In cs, this message translates to:
  /// **'Delší okno vidí níž (teď platné nad {hz} Hz), ale pustí dovnitř první odraz. Pod hranicí se křivka nevyhlazuje ani nekomentuje: je to okno, ne místnost.'**
  String impulseWindowHelp(String hz);

  /// No description provided for @impulseToFirstReflection.
  ///
  /// In cs, this message translates to:
  /// **'Do prvního odrazu ({ms} ms)'**
  String impulseToFirstReflection(String ms);

  /// No description provided for @impulseTime.
  ///
  /// In cs, this message translates to:
  /// **'Čas'**
  String get impulseTime;

  /// No description provided for @impulseImpulse.
  ///
  /// In cs, this message translates to:
  /// **'impuls'**
  String get impulseImpulse;

  /// No description provided for @impulseTimeHelp.
  ///
  /// In cs, this message translates to:
  /// **'Modré je okno, oranžová čára první nalezený odraz. Čas nula je přímý zvuk.'**
  String get impulseTimeHelp;

  /// No description provided for @impulseSpectrogram.
  ///
  /// In cs, this message translates to:
  /// **'Spektrogram'**
  String get impulseSpectrogram;

  /// No description provided for @commonHide.
  ///
  /// In cs, this message translates to:
  /// **'Skrýt'**
  String get commonHide;

  /// No description provided for @commonShow.
  ///
  /// In cs, this message translates to:
  /// **'Zobrazit'**
  String get commonShow;

  /// No description provided for @impulseSpectrogramHelp.
  ///
  /// In cs, this message translates to:
  /// **'Čas v ms od přímého zvuku, frekvence nahoru, barva je hladina do −60 dB. Vodorovný pruh, který přežije ostatní, je mód; tabulka nad tím říká totéž číslem.'**
  String get impulseSpectrogramHelp;

  /// No description provided for @impulseDecayByOctave.
  ///
  /// In cs, this message translates to:
  /// **'Doznívání po oktávách'**
  String get impulseDecayByOctave;

  /// No description provided for @impulseMidNoT20.
  ///
  /// In cs, this message translates to:
  /// **'Střední pásma nedoklesla dost na T20.'**
  String get impulseMidNoT20;

  /// No description provided for @impulseMidT20.
  ///
  /// In cs, this message translates to:
  /// **'Střed 125–500 Hz: T20 {seconds} s — to je RT60, se kterým počítá návrh.'**
  String impulseMidT20(String seconds);

  /// No description provided for @impulseDecayHelp.
  ///
  /// In cs, this message translates to:
  /// **'V basech je RT60 z telefonu spíš odhad: šum pozadí tam bývá nejblíž a „—“ znamená, že dozvuk pod něj nedoklesl. C50 nad nulou: přímý zvuk s prvními odrazy nese víc energie než dozvuk.'**
  String get impulseDecayHelp;

  /// No description provided for @impulseResult.
  ///
  /// In cs, this message translates to:
  /// **'Výsledek'**
  String get impulseResult;

  /// No description provided for @impulseDirectArrived.
  ///
  /// In cs, this message translates to:
  /// **'Přímý zvuk dorazil za'**
  String get impulseDirectArrived;

  /// No description provided for @impulseDirectArrivedHelp.
  ///
  /// In cs, this message translates to:
  /// **'Zpoždění přehrávání plus doba letu — samo o sobě nic neříká, ale rozdíl mezi L a R bednou ano.'**
  String get impulseDirectArrivedHelp;

  /// No description provided for @impulseFirstReflection.
  ///
  /// In cs, this message translates to:
  /// **'První odraz'**
  String get impulseFirstReflection;

  /// No description provided for @impulseNotFound.
  ///
  /// In cs, this message translates to:
  /// **'nenalezen'**
  String get impulseNotFound;

  /// No description provided for @impulseAfterDirect.
  ///
  /// In cs, this message translates to:
  /// **'{time} po přímém zvuku'**
  String impulseAfterDirect(String time);

  /// No description provided for @impulseNoReflectionHelp.
  ///
  /// In cs, this message translates to:
  /// **'Buď tam žádný není, nebo se schoval ve vyzvánění přímého impulsu.'**
  String get impulseNoReflectionHelp;

  /// No description provided for @impulseExtraPath.
  ///
  /// In cs, this message translates to:
  /// **'Dráha navíc ≈ {metres} m.'**
  String impulseExtraPath(String metres);

  /// No description provided for @impulseUnmeasurable.
  ///
  /// In cs, this message translates to:
  /// **'nezměřitelné'**
  String get impulseUnmeasurable;

  /// No description provided for @impulseRt60NoiseHelp.
  ///
  /// In cs, this message translates to:
  /// **'Dozvuk nedoklesl dost hluboko nad šumové pozadí — hlasitěji, nebo v tišší chvíli.'**
  String get impulseRt60NoiseHelp;

  /// No description provided for @impulseRt60Help.
  ///
  /// In cs, this message translates to:
  /// **'Rozdíl mezi T20 a T30 napovídá, jak čisté je doznívání.'**
  String get impulseRt60Help;

  /// No description provided for @impulseGating.
  ///
  /// In cs, this message translates to:
  /// **'Okno (gating)'**
  String get impulseGating;

  /// No description provided for @impulseValidAbove.
  ///
  /// In cs, this message translates to:
  /// **'platné nad {hz} Hz'**
  String impulseValidAbove(String hz);

  /// No description provided for @impulseGatingHelp.
  ///
  /// In cs, this message translates to:
  /// **'Pod tím okno neuvidí ani jednu periodu — křivka tam je artefakt okna, ne místnosti.'**
  String get impulseGatingHelp;

  /// No description provided for @impulseSchroeder.
  ///
  /// In cs, this message translates to:
  /// **'Schroederova křivka doznívání'**
  String get impulseSchroeder;

  /// No description provided for @impulseHdAt.
  ///
  /// In cs, this message translates to:
  /// **'HD{order} při 100 Hz / 1 kHz'**
  String impulseHdAt(int order);

  /// No description provided for @impulseHd2Help.
  ///
  /// In cs, this message translates to:
  /// **'Harmonické leží v záporném čase Farinovy dekonvoluce; tady se z něj čtou místo zahazování. −40 dB je 1 %.'**
  String get impulseHd2Help;

  /// No description provided for @impulseHd3Help.
  ///
  /// In cs, this message translates to:
  /// **'Třetí harmonická roste s přebuzením rychleji než druhá.'**
  String get impulseHd3Help;

  /// No description provided for @impulseDistortionHot.
  ///
  /// In cs, this message translates to:
  /// **'Zkreslení nad −30 dB'**
  String get impulseDistortionHot;

  /// No description provided for @impulseDistortionHotHelp.
  ///
  /// In cs, this message translates to:
  /// **'Buď je sweep příliš nahlas, nebo je repro na hraně. Ohon zkreslení vypadá v impulzu jako odraz — uber hlasitost a změř znovu, než něčemu uvěříš.'**
  String get impulseDistortionHotHelp;

  /// No description provided for @eqMeasured.
  ///
  /// In cs, this message translates to:
  /// **'změřeno'**
  String get eqMeasured;

  /// No description provided for @eqTarget.
  ///
  /// In cs, this message translates to:
  /// **'cíl'**
  String get eqTarget;

  /// No description provided for @eqPredicted.
  ///
  /// In cs, this message translates to:
  /// **'předpověď po EQ'**
  String get eqPredicted;

  /// No description provided for @eqMeasuredAfter.
  ///
  /// In cs, this message translates to:
  /// **'změřeno po EQ'**
  String get eqMeasuredAfter;

  /// No description provided for @eqDeviation.
  ///
  /// In cs, this message translates to:
  /// **'Odchylka od cíle 40–{maxHz} Hz'**
  String eqDeviation(int maxHz);

  /// No description provided for @eqAfterEntering.
  ///
  /// In cs, this message translates to:
  /// **'Po zadání do přijímače'**
  String get eqAfterEntering;

  /// No description provided for @eqPredictionVsReality.
  ///
  /// In cs, this message translates to:
  /// **'Předpověď vs. skutečnost'**
  String get eqPredictionVsReality;

  /// No description provided for @eqStubborn.
  ///
  /// In cs, this message translates to:
  /// **'Zůstane dál od cíle než 6 dB: {bands}. To je interference, ne nedostatek výkonu — řeší se posunem repro nebo posluchače, ne dalším zdvihem.'**
  String eqStubborn(String bands);

  /// No description provided for @eqModelOk.
  ///
  /// In cs, this message translates to:
  /// **'Filtr přijímače se chová zhruba jako model.'**
  String get eqModelOk;

  /// No description provided for @eqModelOff.
  ///
  /// In cs, this message translates to:
  /// **'Skutečný filtr přijímače se od modelu liší o víc, než se čekalo — jeho pásma jsou nejspíš širší nebo užší, než se tu předpokládá.'**
  String get eqModelOff;

  /// No description provided for @eqTargetCurve.
  ///
  /// In cs, this message translates to:
  /// **'Cílová křivka'**
  String get eqTargetCurve;

  /// No description provided for @eqFlat.
  ///
  /// In cs, this message translates to:
  /// **'plochá'**
  String get eqFlat;

  /// No description provided for @eqTargetHelp.
  ///
  /// In cs, this message translates to:
  /// **'Ne rovná: nad pár kHz ucho slyší přímý zvuk, mikrofon sčítá i odrazy, a srovnaná měřená křivka zní tupě. Mírný sklon nahoře a trocha basu dole je to, co lidé v slepém poslechu volí.'**
  String get eqTargetHelp;

  /// No description provided for @eqBassLift.
  ///
  /// In cs, this message translates to:
  /// **'Zdvih basů'**
  String get eqBassLift;

  /// No description provided for @eqBassBelow.
  ///
  /// In cs, this message translates to:
  /// **'Basy pod'**
  String get eqBassBelow;

  /// No description provided for @eqTilt.
  ///
  /// In cs, this message translates to:
  /// **'Sklon'**
  String get eqTilt;

  /// No description provided for @eqDbPerOctave.
  ///
  /// In cs, this message translates to:
  /// **'dB/okt'**
  String get eqDbPerOctave;

  /// No description provided for @eqTiltFrom.
  ///
  /// In cs, this message translates to:
  /// **'Sklon od'**
  String get eqTiltFrom;

  /// No description provided for @errorMicPermission.
  ///
  /// In cs, this message translates to:
  /// **'Bez přístupu k mikrofonu se měřit nedá. Povol ho v Nastavení → AudioScanner → Mikrofon.'**
  String get errorMicPermission;

  /// No description provided for @errorMic.
  ///
  /// In cs, this message translates to:
  /// **'Mikrofon: {error}'**
  String errorMic(String error);

  /// No description provided for @errorMicStart.
  ///
  /// In cs, this message translates to:
  /// **'Nepodařilo se spustit mikrofon: {error}'**
  String errorMicStart(String error);

  /// No description provided for @errorNoArkit.
  ///
  /// In cs, this message translates to:
  /// **'Tohle zařízení neumí ARKit world tracking — body se nedají umísťovat do prostoru.'**
  String get errorNoArkit;

  /// No description provided for @errorRecordingTooShort.
  ///
  /// In cs, this message translates to:
  /// **'Nahrávka je kratší než sweep ({recorded} s z {expected} s). Spusť nahrávání dřív, než pustíš signál.'**
  String errorRecordingTooShort(String recorded, String expected);

  /// No description provided for @sessionSnapshots.
  ///
  /// In cs, this message translates to:
  /// **'Snímky'**
  String get sessionSnapshots;

  /// No description provided for @errorTrackingUnreliable.
  ///
  /// In cs, this message translates to:
  /// **'Sledování polohy není spolehlivé — bod by seděl jinde, než stojíš.'**
  String get errorTrackingUnreliable;

  /// No description provided for @errorNoSound.
  ///
  /// In cs, this message translates to:
  /// **'Za {seconds} s nedorazil žádný zvuk.'**
  String errorNoSound(int seconds);

  /// No description provided for @noteSnapshotNoPose.
  ///
  /// In cs, this message translates to:
  /// **'snímek z analyzátoru, bez polohy'**
  String get noteSnapshotNoPose;

  /// No description provided for @sessionChannels.
  ///
  /// In cs, this message translates to:
  /// **'Kanály'**
  String get sessionChannels;

  /// No description provided for @trackingOk.
  ///
  /// In cs, this message translates to:
  /// **'Sledování OK'**
  String get trackingOk;

  /// No description provided for @trackingLimited.
  ///
  /// In cs, this message translates to:
  /// **'Slabé sledování'**
  String get trackingLimited;

  /// No description provided for @trackingUnavailable.
  ///
  /// In cs, this message translates to:
  /// **'Bez sledování'**
  String get trackingUnavailable;

  /// No description provided for @poseHintFeatures.
  ///
  /// In cs, this message translates to:
  /// **'Málo detailů v obraze — namiř telefon na něco členitého, ne na holou stěnu.'**
  String get poseHintFeatures;

  /// No description provided for @poseHintMotion.
  ///
  /// In cs, this message translates to:
  /// **'Moc rychlý pohyb — jdi pomaleji.'**
  String get poseHintMotion;

  /// No description provided for @poseHintLight.
  ///
  /// In cs, this message translates to:
  /// **'Málo světla — rozsviť, kamera nevidí, kde je.'**
  String get poseHintLight;

  /// No description provided for @poseHintInitializing.
  ///
  /// In cs, this message translates to:
  /// **'ARKit se rozjíždí, chvíli se pohybuj.'**
  String get poseHintInitializing;

  /// No description provided for @poseHintRelocalizing.
  ///
  /// In cs, this message translates to:
  /// **'Hledá se zpět původní bod — vrať se, kde jsi začínal.'**
  String get poseHintRelocalizing;

  /// No description provided for @signalPhonePink.
  ///
  /// In cs, this message translates to:
  /// **'Růžový šum z telefonu'**
  String get signalPhonePink;

  /// No description provided for @signalExternalPink.
  ///
  /// In cs, this message translates to:
  /// **'Růžový šum z beden'**
  String get signalExternalPink;

  /// No description provided for @signalExternalSweep.
  ///
  /// In cs, this message translates to:
  /// **'Sweep z beden'**
  String get signalExternalSweep;

  /// No description provided for @captureWarningBluetooth.
  ///
  /// In cs, this message translates to:
  /// **'Bluetooth mikrofon: komprese a latence měření znehodnotí. Odpoj sluchátka a měř vestavěným mikrofonem.'**
  String get captureWarningBluetooth;

  /// No description provided for @captureWarningProcessing.
  ///
  /// In cs, this message translates to:
  /// **'Systém nevypnul úpravy signálu (AGC / potlačení šumu). Naměřené rozdíly mezi místy budou zkreslené.'**
  String get captureWarningProcessing;

  /// No description provided for @captureWarningMeasurementMode.
  ///
  /// In cs, this message translates to:
  /// **'Nepodařilo se zapnout measurement mode — mikrofon má vlastní korekci frekvenční charakteristiky.'**
  String get captureWarningMeasurementMode;

  /// No description provided for @captureRouteUnknown.
  ///
  /// In cs, this message translates to:
  /// **'neznámý'**
  String get captureRouteUnknown;

  /// No description provided for @axisLength.
  ///
  /// In cs, this message translates to:
  /// **'délka'**
  String get axisLength;

  /// No description provided for @axisWidth.
  ///
  /// In cs, this message translates to:
  /// **'šířka'**
  String get axisWidth;

  /// No description provided for @axisHeight.
  ///
  /// In cs, this message translates to:
  /// **'výška'**
  String get axisHeight;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'ca',
    'cs',
    'da',
    'de',
    'en',
    'es',
    'fi',
    'fr',
    'hr',
    'hu',
    'it',
    'nb',
    'nl',
    'pl',
    'pt',
    'ro',
    'ru',
    'sk',
    'sl',
    'sv',
    'uk',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ca':
      return AppLocalizationsCa();
    case 'cs':
      return AppLocalizationsCs();
    case 'da':
      return AppLocalizationsDa();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fi':
      return AppLocalizationsFi();
    case 'fr':
      return AppLocalizationsFr();
    case 'hr':
      return AppLocalizationsHr();
    case 'hu':
      return AppLocalizationsHu();
    case 'it':
      return AppLocalizationsIt();
    case 'nb':
      return AppLocalizationsNb();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'ru':
      return AppLocalizationsRu();
    case 'sk':
      return AppLocalizationsSk();
    case 'sl':
      return AppLocalizationsSl();
    case 'sv':
      return AppLocalizationsSv();
    case 'uk':
      return AppLocalizationsUk();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
