// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get tabScan => 'สแกน';

  @override
  String get tabMap => 'แผนที่';

  @override
  String get tabResponse => 'การตอบสนอง';

  @override
  String get tabDesign => 'ออกแบบ';

  @override
  String get tabSignals => 'สัญญาณ';

  @override
  String get rtaSnapshotFailed => 'บันทึกสแนปช็อตไม่สำเร็จ';

  @override
  String rtaSavedAsPoint(String id) {
    return 'บันทึกเป็นจุด $id แล้ว';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'บันทึกเป็นจุด $id แล้ว (ไม่มีตำแหน่ง)';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count จุด',
    );
    return 'การปรับเทียบ $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'อ่านไฟล์ไม่ได้: $message';
  }

  @override
  String get rtaOffsetTitle => 'ออฟเซ็ต dB SPL';

  @override
  String get rtaOffsetHelp =>
      'เปิดโทน 1 kHz อ่านระดับจากเครื่องวัด SPL แล้วป้อนค่าต่างเทียบกับที่เครื่องวิเคราะห์แสดง เมื่อออฟเซ็ตไม่เป็นศูนย์ ระดับจะแสดงเป็น SPL โดยประมาณ ถ้าเป็นศูนย์จะยังเป็น dBFS';

  @override
  String get commonReset => 'รีเซ็ต';

  @override
  String get commonCancel => 'ยกเลิก';

  @override
  String get commonSave => 'บันทึก';

  @override
  String get commonStop => 'หยุด';

  @override
  String get commonStartMic => 'เริ่มไมโครโฟน';

  @override
  String get tabAnalyzer => 'เครื่องวิเคราะห์';

  @override
  String get rtaUnfreeze => 'เลิกค้างภาพ';

  @override
  String get rtaFreeze => 'ค้างภาพ';

  @override
  String get rtaPeakHold => 'พีคโฮลด์';

  @override
  String get rtaMaxMinTraces => 'เส้นสูงสุด / ต่ำสุด';

  @override
  String get rtaResetTraces => 'รีเซ็ตเส้น';

  @override
  String get rtaSaveAsPoint => 'บันทึกเป็นจุด (3 วินาที)';

  @override
  String get rtaMicCalibration => 'การปรับเทียบไมโครโฟน…';

  @override
  String get rtaRemoveCalibration => 'ลบการปรับเทียบ';

  @override
  String get rtaOffsetMenu => 'ออฟเซ็ต dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · ไม่ผ่านการประมวลผลสัญญาณ';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count จุด',
    );
    return 'การปรับเทียบ $name: $_temp0, แก้ไข $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (โดยประมาณ)';

  @override
  String get rtaFrozenHint =>
      'ค้างภาพอยู่ — ไมโครโฟนยังทำงานต่อ เพียงแต่ไม่วาดภาพ';

  @override
  String get rtaRelativeHint =>
      'ระดับเป็นค่าสัมพัทธ์ (dBFS) เส้นขอบจะปรากฏเมื่อคุณบันทึกจุดแรก ซึ่งเป็นจุดอ้างอิงของจุดอื่น ๆ';

  @override
  String get rtaReferenceHint => 'แท่งทึบ = ตรงนี้ เส้นขอบ = จุดอ้างอิง';

  @override
  String get rtaEnvelopeHint => 'แดง = สูงสุด เขียว = ต่ำสุดตั้งแต่รีเซ็ต';

  @override
  String get rtaMicStopped => 'ไมโครโฟนหยุดอยู่';

  @override
  String get rtaSilence => 'เงียบ — สัญญาณเล่นอยู่หรือเปล่า';

  @override
  String get rtaPlaceholder => 'เริ่มไมโครโฟนแล้วเล่นสัญญาณเข้าไปในห้อง';

  @override
  String rtaBandsInfo(int count) {
    return '$count แถบความถี่หนึ่งในสามอ็อกเทฟ, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'สแกนห้อง';

  @override
  String scanPointCount(int count) {
    return '$count จุด';
  }

  @override
  String get commonMicNotRunning => 'ไมโครโฟนไม่ทำงาน';

  @override
  String get scanMicNeeded =>
      'ถ้าไม่มีไมโครโฟน จะวัดได้เฉพาะตำแหน่ง ไม่ใช่เสียง';

  @override
  String get scanContinuous => 'วัดต่อเนื่อง';

  @override
  String get scanContinuousHint => 'บันทึกจุดอัตโนมัติทุก 0.5 ม. ที่เดิน';

  @override
  String get scanMeasuring => 'กำลังวัด…';

  @override
  String get scanMeasureHere => 'วัดตรงนี้';

  @override
  String scanPointSaved(String id, String position) {
    return 'บันทึกจุด $id ที่ $position แล้ว';
  }

  @override
  String get scanStartTracking => 'เริ่มติดตามตำแหน่ง';

  @override
  String get scanStartTrackingHint =>
      'ARKit — แอปใช้สิ่งนี้เพื่อรู้ว่าคุณอยู่ตรงไหนในห้อง';

  @override
  String scanPosition(String position) {
    return 'ตำแหน่ง: $position ม. จากจุดกำเนิด';
  }

  @override
  String get scanSetOriginHint => 'ไปยืนที่ตำแหน่งนั่งฟัง แล้วกำหนดจุดกำเนิด';

  @override
  String get scanOriginHere => 'ตรงนี้คือจุดกำเนิด';

  @override
  String get scanNoPoints => 'ยังไม่มีจุด';

  @override
  String scanPointStats(String variation, String rms) {
    return 'ความกระจาย 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'ห้องนั่งเล่น';

  @override
  String get scanNewMeasurement => 'การวัดใหม่';

  @override
  String get scanRoomName => 'ชื่อห้อง';

  @override
  String get scanExcitation => 'ใช้อะไรกระตุ้นห้อง';

  @override
  String get scanPhoneNoiseHint =>
      'เป็นเพียงแนวทาง — ลำโพงโทรศัพท์แทบไม่ให้เสียงเบสเลย';

  @override
  String get scanStart => 'เริ่ม';

  @override
  String get mapExportTooltip => 'ส่งออก FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'แผนที่ต้องมีอย่างน้อยสองจุด เดินไปทั่วห้องแล้ววัดไปเรื่อย ๆ';

  @override
  String get mapShareText =>
      'FRD ทีละจุด (นำเข้า REW / VituixCAD) และทั้งเซสชันเป็น JSON';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'จุดที่ราบที่สุด: $id ที่ $position ม. (ความกระจาย $variation dB ที่ 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'สัญญาณเดียวที่คำนวณอิมพัลส์เรสปอนส์ เวลาเสียงก้อง และการสะท้อนแรก ๆ ได้ เล่นจากคอมพิวเตอร์หรือ DAC ออกลำโพง ให้โทรศัพท์อัดเสียง';

  @override
  String get signalsLength => 'ความยาว';

  @override
  String get signalsFrom => 'จาก';

  @override
  String get signalsTo => 'ถึง';

  @override
  String get signalsMonoNoChannel => 'โมโน (ไม่มีแชนเนล)';

  @override
  String get signalsExportWav => 'ส่งออก WAV';

  @override
  String get signalsPinkNoise => 'พิงก์นอยส์';

  @override
  String get signalsPinkHelp =>
      'พลังงานเท่ากันในทุกอ็อกเทฟ ให้ได้แค่การตอบสนองความถี่ ไม่มีเวลาและไม่มีการสะท้อน — พอสำหรับเช็กเร็ว ๆ ว่า \"มีอะไรเปลี่ยนไหม\"';

  @override
  String get signalsExportPink => 'ส่งออก WAV 30 วินาที';

  @override
  String get signalsHowTo => 'วิธีวัด';

  @override
  String get signalsStep1 =>
      'เล่นสัญญาณจากคอมพิวเตอร์ออกลำโพง ไม่ใช่จากโทรศัพท์';

  @override
  String get signalsStep2 =>
      'ตั้งความดังให้เครื่องวิเคราะห์แสดงราว −20 dBFS สัญญาณเกินจะดูเหมือนการสะท้อน';

  @override
  String get signalsStep3 =>
      'ถือโทรศัพท์ตั้งตรง เหยียดแขน ให้ไมโครโฟนหันไปทางลำโพง';

  @override
  String get signalsStep4 =>
      'ถอดหูฟังบลูทูธ — การบีบอัดและความหน่วงทำให้การวัดเสียหาย';

  @override
  String get signalsNoteMono =>
      'ส่งโมโนไปลำโพงทั้งสองพร้อมกันจะรวม L กับ R และส่วนต่างของทั้งสองจะหายไปในผลรวม ถ้าจะวัดแชนเนล ให้เลือกแชนเนล';

  @override
  String get signalsNoteStereo =>
      'ไฟล์สเตอริโอที่มีสัญญาณในแชนเนลเดียว — อุปกรณ์ใดที่เล่นสเตอริโอได้ก็เล่นได้';

  @override
  String get signalsNoteChannel =>
      'ไฟล์โมโนที่ตั้งชื่อตามแชนเนล ส่งไปยังอินพุตที่ถูกต้องของเครื่องรับจาก DAW หรืออินพุตหลายแชนเนล แล็ปท็อปที่มีเอาต์พุตสเตอริโอส่งมาที่แชนเนลนี้ไม่ได้';

  @override
  String get channelsTitle => 'การวัดแชนเนล';

  @override
  String get channelsHelp =>
      'ยืนที่ตำแหน่งนั่งฟัง สำหรับแต่ละแชนเนล: เริ่มอัด เล่นสวีปจากแท็บสัญญาณเข้าไป แล้วแตะเสร็จสิ้น ถ้าไม่มีจุดเหล่านี้ การออกแบบจะสร้าง EQ และระดับเสียงไม่ได้';

  @override
  String channelsSweepLength(int seconds) {
    return 'สวีป $seconds วินาที';
  }

  @override
  String get channelsVerifyAfterEq => 'ตรวจสอบหลังป้อน EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'จุดจะถูกบันทึกเป็น \"หลัง EQ\" และไม่เขียนทับจุดที่ใช้คำนวณ EQ';

  @override
  String channelsRecording(String seconds) {
    return 'กำลังอัด $seconds วินาที — เล่นสวีปเดี๋ยวนี้';
  }

  @override
  String get channelsNotMeasured => 'ยังไม่ได้วัด';

  @override
  String get channelsMeasuredNoise => 'วัดด้วยนอยส์แล้ว';

  @override
  String channelsSummary(int count, String ms) {
    return '$count ครั้ง · เสียงตรงมาถึงใน $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count ครั้ง · เสียงตรงมาถึงใน $ms ms, T20 $t20 วินาที';
  }

  @override
  String get commonDone => 'เสร็จสิ้น';

  @override
  String get channelsMeasure => 'วัด';

  @override
  String get channelsAdd => 'เพิ่ม';

  @override
  String get channelsAgain => 'อีกครั้ง';

  @override
  String get compareTitle => 'เปรียบเทียบ';

  @override
  String get compareNeedsTwoPoints => 'การเปรียบเทียบต้องมีอย่างน้อยสองจุด';

  @override
  String get commonWithRoom => 'รวมห้อง';

  @override
  String get commonDirectSound => 'เสียงตรง';

  @override
  String get compareAfterEq => 'หลัง EQ';

  @override
  String get compareBandsA => 'A (แถบความถี่)';

  @override
  String get compareBandsB => 'B (แถบความถี่)';

  @override
  String get compareArrivalDiff => 'ผลต่างเวลามาถึง A − B';

  @override
  String get compareBroadbandDiff => 'ผลต่างระดับเต็มย่านความถี่ A − B';

  @override
  String get compareWorstBelow300 => 'ผลต่างมากสุดต่ำกว่า 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB ในแถบ $band Hz';
  }

  @override
  String get compareTrimNote =>
      'ดิสแทนซ์และเลเวลทริมช่วยปรับผลต่างเวลามาถึงและระดับให้ตรงกัน แต่ไม่ปรับผลต่างรูปร่างต่ำกว่า 300 Hz ซึ่งเกิดจากผนังคนละด้านที่ระยะต่างกัน ต้องแก้ด้วยการขยับตำแหน่ง';

  @override
  String get designRt60Live => 'T20 125–500 Hz จากการตอบสนองล่าสุด';

  @override
  String get designRt60Stored => 'T20 125–500 Hz จากสวีปที่บันทึกไว้';

  @override
  String get designRt60Guess =>
      'ค่าประมาณ — วัดสวีปก่อน ความถี่ชโรเดอร์ตอนนี้เป็นแค่คำแนะนำ';

  @override
  String get designExportTooltip => 'ส่งออกการตั้งค่า';

  @override
  String get designCompute => 'คำนวณการออกแบบ';

  @override
  String get designLidarChecking => 'กำลังตรวจว่ามี LiDAR หรือไม่…';

  @override
  String get designLidarAvailable => 'มี LiDAR';

  @override
  String get designLidarMissing => 'ไม่มี LiDAR — ป้อนขนาดเอง';

  @override
  String get designLidarHint =>
      'การสแกนให้ผนังแม่นถึงเซนติเมตร จุดสะท้อนและระยะถึงขอบเขตจึงตรงด้วย ไม่ใช่แค่โหมด';

  @override
  String get designManualHint =>
      'การคำนวณโหมดใช้ตัวเลขแค่สามตัว แต่คุณจะเสียจุดสะท้อนและระยะที่แม่นถึงผนัง';

  @override
  String get designStopScan => 'จบการสแกน';

  @override
  String get designScanRoom => 'สแกนห้อง';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: 'ผนัง $walls ด้าน',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: 'ช่องเปิด $openings จุด',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'ขนาดห้อง';

  @override
  String get designLength => 'ความยาว';

  @override
  String get designWidth => 'ความกว้าง';

  @override
  String get designHeight => 'ความสูง';

  @override
  String get designWhatToDo => 'ควรทำอย่างไร';

  @override
  String get designRoomModes => 'โหมดห้อง';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'เหนือ $schroeder Hz (ชโรเดอร์) โหมดเดี่ยว ๆ ไม่มีความหมายแล้ว RT60 $rt60 วินาที: $source';
  }

  @override
  String get designEqTitle => 'EQ: วัดได้ เป้าหมาย การคาดการณ์';

  @override
  String get designEqHelp =>
      'การคาดการณ์คือการตอบสนองที่วัดได้บวกแบบจำลองสิบห้าแถบของเครื่องรับ หลังป้อน EQ ให้วัดแชนเนลอีกครั้งโดยเปิดสวิตช์ \"หลัง EQ\" เพื่อดูว่าแบบจำลองใกล้เคียงเพียงใด';

  @override
  String get designReceiverConfig => 'การตั้งค่าเครื่องรับ';

  @override
  String get designGeometryOnly =>
      'ถ้ายังไม่ได้วัดแชนเนลด้วยสวีป จะมีแค่เรขาคณิต: ระยะและความถี่ครอสโอเวอร์ EQ และระดับเสียงจะเพิ่มเมื่อมีจุดของแต่ละแชนเนล';

  @override
  String get designShareSubject => 'ข้อเสนอการตั้งค่า';

  @override
  String get impulseTitle => 'อิมพัลส์เรสปอนส์';

  @override
  String get impulseCompareTooltip => 'เปรียบเทียบจุด';

  @override
  String get impulseExportTooltip => 'ส่งออก FRD พร้อมเฟส';

  @override
  String get impulseTapToStart => 'แตะเพื่อเริ่ม';

  @override
  String get impulseSweepTitle => 'สวีปที่จะเล่นออกลำโพง';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds วินาที ต้องตรงกับที่คุณเล่น — ไม่เช่นนั้นดีคอนโวลูชันจะให้ผลที่ไร้ความหมาย';
  }

  @override
  String impulseRecording(String seconds) {
    return 'กำลังอัด — $seconds วินาที';
  }

  @override
  String get impulsePlaySweepNow => 'เล่นสวีปจากคอมพิวเตอร์เดี๋ยวนี้';

  @override
  String get impulseStartRecording => 'เริ่มอัด แล้วค่อยเล่นสวีป';

  @override
  String get impulseFrequencyResponse => 'การตอบสนองความถี่';

  @override
  String get impulseWithRoom => 'รวมห้อง (1 วินาที)';

  @override
  String impulseDirectWindow(String ms) {
    return 'เสียงตรง (หน้าต่าง $ms ms)';
  }

  @override
  String get impulseWindow => 'หน้าต่าง';

  @override
  String impulseWindowHelp(String hz) {
    return 'หน้าต่างยาวขึ้นเห็นความถี่ต่ำลง (ตอนนี้ใช้ได้เหนือ $hz Hz) แต่ก็รับการสะท้อนแรกเข้ามา ต่ำกว่าขอบเขตนี้เส้นโค้งไม่ถูกทำให้เรียบและไม่มีคำวิจารณ์: นี่คือหน้าต่าง ไม่ใช่ห้อง';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'ถึงการสะท้อนแรก ($ms ms)';
  }

  @override
  String get impulseTime => 'เวลา';

  @override
  String get impulseImpulse => 'อิมพัลส์';

  @override
  String get impulseTimeHelp =>
      'สีน้ำเงินคือหน้าต่าง เส้นสีส้มคือการสะท้อนแรกที่พบ เวลาศูนย์คือเสียงตรง';

  @override
  String get impulseSpectrogram => 'สเปกโทรแกรม';

  @override
  String get commonHide => 'ซ่อน';

  @override
  String get commonShow => 'แสดง';

  @override
  String get impulseSpectrogramHelp =>
      'เวลาเป็น ms นับจากเสียงตรง ความถี่ขึ้นด้านบน สีคือระดับลงไปถึง −60 dB แถบแนวนอนที่ยังอยู่เมื่ออย่างอื่นหายไปคือโหมด ตารางด้านบนบอกเรื่องเดียวกันเป็นตัวเลข';

  @override
  String get impulseDecayByOctave => 'การสลายตามอ็อกเทฟ';

  @override
  String get impulseMidNoT20 => 'ย่านกลางลดลงไม่พอสำหรับ T20';

  @override
  String impulseMidT20(String seconds) {
    return 'ย่านกลาง 125–500 Hz: T20 $seconds วินาที — นี่คือ RT60 ที่การออกแบบใช้';
  }

  @override
  String get impulseDecayHelp =>
      'ที่เสียงเบส RT60 จากโทรศัพท์เป็นเพียงค่าประมาณ: นอยส์พื้นหลังอยู่ใกล้ที่สุด และ \"—\" หมายความว่าเสียงก้องไม่ลดต่ำกว่านั้น C50 สูงกว่าศูนย์: เสียงตรงรวมการสะท้อนแรก ๆ มีพลังงานมากกว่าเสียงก้อง';

  @override
  String get impulseResult => 'ผลลัพธ์';

  @override
  String get impulseDirectArrived => 'เสียงตรงมาถึงใน';

  @override
  String get impulseDirectArrivedHelp =>
      'ความหน่วงการเล่นบวกเวลาเดินทาง — ตัวมันเองไม่ได้บอกอะไร แต่ส่วนต่างระหว่างลำโพง L กับ R บอกได้';

  @override
  String get impulseFirstReflection => 'การสะท้อนแรก';

  @override
  String get impulseNotFound => 'ไม่พบ';

  @override
  String impulseAfterDirect(String time) {
    return '$time หลังเสียงตรง';
  }

  @override
  String get impulseNoReflectionHelp =>
      'อาจไม่มีเลย หรือไม่ก็ซ่อนอยู่ในเสียงสั่นของอิมพัลส์ตรง';

  @override
  String impulseExtraPath(String metres) {
    return 'เส้นทางที่เพิ่ม ≈ $metres ม.';
  }

  @override
  String get impulseUnmeasurable => 'วัดไม่ได้';

  @override
  String get impulseRt60NoiseHelp =>
      'เสียงก้องลดลงไม่ลึกพอเหนือนอยส์พื้นหลัง — เพิ่มความดัง หรือวัดตอนเงียบกว่านี้';

  @override
  String get impulseRt60Help =>
      'ส่วนต่างระหว่าง T20 กับ T30 บอกว่าการสลายสะอาดเพียงใด';

  @override
  String get impulseGating => 'หน้าต่าง (เกทติ้ง)';

  @override
  String impulseValidAbove(String hz) {
    return 'ใช้ได้เหนือ $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'ต่ำกว่านี้หน้าต่างมองไม่เห็นแม้แต่หนึ่งคาบ — เส้นโค้งตรงนั้นเป็นสิ่งแปลกปลอมของหน้าต่าง ไม่ใช่ของห้อง';

  @override
  String get impulseSchroeder => 'เส้นโค้งการสลายของชโรเดอร์';

  @override
  String impulseHdAt(int order) {
    return 'HD$order ที่ 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'ฮาร์โมนิกอยู่ในเวลาลบของดีคอนโวลูชันแบบฟารินา ที่นี่อ่านจากตรงนั้นแทนที่จะทิ้ง −40 dB คือ 1 %';

  @override
  String get impulseHd3Help =>
      'ฮาร์โมนิกที่สามโตตามสัญญาณเกินเร็วกว่าฮาร์โมนิกที่สอง';

  @override
  String get impulseDistortionHot => 'ความผิดเพี้ยนเกิน −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'สวีปดังเกินไป หรือลำโพงถึงขีดสุดแล้ว หางของความผิดเพี้ยนในอิมพัลส์ดูเหมือนการสะท้อน — ลดความดังแล้ววัดใหม่ก่อนเชื่ออะไร';

  @override
  String get eqMeasured => 'วัดได้';

  @override
  String get eqTarget => 'เป้าหมาย';

  @override
  String get eqPredicted => 'คาดการณ์หลัง EQ';

  @override
  String get eqMeasuredAfter => 'วัดได้หลัง EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'ส่วนเบี่ยงเบนจากเป้าหมาย 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'หลังป้อนเข้าเครื่องรับ';

  @override
  String get eqPredictionVsReality => 'การคาดการณ์เทียบกับความจริง';

  @override
  String eqStubborn(String bands) {
    return 'จะยังห่างจากเป้าหมายเกิน 6 dB: $bands นี่คือการแทรกสอด ไม่ใช่กำลังไม่พอ — แก้ด้วยการขยับลำโพงหรือผู้ฟัง ไม่ใช่การยกเพิ่ม';
  }

  @override
  String get eqModelOk => 'ฟิลเตอร์ของเครื่องรับทำงานใกล้เคียงกับแบบจำลอง';

  @override
  String get eqModelOff =>
      'ฟิลเตอร์จริงของเครื่องรับต่างจากแบบจำลองมากกว่าที่คาด — แถบความถี่ของมันน่าจะกว้างหรือแคบกว่าที่สมมติไว้ที่นี่';

  @override
  String get eqTargetCurve => 'เส้นโค้งเป้าหมาย';

  @override
  String get eqFlat => 'ราบ';

  @override
  String get eqTargetHelp =>
      'ไม่ราบ: เหนือไม่กี่ kHz หูได้ยินเสียงตรง ส่วนไมโครโฟนรวมการสะท้อนด้วย และเส้นโค้งที่วัดได้เมื่อปรับให้ราบจะฟังทึบ ความลาดเอียงเล็กน้อยที่ย่านสูงกับเบสยกขึ้นนิดหน่อยคือสิ่งที่คนเลือกในการฟังแบบปิดตา';

  @override
  String get eqBassLift => 'ยกเบส';

  @override
  String get eqBassBelow => 'เบสต่ำกว่า';

  @override
  String get eqTilt => 'ความลาดเอียง';

  @override
  String get eqDbPerOctave => 'dB/อ็อกเทฟ';

  @override
  String get eqTiltFrom => 'ความลาดเอียงตั้งแต่';

  @override
  String get errorMicPermission =>
      'ถ้าไม่ได้รับอนุญาตให้ใช้ไมโครโฟน จะวัดไม่ได้ อนุญาตได้ที่ การตั้งค่า → AudioScanner → ไมโครโฟน';

  @override
  String errorMic(String error) {
    return 'ไมโครโฟน: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'เริ่มไมโครโฟนไม่สำเร็จ: $error';
  }

  @override
  String get errorNoArkit =>
      'อุปกรณ์นี้ไม่รองรับ ARKit world tracking — วางจุดในพื้นที่ไม่ได้';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'การอัดสั้นกว่าสวีป ($recorded วินาทีจาก $expected วินาที) เริ่มอัดก่อนจะเล่นสัญญาณ';
  }

  @override
  String get sessionSnapshots => 'สแนปช็อต';

  @override
  String get errorTrackingUnreliable =>
      'การติดตามตำแหน่งไม่น่าเชื่อถือ — จุดอาจไม่ตรงกับที่คุณยืนอยู่';

  @override
  String errorNoSound(int seconds) {
    return 'ไม่มีเสียงมาถึงภายใน $seconds วินาที';
  }

  @override
  String get noteSnapshotNoPose => 'สแนปช็อตจากเครื่องวิเคราะห์ ไม่มีตำแหน่ง';

  @override
  String get sessionChannels => 'แชนเนล';

  @override
  String get trackingOk => 'ติดตามปกติ';

  @override
  String get trackingLimited => 'ติดตามอ่อน';

  @override
  String get trackingUnavailable => 'ไม่มีการติดตาม';

  @override
  String get poseHintFeatures =>
      'ภาพมีรายละเอียดน้อยเกินไป — หันโทรศัพท์ไปที่สิ่งที่มีพื้นผิวหลากหลาย ไม่ใช่ผนังเปล่า';

  @override
  String get poseHintMotion => 'เคลื่อนที่เร็วเกินไป — ไปช้าลง';

  @override
  String get poseHintLight => 'แสงน้อย — เปิดไฟ กล้องมองไม่เห็นว่าอยู่ที่ไหน';

  @override
  String get poseHintInitializing => 'ARKit กำลังเริ่มทำงาน เดินไปมาสักครู่';

  @override
  String get poseHintRelocalizing => 'กำลังหาจุดเดิม — กลับไปที่ที่คุณเริ่ม';

  @override
  String get signalPhonePink => 'พิงก์นอยส์จากโทรศัพท์';

  @override
  String get signalExternalPink => 'พิงก์นอยส์จากลำโพง';

  @override
  String get signalExternalSweep => 'สวีปจากลำโพง';

  @override
  String get captureWarningBluetooth =>
      'ไมโครโฟนบลูทูธ: การบีบอัดและความหน่วงทำให้การวัดเสียหาย ถอดหูฟังแล้ววัดด้วยไมโครโฟนในตัว';

  @override
  String get captureWarningProcessing =>
      'ระบบไม่ได้ปิดการประมวลผลสัญญาณ (AGC / ลดนอยส์) ผลต่างที่วัดได้ระหว่างจุดจะเพี้ยน';

  @override
  String get captureWarningMeasurementMode =>
      'เปิดโหมดการวัดไม่สำเร็จ — ไมโครโฟนมีการแก้การตอบสนองความถี่ของตัวเอง';

  @override
  String get captureRouteUnknown => 'ไม่ทราบ';

  @override
  String get axisLength => 'ความยาว';

  @override
  String get axisWidth => 'ความกว้าง';

  @override
  String get axisHeight => 'ความสูง';
}
