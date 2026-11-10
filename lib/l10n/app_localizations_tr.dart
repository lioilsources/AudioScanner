// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get tabScan => 'Tarama';

  @override
  String get tabMap => 'Harita';

  @override
  String get tabResponse => 'Yanıt';

  @override
  String get tabDesign => 'Tasarım';

  @override
  String get tabSignals => 'Sinyaller';

  @override
  String get rtaSnapshotFailed => 'Anlık görüntü kaydedilmedi.';

  @override
  String rtaSavedAsPoint(String id) {
    return '$id noktası olarak kaydedildi.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return '$id noktası olarak kaydedildi (konum yok).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nokta',
    );
    return 'Kalibrasyon $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Dosya okunamıyor: $message';
  }

  @override
  String get rtaOffsetTitle => 'dB SPL ofseti';

  @override
  String get rtaOffsetHelp =>
      '1 kHz\'lik bir ton çal, seviyeyi bir SPL ölçerden oku ve analizörün gösterdiğiyle arasındaki farkı gir. Sıfırdan farklı bir ofsetle seviyeler SPL tahmini olarak işaretlenir; ofset olmadan dBFS\'de kalır.';

  @override
  String get commonReset => 'Sıfırla';

  @override
  String get commonCancel => 'İptal';

  @override
  String get commonSave => 'Kaydet';

  @override
  String get commonStop => 'Durdur';

  @override
  String get commonStartMic => 'Mikrofonu başlat';

  @override
  String get tabAnalyzer => 'Analizör';

  @override
  String get rtaUnfreeze => 'Devam et';

  @override
  String get rtaFreeze => 'Dondur';

  @override
  String get rtaPeakHold => 'Tepe tutma';

  @override
  String get rtaMaxMinTraces => 'Maks. / min. izler';

  @override
  String get rtaResetTraces => 'İzleri sıfırla';

  @override
  String get rtaSaveAsPoint => 'Nokta olarak kaydet (3 sn)';

  @override
  String get rtaMicCalibration => 'Mikrofon kalibrasyonu…';

  @override
  String get rtaRemoveCalibration => 'Kalibrasyonu kaldır';

  @override
  String get rtaOffsetMenu => 'dB SPL ofseti…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · sinyal işleme yok';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count nokta',
    );
    return 'Kalibrasyon $name: $_temp0, düzeltme $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (tahmin)';

  @override
  String get rtaFrozenHint =>
      'Donduruldu — mikrofon çalışmaya devam ediyor, sadece çizilmiyor.';

  @override
  String get rtaRelativeHint =>
      'Seviyeler görecelidir (dBFS). İlk noktayı kaydettiğinde dış çizgi görünür — o nokta diğerleri için referanstır.';

  @override
  String get rtaReferenceHint =>
      'Dolu çubuklar = burası. Dış çizgi = referans noktası.';

  @override
  String get rtaEnvelopeHint =>
      'Kırmızı = maks., yeşil = sıfırlamadan bu yana min.';

  @override
  String get rtaMicStopped => 'mikrofon durdu';

  @override
  String get rtaSilence => 'sessizlik — sinyal çalıyor mu?';

  @override
  String get rtaPlaceholder => 'Mikrofonu başlat ve odaya bir sinyal çal.';

  @override
  String rtaBandsInfo(int count) {
    return '$count üçte bir oktav bandı, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Oda taraması';

  @override
  String scanPointCount(int count) {
    return '$count nk.';
  }

  @override
  String get commonMicNotRunning => 'Mikrofon çalışmıyor';

  @override
  String get scanMicNeeded =>
      'Mikrofon olmadan yalnızca konum ölçülür, ses ölçülmez.';

  @override
  String get scanContinuous => 'Sürekli ölçüm';

  @override
  String get scanContinuousHint => 'Her 0,5 m yürüyüşte otomatik bir nokta';

  @override
  String get scanMeasuring => 'Ölçülüyor…';

  @override
  String get scanMeasureHere => 'Burada ölç';

  @override
  String scanPointSaved(String id, String position) {
    return '$id noktası $position konumunda kaydedildi';
  }

  @override
  String get scanStartTracking => 'Konum takibini başlat';

  @override
  String get scanStartTrackingHint =>
      'ARKit — uygulama odada nerede durduğunu böyle bilir.';

  @override
  String scanPosition(String position) {
    return 'Konum: başlangıç noktasından $position m';
  }

  @override
  String get scanSetOriginHint =>
      'Dinleme noktasına geç ve başlangıç noktasını belirle.';

  @override
  String get scanOriginHere => 'Başlangıç noktası burası';

  @override
  String get scanNoPoints => 'Henüz nokta yok.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'sapma 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Oturma odası';

  @override
  String get scanNewMeasurement => 'Yeni ölçüm';

  @override
  String get scanRoomName => 'Oda adı';

  @override
  String get scanExcitation => 'Odayı neyle uyaracaksın';

  @override
  String get scanPhoneNoiseHint =>
      'Yalnızca fikir vermek için — telefon hoparlörü hiç bas vermez.';

  @override
  String get scanStart => 'Başla';

  @override
  String get mapExportTooltip => 'FRD + JSON dışa aktar';

  @override
  String get mapNeedsTwoPoints =>
      'Harita için en az iki nokta gerekir. Odayı dolaş ve sürekli ölç.';

  @override
  String get mapShareText =>
      'Nokta başına FRD (REW / VituixCAD\'e aktarım) ve tüm oturum JSON olarak.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'En düz nokta: $id, $position m (40–300 Hz\'de $variation dB sapma)';
  }

  @override
  String get signalsSweepHelp =>
      'Dürtü yanıtı, yankılanma süresi ve ilk yansımaların hesaplanabildiği tek sinyal. Bir bilgisayardan veya DAC\'tan hoparlörlerden çal, telefon kaydetsin.';

  @override
  String get signalsLength => 'Süre';

  @override
  String get signalsFrom => 'Başlangıç';

  @override
  String get signalsTo => 'Bitiş';

  @override
  String get signalsMonoNoChannel => 'Mono (kanalsız)';

  @override
  String get signalsExportWav => 'WAV dışa aktar';

  @override
  String get signalsPinkNoise => 'Pembe gürültü';

  @override
  String get signalsPinkHelp =>
      'Her oktavda eşit enerji. Yalnızca frekans yanıtı verir, zaman ya da yansıma yok — hızlı bir “burada bir şey oluyor mu?” için yeterli.';

  @override
  String get signalsExportPink => '30 sn WAV dışa aktar';

  @override
  String get signalsHowTo => 'Nasıl ölçülür';

  @override
  String get signalsStep1 =>
      'Sinyali telefondan değil, bilgisayardan hoparlörlere çal.';

  @override
  String get signalsStep2 =>
      'Sesi analizör yaklaşık −20 dBFS gösterecek şekilde ayarla. Aşırı yükleme yansıma gibi görünür.';

  @override
  String get signalsStep3 =>
      'Telefonu kolun uzanmış hâlde dik tut, mikrofon hoparlörlere dönük olsun.';

  @override
  String get signalsStep4 =>
      'Bluetooth kulaklıkların bağlantısını kes — sıkıştırma ve gecikme ölçümü bozar.';

  @override
  String get signalsNoteMono =>
      'İki hoparlöre birden mono, L ve R\'yi toplar ve aralarındaki fark toplamda kaybolur. Kanal ölçmek için bir kanal seç.';

  @override
  String get signalsNoteStereo =>
      'Sinyali yalnızca tek kanalda olan stereo dosya — stereo çalan her şey onu çalar.';

  @override
  String get signalsNoteChannel =>
      'Kanalın adını taşıyan mono dosya. Bir DAW\'dan veya çok kanallı bir girişten alıcının doğru girişine yönlendir; stereo çıkışlı bir dizüstü onu bu kanala ulaştıramaz.';

  @override
  String get channelsTitle => 'Kanal ölçümü';

  @override
  String get channelsHelp =>
      'Dinleme noktasına geç. Her kanal için: kaydı başlat, Sinyaller sekmesinden o kanala bir sweep çal, Bitti\'ye dokun. Bu noktalar olmadan tasarımın EQ ve seviyeleri hesaplayacağı bir şey olmaz.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds sn';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ girildikten sonra doğrulama';

  @override
  String get channelsVerifyAfterEqHint =>
      'Nokta “EQ sonrası” olarak kaydedilir ve EQ\'nun hesaplandığı noktanın üzerine yazmaz.';

  @override
  String channelsRecording(String seconds) {
    return 'Kaydediliyor $seconds sn — şimdi sweep\'i çal';
  }

  @override
  String get channelsNotMeasured => 'ölçülmedi';

  @override
  String get channelsMeasuredNoise => 'gürültüyle ölçüldü';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · doğrudan ses $ms ms sonra';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · doğrudan ses $ms ms sonra, T20 $t20 sn';
  }

  @override
  String get commonDone => 'Bitti';

  @override
  String get channelsMeasure => 'Ölç';

  @override
  String get channelsAdd => 'Ekle';

  @override
  String get channelsAgain => 'Yeniden';

  @override
  String get compareTitle => 'Karşılaştırma';

  @override
  String get compareNeedsTwoPoints =>
      'Karşılaştırma için en az iki nokta gerekir.';

  @override
  String get commonWithRoom => 'odayla';

  @override
  String get commonDirectSound => 'doğrudan ses';

  @override
  String get compareAfterEq => 'EQ sonrası';

  @override
  String get compareBandsA => 'A (bantlar)';

  @override
  String get compareBandsB => 'B (bantlar)';

  @override
  String get compareArrivalDiff => 'Varış farkı A − B';

  @override
  String get compareBroadbandDiff => 'Geniş bant seviyesi A − B';

  @override
  String get compareWorstBelow300 => '300 Hz altındaki en büyük fark';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz bandında $db dB';
  }

  @override
  String get compareTrimNote =>
      'Distance ve level trim varış ve seviye farkını eşitler. 300 Hz altındaki biçim farkını eşitlemez — onu farklı mesafedeki başka bir duvar yaratır ve yer değiştirerek çözülür.';

  @override
  String get designRt60Live => 'Son yanıttan T20 125–500 Hz';

  @override
  String get designRt60Stored => 'Kayıtlı bir sweep\'ten T20 125–500 Hz';

  @override
  String get designRt60Guess =>
      'tahmin — bir sweep ölç, Schroeder şimdilik yalnızca bir ipucu';

  @override
  String get designExportTooltip => 'Yapılandırmayı dışa aktar';

  @override
  String get designCompute => 'Tasarımı hesapla';

  @override
  String get designLidarChecking => 'LiDAR olup olmadığı kontrol ediliyor…';

  @override
  String get designLidarAvailable => 'LiDAR mevcut';

  @override
  String get designLidarMissing => 'LiDAR yok — boyutları elle gir';

  @override
  String get designLidarHint =>
      'Tarama duvarları santimetre hassasiyetinde verir; böylece yalnızca modlar değil, yansıma noktaları ve sınırlara olan mesafeler de doğru olur.';

  @override
  String get designManualHint =>
      'Mod hesabı yalnızca üç sayı ister — ama yansıma noktalarını ve duvarlara olan kesin mesafeleri kaybedersin.';

  @override
  String get designStopScan => 'Taramayı bitir';

  @override
  String get designScanRoom => 'Odayı tara';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls duvar',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings açıklık',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Oda boyutları';

  @override
  String get designLength => 'Uzunluk';

  @override
  String get designWidth => 'Genişlik';

  @override
  String get designHeight => 'Yükseklik';

  @override
  String get designWhatToDo => 'Ne yapılmalı';

  @override
  String get designRoomModes => 'Oda modları';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '$schroeder Hz (Schroeder) üzerinde tek tek modların artık anlamı yoktur. RT60 $rt60 sn: $source.';
  }

  @override
  String get designEqTitle => 'EQ: ölçülen, hedef, tahmin';

  @override
  String get designEqHelp =>
      'Tahmin, ölçülen yanıt artı alıcının on beş bandının bir modelidir. EQ\'yu girdikten sonra kanalı “EQ sonrası” anahtarıyla yeniden ölç ki modelin ne kadar yaklaştığını gör.';

  @override
  String get designReceiverConfig => 'Alıcı yapılandırması';

  @override
  String get designGeometryOnly =>
      'Kanalların sweep ölçümleri olmadan burada yalnızca geometri var: mesafeler ve geçiş frekansları. EQ ve seviyeler, kanal başına noktalar olduğunda gelecek.';

  @override
  String get designShareSubject => 'Yapılandırma önerisi';

  @override
  String get impulseTitle => 'Dürtü yanıtı';

  @override
  String get impulseCompareTooltip => 'Noktaları karşılaştır';

  @override
  String get impulseExportTooltip => 'Fazlı FRD dışa aktar';

  @override
  String get impulseTapToStart => 'Başlatmak için dokun.';

  @override
  String get impulseSweepTitle => 'Hoparlörlerden çalacağın sweep';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds sn. Çaldığınla aynı olmalı — yoksa ters evrişim anlamsız sonuç verir.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Kaydediliyor — $seconds sn';
  }

  @override
  String get impulsePlaySweepNow => 'Şimdi sweep\'i bilgisayardan çal.';

  @override
  String get impulseStartRecording => 'Kaydı başlat, sonra sweep\'i çal';

  @override
  String get impulseFrequencyResponse => 'Frekans yanıtı';

  @override
  String get impulseWithRoom => 'odayla (1 sn)';

  @override
  String impulseDirectWindow(String ms) {
    return 'doğrudan ses (pencere $ms ms)';
  }

  @override
  String get impulseWindow => 'Pencere';

  @override
  String impulseWindowHelp(String hz) {
    return 'Daha uzun pencere daha aşağıyı görür (şu an $hz Hz üzerinde geçerli), ama ilk yansımayı içeri alır. Sınırın altında eğri ne yumuşatılır ne yorumlanır: o pencere, oda değil.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'İlk yansımaya kadar ($ms ms)';
  }

  @override
  String get impulseTime => 'Zaman';

  @override
  String get impulseImpulse => 'dürtü';

  @override
  String get impulseTimeHelp =>
      'Mavi pencere, turuncu çizgi bulunan ilk yansıma. Sıfır zamanı doğrudan sestir.';

  @override
  String get impulseSpectrogram => 'Spektrogram';

  @override
  String get commonHide => 'Gizle';

  @override
  String get commonShow => 'Göster';

  @override
  String get impulseSpectrogramHelp =>
      'Doğrudan sesten itibaren ms cinsinden zaman, frekans yukarı doğru, renk −60 dB\'e kadar seviye. Diğerlerinden uzun süren yatay bir şerit bir moddur; yukarıdaki tablo aynısını sayıyla söyler.';

  @override
  String get impulseDecayByOctave => 'Oktav bazında sönüm';

  @override
  String get impulseMidNoT20 => 'Orta bantlar T20 için yeterince sönmedi.';

  @override
  String impulseMidT20(String seconds) {
    return 'Orta 125–500 Hz: T20 $seconds sn — tasarımın hesapladığı RT60 budur.';
  }

  @override
  String get impulseDecayHelp =>
      'Baslarda telefondan alınan RT60 daha çok bir tahmindir: arka plan gürültüsü orada en yakındır ve “—” yankının onun altına düşmediği anlamına gelir. Sıfırın üzerinde C50: erken yansımalarla birlikte doğrudan ses, yankıdan daha fazla enerji taşır.';

  @override
  String get impulseResult => 'Sonuç';

  @override
  String get impulseDirectArrived => 'Doğrudan sesin varışı';

  @override
  String get impulseDirectArrivedHelp =>
      'Çalma gecikmesi artı yol süresi — tek başına hiçbir şey söylemez, ama sol ve sağ hoparlör arasındaki fark söyler.';

  @override
  String get impulseFirstReflection => 'İlk yansıma';

  @override
  String get impulseNotFound => 'bulunamadı';

  @override
  String impulseAfterDirect(String time) {
    return 'doğrudan sesten $time sonra';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Ya hiç yok ya da doğrudan dürtünün çınlamasında saklanıyor.';

  @override
  String impulseExtraPath(String metres) {
    return 'Ek yol ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'ölçülemez';

  @override
  String get impulseRt60NoiseHelp =>
      'Yankı, gürültü tabanının üzerinde yeterince derine inmedi — daha yüksek sesle ya da daha sessiz bir anda dene.';

  @override
  String get impulseRt60Help =>
      'T20 ile T30 arasındaki fark sönümün ne kadar temiz olduğunu gösterir.';

  @override
  String get impulseGating => 'Pencere (gating)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz üzerinde geçerli';
  }

  @override
  String get impulseGatingHelp =>
      'Bunun altında pencere tek bir periyot bile görmez — oradaki eğri odanın değil, pencerenin bir yapaylığıdır.';

  @override
  String get impulseSchroeder => 'Schroeder sönüm eğrisi';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz\'de HD$order';
  }

  @override
  String get impulseHd2Help =>
      'Harmonikler Farina ters evrişiminin negatif zamanında bulunur; burada atılmak yerine oradan okunur. −40 dB %1\'dir.';

  @override
  String get impulseHd3Help =>
      'Üçüncü harmonik aşırı yüklemeyle ikinciden daha hızlı büyür.';

  @override
  String get impulseDistortionHot => '−30 dB üzerinde bozulma';

  @override
  String get impulseDistortionHotHelp =>
      'Ya sweep çok yüksek ya da hoparlör sınırında. Bozulma kuyruğu dürtüde yansıma gibi görünür — sesi kıs ve bir şeye inanmadan önce yeniden ölç.';

  @override
  String get eqMeasured => 'ölçülen';

  @override
  String get eqTarget => 'hedef';

  @override
  String get eqPredicted => 'EQ sonrası tahmin';

  @override
  String get eqMeasuredAfter => 'EQ sonrası ölçülen';

  @override
  String eqDeviation(int maxHz) {
    return 'Hedeften sapma 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Alıcıya girildikten sonra';

  @override
  String get eqPredictionVsReality => 'Tahmin ve gerçek';

  @override
  String eqStubborn(String bands) {
    return 'Hedeften 6 dB\'den fazla uzakta kalır: $bands. Bu güç eksikliği değil, girişimdir — daha fazla yükseltmeyle değil, hoparlörü ya da dinleyiciyi taşıyarak çözülür.';
  }

  @override
  String get eqModelOk => 'Alıcının filtresi kabaca model gibi davranıyor.';

  @override
  String get eqModelOff =>
      'Alıcının gerçek filtresi modelden beklenenden fazla sapıyor — bantları muhtemelen burada varsayılandan daha geniş ya da dar.';

  @override
  String get eqTargetCurve => 'Hedef eğri';

  @override
  String get eqFlat => 'düz';

  @override
  String get eqTargetHelp =>
      'Düz değil: birkaç kHz\'in üzerinde kulak doğrudan sesi duyar, mikrofon yansımaları da toplar ve düzleştirilmiş bir ölçüm eğrisi donuk ses verir. Üstte hafif bir eğim ve altta biraz bas — insanların kör dinlemede seçtiği budur.';

  @override
  String get eqBassLift => 'Bas yükseltme';

  @override
  String get eqBassBelow => 'Bas sınırı';

  @override
  String get eqTilt => 'Eğim';

  @override
  String get eqDbPerOctave => 'dB/okt';

  @override
  String get eqTiltFrom => 'Eğim başlangıcı';

  @override
  String get errorMicPermission =>
      'Mikrofon erişimi olmadan ölçüm yapılamaz. Ayarlar → AudioScanner → Mikrofon bölümünden izin ver.';

  @override
  String errorMic(String error) {
    return 'Mikrofon: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Mikrofon başlatılamadı: $error';
  }

  @override
  String get errorNoArkit =>
      'Bu cihaz ARKit world tracking desteklemiyor — noktalar uzaya yerleştirilemez.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Kayıt sweep\'ten kısa ($recorded sn / $expected sn). Sinyali çalmadan önce kaydı başlat.';
  }

  @override
  String get sessionSnapshots => 'Anlık görüntüler';

  @override
  String get errorTrackingUnreliable =>
      'Konum takibi güvenilir değil — nokta durduğun yerden başka bir yere düşer.';

  @override
  String errorNoSound(int seconds) {
    return '$seconds sn içinde hiç ses gelmedi.';
  }

  @override
  String get noteSnapshotNoPose => 'analizörden anlık görüntü, konum yok';

  @override
  String get sessionChannels => 'Kanallar';

  @override
  String get trackingOk => 'Takip OK';

  @override
  String get trackingLimited => 'Zayıf takip';

  @override
  String get trackingUnavailable => 'Takip yok';

  @override
  String get poseHintFeatures =>
      'Görüntüde çok az ayrıntı var — telefonu çıplak bir duvara değil, desenli bir şeye doğrult.';

  @override
  String get poseHintMotion => 'Çok hızlı hareket — daha yavaş yürü.';

  @override
  String get poseHintLight =>
      'Çok az ışık — ışığı aç, kamera nerede olduğunu göremiyor.';

  @override
  String get poseHintInitializing => 'ARKit başlıyor, biraz hareket et.';

  @override
  String get poseHintRelocalizing =>
      'İlk nokta yeniden aranıyor — başladığın yere geri dön.';

  @override
  String get signalPhonePink => 'Telefondan pembe gürültü';

  @override
  String get signalExternalPink => 'Hoparlörlerden pembe gürültü';

  @override
  String get signalExternalSweep => 'Hoparlörlerden sweep';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth mikrofon: sıkıştırma ve gecikme ölçümü bozar. Kulaklığın bağlantısını kes ve dahili mikrofonla ölç.';

  @override
  String get captureWarningProcessing =>
      'Sistem sinyal işlemeyi (AGC / gürültü bastırma) kapatmadı. Noktalar arasında ölçülen farklar bozuk olacak.';

  @override
  String get captureWarningMeasurementMode =>
      'Measurement mode açılamadı — mikrofonun kendi frekans yanıtı düzeltmesi var.';

  @override
  String get captureRouteUnknown => 'bilinmiyor';

  @override
  String get axisLength => 'uzunluk';

  @override
  String get axisWidth => 'genişlik';

  @override
  String get axisHeight => 'yükseklik';
}
