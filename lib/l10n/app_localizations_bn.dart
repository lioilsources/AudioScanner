// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Bengali Bangla (`bn`).
class AppLocalizationsBn extends AppLocalizations {
  AppLocalizationsBn([String locale = 'bn']) : super(locale);

  @override
  String get tabScan => 'স্ক্যান';

  @override
  String get tabMap => 'মানচিত্র';

  @override
  String get tabResponse => 'রেসপন্স';

  @override
  String get tabDesign => 'ডিজাইন';

  @override
  String get tabSignals => 'সিগন্যাল';

  @override
  String get rtaSnapshotFailed => 'স্ন্যাপশট সংরক্ষিত হয়নি।';

  @override
  String rtaSavedAsPoint(String id) {
    return 'বিন্দু $id হিসেবে সংরক্ষিত।';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'বিন্দু $id হিসেবে সংরক্ষিত (অবস্থান ছাড়া)।';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি বিন্দু',
    );
    return 'ক্যালিব্রেশন $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'ফাইলটি পড়া যাচ্ছে না: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL অফসেট';

  @override
  String get rtaOffsetHelp =>
      '1 kHz টোন বাজান, SPL মিটারে লেভেল পড়ুন এবং অ্যানালাইজার যা দেখাচ্ছে তার সঙ্গে পার্থক্য লিখুন। শূন্য ছাড়া অন্য অফসেট থাকলে লেভেলগুলো SPL অনুমান হিসেবে চিহ্নিত হয়; না থাকলে dBFS-এ থাকে।';

  @override
  String get commonReset => 'রিসেট';

  @override
  String get commonCancel => 'বাতিল';

  @override
  String get commonSave => 'সংরক্ষণ';

  @override
  String get commonStop => 'থামান';

  @override
  String get commonStartMic => 'মাইক্রোফোন চালু করুন';

  @override
  String get tabAnalyzer => 'অ্যানালাইজার';

  @override
  String get rtaUnfreeze => 'আবার চালু';

  @override
  String get rtaFreeze => 'স্থির করুন';

  @override
  String get rtaPeakHold => 'পিক হোল্ড';

  @override
  String get rtaMaxMinTraces => 'সর্বোচ্চ / সর্বনিম্ন রেখা';

  @override
  String get rtaResetTraces => 'রেখা রিসেট করুন';

  @override
  String get rtaSaveAsPoint => 'বিন্দু হিসেবে সংরক্ষণ (3 সে.)';

  @override
  String get rtaMicCalibration => 'মাইক্রোফোন ক্যালিব্রেশন…';

  @override
  String get rtaRemoveCalibration => 'ক্যালিব্রেশন সরান';

  @override
  String get rtaOffsetMenu => 'dB SPL অফসেট…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · সিগন্যাল প্রসেসিং ছাড়া';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countটি বিন্দু',
    );
    return 'ক্যালিব্রেশন $name: $_temp0, সংশোধন $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (অনুমান)';

  @override
  String get rtaFrozenHint => 'স্থির — মাইক্রোফোন চলছে, শুধু আঁকা হচ্ছে না।';

  @override
  String get rtaRelativeHint =>
      'লেভেলগুলো আপেক্ষিক (dBFS)। প্রথম বিন্দু সংরক্ষণ করলে রূপরেখা দেখা যাবে — সেটাই বাকিদের রেফারেন্স।';

  @override
  String get rtaReferenceHint =>
      'ভরাট কলাম = এখানে। রূপরেখা = রেফারেন্স বিন্দু।';

  @override
  String get rtaEnvelopeHint =>
      'লাল = সর্বোচ্চ, সবুজ = রিসেটের পর থেকে সর্বনিম্ন।';

  @override
  String get rtaMicStopped => 'মাইক্রোফোন বন্ধ';

  @override
  String get rtaSilence => 'নীরবতা — কোনো সিগন্যাল বাজছে কি?';

  @override
  String get rtaPlaceholder =>
      'মাইক্রোফোন চালু করুন এবং ঘরে একটি সিগন্যাল বাজান।';

  @override
  String rtaBandsInfo(int count) {
    return '$countটি এক-তৃতীয়াংশ অক্টেভ ব্যান্ড, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'ঘর স্ক্যান';

  @override
  String scanPointCount(int count) {
    return '$count বিন্দু';
  }

  @override
  String get commonMicNotRunning => 'মাইক্রোফোন চলছে না';

  @override
  String get scanMicNeeded => 'এটি ছাড়া শুধু অবস্থান মাপা হয়, শব্দ নয়।';

  @override
  String get scanContinuous => 'ধারাবাহিক পরিমাপ';

  @override
  String get scanContinuousHint =>
      'প্রতি 0.5 মি. হাঁটায় স্বয়ংক্রিয়ভাবে একটি বিন্দু';

  @override
  String get scanMeasuring => 'মাপা হচ্ছে…';

  @override
  String get scanMeasureHere => 'এখানে মাপুন';

  @override
  String scanPointSaved(String id, String position) {
    return 'বিন্দু $id $position-এ সংরক্ষিত';
  }

  @override
  String get scanStartTracking => 'অবস্থান ট্র্যাকিং চালু করুন';

  @override
  String get scanStartTrackingHint =>
      'ARKit — এভাবেই অ্যাপ জানে আপনি ঘরের কোথায় দাঁড়িয়ে আছেন।';

  @override
  String scanPosition(String position) {
    return 'অবস্থান: মূলবিন্দু থেকে $position মি.';
  }

  @override
  String get scanSetOriginHint =>
      'শোনার জায়গায় দাঁড়ান এবং মূলবিন্দু ঠিক করুন।';

  @override
  String get scanOriginHere => 'মূলবিন্দু এখানে';

  @override
  String get scanNoPoints => 'এখনও কোনো বিন্দু নেই।';

  @override
  String scanPointStats(String variation, String rms) {
    return 'বিস্তার 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'বসার ঘর';

  @override
  String get scanNewMeasurement => 'নতুন পরিমাপ';

  @override
  String get scanRoomName => 'ঘরের নাম';

  @override
  String get scanExcitation => 'কী দিয়ে ঘরকে উদ্দীপিত করবেন';

  @override
  String get scanPhoneNoiseHint =>
      'শুধু ধারণার জন্য — ফোনের স্পিকার একেবারেই বেস দেয় না।';

  @override
  String get scanStart => 'শুরু করুন';

  @override
  String get mapExportTooltip => 'FRD + JSON রপ্তানি';

  @override
  String get mapNeedsTwoPoints =>
      'মানচিত্রের জন্য অন্তত দুটি বিন্দু লাগে। ঘরে ঘুরুন এবং সঙ্গে সঙ্গে মাপুন।';

  @override
  String get mapShareText =>
      'প্রতি বিন্দুর FRD (REW / VituixCAD-এ আমদানির জন্য) এবং পুরো সেশন JSON-এ।';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'সবচেয়ে সমতল জায়গা: $id, $position মি.-এ (40–300 Hz-এ $variation dB বিস্তার)';
  }

  @override
  String get signalsSweepHelp =>
      'একমাত্র সিগন্যাল যা থেকে ইমপালস রেসপন্স, প্রতিধ্বনি সময় ও প্রথম প্রতিফলন হিসাব করা যায়। কম্পিউটার বা DAC থেকে স্পিকারে বাজান, ফোনকে রেকর্ড করতে দিন।';

  @override
  String get signalsLength => 'দৈর্ঘ্য';

  @override
  String get signalsFrom => 'থেকে';

  @override
  String get signalsTo => 'পর্যন্ত';

  @override
  String get signalsMonoNoChannel => 'মনো (চ্যানেল ছাড়া)';

  @override
  String get signalsExportWav => 'WAV রপ্তানি';

  @override
  String get signalsPinkNoise => 'পিংক নয়েজ';

  @override
  String get signalsPinkHelp =>
      'প্রতিটি অক্টেভে সমান শক্তি। শুধু ফ্রিকোয়েন্সি রেসপন্স দেয়, সময় বা প্রতিফলন নয় — দ্রুত «এখানে কিছু হচ্ছে কি?» জানতে যথেষ্ট।';

  @override
  String get signalsExportPink => '30 সে. WAV রপ্তানি';

  @override
  String get signalsHowTo => 'কীভাবে মাপবেন';

  @override
  String get signalsStep1 =>
      'সিগন্যাল কম্পিউটার থেকে স্পিকারে বাজান, ফোন থেকে নয়।';

  @override
  String get signalsStep2 =>
      'ভলিউম এমনভাবে সেট করুন যাতে অ্যানালাইজার প্রায় −20 dBFS দেখায়। ওভারলোড প্রতিফলনের মতো দেখায়।';

  @override
  String get signalsStep3 =>
      'ফোনটি হাত বাড়িয়ে খাড়া করে ধরুন, মাইক্রোফোন স্পিকারের দিকে।';

  @override
  String get signalsStep4 =>
      'ব্লুটুথ হেডফোন বিচ্ছিন্ন করুন — কম্প্রেশন ও লেটেন্সি পরিমাপ নষ্ট করে।';

  @override
  String get signalsNoteMono =>
      'দুই স্পিকারে একসঙ্গে মনো L ও R যোগ করে, আর তাদের পার্থক্য যোগফলে হারিয়ে যায়। চ্যানেল মাপতে একটি চ্যানেল বেছে নিন।';

  @override
  String get signalsNoteStereo =>
      'স্টেরিও ফাইল যার সিগন্যাল কেবল একটি চ্যানেলে — স্টেরিও বাজায় এমন যেকোনো কিছু এটি বাজাবে।';

  @override
  String get signalsNoteChannel =>
      'চ্যানেলের নামে মনো ফাইল। DAW থেকে বা মাল্টিচ্যানেল ইনপুটের মাধ্যমে রিসিভারের সঠিক ইনপুটে পাঠান; স্টেরিও আউটপুটের ল্যাপটপ এটিকে এই চ্যানেলে পৌঁছাতে পারবে না।';

  @override
  String get channelsTitle => 'চ্যানেল পরিমাপ';

  @override
  String get channelsHelp =>
      'শোনার জায়গায় দাঁড়ান। প্রতিটি চ্যানেলের জন্য: রেকর্ডিং শুরু করুন, সিগন্যাল ট্যাব থেকে তাতে sweep বাজান, সম্পন্ন-এ ট্যাপ করুন। এই বিন্দুগুলো ছাড়া ডিজাইনের কাছে EQ ও লেভেল হিসাব করার কিছু থাকে না।';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds সে.';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ দেওয়ার পর যাচাই';

  @override
  String get channelsVerifyAfterEqHint =>
      'বিন্দুটি «EQ-এর পরে» হিসেবে সংরক্ষিত হয় এবং যে বিন্দু থেকে EQ হিসাব হয়েছিল সেটি মুছে দেয় না।';

  @override
  String channelsRecording(String seconds) {
    return 'রেকর্ড হচ্ছে $seconds সে. — এখন sweep বাজান';
  }

  @override
  String get channelsNotMeasured => 'মাপা হয়নি';

  @override
  String get channelsMeasuredNoise => 'নয়েজ দিয়ে মাপা';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · সরাসরি শব্দ $ms ms পরে';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · সরাসরি শব্দ $ms ms পরে, T20 $t20 সে.';
  }

  @override
  String get commonDone => 'সম্পন্ন';

  @override
  String get channelsMeasure => 'মাপুন';

  @override
  String get channelsAdd => 'যোগ করুন';

  @override
  String get channelsAgain => 'আবার';

  @override
  String get compareTitle => 'তুলনা';

  @override
  String get compareNeedsTwoPoints => 'তুলনার জন্য অন্তত দুটি বিন্দু লাগে।';

  @override
  String get commonWithRoom => 'ঘরসহ';

  @override
  String get commonDirectSound => 'সরাসরি শব্দ';

  @override
  String get compareAfterEq => 'EQ-এর পরে';

  @override
  String get compareBandsA => 'A (ব্যান্ড)';

  @override
  String get compareBandsB => 'B (ব্যান্ড)';

  @override
  String get compareArrivalDiff => 'আগমনের পার্থক্য A − B';

  @override
  String get compareBroadbandDiff => 'ব্রডব্যান্ড লেভেল A − B';

  @override
  String get compareWorstBelow300 => '300 Hz-এর নিচে সবচেয়ে বড় পার্থক্য';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz ব্যান্ডে $db dB';
  }

  @override
  String get compareTrimNote =>
      'Distance ও level trim আগমন ও লেভেলের পার্থক্য সমান করে। 300 Hz-এর নিচে আকৃতির পার্থক্য করে না — সেটি অন্য দূরত্বে অন্য দেয়াল থেকে আসে এবং জায়গা বদলে সমাধান হয়।';

  @override
  String get designRt60Live => 'সর্বশেষ রেসপন্স থেকে T20 125–500 Hz';

  @override
  String get designRt60Stored => 'সংরক্ষিত sweep থেকে T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'অনুমান — একটি sweep মাপুন, Schroeder আপাতত শুধু ইঙ্গিত';

  @override
  String get designExportTooltip => 'কনফিগারেশন রপ্তানি';

  @override
  String get designCompute => 'ডিজাইন হিসাব করুন';

  @override
  String get designLidarChecking => 'LiDAR আছে কি না দেখা হচ্ছে…';

  @override
  String get designLidarAvailable => 'LiDAR উপলব্ধ';

  @override
  String get designLidarMissing => 'LiDAR নেই — মাপ হাতে লিখুন';

  @override
  String get designLidarHint =>
      'স্ক্যান দেয়ালগুলো সেন্টিমিটার পর্যন্ত দেয়, তাই শুধু মোড নয়, প্রতিফলন বিন্দু ও সীমানা পর্যন্ত দূরত্বও মিলে যায়।';

  @override
  String get designManualHint =>
      'মোডাল হিসাবের জন্য মাত্র তিনটি সংখ্যা লাগে — কিন্তু প্রতিফলন বিন্দু ও দেয়াল পর্যন্ত সঠিক দূরত্ব হারাবেন।';

  @override
  String get designStopScan => 'স্ক্যান শেষ করুন';

  @override
  String get designScanRoom => 'ঘর স্ক্যান করুন';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$wallsটি দেয়াল',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openingsটি খোলা জায়গা',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'ঘরের মাপ';

  @override
  String get designLength => 'দৈর্ঘ্য';

  @override
  String get designWidth => 'প্রস্থ';

  @override
  String get designHeight => 'উচ্চতা';

  @override
  String get designWhatToDo => 'কী করবেন';

  @override
  String get designRoomModes => 'ঘরের মোড';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (Schroeder)-এর ওপরে আলাদা মোডের আর কোনো অর্থ থাকে না। RT60 $rt60 সে.: $source।';
  }

  @override
  String get designEqTitle => 'EQ: মাপা, লক্ষ্য, পূর্বাভাস';

  @override
  String get designEqHelp =>
      'পূর্বাভাস হলো মাপা রেসপন্স আর রিসিভারের পনেরোটি ব্যান্ডের মডেল। EQ দেওয়ার পর «EQ-এর পরে» সুইচ দিয়ে চ্যানেলটি আবার মাপুন, দেখবেন মডেল কতটা কাছাকাছি ছিল।';

  @override
  String get designReceiverConfig => 'রিসিভার কনফিগারেশন';

  @override
  String get designGeometryOnly =>
      'চ্যানেলগুলোর sweep পরিমাপ ছাড়া এখানে শুধু জ্যামিতি আছে: দূরত্ব ও ক্রসওভার ফ্রিকোয়েন্সি। প্রতিটি চ্যানেলের বিন্দু হলে EQ ও লেভেল আসবে।';

  @override
  String get designShareSubject => 'কনফিগারেশন প্রস্তাব';

  @override
  String get impulseTitle => 'ইমপালস রেসপন্স';

  @override
  String get impulseCompareTooltip => 'বিন্দু তুলনা';

  @override
  String get impulseExportTooltip => 'ফেজসহ FRD রপ্তানি';

  @override
  String get impulseTapToStart => 'চালু করতে ট্যাপ করুন।';

  @override
  String get impulseSweepTitle => 'যে sweep আপনি স্পিকারে বাজাবেন';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds সে.। আপনি যা বাজাচ্ছেন তার সঙ্গে মিলতে হবে — নইলে ডিকনভোলিউশন অর্থহীন ফল দেবে।';
  }

  @override
  String impulseRecording(String seconds) {
    return 'রেকর্ড হচ্ছে — $seconds সে.';
  }

  @override
  String get impulsePlaySweepNow => 'এখন কম্পিউটার থেকে sweep বাজান।';

  @override
  String get impulseStartRecording => 'রেকর্ডিং শুরু করুন, তারপর sweep বাজান';

  @override
  String get impulseFrequencyResponse => 'ফ্রিকোয়েন্সি রেসপন্স';

  @override
  String get impulseWithRoom => 'ঘরসহ (1 সে.)';

  @override
  String impulseDirectWindow(String ms) {
    return 'সরাসরি শব্দ (উইন্ডো $ms ms)';
  }

  @override
  String get impulseWindow => 'উইন্ডো';

  @override
  String impulseWindowHelp(String hz) {
    return 'দীর্ঘ উইন্ডো আরও নিচে দেখে (এখন $hz Hz-এর ওপরে বৈধ), কিন্তু প্রথম প্রতিফলন ভেতরে ঢুকতে দেয়। সীমার নিচে বক্ররেখা মসৃণ বা ব্যাখ্যা করা হয় না: সেটা উইন্ডো, ঘর নয়।';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'প্রথম প্রতিফলন পর্যন্ত ($ms ms)';
  }

  @override
  String get impulseTime => 'সময়';

  @override
  String get impulseImpulse => 'ইমপালস';

  @override
  String get impulseTimeHelp =>
      'নীল হলো উইন্ডো, কমলা রেখা প্রথম পাওয়া প্রতিফলন। শূন্য সময় হলো সরাসরি শব্দ।';

  @override
  String get impulseSpectrogram => 'স্পেকট্রোগ্রাম';

  @override
  String get commonHide => 'লুকান';

  @override
  String get commonShow => 'দেখান';

  @override
  String get impulseSpectrogramHelp =>
      'সরাসরি শব্দ থেকে ms-এ সময়, ফ্রিকোয়েন্সি ওপরের দিকে, রং −60 dB পর্যন্ত লেভেল। যে অনুভূমিক ফিতা বাকিদের চেয়ে বেশিক্ষণ টেকে সেটি মোড; ওপরের টেবিল একই কথা সংখ্যায় বলে।';

  @override
  String get impulseDecayByOctave => 'অক্টেভ অনুযায়ী ক্ষয়';

  @override
  String get impulseMidNoT20 => 'মাঝের ব্যান্ডগুলো T20-এর জন্য যথেষ্ট কমেনি।';

  @override
  String impulseMidT20(String seconds) {
    return 'মাঝ 125–500 Hz: T20 $seconds সে. — এটিই সেই RT60 যা দিয়ে ডিজাইন হিসাব করে।';
  }

  @override
  String get impulseDecayHelp =>
      'বেসে ফোনের RT60 মূলত অনুমান: পটভূমির নয়েজ সেখানে সবচেয়ে কাছে, আর «—» মানে প্রতিধ্বনি তার নিচে নামেনি। শূন্যের ওপরে C50: প্রথম প্রতিফলনসহ সরাসরি শব্দ প্রতিধ্বনির চেয়ে বেশি শক্তি বহন করে।';

  @override
  String get impulseResult => 'ফলাফল';

  @override
  String get impulseDirectArrived => 'সরাসরি শব্দ পৌঁছেছে';

  @override
  String get impulseDirectArrivedHelp =>
      'প্লেব্যাক বিলম্ব আর যাত্রার সময় — একা কিছু বলে না, কিন্তু বাম ও ডান স্পিকারের পার্থক্য বলে।';

  @override
  String get impulseFirstReflection => 'প্রথম প্রতিফলন';

  @override
  String get impulseNotFound => 'পাওয়া যায়নি';

  @override
  String impulseAfterDirect(String time) {
    return 'সরাসরি শব্দের $time পরে';
  }

  @override
  String get impulseNoReflectionHelp =>
      'হয় কোনোটি নেই, নয়তো সরাসরি ইমপালসের রিংিংয়ে লুকিয়ে আছে।';

  @override
  String impulseExtraPath(String metres) {
    return 'অতিরিক্ত পথ ≈ $metres মি.।';
  }

  @override
  String get impulseUnmeasurable => 'মাপা যায় না';

  @override
  String get impulseRt60NoiseHelp =>
      'প্রতিধ্বনি নয়েজ ফ্লোরের ওপরে যথেষ্ট গভীরে নামেনি — আরও জোরে, বা শান্ত সময়ে চেষ্টা করুন।';

  @override
  String get impulseRt60Help =>
      'T20 ও T30-এর পার্থক্য বোঝায় ক্ষয় কতটা পরিষ্কার।';

  @override
  String get impulseGating => 'উইন্ডো (gating)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz-এর ওপরে বৈধ';
  }

  @override
  String get impulseGatingHelp =>
      'এর নিচে উইন্ডো একটি পর্যায়ও দেখে না — সেখানে বক্ররেখা উইন্ডোর প্রভাব, ঘরের নয়।';

  @override
  String get impulseSchroeder => 'শ্রোডার ক্ষয় বক্ররেখা';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz-এ HD$order';
  }

  @override
  String get impulseHd2Help =>
      'হারমোনিকগুলো Farina ডিকনভোলিউশনের ঋণাত্মক সময়ে থাকে; এখানে সেগুলো ফেলে না দিয়ে সেখান থেকেই পড়া হয়। −40 dB মানে 1 %।';

  @override
  String get impulseHd3Help =>
      'ওভারলোডে তৃতীয় হারমোনিক দ্বিতীয়টির চেয়ে দ্রুত বাড়ে।';

  @override
  String get impulseDistortionHot => '−30 dB-এর ওপরে বিকৃতি';

  @override
  String get impulseDistortionHotHelp =>
      'হয় sweep খুব জোরে, নয়তো স্পিকার সীমায় আছে। বিকৃতির লেজ ইমপালসে প্রতিফলনের মতো দেখায় — ভলিউম কমান এবং কিছু বিশ্বাস করার আগে আবার মাপুন।';

  @override
  String get eqMeasured => 'মাপা';

  @override
  String get eqTarget => 'লক্ষ্য';

  @override
  String get eqPredicted => 'EQ-এর পরে পূর্বাভাস';

  @override
  String get eqMeasuredAfter => 'EQ-এর পরে মাপা';

  @override
  String eqDeviation(int maxHz) {
    return 'লক্ষ্য থেকে বিচ্যুতি 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'রিসিভারে দেওয়ার পর';

  @override
  String get eqPredictionVsReality => 'পূর্বাভাস বনাম বাস্তব';

  @override
  String eqStubborn(String bands) {
    return 'লক্ষ্য থেকে 6 dB-এর বেশি দূরে থাকবে: $bands। এটি ব্যতিচার, শক্তির অভাব নয় — স্পিকার বা শ্রোতাকে সরিয়ে সমাধান হয়, আরও বুস্ট দিয়ে নয়।';
  }

  @override
  String get eqModelOk => 'রিসিভারের ফিল্টার মোটামুটি মডেলের মতোই আচরণ করে।';

  @override
  String get eqModelOff =>
      'রিসিভারের আসল ফিল্টার প্রত্যাশার চেয়ে মডেল থেকে বেশি আলাদা — এর ব্যান্ডগুলো সম্ভবত এখানে ধরা মানের চেয়ে চওড়া বা সরু।';

  @override
  String get eqTargetCurve => 'লক্ষ্য বক্ররেখা';

  @override
  String get eqFlat => 'সমতল';

  @override
  String get eqTargetHelp =>
      'সমতল নয়: কয়েক kHz-এর ওপরে কান সরাসরি শব্দ শোনে, মাইক্রোফোন প্রতিফলনও যোগ করে, আর সমতল করা মাপা বক্ররেখা নিস্তেজ শোনায়। ওপরে হালকা ঢাল আর নিচে একটু বেস — অন্ধ শ্রবণে মানুষ এটাই বেছে নেয়।';

  @override
  String get eqBassLift => 'বেস বুস্ট';

  @override
  String get eqBassBelow => 'বেস এর নিচে';

  @override
  String get eqTilt => 'ঢাল';

  @override
  String get eqDbPerOctave => 'dB/অক্টেভ';

  @override
  String get eqTiltFrom => 'ঢাল শুরু';

  @override
  String get errorMicPermission =>
      'মাইক্রোফোনে অ্যাক্সেস ছাড়া মাপা যায় না। সেটিংস → AudioScanner → মাইক্রোফোন-এ অনুমতি দিন।';

  @override
  String errorMic(String error) {
    return 'মাইক্রোফোন: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'মাইক্রোফোন চালু করা যায়নি: $error';
  }

  @override
  String get errorNoArkit =>
      'এই ডিভাইস ARKit world tracking সমর্থন করে না — বিন্দুগুলো স্থানে রাখা যাবে না।';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'রেকর্ডিং sweep-এর চেয়ে ছোট ($expected সে.-এর মধ্যে $recorded সে.)। সিগন্যাল বাজানোর আগে রেকর্ডিং শুরু করুন।';
  }

  @override
  String get sessionSnapshots => 'স্ন্যাপশট';

  @override
  String get errorTrackingUnreliable =>
      'অবস্থান ট্র্যাকিং নির্ভরযোগ্য নয় — বিন্দুটি আপনি যেখানে দাঁড়িয়ে আছেন তার অন্য জায়গায় পড়বে।';

  @override
  String errorNoSound(int seconds) {
    return '$seconds সে.-এ কোনো শব্দ আসেনি।';
  }

  @override
  String get noteSnapshotNoPose => 'অ্যানালাইজারের স্ন্যাপশট, অবস্থান ছাড়া';

  @override
  String get sessionChannels => 'চ্যানেল';

  @override
  String get trackingOk => 'ট্র্যাকিং ঠিক আছে';

  @override
  String get trackingLimited => 'দুর্বল ট্র্যাকিং';

  @override
  String get trackingUnavailable => 'ট্র্যাকিং নেই';

  @override
  String get poseHintFeatures =>
      'ছবিতে খুব কম বিবরণ — ফোনটি টেক্সচারযুক্ত কিছুর দিকে ধরুন, খালি দেয়ালের দিকে নয়।';

  @override
  String get poseHintMotion => 'খুব দ্রুত নড়াচড়া — আস্তে হাঁটুন।';

  @override
  String get poseHintLight =>
      'খুব কম আলো — আলো জ্বালান, ক্যামেরা দেখতে পাচ্ছে না সে কোথায়।';

  @override
  String get poseHintInitializing => 'ARKit চালু হচ্ছে, একটু নড়াচড়া করুন।';

  @override
  String get poseHintRelocalizing =>
      'মূল বিন্দু আবার খোঁজা হচ্ছে — যেখান থেকে শুরু করেছিলেন সেখানে ফিরে যান।';

  @override
  String get signalPhonePink => 'ফোন থেকে পিংক নয়েজ';

  @override
  String get signalExternalPink => 'স্পিকার থেকে পিংক নয়েজ';

  @override
  String get signalExternalSweep => 'স্পিকার থেকে sweep';

  @override
  String get captureWarningBluetooth =>
      'ব্লুটুথ মাইক্রোফোন: কম্প্রেশন ও লেটেন্সি পরিমাপ নষ্ট করে। হেডফোন বিচ্ছিন্ন করুন এবং বিল্ট-ইন মাইক্রোফোনে মাপুন।';

  @override
  String get captureWarningProcessing =>
      'সিস্টেম সিগন্যাল প্রসেসিং (AGC / নয়েজ দমন) বন্ধ করেনি। জায়গাগুলোর মধ্যে মাপা পার্থক্য বিকৃত হবে।';

  @override
  String get captureWarningMeasurementMode =>
      'measurement mode চালু করা যায়নি — মাইক্রোফোনের নিজস্ব ফ্রিকোয়েন্সি রেসপন্স সংশোধন আছে।';

  @override
  String get captureRouteUnknown => 'অজানা';

  @override
  String get axisLength => 'দৈর্ঘ্য';

  @override
  String get axisWidth => 'প্রস্থ';

  @override
  String get axisHeight => 'উচ্চতা';
}
