// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Malay (`ms`).
class AppLocalizationsMs extends AppLocalizations {
  AppLocalizationsMs([String locale = 'ms']) : super(locale);

  @override
  String get tabScan => 'Imbas';

  @override
  String get tabMap => 'Peta';

  @override
  String get tabResponse => 'Sambutan';

  @override
  String get tabDesign => 'Reka bentuk';

  @override
  String get tabSignals => 'Isyarat';

  @override
  String get rtaSnapshotFailed => 'Syot kilat gagal disimpan.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Disimpan sebagai titik $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Disimpan sebagai titik $id (tanpa kedudukan).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titik',
    );
    return 'Penentukuran $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Fail tidak dapat dibaca: $message';
  }

  @override
  String get rtaOffsetTitle => 'Ofset dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Mainkan nada 1 kHz, baca tahap pada meter SPL dan masukkan perbezaan berbanding paparan penganalisis. Dengan ofset bukan sifar, tahap ditanda sebagai anggaran SPL; tanpanya ia kekal dBFS.';

  @override
  String get commonReset => 'Set semula';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonSave => 'Simpan';

  @override
  String get commonStop => 'Henti';

  @override
  String get commonStartMic => 'Mulakan mikrofon';

  @override
  String get tabAnalyzer => 'Penganalisis';

  @override
  String get rtaUnfreeze => 'Nyahbeku';

  @override
  String get rtaFreeze => 'Bekukan';

  @override
  String get rtaPeakHold => 'Peak hold';

  @override
  String get rtaMaxMinTraces => 'Jejak maks / min';

  @override
  String get rtaResetTraces => 'Set semula jejak';

  @override
  String get rtaSaveAsPoint => 'Simpan sebagai titik (3 s)';

  @override
  String get rtaMicCalibration => 'Penentukuran mikrofon…';

  @override
  String get rtaRemoveCalibration => 'Buang penentukuran';

  @override
  String get rtaOffsetMenu => 'Ofset dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · tanpa pemprosesan isyarat';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titik',
    );
    return 'Penentukuran $name: $_temp0, pembetulan $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (anggaran)';

  @override
  String get rtaFrozenHint =>
      'Dibekukan — mikrofon terus berjalan, cuma tidak dilukis.';

  @override
  String get rtaRelativeHint =>
      'Tahap adalah relatif (dBFS). Garis luar muncul selepas anda menyimpan titik pertama — itulah rujukan bagi titik lain.';

  @override
  String get rtaReferenceHint =>
      'Palang penuh = di sini. Garis luar = titik rujukan.';

  @override
  String get rtaEnvelopeHint => 'Merah = maks, hijau = min sejak set semula.';

  @override
  String get rtaMicStopped => 'mikrofon berhenti';

  @override
  String get rtaSilence => 'senyap — adakah isyarat dimainkan?';

  @override
  String get rtaPlaceholder =>
      'Mulakan mikrofon dan mainkan isyarat ke dalam bilik.';

  @override
  String rtaBandsInfo(int count) {
    return '$count jalur sepertiga oktaf, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Imbas bilik';

  @override
  String scanPointCount(int count) {
    return '$count t.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofon tidak berjalan';

  @override
  String get scanMicNeeded =>
      'Tanpanya hanya kedudukan yang diukur, bukan bunyi.';

  @override
  String get scanContinuous => 'Pengukuran berterusan';

  @override
  String get scanContinuousHint => 'Titik automatik setiap 0.5 m berjalan';

  @override
  String get scanMeasuring => 'Mengukur…';

  @override
  String get scanMeasureHere => 'Ukur di sini';

  @override
  String scanPointSaved(String id, String position) {
    return 'Titik $id disimpan di $position';
  }

  @override
  String get scanStartTracking => 'Mulakan penjejakan kedudukan';

  @override
  String get scanStartTrackingHint =>
      'ARKit — dari sini aplikasi tahu di mana anda berdiri dalam bilik.';

  @override
  String scanPosition(String position) {
    return 'Kedudukan: $position m dari asalan';
  }

  @override
  String get scanSetOriginHint =>
      'Berdiri di kedudukan mendengar dan tetapkan asalan.';

  @override
  String get scanOriginHere => 'Asalan di sini';

  @override
  String get scanNoPoints => 'Belum ada titik.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'serakan 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Ruang tamu';

  @override
  String get scanNewMeasurement => 'Pengukuran baharu';

  @override
  String get scanRoomName => 'Nama bilik';

  @override
  String get scanExcitation => 'Dengan apa bilik dirangsang';

  @override
  String get scanPhoneNoiseHint =>
      'Sekadar panduan — pembesar suara telefon hampir tidak menghasilkan bes.';

  @override
  String get scanStart => 'Mula';

  @override
  String get mapExportTooltip => 'Eksport FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Peta memerlukan sekurang-kurangnya dua titik. Jalan keliling bilik dan ukur berterusan.';

  @override
  String get mapShareText =>
      'FRD mengikut titik (import ke REW / VituixCAD) dan keseluruhan sesi dalam JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Tempat paling rata: $id di $position m (serakan $variation dB pada 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Satu-satunya isyarat yang boleh dikira menjadi sambutan impuls, masa gema dan pantulan awal. Mainkan dari komputer atau DAC ke pembesar suara, biar telefon merakam.';

  @override
  String get signalsLength => 'Tempoh';

  @override
  String get signalsFrom => 'Dari';

  @override
  String get signalsTo => 'Hingga';

  @override
  String get signalsMonoNoChannel => 'Mono (tanpa saluran)';

  @override
  String get signalsExportWav => 'Eksport WAV';

  @override
  String get signalsPinkNoise => 'Hingar merah jambu';

  @override
  String get signalsPinkHelp =>
      'Tenaga yang sama pada setiap oktaf. Hanya memberi sambutan frekuensi, tanpa masa atau pantulan — memadai untuk semakan pantas \"adakah sesuatu berubah?\".';

  @override
  String get signalsExportPink => 'Eksport WAV 30 s';

  @override
  String get signalsHowTo => 'Cara mengukur';

  @override
  String get signalsStep1 =>
      'Mainkan isyarat dari komputer ke pembesar suara, bukan dari telefon.';

  @override
  String get signalsStep2 =>
      'Laraskan kelantangan supaya penganalisis menunjukkan sekitar −20 dBFS. Beban lampau kelihatan seperti pantulan.';

  @override
  String get signalsStep3 =>
      'Pegang telefon menegak dengan lengan dihulur, mikrofon menghala ke pembesar suara.';

  @override
  String get signalsStep4 =>
      'Putuskan fon kepala Bluetooth — mampatan dan kependaman merosakkan ukuran.';

  @override
  String get signalsNoteMono =>
      'Mono ke kedua-dua pembesar suara serentak menjumlahkan L dan R, dan perbezaan antara keduanya hilang dalam jumlah. Untuk mengukur saluran, pilih saluran.';

  @override
  String get signalsNoteStereo =>
      'Fail stereo dengan isyarat pada satu saluran sahaja — dimainkan oleh apa-apa yang memainkan stereo.';

  @override
  String get signalsNoteChannel =>
      'Fail mono yang dinamakan mengikut saluran. Halakan ke input penerima yang betul dari DAW atau input berbilang saluran; komputer riba dengan output stereo tidak dapat menghantarnya ke saluran ini.';

  @override
  String get channelsTitle => 'Pengukuran saluran';

  @override
  String get channelsHelp =>
      'Berdiri di kedudukan mendengar. Bagi setiap saluran: mula rakam, mainkan sweep dari tab Isyarat ke dalamnya, ketik Selesai. Tanpa titik ini reka bentuk tiada bahan untuk membuat EQ dan kelantangan.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Pengesahan selepas memasukkan EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Titik disimpan sebagai \"selepas EQ\" dan tidak menimpa titik yang digunakan untuk mengira EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Merakam $seconds s — mainkan sweep sekarang';
  }

  @override
  String get channelsNotMeasured => 'belum diukur';

  @override
  String get channelsMeasuredNoise => 'diukur dengan hingar';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · bunyi terus dalam $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · bunyi terus dalam $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Selesai';

  @override
  String get channelsMeasure => 'Ukur';

  @override
  String get channelsAdd => 'Tambah';

  @override
  String get channelsAgain => 'Lagi';

  @override
  String get compareTitle => 'Perbandingan';

  @override
  String get compareNeedsTwoPoints =>
      'Perbandingan memerlukan sekurang-kurangnya dua titik.';

  @override
  String get commonWithRoom => 'dengan bilik';

  @override
  String get commonDirectSound => 'bunyi terus';

  @override
  String get compareAfterEq => 'selepas EQ';

  @override
  String get compareBandsA => 'A (jalur)';

  @override
  String get compareBandsB => 'B (jalur)';

  @override
  String get compareArrivalDiff => 'Beza masa tiba A − B';

  @override
  String get compareBroadbandDiff => 'Beza tahap jalur lebar A − B';

  @override
  String get compareWorstBelow300 => 'Beza terbesar di bawah 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB pada jalur $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance dan level trim menyamakan beza masa tiba dan tahap. Ia tidak menyamakan beza bentuk di bawah 300 Hz — itu perbuatan dinding lain pada jarak lain, dan diatasi dengan mengalihkan kedudukan.';

  @override
  String get designRt60Live => 'T20 125–500 Hz daripada sambutan terakhir';

  @override
  String get designRt60Stored => 'T20 125–500 Hz daripada sweep tersimpan';

  @override
  String get designRt60Guess =>
      'anggaran — ukur sweep, frekuensi Schroeder buat masa ini cuma petunjuk';

  @override
  String get designExportTooltip => 'Eksport konfigurasi';

  @override
  String get designCompute => 'Kira reka bentuk';

  @override
  String get designLidarChecking => 'Memeriksa sama ada ada LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR tersedia';

  @override
  String get designLidarMissing =>
      'Tiada LiDAR — masukkan dimensi secara manual';

  @override
  String get designLidarHint =>
      'Imbasan memberi dinding hingga ke sentimeter, jadi titik pantulan dan jarak ke sempadan juga tepat, bukan sekadar mod.';

  @override
  String get designManualHint =>
      'Pengiraan mod hanya perlukan tiga nombor, tetapi anda kehilangan titik pantulan dan jarak tepat ke dinding.';

  @override
  String get designStopScan => 'Tamatkan imbasan';

  @override
  String get designScanRoom => 'Imbas bilik';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls dinding',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings bukaan',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Dimensi bilik';

  @override
  String get designLength => 'Panjang';

  @override
  String get designWidth => 'Lebar';

  @override
  String get designHeight => 'Tinggi';

  @override
  String get designWhatToDo => 'Apa yang perlu dibuat';

  @override
  String get designRoomModes => 'Mod bilik';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Di atas $schroeder Hz (Schroeder), mod individu tidak lagi bermakna. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: diukur, sasaran, ramalan';

  @override
  String get designEqHelp =>
      'Ramalan ialah sambutan terukur ditambah model lima belas jalur penerima. Selepas memasukkan EQ, ukur semula saluran dengan suis \"selepas EQ\" untuk melihat sejauh mana model itu tepat.';

  @override
  String get designReceiverConfig => 'Konfigurasi penerima';

  @override
  String get designGeometryOnly =>
      'Tanpa pengukuran saluran dengan sweep, yang ada hanyalah geometri: jarak dan frekuensi pangkah. EQ dan kelantangan menyusul apabila ada titik bagi setiap saluran.';

  @override
  String get designShareSubject => 'Cadangan konfigurasi';

  @override
  String get impulseTitle => 'Sambutan impuls';

  @override
  String get impulseCompareTooltip => 'Bandingkan titik';

  @override
  String get impulseExportTooltip => 'Eksport FRD dengan fasa';

  @override
  String get impulseTapToStart => 'Ketik untuk bermula.';

  @override
  String get impulseSweepTitle => 'Sweep yang dimainkan ke pembesar suara';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Mesti sepadan dengan apa yang anda mainkan — jika tidak, dekonvolusi memulangkan karut.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Merakam — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Sekarang mainkan sweep dari komputer.';

  @override
  String get impulseStartRecording => 'Mula rakam, kemudian mainkan sweep';

  @override
  String get impulseFrequencyResponse => 'Sambutan frekuensi';

  @override
  String get impulseWithRoom => 'dengan bilik (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'bunyi terus (tetingkap $ms ms)';
  }

  @override
  String get impulseWindow => 'Tetingkap';

  @override
  String impulseWindowHelp(String hz) {
    return 'Tetingkap lebih panjang melihat lebih rendah (kini sah di atas $hz Hz), tetapi turut membenarkan pantulan pertama. Di bawah had itu lengkung tidak dilicinkan atau diulas: ia tetingkap, bukan bilik.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Hingga pantulan pertama ($ms ms)';
  }

  @override
  String get impulseTime => 'Masa';

  @override
  String get impulseImpulse => 'impuls';

  @override
  String get impulseTimeHelp =>
      'Biru ialah tetingkap, garis oren ialah pantulan pertama yang dijumpai. Masa sifar ialah bunyi terus.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Sembunyi';

  @override
  String get commonShow => 'Tunjuk';

  @override
  String get impulseSpectrogramHelp =>
      'Masa dalam ms dari bunyi terus, frekuensi ke atas, warna ialah tahap hingga −60 dB. Jalur mendatar yang kekal apabila yang lain hilang ialah satu mod; jadual di atas menyatakan perkara yang sama dengan nombor.';

  @override
  String get impulseDecayByOctave => 'Susutan mengikut oktaf';

  @override
  String get impulseMidNoT20 => 'Jalur tengah tidak susut cukup untuk T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Tengah 125–500 Hz: T20 $seconds s — inilah RT60 yang digunakan reka bentuk.';
  }

  @override
  String get impulseDecayHelp =>
      'Pada bes, RT60 daripada telefon lebih merupakan anggaran: hingar latar paling hampir di sana dan \"—\" bermaksud gema tidak susut di bawahnya. C50 di atas sifar: bunyi terus dengan pantulan awal membawa lebih tenaga daripada gema.';

  @override
  String get impulseResult => 'Keputusan';

  @override
  String get impulseDirectArrived => 'Bunyi terus tiba dalam';

  @override
  String get impulseDirectArrivedHelp =>
      'Kependaman main balik ditambah masa perjalanan — sendirian tidak bermakna apa-apa, tetapi beza antara pembesar suara L dan R bermakna.';

  @override
  String get impulseFirstReflection => 'Pantulan pertama';

  @override
  String get impulseNotFound => 'tidak dijumpai';

  @override
  String impulseAfterDirect(String time) {
    return '$time selepas bunyi terus';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Sama ada tiada langsung, atau tersembunyi dalam dering impuls terus.';

  @override
  String impulseExtraPath(String metres) {
    return 'Laluan tambahan ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'tidak dapat diukur';

  @override
  String get impulseRt60NoiseHelp =>
      'Gema tidak susut cukup dalam di atas hingar latar — kuatkan, atau ukur pada waktu yang lebih senyap.';

  @override
  String get impulseRt60Help =>
      'Beza antara T20 dan T30 menunjukkan betapa bersihnya susutan itu.';

  @override
  String get impulseGating => 'Tetingkap (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'sah di atas $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Di bawah itu tetingkap tidak nampak walau satu kitaran — lengkung di sana ialah artifak tetingkap, bukan bilik.';

  @override
  String get impulseSchroeder => 'Lengkung susutan Schroeder';

  @override
  String impulseHdAt(int order) {
    return 'HD$order pada 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmonik berada pada masa negatif dekonvolusi Farina; di sini ia dibaca dari situ dan bukan dibuang. −40 dB ialah 1 %.';

  @override
  String get impulseHd3Help =>
      'Harmonik ketiga tumbuh dengan beban lampau lebih pantas daripada yang kedua.';

  @override
  String get impulseDistortionHot => 'Herotan melebihi −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Sama ada sweep terlalu kuat, atau pembesar suara di hadnya. Ekor herotan kelihatan seperti pantulan dalam impuls — kurangkan kelantangan dan ukur semula sebelum mempercayai apa-apa.';

  @override
  String get eqMeasured => 'diukur';

  @override
  String get eqTarget => 'sasaran';

  @override
  String get eqPredicted => 'ramalan selepas EQ';

  @override
  String get eqMeasuredAfter => 'diukur selepas EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Sisihan daripada sasaran 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Selepas dimasukkan ke penerima';

  @override
  String get eqPredictionVsReality => 'Ramalan lawan hakikat';

  @override
  String eqStubborn(String bands) {
    return 'Kekal lebih daripada 6 dB dari sasaran: $bands. Itu gangguan, bukan kekurangan kuasa — diatasi dengan mengalihkan pembesar suara atau pendengar, bukan menambah lagi.';
  }

  @override
  String get eqModelOk =>
      'Penapis penerima berkelakuan lebih kurang seperti model.';

  @override
  String get eqModelOff =>
      'Penapis sebenar penerima berbeza daripada model lebih daripada yang dijangka — jalurnya mungkin lebih lebar atau lebih sempit daripada yang diandaikan di sini.';

  @override
  String get eqTargetCurve => 'Lengkung sasaran';

  @override
  String get eqFlat => 'rata';

  @override
  String get eqTargetHelp =>
      'Tidak rata: di atas beberapa kHz telinga mendengar bunyi terus, manakala mikrofon menjumlahkan pantulan juga, dan lengkung terukur yang diratakan kedengaran tumpul. Cerun ringan di atas dan sedikit bes di bawah ialah pilihan orang dalam ujian dengar buta.';

  @override
  String get eqBassLift => 'Angkat bes';

  @override
  String get eqBassBelow => 'Bes di bawah';

  @override
  String get eqTilt => 'Cerun';

  @override
  String get eqDbPerOctave => 'dB/okt';

  @override
  String get eqTiltFrom => 'Cerun dari';

  @override
  String get errorMicPermission =>
      'Tanpa akses mikrofon, pengukuran tidak boleh dibuat. Benarkan di Tetapan → AudioScanner → Mikrofon.';

  @override
  String errorMic(String error) {
    return 'Mikrofon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Gagal memulakan mikrofon: $error';
  }

  @override
  String get errorNoArkit =>
      'Peranti ini tidak menyokong ARKit world tracking — titik tidak boleh diletakkan dalam ruang.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Rakaman lebih pendek daripada sweep ($recorded s daripada $expected s). Mula merakam sebelum memainkan isyarat.';
  }

  @override
  String get sessionSnapshots => 'Syot kilat';

  @override
  String get errorTrackingUnreliable =>
      'Penjejakan kedudukan tidak boleh dipercayai — titik mungkin terletak berlainan daripada tempat anda berdiri.';

  @override
  String errorNoSound(int seconds) {
    return 'Tiada bunyi tiba dalam $seconds s.';
  }

  @override
  String get noteSnapshotNoPose =>
      'syot kilat daripada penganalisis, tanpa kedudukan';

  @override
  String get sessionChannels => 'Saluran';

  @override
  String get trackingOk => 'Penjejakan OK';

  @override
  String get trackingLimited => 'Penjejakan lemah';

  @override
  String get trackingUnavailable => 'Tanpa penjejakan';

  @override
  String get poseHintFeatures =>
      'Terlalu sedikit perincian pada imej — halakan telefon ke sesuatu yang bertekstur, bukan dinding kosong.';

  @override
  String get poseHintMotion =>
      'Pergerakan terlalu laju — jalan lebih perlahan.';

  @override
  String get poseHintLight =>
      'Cahaya kurang — hidupkan lampu, kamera tidak nampak di mana ia berada.';

  @override
  String get poseHintInitializing =>
      'ARKit sedang bermula, bergeraklah seketika.';

  @override
  String get poseHintRelocalizing =>
      'Mencari semula titik asal — kembali ke tempat anda bermula.';

  @override
  String get signalPhonePink => 'Hingar merah jambu dari telefon';

  @override
  String get signalExternalPink => 'Hingar merah jambu dari pembesar suara';

  @override
  String get signalExternalSweep => 'Sweep dari pembesar suara';

  @override
  String get captureWarningBluetooth =>
      'Mikrofon Bluetooth: mampatan dan kependaman merosakkan ukuran. Putuskan fon kepala dan ukur dengan mikrofon terbina dalam.';

  @override
  String get captureWarningProcessing =>
      'Sistem tidak mematikan pemprosesan isyarat (AGC / penindasan hingar). Beza terukur antara tempat akan terherot.';

  @override
  String get captureWarningMeasurementMode =>
      'Gagal mengaktifkan mod pengukuran — mikrofon mempunyai pembetulan sambutan frekuensinya sendiri.';

  @override
  String get captureRouteUnknown => 'tidak diketahui';

  @override
  String get axisLength => 'panjang';

  @override
  String get axisWidth => 'lebar';

  @override
  String get axisHeight => 'tinggi';
}
