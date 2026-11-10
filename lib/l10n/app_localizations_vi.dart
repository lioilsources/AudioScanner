// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get tabScan => 'Quét';

  @override
  String get tabMap => 'Bản đồ';

  @override
  String get tabResponse => 'Đáp ứng';

  @override
  String get tabDesign => 'Thiết kế';

  @override
  String get tabSignals => 'Tín hiệu';

  @override
  String get rtaSnapshotFailed => 'Không lưu được ảnh chụp nhanh.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Đã lưu thành điểm $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Đã lưu thành điểm $id (không có vị trí).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count điểm',
    );
    return 'Hiệu chuẩn $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Không đọc được tệp: $message';
  }

  @override
  String get rtaOffsetTitle => 'Độ lệch dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Phát âm 1 kHz, đọc mức trên máy đo SPL rồi nhập chênh lệch so với giá trị bộ phân tích hiển thị. Khi độ lệch khác không, mức được ghi là SPL ước tính; nếu bằng không thì vẫn là dBFS.';

  @override
  String get commonReset => 'Đặt lại';

  @override
  String get commonCancel => 'Hủy';

  @override
  String get commonSave => 'Lưu';

  @override
  String get commonStop => 'Dừng';

  @override
  String get commonStartMic => 'Bật micro';

  @override
  String get tabAnalyzer => 'Bộ phân tích';

  @override
  String get rtaUnfreeze => 'Bỏ đóng băng';

  @override
  String get rtaFreeze => 'Đóng băng';

  @override
  String get rtaPeakHold => 'Giữ đỉnh';

  @override
  String get rtaMaxMinTraces => 'Vết max / min';

  @override
  String get rtaResetTraces => 'Đặt lại vết';

  @override
  String get rtaSaveAsPoint => 'Lưu thành điểm (3 giây)';

  @override
  String get rtaMicCalibration => 'Hiệu chuẩn micro…';

  @override
  String get rtaRemoveCalibration => 'Gỡ hiệu chuẩn';

  @override
  String get rtaOffsetMenu => 'Độ lệch dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · không xử lý tín hiệu';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count điểm',
    );
    return 'Hiệu chuẩn $name: $_temp0, hiệu chỉnh $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (ước tính)';

  @override
  String get rtaFrozenHint => 'Đã đóng băng — micro vẫn chạy, chỉ là không vẽ.';

  @override
  String get rtaRelativeHint =>
      'Các mức là tương đối (dBFS). Đường viền sẽ hiện khi bạn lưu điểm đầu tiên — điểm đó là mốc tham chiếu cho các điểm khác.';

  @override
  String get rtaReferenceHint =>
      'Cột đặc = ở đây. Đường viền = điểm tham chiếu.';

  @override
  String get rtaEnvelopeHint => 'Đỏ = max, xanh lá = min kể từ lần đặt lại.';

  @override
  String get rtaMicStopped => 'micro đang dừng';

  @override
  String get rtaSilence => 'im lặng — tín hiệu có đang phát không?';

  @override
  String get rtaPlaceholder => 'Bật micro và phát tín hiệu vào phòng.';

  @override
  String rtaBandsInfo(int count) {
    return '$count dải một phần ba quãng tám, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Quét phòng';

  @override
  String scanPointCount(int count) {
    return '$count đ.';
  }

  @override
  String get commonMicNotRunning => 'Micro không chạy';

  @override
  String get scanMicNeeded =>
      'Không có micro thì chỉ đo được vị trí, không đo được âm thanh.';

  @override
  String get scanContinuous => 'Đo liên tục';

  @override
  String get scanContinuousHint => 'Tự động lấy một điểm sau mỗi 0,5 m đi bộ';

  @override
  String get scanMeasuring => 'Đang đo…';

  @override
  String get scanMeasureHere => 'Đo tại đây';

  @override
  String scanPointSaved(String id, String position) {
    return 'Đã lưu điểm $id tại $position';
  }

  @override
  String get scanStartTracking => 'Bắt đầu theo dõi vị trí';

  @override
  String get scanStartTrackingHint =>
      'ARKit — nhờ đó ứng dụng biết bạn đang đứng ở đâu trong phòng.';

  @override
  String scanPosition(String position) {
    return 'Vị trí: $position m so với gốc';
  }

  @override
  String get scanSetOriginHint => 'Đứng ở vị trí nghe và đặt gốc tọa độ.';

  @override
  String get scanOriginHere => 'Gốc tọa độ ở đây';

  @override
  String get scanNoPoints => 'Chưa có điểm nào.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'độ phân tán 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Phòng khách';

  @override
  String get scanNewMeasurement => 'Phép đo mới';

  @override
  String get scanRoomName => 'Tên phòng';

  @override
  String get scanExcitation => 'Dùng gì để kích thích phòng';

  @override
  String get scanPhoneNoiseHint =>
      'Chỉ mang tính tham khảo — loa điện thoại gần như không phát được âm trầm.';

  @override
  String get scanStart => 'Bắt đầu';

  @override
  String get mapExportTooltip => 'Xuất FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'Bản đồ cần ít nhất hai điểm. Đi quanh phòng và đo liên tục.';

  @override
  String get mapShareText =>
      'FRD theo từng điểm (nhập vào REW / VituixCAD) và toàn bộ phiên ở dạng JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Vị trí phẳng nhất: $id tại $position m (độ phân tán $variation dB ở 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'Tín hiệu duy nhất để tính được đáp ứng xung, thời gian vang và các phản xạ đầu. Phát từ máy tính hoặc DAC ra loa, để điện thoại ghi âm.';

  @override
  String get signalsLength => 'Độ dài';

  @override
  String get signalsFrom => 'Từ';

  @override
  String get signalsTo => 'Đến';

  @override
  String get signalsMonoNoChannel => 'Mono (không kênh)';

  @override
  String get signalsExportWav => 'Xuất WAV';

  @override
  String get signalsPinkNoise => 'Nhiễu hồng';

  @override
  String get signalsPinkHelp =>
      'Năng lượng bằng nhau ở mỗi quãng tám. Chỉ cho đáp ứng tần số, không có thời gian hay phản xạ — đủ để kiểm tra nhanh xem \"có gì thay đổi không\".';

  @override
  String get signalsExportPink => 'Xuất WAV 30 giây';

  @override
  String get signalsHowTo => 'Cách đo';

  @override
  String get signalsStep1 =>
      'Phát tín hiệu từ máy tính ra loa, không phát từ điện thoại.';

  @override
  String get signalsStep2 =>
      'Chỉnh âm lượng để bộ phân tích hiển thị khoảng −20 dBFS. Quá tải trông giống phản xạ.';

  @override
  String get signalsStep3 =>
      'Cầm điện thoại thẳng đứng, duỗi tay, hướng micro về phía loa.';

  @override
  String get signalsStep4 =>
      'Ngắt tai nghe Bluetooth — nén và độ trễ làm hỏng phép đo.';

  @override
  String get signalsNoteMono =>
      'Gửi mono tới cả hai loa cùng lúc sẽ cộng L và R, và sự khác biệt giữa chúng biến mất trong tổng. Để đo từng kênh, hãy chọn kênh.';

  @override
  String get signalsNoteStereo =>
      'Tệp stereo có tín hiệu chỉ ở một kênh — bất cứ thiết bị nào phát được stereo đều phát được.';

  @override
  String get signalsNoteChannel =>
      'Tệp mono đặt tên theo kênh. Hãy đưa nó vào đúng ngõ vào của bộ thu từ DAW hoặc ngõ vào đa kênh; laptop có ngõ ra stereo không đưa được nó vào kênh này.';

  @override
  String get channelsTitle => 'Đo kênh';

  @override
  String get channelsHelp =>
      'Đứng ở vị trí nghe. Với mỗi kênh: bắt đầu ghi, phát sweep từ tab Tín hiệu vào kênh đó, rồi chạm Xong. Không có các điểm này, phần thiết kế không có gì để tạo EQ và âm lượng.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds giây';
  }

  @override
  String get channelsVerifyAfterEq => 'Kiểm tra sau khi nhập EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'Điểm sẽ được lưu là \"sau EQ\" và không ghi đè điểm dùng để tính EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Đang ghi $seconds giây — hãy phát sweep ngay';
  }

  @override
  String get channelsNotMeasured => 'chưa đo';

  @override
  String get channelsMeasuredNoise => 'đã đo bằng nhiễu';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · âm trực tiếp sau $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · âm trực tiếp sau $ms ms, T20 $t20 giây';
  }

  @override
  String get commonDone => 'Xong';

  @override
  String get channelsMeasure => 'Đo';

  @override
  String get channelsAdd => 'Thêm';

  @override
  String get channelsAgain => 'Lại';

  @override
  String get compareTitle => 'So sánh';

  @override
  String get compareNeedsTwoPoints => 'So sánh cần ít nhất hai điểm.';

  @override
  String get commonWithRoom => 'có phòng';

  @override
  String get commonDirectSound => 'âm trực tiếp';

  @override
  String get compareAfterEq => 'sau EQ';

  @override
  String get compareBandsA => 'A (dải)';

  @override
  String get compareBandsB => 'B (dải)';

  @override
  String get compareArrivalDiff => 'Chênh lệch thời gian đến A − B';

  @override
  String get compareBroadbandDiff => 'Chênh lệch mức băng rộng A − B';

  @override
  String get compareWorstBelow300 => 'Chênh lệch lớn nhất dưới 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB ở dải $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance và level trim san bằng chênh lệch thời gian đến và mức. Chúng không san bằng chênh lệch hình dạng dưới 300 Hz — đó là do bức tường khác ở khoảng cách khác, và được xử lý bằng cách dời vị trí.';

  @override
  String get designRt60Live => 'T20 125–500 Hz từ đáp ứng gần nhất';

  @override
  String get designRt60Stored => 'T20 125–500 Hz từ sweep đã lưu';

  @override
  String get designRt60Guess =>
      'ước tính — hãy đo sweep, tần số Schroeder hiện chỉ là gợi ý';

  @override
  String get designExportTooltip => 'Xuất cấu hình';

  @override
  String get designCompute => 'Tính thiết kế';

  @override
  String get designLidarChecking => 'Đang kiểm tra xem có LiDAR không…';

  @override
  String get designLidarAvailable => 'Có LiDAR';

  @override
  String get designLidarMissing => 'Không có LiDAR — nhập kích thước thủ công';

  @override
  String get designLidarHint =>
      'Quét cho tường chính xác đến từng centimet, nên cả điểm phản xạ và khoảng cách tới biên cũng khớp, không chỉ các mode.';

  @override
  String get designManualHint =>
      'Tính mode chỉ cần ba con số, nhưng bạn mất các điểm phản xạ và khoảng cách chính xác tới tường.';

  @override
  String get designStopScan => 'Kết thúc quét';

  @override
  String get designScanRoom => 'Quét phòng';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls bức tường',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings ô mở',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Kích thước phòng';

  @override
  String get designLength => 'Dài';

  @override
  String get designWidth => 'Rộng';

  @override
  String get designHeight => 'Cao';

  @override
  String get designWhatToDo => 'Cần làm gì';

  @override
  String get designRoomModes => 'Mode của phòng';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Trên $schroeder Hz (Schroeder), từng mode riêng lẻ không còn ý nghĩa. RT60 $rt60 giây: $source.';
  }

  @override
  String get designEqTitle => 'EQ: đã đo, mục tiêu, dự đoán';

  @override
  String get designEqHelp =>
      'Dự đoán là đáp ứng đã đo cộng với mô hình mười lăm dải của bộ thu. Sau khi nhập EQ, hãy đo lại kênh với công tắc \"sau EQ\" để thấy mô hình sát đến đâu.';

  @override
  String get designReceiverConfig => 'Cấu hình bộ thu';

  @override
  String get designGeometryOnly =>
      'Nếu chưa đo kênh bằng sweep thì chỉ có hình học: khoảng cách và tần số phân tần. EQ và âm lượng sẽ có khi đã có điểm cho từng kênh.';

  @override
  String get designShareSubject => 'Đề xuất cấu hình';

  @override
  String get impulseTitle => 'Đáp ứng xung';

  @override
  String get impulseCompareTooltip => 'So sánh các điểm';

  @override
  String get impulseExportTooltip => 'Xuất FRD kèm pha';

  @override
  String get impulseTapToStart => 'Chạm để bắt đầu.';

  @override
  String get impulseSweepTitle => 'Sweep sẽ phát ra loa';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds giây. Phải khớp với những gì bạn phát — nếu không, phép giải chập sẽ cho kết quả vô nghĩa.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Đang ghi — $seconds giây';
  }

  @override
  String get impulsePlaySweepNow => 'Bây giờ hãy phát sweep từ máy tính.';

  @override
  String get impulseStartRecording => 'Bắt đầu ghi, rồi phát sweep';

  @override
  String get impulseFrequencyResponse => 'Đáp ứng tần số';

  @override
  String get impulseWithRoom => 'có phòng (1 giây)';

  @override
  String impulseDirectWindow(String ms) {
    return 'âm trực tiếp (cửa sổ $ms ms)';
  }

  @override
  String get impulseWindow => 'Cửa sổ';

  @override
  String impulseWindowHelp(String hz) {
    return 'Cửa sổ dài hơn thấy được tần số thấp hơn (hiện hợp lệ trên $hz Hz), nhưng cũng lọt vào phản xạ đầu tiên. Dưới ngưỡng này, đường cong không được làm mượt cũng không được nhận xét: đó là cửa sổ, không phải phòng.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Đến phản xạ đầu tiên ($ms ms)';
  }

  @override
  String get impulseTime => 'Thời gian';

  @override
  String get impulseImpulse => 'xung';

  @override
  String get impulseTimeHelp =>
      'Màu xanh là cửa sổ, đường cam là phản xạ đầu tiên tìm thấy. Thời gian không là âm trực tiếp.';

  @override
  String get impulseSpectrogram => 'Phổ đồ';

  @override
  String get commonHide => 'Ẩn';

  @override
  String get commonShow => 'Hiện';

  @override
  String get impulseSpectrogramHelp =>
      'Thời gian tính bằng ms kể từ âm trực tiếp, tần số hướng lên, màu là mức đến −60 dB. Dải ngang còn lại khi mọi thứ khác đã tắt là một mode; bảng phía trên nói điều tương tự bằng con số.';

  @override
  String get impulseDecayByOctave => 'Suy giảm theo quãng tám';

  @override
  String get impulseMidNoT20 => 'Dải giữa chưa suy giảm đủ để tính T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Dải giữa 125–500 Hz: T20 $seconds giây — đây là RT60 mà phần thiết kế dùng.';
  }

  @override
  String get impulseDecayHelp =>
      'Ở âm trầm, RT60 từ điện thoại chỉ là ước tính: nhiễu nền ở đó gần nhất và \"—\" nghĩa là tiếng vang không giảm xuống dưới nó. C50 trên không: âm trực tiếp cùng các phản xạ đầu mang nhiều năng lượng hơn tiếng vang.';

  @override
  String get impulseResult => 'Kết quả';

  @override
  String get impulseDirectArrived => 'Âm trực tiếp đến sau';

  @override
  String get impulseDirectArrivedHelp =>
      'Độ trễ phát cộng thời gian truyền — bản thân nó không nói lên điều gì, nhưng chênh lệch giữa loa L và R thì có.';

  @override
  String get impulseFirstReflection => 'Phản xạ đầu tiên';

  @override
  String get impulseNotFound => 'không tìm thấy';

  @override
  String impulseAfterDirect(String time) {
    return '$time sau âm trực tiếp';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Hoặc không có phản xạ nào, hoặc nó nằm lẫn trong tiếng ngân của xung trực tiếp.';

  @override
  String impulseExtraPath(String metres) {
    return 'Quãng đường thêm ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'không đo được';

  @override
  String get impulseRt60NoiseHelp =>
      'Tiếng vang không giảm đủ sâu trên nhiễu nền — hãy tăng âm lượng hoặc đo lúc yên tĩnh hơn.';

  @override
  String get impulseRt60Help =>
      'Chênh lệch giữa T20 và T30 cho biết sự suy giảm sạch đến đâu.';

  @override
  String get impulseGating => 'Cửa sổ (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'hợp lệ trên $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Dưới mức đó cửa sổ không thấy nổi một chu kỳ — đường cong ở đó là hiện tượng của cửa sổ, không phải của phòng.';

  @override
  String get impulseSchroeder => 'Đường cong suy giảm Schroeder';

  @override
  String impulseHdAt(int order) {
    return 'HD$order tại 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Các họa âm nằm ở thời gian âm của phép giải chập Farina; ở đây chúng được đọc ra thay vì bỏ đi. −40 dB là 1 %.';

  @override
  String get impulseHd3Help =>
      'Họa âm bậc ba tăng theo quá tải nhanh hơn họa âm bậc hai.';

  @override
  String get impulseDistortionHot => 'Méo trên −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Hoặc sweep quá to, hoặc loa đang ở giới hạn. Đuôi méo trông như phản xạ trong xung — giảm âm lượng và đo lại trước khi tin bất cứ điều gì.';

  @override
  String get eqMeasured => 'đã đo';

  @override
  String get eqTarget => 'mục tiêu';

  @override
  String get eqPredicted => 'dự đoán sau EQ';

  @override
  String get eqMeasuredAfter => 'đã đo sau EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Độ lệch so với mục tiêu 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Sau khi nhập vào bộ thu';

  @override
  String get eqPredictionVsReality => 'Dự đoán so với thực tế';

  @override
  String eqStubborn(String bands) {
    return 'Vẫn xa mục tiêu hơn 6 dB: $bands. Đó là giao thoa, không phải thiếu công suất — xử lý bằng cách dời loa hoặc người nghe, không phải tăng thêm.';
  }

  @override
  String get eqModelOk => 'Bộ lọc của bộ thu hoạt động gần giống mô hình.';

  @override
  String get eqModelOff =>
      'Bộ lọc thực của bộ thu khác mô hình nhiều hơn dự kiến — các dải của nó có lẽ rộng hơn hoặc hẹp hơn giả định ở đây.';

  @override
  String get eqTargetCurve => 'Đường cong mục tiêu';

  @override
  String get eqFlat => 'phẳng';

  @override
  String get eqTargetHelp =>
      'Không phẳng: trên vài kHz tai nghe âm trực tiếp, còn micro cộng cả phản xạ, và đường cong đo được san phẳng nghe sẽ đục. Độ dốc nhẹ ở dải cao và chút tăng trầm ở dải thấp là điều mọi người chọn khi nghe mù.';

  @override
  String get eqBassLift => 'Tăng trầm';

  @override
  String get eqBassBelow => 'Âm trầm dưới';

  @override
  String get eqTilt => 'Độ dốc';

  @override
  String get eqDbPerOctave => 'dB/quãng tám';

  @override
  String get eqTiltFrom => 'Độ dốc từ';

  @override
  String get errorMicPermission =>
      'Không có quyền truy cập micro thì không đo được. Hãy cho phép trong Cài đặt → AudioScanner → Micro.';

  @override
  String errorMic(String error) {
    return 'Micro: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Không bật được micro: $error';
  }

  @override
  String get errorNoArkit =>
      'Thiết bị này không hỗ trợ ARKit world tracking — không thể đặt điểm trong không gian.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'Bản ghi ngắn hơn sweep ($recorded giây trên $expected giây). Hãy bắt đầu ghi trước khi phát tín hiệu.';
  }

  @override
  String get sessionSnapshots => 'Ảnh chụp nhanh';

  @override
  String get errorTrackingUnreliable =>
      'Theo dõi vị trí không đáng tin — điểm có thể nằm lệch so với chỗ bạn đứng.';

  @override
  String errorNoSound(int seconds) {
    return 'Không có âm thanh nào đến trong $seconds giây.';
  }

  @override
  String get noteSnapshotNoPose =>
      'ảnh chụp nhanh từ bộ phân tích, không có vị trí';

  @override
  String get sessionChannels => 'Kênh';

  @override
  String get trackingOk => 'Theo dõi tốt';

  @override
  String get trackingLimited => 'Theo dõi yếu';

  @override
  String get trackingUnavailable => 'Không theo dõi';

  @override
  String get poseHintFeatures =>
      'Hình ảnh có quá ít chi tiết — hướng điện thoại vào vật có nhiều chi tiết, đừng hướng vào bức tường trống.';

  @override
  String get poseHintMotion => 'Chuyển động quá nhanh — đi chậm lại.';

  @override
  String get poseHintLight =>
      'Thiếu sáng — hãy bật đèn, camera không nhìn thấy mình đang ở đâu.';

  @override
  String get poseHintInitializing =>
      'ARKit đang khởi động, hãy di chuyển một lát.';

  @override
  String get poseHintRelocalizing =>
      'Đang tìm lại điểm ban đầu — hãy quay lại chỗ bạn bắt đầu.';

  @override
  String get signalPhonePink => 'Nhiễu hồng từ điện thoại';

  @override
  String get signalExternalPink => 'Nhiễu hồng từ loa';

  @override
  String get signalExternalSweep => 'Sweep từ loa';

  @override
  String get captureWarningBluetooth =>
      'Micro Bluetooth: nén và độ trễ làm hỏng phép đo. Hãy ngắt tai nghe và đo bằng micro tích hợp.';

  @override
  String get captureWarningProcessing =>
      'Hệ thống chưa tắt xử lý tín hiệu (AGC / khử ồn). Chênh lệch đo được giữa các điểm sẽ bị méo.';

  @override
  String get captureWarningMeasurementMode =>
      'Không bật được chế độ đo — micro có bù đáp ứng tần số riêng.';

  @override
  String get captureRouteUnknown => 'không rõ';

  @override
  String get axisLength => 'dài';

  @override
  String get axisWidth => 'rộng';

  @override
  String get axisHeight => 'cao';
}
