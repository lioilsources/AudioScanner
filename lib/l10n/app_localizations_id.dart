// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get tabScan => 'Pindai';

  @override
  String get tabMap => 'Peta';

  @override
  String get tabResponse => 'Respons';

  @override
  String get tabDesign => 'Desain';

  @override
  String get tabSignals => 'Sinyal';

  @override
  String get rtaSnapshotFailed => 'Cuplikan gagal disimpan.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Disimpan sebagai titik $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Disimpan sebagai titik $id (tanpa posisi).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titik',
    );
    return 'Kalibrasi $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'File tidak dapat dibaca: $message';
  }

  @override
  String get rtaOffsetTitle => 'Offset dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Putar nada 1 kHz, baca levelnya di alat ukur SPL, lalu masukkan selisihnya terhadap yang ditampilkan penganalisis. Dengan offset bukan nol, level ditandai sebagai perkiraan SPL; tanpa itu tetap dBFS.';

  @override
  String get commonReset => 'Atur ulang';

  @override
  String get commonCancel => 'Batal';

  @override
  String get commonSave => 'Simpan';

  @override
  String get commonStop => 'Berhenti';

  @override
  String get commonStartMic => 'Mulai mikrofon';

  @override
  String get tabAnalyzer => 'Penganalisis';

  @override
  String get rtaUnfreeze => 'Lepas bekukan';

  @override
  String get rtaFreeze => 'Bekukan';

  @override
  String get rtaPeakHold => 'Peak hold';

  @override
  String get rtaMaxMinTraces => 'Jejak maks / min';

  @override
  String get rtaResetTraces => 'Atur ulang jejak';

  @override
  String get rtaSaveAsPoint => 'Simpan sebagai titik (3 dtk)';

  @override
  String get rtaMicCalibration => 'Kalibrasi mikrofon…';

  @override
  String get rtaRemoveCalibration => 'Hapus kalibrasi';

  @override
  String get rtaOffsetMenu => 'Offset dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · tanpa pemrosesan sinyal';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count titik',
    );
    return 'Kalibrasi $name: $_temp0, koreksi $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (perkiraan)';

  @override
  String get rtaFrozenHint =>
      'Dibekukan — mikrofon tetap berjalan, hanya tidak digambar.';

  @override
  String get rtaRelativeHint =>
      'Level bersifat relatif (dBFS). Garis tepi muncul setelah Anda menyimpan titik pertama — itulah acuan untuk titik lain.';

  @override
  String get rtaReferenceHint =>
      'Batang penuh = di sini. Garis tepi = titik acuan.';

  @override
  String get rtaEnvelopeHint => 'Merah = maks, hijau = min sejak diatur ulang.';

  @override
  String get rtaMicStopped => 'mikrofon berhenti';

  @override
  String get rtaSilence => 'hening — apakah sinyal diputar?';

  @override
  String get rtaPlaceholder =>
      'Mulai mikrofon dan putar sinyal ke dalam ruangan.';

  @override
  String rtaBandsInfo(int count) {
    return '$count pita sepertiga oktaf, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Pindai ruangan';

  @override
  String scanPointCount(int count) {
    return '$count t.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofon tidak berjalan';

  @override
  String get scanMicNeeded =>
      'Tanpa mikrofon hanya posisi yang terukur, bukan suara.';

  @override
  String get scanContinuous => 'Pengukuran berkelanjutan';

  @override
  String get scanContinuousHint => 'Titik otomatis setiap 0,5 m berjalan';

  @override
  String get scanMeasuring => 'Mengukur…';

  @override
  String get scanMeasureHere => 'Ukur di sini';

  @override
  String scanPointSaved(String id, String position) {
    return 'Titik $id disimpan di $position';
  }

  @override
  String get scanStartTracking => 'Mulai pelacakan posisi';

  @override
  String get scanStartTrackingHint =>
      'ARKit — dari sini aplikasi tahu di mana Anda berdiri di ruangan.';

  @override
  String scanPosition(String position) {
    return 'Posisi: $position m dari titik asal';
  }

  @override
  String get scanSetOriginHint =>
      'Berdirilah di posisi dengar dan tetapkan titik asal.';

  @override
  String get scanOriginHere => 'Titik asal di sini';

  @override
  String get scanNoPoints => 'Belum ada titik.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'sebaran 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Ruang tamu';

  @override
  String get scanNewMeasurement => 'Pengukuran baru';

  @override
  String get scanRoomName => 'Nama ruangan';

  @override
  String get scanExcitation => 'Dengan apa ruangan dieksitasi';

  @override
  String get scanPhoneNoiseHint =>
      'Hanya sebagai petunjuk — speaker ponsel hampir tidak menghasilkan bass.';

  @override
  String get scanStart => 'Mulai';

  @override
  String get mapExportTooltip => 'Ekspor FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Peta butuh minimal dua titik. Jelajahi ruangan dan ukur terus.';

  @override
  String get mapShareText =>
      'FRD per titik (impor ke REW / VituixCAD) dan seluruh sesi dalam JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Tempat paling datar: $id di $position m (sebaran $variation dB pada 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Satu-satunya sinyal yang bisa dihitung menjadi respons impuls, waktu dengung, dan pantulan awal. Putar dari komputer atau DAC ke speaker, biarkan ponsel merekam.';

  @override
  String get signalsLength => 'Durasi';

  @override
  String get signalsFrom => 'Dari';

  @override
  String get signalsTo => 'Sampai';

  @override
  String get signalsMonoNoChannel => 'Mono (tanpa kanal)';

  @override
  String get signalsExportWav => 'Ekspor WAV';

  @override
  String get signalsPinkNoise => 'Pink noise';

  @override
  String get signalsPinkHelp =>
      'Energi sama di setiap oktaf. Hanya memberi respons frekuensi, tanpa waktu atau pantulan — cukup untuk cek cepat \"apakah ada yang berubah?\".';

  @override
  String get signalsExportPink => 'Ekspor WAV 30 dtk';

  @override
  String get signalsHowTo => 'Cara mengukur';

  @override
  String get signalsStep1 =>
      'Putar sinyal dari komputer ke speaker, bukan dari ponsel.';

  @override
  String get signalsStep2 =>
      'Atur volume agar penganalisis menunjukkan sekitar −20 dBFS. Overload terlihat seperti pantulan.';

  @override
  String get signalsStep3 =>
      'Pegang ponsel tegak dengan lengan terulur, mikrofon menghadap speaker.';

  @override
  String get signalsStep4 =>
      'Lepas headphone Bluetooth — kompresi dan latensi merusak pengukuran.';

  @override
  String get signalsNoteMono =>
      'Mono ke kedua speaker sekaligus menjumlahkan L dan R, dan selisih keduanya hilang dalam penjumlahan. Untuk mengukur kanal, pilih kanalnya.';

  @override
  String get signalsNoteStereo =>
      'File stereo dengan sinyal hanya di satu kanal — bisa diputar perangkat apa pun yang memutar stereo.';

  @override
  String get signalsNoteChannel =>
      'File mono yang dinamai sesuai kanal. Arahkan ke input receiver yang benar dari DAW atau input multikanal; laptop dengan output stereo tidak bisa mengirimnya ke kanal ini.';

  @override
  String get channelsTitle => 'Pengukuran kanal';

  @override
  String get channelsHelp =>
      'Berdirilah di posisi dengar. Untuk setiap kanal: mulai rekam, putar sweep dari tab Sinyal ke kanal itu, ketuk Selesai. Tanpa titik-titik ini, desain tidak punya bahan untuk membuat EQ dan volume.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds dtk';
  }

  @override
  String get channelsVerifyAfterEq => 'Verifikasi setelah memasukkan EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Titik disimpan sebagai \"setelah EQ\" dan tidak menimpa titik yang dipakai menghitung EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Merekam $seconds dtk — putar sweep sekarang';
  }

  @override
  String get channelsNotMeasured => 'belum diukur';

  @override
  String get channelsMeasuredNoise => 'diukur dengan noise';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · suara langsung dalam $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · suara langsung dalam $ms ms, T20 $t20 dtk';
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
  String get compareNeedsTwoPoints => 'Perbandingan butuh minimal dua titik.';

  @override
  String get commonWithRoom => 'dengan ruangan';

  @override
  String get commonDirectSound => 'suara langsung';

  @override
  String get compareAfterEq => 'setelah EQ';

  @override
  String get compareBandsA => 'A (pita)';

  @override
  String get compareBandsB => 'B (pita)';

  @override
  String get compareArrivalDiff => 'Selisih waktu tiba A − B';

  @override
  String get compareBroadbandDiff => 'Selisih level pita lebar A − B';

  @override
  String get compareWorstBelow300 => 'Selisih terbesar di bawah 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB di pita $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance dan level trim menyamakan selisih waktu tiba dan level. Keduanya tidak menyamakan selisih bentuk di bawah 300 Hz — itu ulah dinding lain pada jarak lain, dan diatasi dengan menggeser posisi.';

  @override
  String get designRt60Live => 'T20 125–500 Hz dari respons terakhir';

  @override
  String get designRt60Stored => 'T20 125–500 Hz dari sweep tersimpan';

  @override
  String get designRt60Guess =>
      'perkiraan — ukur sweep, frekuensi Schroeder baru sebatas petunjuk';

  @override
  String get designExportTooltip => 'Ekspor konfigurasi';

  @override
  String get designCompute => 'Hitung desain';

  @override
  String get designLidarChecking => 'Memeriksa apakah ada LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR tersedia';

  @override
  String get designLidarMissing =>
      'Tanpa LiDAR — masukkan dimensi secara manual';

  @override
  String get designLidarHint =>
      'Pemindaian memberi dinding hingga sentimeter, sehingga titik pantulan dan jarak ke batas juga tepat, bukan hanya mode.';

  @override
  String get designManualHint =>
      'Perhitungan mode hanya butuh tiga angka, tetapi Anda kehilangan titik pantulan dan jarak tepat ke dinding.';

  @override
  String get designStopScan => 'Akhiri pemindaian';

  @override
  String get designScanRoom => 'Pindai ruangan';

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
  String get designRoomDimensions => 'Dimensi ruangan';

  @override
  String get designLength => 'Panjang';

  @override
  String get designWidth => 'Lebar';

  @override
  String get designHeight => 'Tinggi';

  @override
  String get designWhatToDo => 'Apa yang harus dilakukan';

  @override
  String get designRoomModes => 'Mode ruangan';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Di atas $schroeder Hz (Schroeder), mode individual tidak lagi bermakna. RT60 $rt60 dtk: $source.';
  }

  @override
  String get designEqTitle => 'EQ: terukur, target, prediksi';

  @override
  String get designEqHelp =>
      'Prediksi adalah respons terukur ditambah model lima belas pita milik receiver. Setelah memasukkan EQ, ukur ulang kanal dengan sakelar \"setelah EQ\" untuk melihat seberapa dekat modelnya.';

  @override
  String get designReceiverConfig => 'Konfigurasi receiver';

  @override
  String get designGeometryOnly =>
      'Tanpa pengukuran kanal dengan sweep, yang ada hanya geometri: jarak dan frekuensi crossover. EQ dan volume menyusul setelah ada titik per kanal.';

  @override
  String get designShareSubject => 'Usulan konfigurasi';

  @override
  String get impulseTitle => 'Respons impuls';

  @override
  String get impulseCompareTooltip => 'Bandingkan titik';

  @override
  String get impulseExportTooltip => 'Ekspor FRD dengan fase';

  @override
  String get impulseTapToStart => 'Ketuk untuk memulai.';

  @override
  String get impulseSweepTitle => 'Sweep yang diputar ke speaker';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds dtk. Harus sama dengan yang Anda putar — kalau tidak, dekonvolusi menghasilkan omong kosong.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Merekam — $seconds dtk';
  }

  @override
  String get impulsePlaySweepNow => 'Sekarang putar sweep dari komputer.';

  @override
  String get impulseStartRecording => 'Mulai rekam, lalu putar sweep';

  @override
  String get impulseFrequencyResponse => 'Respons frekuensi';

  @override
  String get impulseWithRoom => 'dengan ruangan (1 dtk)';

  @override
  String impulseDirectWindow(String ms) {
    return 'suara langsung (jendela $ms ms)';
  }

  @override
  String get impulseWindow => 'Jendela';

  @override
  String impulseWindowHelp(String hz) {
    return 'Jendela lebih panjang melihat lebih rendah (kini valid di atas $hz Hz), tetapi memasukkan pantulan pertama. Di bawah batas itu kurva tidak dihaluskan atau dikomentari: itu jendela, bukan ruangan.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Sampai pantulan pertama ($ms ms)';
  }

  @override
  String get impulseTime => 'Waktu';

  @override
  String get impulseImpulse => 'impuls';

  @override
  String get impulseTimeHelp =>
      'Biru adalah jendela, garis oranye adalah pantulan pertama yang ditemukan. Waktu nol adalah suara langsung.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Sembunyikan';

  @override
  String get commonShow => 'Tampilkan';

  @override
  String get impulseSpectrogramHelp =>
      'Waktu dalam ms dari suara langsung, frekuensi ke atas, warna adalah level hingga −60 dB. Garis horizontal yang bertahan saat yang lain hilang adalah mode; tabel di atas menyatakan hal yang sama dengan angka.';

  @override
  String get impulseDecayByOctave => 'Peluruhan per oktaf';

  @override
  String get impulseMidNoT20 => 'Pita tengah tidak meluruh cukup untuk T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Tengah 125–500 Hz: T20 $seconds dtk — inilah RT60 yang dipakai desain.';
  }

  @override
  String get impulseDecayHelp =>
      'Di bass, RT60 dari ponsel lebih berupa perkiraan: noise latar paling dekat di sana dan \"—\" berarti dengung tidak turun di bawahnya. C50 di atas nol: suara langsung dengan pantulan awal membawa lebih banyak energi daripada dengung.';

  @override
  String get impulseResult => 'Hasil';

  @override
  String get impulseDirectArrived => 'Suara langsung tiba dalam';

  @override
  String get impulseDirectArrivedHelp =>
      'Latensi pemutaran ditambah waktu tempuh — sendirian tidak berarti apa-apa, tetapi selisih antara speaker L dan R berarti.';

  @override
  String get impulseFirstReflection => 'Pantulan pertama';

  @override
  String get impulseNotFound => 'tidak ditemukan';

  @override
  String impulseAfterDirect(String time) {
    return '$time setelah suara langsung';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Entah tidak ada, atau tersembunyi dalam dering impuls langsung.';

  @override
  String impulseExtraPath(String metres) {
    return 'Jalur tambahan ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'tidak terukur';

  @override
  String get impulseRt60NoiseHelp =>
      'Dengung tidak meluruh cukup dalam di atas noise latar — keraskan volume, atau ukur saat lebih sepi.';

  @override
  String get impulseRt60Help =>
      'Selisih antara T20 dan T30 menunjukkan seberapa bersih peluruhannya.';

  @override
  String get impulseGating => 'Jendela (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'valid di atas $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Di bawah itu jendela tidak melihat satu periode pun — kurva di sana adalah artefak jendela, bukan ruangan.';

  @override
  String get impulseSchroeder => 'Kurva peluruhan Schroeder';

  @override
  String impulseHdAt(int order) {
    return 'HD$order pada 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Harmonik berada di waktu negatif dekonvolusi Farina; di sini dibaca dari sana, bukan dibuang. −40 dB adalah 1 %.';

  @override
  String get impulseHd3Help =>
      'Harmonik ketiga tumbuh dengan overload lebih cepat daripada yang kedua.';

  @override
  String get impulseDistortionHot => 'Distorsi di atas −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Sweep terlalu keras, atau speaker di batasnya. Ekor distorsi tampak seperti pantulan dalam impuls — turunkan volume dan ukur ulang sebelum memercayai apa pun.';

  @override
  String get eqMeasured => 'terukur';

  @override
  String get eqTarget => 'target';

  @override
  String get eqPredicted => 'prediksi setelah EQ';

  @override
  String get eqMeasuredAfter => 'terukur setelah EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Deviasi dari target 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Setelah dimasukkan ke receiver';

  @override
  String get eqPredictionVsReality => 'Prediksi vs kenyataan';

  @override
  String eqStubborn(String bands) {
    return 'Tetap lebih dari 6 dB dari target: $bands. Itu interferensi, bukan kurang daya — diatasi dengan menggeser speaker atau pendengar, bukan dengan menaikkan lagi.';
  }

  @override
  String get eqModelOk =>
      'Filter receiver berperilaku kurang lebih seperti model.';

  @override
  String get eqModelOff =>
      'Filter receiver yang sebenarnya berbeda dari model lebih dari yang diperkirakan — pita-pitanya kemungkinan lebih lebar atau lebih sempit daripada yang diasumsikan di sini.';

  @override
  String get eqTargetCurve => 'Kurva target';

  @override
  String get eqFlat => 'datar';

  @override
  String get eqTargetHelp =>
      'Tidak datar: di atas beberapa kHz telinga mendengar suara langsung, sedangkan mikrofon menjumlahkan pantulan juga, dan kurva terukur yang diratakan terdengar tumpul. Kemiringan ringan di atas dan sedikit bass di bawah adalah yang dipilih orang dalam uji dengar buta.';

  @override
  String get eqBassLift => 'Dorongan bass';

  @override
  String get eqBassBelow => 'Bass di bawah';

  @override
  String get eqTilt => 'Kemiringan';

  @override
  String get eqDbPerOctave => 'dB/okt';

  @override
  String get eqTiltFrom => 'Kemiringan dari';

  @override
  String get errorMicPermission =>
      'Tanpa akses mikrofon tidak bisa mengukur. Izinkan di Pengaturan → AudioScanner → Mikrofon.';

  @override
  String errorMic(String error) {
    return 'Mikrofon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Gagal memulai mikrofon: $error';
  }

  @override
  String get errorNoArkit =>
      'Perangkat ini tidak mendukung ARKit world tracking — titik tidak bisa ditempatkan di ruang.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Rekaman lebih pendek dari sweep ($recorded dtk dari $expected dtk). Mulai merekam sebelum memutar sinyal.';
  }

  @override
  String get sessionSnapshots => 'Cuplikan';

  @override
  String get errorTrackingUnreliable =>
      'Pelacakan posisi tidak andal — titik bisa bergeser dari tempat Anda berdiri.';

  @override
  String errorNoSound(int seconds) {
    return 'Tidak ada suara yang tiba dalam $seconds dtk.';
  }

  @override
  String get noteSnapshotNoPose => 'cuplikan dari penganalisis, tanpa posisi';

  @override
  String get sessionChannels => 'Kanal';

  @override
  String get trackingOk => 'Pelacakan OK';

  @override
  String get trackingLimited => 'Pelacakan lemah';

  @override
  String get trackingUnavailable => 'Tanpa pelacakan';

  @override
  String get poseHintFeatures =>
      'Terlalu sedikit detail pada gambar — arahkan ponsel ke sesuatu yang bertekstur, bukan dinding kosong.';

  @override
  String get poseHintMotion => 'Gerakan terlalu cepat — jalan lebih pelan.';

  @override
  String get poseHintLight =>
      'Kurang cahaya — nyalakan lampu, kamera tidak melihat di mana ia berada.';

  @override
  String get poseHintInitializing =>
      'ARKit sedang menyala, bergeraklah sebentar.';

  @override
  String get poseHintRelocalizing =>
      'Mencari titik semula — kembali ke tempat Anda mulai.';

  @override
  String get signalPhonePink => 'Pink noise dari ponsel';

  @override
  String get signalExternalPink => 'Pink noise dari speaker';

  @override
  String get signalExternalSweep => 'Sweep dari speaker';

  @override
  String get captureWarningBluetooth =>
      'Mikrofon Bluetooth: kompresi dan latensi merusak pengukuran. Lepas headphone dan ukur dengan mikrofon bawaan.';

  @override
  String get captureWarningProcessing =>
      'Sistem tidak mematikan pemrosesan sinyal (AGC / peredam noise). Selisih terukur antar titik akan terdistorsi.';

  @override
  String get captureWarningMeasurementMode =>
      'Gagal mengaktifkan mode pengukuran — mikrofon punya koreksi respons frekuensinya sendiri.';

  @override
  String get captureRouteUnknown => 'tidak diketahui';

  @override
  String get axisLength => 'panjang';

  @override
  String get axisWidth => 'lebar';

  @override
  String get axisHeight => 'tinggi';
}
