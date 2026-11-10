// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get tabScan => '扫描';

  @override
  String get tabMap => '地图';

  @override
  String get tabResponse => '响应';

  @override
  String get tabDesign => '设计';

  @override
  String get tabSignals => '信号';

  @override
  String get rtaSnapshotFailed => '快照未能保存。';

  @override
  String rtaSavedAsPoint(String id) {
    return '已保存为点 $id。';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return '已保存为点 $id（无位置）。';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个点',
    );
    return '校准 $name：$_temp0，$min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return '无法读取文件：$message';
  }

  @override
  String get rtaOffsetTitle => '偏移 dB SPL';

  @override
  String get rtaOffsetHelp =>
      '播放 1 kHz 音调，在声压计上读出电平，然后输入它与分析仪显示值之间的差。偏移不为零时，电平会标为估计的 SPL；为零时仍为 dBFS。';

  @override
  String get commonReset => '重置';

  @override
  String get commonCancel => '取消';

  @override
  String get commonSave => '保存';

  @override
  String get commonStop => '停止';

  @override
  String get commonStartMic => '启动麦克风';

  @override
  String get tabAnalyzer => '分析仪';

  @override
  String get rtaUnfreeze => '取消冻结';

  @override
  String get rtaFreeze => '冻结';

  @override
  String get rtaPeakHold => '峰值保持';

  @override
  String get rtaMaxMinTraces => '最大 / 最小轨迹';

  @override
  String get rtaResetTraces => '重置轨迹';

  @override
  String get rtaSaveAsPoint => '保存为点（3 秒）';

  @override
  String get rtaMicCalibration => '麦克风校准…';

  @override
  String get rtaRemoveCalibration => '移除校准';

  @override
  String get rtaOffsetMenu => '偏移 dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · 无信号处理';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 个点',
    );
    return '校准 $name：$_temp0，修正 $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL（估计）';

  @override
  String get rtaFrozenHint => '已冻结 — 麦克风仍在运行，只是不再绘制。';

  @override
  String get rtaRelativeHint => '电平为相对值（dBFS）。保存第一个点后会出现轮廓，它将作为其他点的参考。';

  @override
  String get rtaReferenceHint => '实心柱 = 此处。轮廓 = 参考点。';

  @override
  String get rtaEnvelopeHint => '红色 = 最大，绿色 = 最小（自重置以来）。';

  @override
  String get rtaMicStopped => '麦克风已停止';

  @override
  String get rtaSilence => '静音 — 信号在播放吗？';

  @override
  String get rtaPlaceholder => '启动麦克风，并向房间播放信号。';

  @override
  String rtaBandsInfo(int count) {
    return '$count 个 1/3 倍频程频段，20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => '房间扫描';

  @override
  String scanPointCount(int count) {
    return '$count 点';
  }

  @override
  String get commonMicNotRunning => '麦克风未运行';

  @override
  String get scanMicNeeded => '没有麦克风时只会测量位置，不会测量声音。';

  @override
  String get scanContinuous => '连续测量';

  @override
  String get scanContinuousHint => '每走 0.5 m 自动记录一个点';

  @override
  String get scanMeasuring => '测量中…';

  @override
  String get scanMeasureHere => '在此测量';

  @override
  String scanPointSaved(String id, String position) {
    return '点 $id 已保存到 $position';
  }

  @override
  String get scanStartTracking => '开始位置跟踪';

  @override
  String get scanStartTrackingHint => 'ARKit — 应用据此知道你在房间中的位置。';

  @override
  String scanPosition(String position) {
    return '位置：距原点 $position m';
  }

  @override
  String get scanSetOriginHint => '站到听音位置，并设定原点。';

  @override
  String get scanOriginHere => '这里是原点';

  @override
  String get scanNoPoints => '还没有点。';

  @override
  String scanPointStats(String variation, String rms) {
    return '40–300 Hz 离散度：$variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => '客厅';

  @override
  String get scanNewMeasurement => '新测量';

  @override
  String get scanRoomName => '房间名称';

  @override
  String get scanExcitation => '用什么激励房间';

  @override
  String get scanPhoneNoiseHint => '仅供参考 — 手机扬声器几乎发不出低音。';

  @override
  String get scanStart => '开始';

  @override
  String get mapExportTooltip => '导出 FRD + JSON';

  @override
  String get mapNeedsTwoPoints => '地图至少需要两个点。请在房间里走动并持续测量。';

  @override
  String get mapShareText => '按点导出的 FRD（可导入 REW / VituixCAD）以及完整会话的 JSON。';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return '最平坦的位置：$id，位于 $position m（40–300 Hz 离散度 $variation dB）';
  }

  @override
  String get signalsSweepHelp =>
      '这是唯一能计算出脉冲响应、混响时间和早期反射的信号。请从电脑或 DAC 经音箱播放，手机负责录音。';

  @override
  String get signalsLength => '时长';

  @override
  String get signalsFrom => '起始';

  @override
  String get signalsTo => '终止';

  @override
  String get signalsMonoNoChannel => '单声道（无声道）';

  @override
  String get signalsExportWav => '导出 WAV';

  @override
  String get signalsPinkNoise => '粉红噪声';

  @override
  String get signalsPinkHelp =>
      '每个倍频程的能量相同。只能得到频率响应，没有时间信息，也没有反射 — 用来快速确认“这里有没有效果？”足够了。';

  @override
  String get signalsExportPink => '导出 30 秒 WAV';

  @override
  String get signalsHowTo => '如何测量';

  @override
  String get signalsStep1 => '信号请从电脑经音箱播放，不要从手机播放。';

  @override
  String get signalsStep2 => '调整音量，使分析仪显示约 −20 dBFS。过载看起来像反射。';

  @override
  String get signalsStep3 => '竖直持握手机，手臂伸直，麦克风朝向音箱。';

  @override
  String get signalsStep4 => '断开蓝牙耳机 — 压缩和延迟会破坏测量。';

  @override
  String get signalsNoteMono =>
      '将单声道同时送到两只音箱，L 和 R 会相加，它们的差异就会在和中消失。要测量某个声道，请选择该声道。';

  @override
  String get signalsNoteStereo => '仅在一个声道中带有信号的立体声文件 — 任何能播放立体声的设备都可以播放。';

  @override
  String get signalsNoteChannel =>
      '按声道命名的单声道文件。请通过 DAW 或多声道输入把它送到接收机的正确输入；只有立体声输出的笔记本无法把它送到这个声道。';

  @override
  String get channelsTitle => '声道测量';

  @override
  String get channelsHelp =>
      '站在听音位置。对每个声道：开始录音，从“信号”标签播放扫频，点“完成”。没有这些点，设计就无法生成 EQ 和音量。';

  @override
  String channelsSweepLength(int seconds) {
    return '扫频 $seconds 秒';
  }

  @override
  String get channelsVerifyAfterEq => '输入 EQ 后验证';

  @override
  String get channelsVerifyAfterEqHint => '该点会保存为“EQ 后”，不会覆盖用来计算 EQ 的那个点。';

  @override
  String channelsRecording(String seconds) {
    return '正在录音 $seconds 秒 — 现在播放扫频';
  }

  @override
  String get channelsNotMeasured => '未测量';

  @override
  String get channelsMeasuredNoise => '已用噪声测量';

  @override
  String channelsSummary(int count, String ms) {
    return '$count 次 · 直达声 $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count 次 · 直达声 $ms ms，T20 $t20 秒';
  }

  @override
  String get commonDone => '完成';

  @override
  String get channelsMeasure => '测量';

  @override
  String get channelsAdd => '添加';

  @override
  String get channelsAgain => '重来';

  @override
  String get compareTitle => '对比';

  @override
  String get compareNeedsTwoPoints => '对比至少需要两个点。';

  @override
  String get commonWithRoom => '含房间';

  @override
  String get commonDirectSound => '直达声';

  @override
  String get compareAfterEq => 'EQ 后';

  @override
  String get compareBandsA => 'A（频段）';

  @override
  String get compareBandsB => 'B（频段）';

  @override
  String get compareArrivalDiff => '到达时间差 A − B';

  @override
  String get compareBroadbandDiff => '宽带电平差 A − B';

  @override
  String get compareWorstBelow300 => '300 Hz 以下的最大差异';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz 频段 $db dB';
  }

  @override
  String get compareTrimNote =>
      '距离和电平微调可以对齐到达时间和电平的差异，但无法对齐 300 Hz 以下的形状差异 — 那是不同距离上的不同墙面造成的，需要通过移动位置来解决。';

  @override
  String get designRt60Live => '最近一次响应的 T20 125–500 Hz';

  @override
  String get designRt60Stored => '已保存扫频的 T20 125–500 Hz';

  @override
  String get designRt60Guess => '估计值 — 请测量扫频，施罗德频率目前只是提示';

  @override
  String get designExportTooltip => '导出配置';

  @override
  String get designCompute => '计算设计';

  @override
  String get designLidarChecking => '正在检测是否有 LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR 可用';

  @override
  String get designLidarMissing => '无 LiDAR — 请手动输入尺寸';

  @override
  String get designLidarHint => '扫描能把墙面精确到厘米，因此反射点和到边界的距离也准确，而不仅是模态。';

  @override
  String get designManualHint => '模态计算只需要三个数字，但你会失去反射点和到墙面的精确距离。';

  @override
  String get designStopScan => '结束扫描';

  @override
  String get designScanRoom => '扫描房间';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls 面墙',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings 个开口',
    );
    return '$_temp0，$_temp1';
  }

  @override
  String get designRoomDimensions => '房间尺寸';

  @override
  String get designLength => '长';

  @override
  String get designWidth => '宽';

  @override
  String get designHeight => '高';

  @override
  String get designWhatToDo => '该怎么办';

  @override
  String get designRoomModes => '房间模态';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '在施罗德频率 $schroeder Hz 以上，单个模态已无意义。RT60 $rt60 秒：$source。';
  }

  @override
  String get designEqTitle => 'EQ：测量、目标、预测';

  @override
  String get designEqHelp =>
      '预测值是测得的响应加上接收机十五频段的模型。输入 EQ 后，请打开“EQ 后”开关重新测量该声道，以看出模型有多接近。';

  @override
  String get designReceiverConfig => '接收机配置';

  @override
  String get designGeometryOnly =>
      '没有用扫频测量声道时，这里只有几何信息：距离和分频点。EQ 和音量会在有了每个声道的点之后加入。';

  @override
  String get designShareSubject => '配置建议';

  @override
  String get impulseTitle => '脉冲响应';

  @override
  String get impulseCompareTooltip => '对比各点';

  @override
  String get impulseExportTooltip => '导出带相位的 FRD';

  @override
  String get impulseTapToStart => '点按开始。';

  @override
  String get impulseSweepTitle => '要从音箱播放的扫频';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz，$seconds 秒。必须与你播放的内容一致 — 否则反卷积会得出无意义的结果。';
  }

  @override
  String impulseRecording(String seconds) {
    return '正在录音 — $seconds 秒';
  }

  @override
  String get impulsePlaySweepNow => '现在请从电脑播放扫频。';

  @override
  String get impulseStartRecording => '先开始录音，再播放扫频';

  @override
  String get impulseFrequencyResponse => '频率响应';

  @override
  String get impulseWithRoom => '含房间（1 秒）';

  @override
  String impulseDirectWindow(String ms) {
    return '直达声（窗口 $ms ms）';
  }

  @override
  String get impulseWindow => '窗口';

  @override
  String impulseWindowHelp(String hz) {
    return '窗口越长，能看到的频率越低（目前在 $hz Hz 以上有效），但会混入第一次反射。低于这个界限，曲线不做平滑也不作评论：看到的是窗口，而不是房间。';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return '到第一次反射（$ms ms）';
  }

  @override
  String get impulseTime => '时间';

  @override
  String get impulseImpulse => '脉冲';

  @override
  String get impulseTimeHelp => '蓝色是窗口，橙色线是找到的第一次反射。时间零点是直达声。';

  @override
  String get impulseSpectrogram => '声谱图';

  @override
  String get commonHide => '隐藏';

  @override
  String get commonShow => '显示';

  @override
  String get impulseSpectrogramHelp =>
      '从直达声起算的时间（ms），频率向上，颜色是低至 −60 dB 的电平。其他成分消失后仍留下的水平条带就是模态；上方的表格用数字说明同一件事。';

  @override
  String get impulseDecayByOctave => '按倍频程的衰减';

  @override
  String get impulseMidNoT20 => '中频段衰减得还不够，无法得到 T20。';

  @override
  String impulseMidT20(String seconds) {
    return '中频 125–500 Hz：T20 $seconds 秒 — 设计使用的就是这个 RT60。';
  }

  @override
  String get impulseDecayHelp =>
      '在低频，手机测得的 RT60 更像是估计：背景噪声在那里最接近，“—”表示混响没有衰减到它以下。C50 大于零：直达声加早期反射携带的能量多于混响。';

  @override
  String get impulseResult => '结果';

  @override
  String get impulseDirectArrived => '直达声到达于';

  @override
  String get impulseDirectArrivedHelp =>
      '播放延迟加传播时间 — 本身说明不了什么，但 L 与 R 音箱之间的差值有意义。';

  @override
  String get impulseFirstReflection => '第一次反射';

  @override
  String get impulseNotFound => '未找到';

  @override
  String impulseAfterDirect(String time) {
    return '直达声之后 $time';
  }

  @override
  String get impulseNoReflectionHelp => '要么没有反射，要么藏在直达脉冲的振铃里。';

  @override
  String impulseExtraPath(String metres) {
    return '额外路程 ≈ $metres m。';
  }

  @override
  String get impulseUnmeasurable => '无法测量';

  @override
  String get impulseRt60NoiseHelp => '混响没有衰减到足够高于背景噪声的位置 — 请提高音量，或在更安静的时候测量。';

  @override
  String get impulseRt60Help => 'T20 与 T30 的差异说明衰减有多干净。';

  @override
  String get impulseGating => '窗口（加窗）';

  @override
  String impulseValidAbove(String hz) {
    return '在 $hz Hz 以上有效';
  }

  @override
  String get impulseGatingHelp => '低于这个值，窗口连一个周期都看不到 — 那里的曲线是窗口的伪影，不是房间。';

  @override
  String get impulseSchroeder => '施罗德衰减曲线';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz 处的 HD$order';
  }

  @override
  String get impulseHd2Help => '谐波位于法里纳反卷积的负时间部分；这里读取它们，而不是丢弃。−40 dB 即 1 %。';

  @override
  String get impulseHd3Help => '三次谐波随过载增长得比二次谐波更快。';

  @override
  String get impulseDistortionHot => '失真超过 −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      '要么扫频音量太大，要么音箱已到极限。失真的拖尾在脉冲中看起来像反射 — 先降低音量重新测量，再下结论。';

  @override
  String get eqMeasured => '测量';

  @override
  String get eqTarget => '目标';

  @override
  String get eqPredicted => 'EQ 后预测';

  @override
  String get eqMeasuredAfter => 'EQ 后测量';

  @override
  String eqDeviation(int maxHz) {
    return '与目标的偏差 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => '输入接收机后';

  @override
  String get eqPredictionVsReality => '预测与实际';

  @override
  String eqStubborn(String bands) {
    return '与目标的差距仍将超过 6 dB：$bands。这是干涉，不是功率不足 — 要靠移动音箱或听音者来解决，而不是再提升。';
  }

  @override
  String get eqModelOk => '接收机的滤波器表现大致与模型一致。';

  @override
  String get eqModelOff => '接收机的实际滤波器与模型的差异超出预期 — 它的频段可能比这里假设的更宽或更窄。';

  @override
  String get eqTargetCurve => '目标曲线';

  @override
  String get eqFlat => '平直';

  @override
  String get eqTargetHelp =>
      '不是平直的：在几 kHz 以上，耳朵听到的是直达声，而麦克风会把反射也加在一起，把测得的曲线拉平后听起来会发闷。高频略微倾斜、低频稍微抬升，是盲听时人们会选的。';

  @override
  String get eqBassLift => '低频提升';

  @override
  String get eqBassBelow => '低频范围低于';

  @override
  String get eqTilt => '倾斜';

  @override
  String get eqDbPerOctave => 'dB/倍频程';

  @override
  String get eqTiltFrom => '倾斜起点';

  @override
  String get errorMicPermission =>
      '没有麦克风权限就无法测量。请在 设置 → AudioScanner → 麦克风 中允许。';

  @override
  String errorMic(String error) {
    return '麦克风：$error';
  }

  @override
  String errorMicStart(String error) {
    return '无法启动麦克风：$error';
  }

  @override
  String get errorNoArkit => '此设备不支持 ARKit 世界跟踪 — 无法把点放置到空间中。';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return '录音比扫频短（$expected 秒中的 $recorded 秒）。请在播放信号之前开始录音。';
  }

  @override
  String get sessionSnapshots => '快照';

  @override
  String get errorTrackingUnreliable => '位置跟踪不可靠 — 该点可能与你所站的位置不符。';

  @override
  String errorNoSound(int seconds) {
    return '$seconds 秒内没有收到任何声音。';
  }

  @override
  String get noteSnapshotNoPose => '来自分析仪的快照，无位置';

  @override
  String get sessionChannels => '声道';

  @override
  String get trackingOk => '跟踪正常';

  @override
  String get trackingLimited => '跟踪较弱';

  @override
  String get trackingUnavailable => '无跟踪';

  @override
  String get poseHintFeatures => '画面细节太少 — 请把手机对准有层次的物体，不要对着空白墙面。';

  @override
  String get poseHintMotion => '移动太快 — 请慢一点。';

  @override
  String get poseHintLight => '光线太暗 — 请开灯，相机看不清自己在哪里。';

  @override
  String get poseHintInitializing => 'ARKit 正在启动，请先移动一会儿。';

  @override
  String get poseHintRelocalizing => '正在寻找原来的点 — 请回到出发的地方。';

  @override
  String get signalPhonePink => '手机粉红噪声';

  @override
  String get signalExternalPink => '音箱粉红噪声';

  @override
  String get signalExternalSweep => '音箱扫频';

  @override
  String get captureWarningBluetooth => '蓝牙麦克风：压缩和延迟会破坏测量。请断开耳机，使用内置麦克风测量。';

  @override
  String get captureWarningProcessing => '系统没有关闭信号处理（AGC / 降噪）。各点之间测得的差异会失真。';

  @override
  String get captureWarningMeasurementMode => '无法开启测量模式 — 麦克风带有自己的频率响应修正。';

  @override
  String get captureRouteUnknown => '未知';

  @override
  String get axisLength => '长';

  @override
  String get axisWidth => '宽';

  @override
  String get axisHeight => '高';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get tabScan => '掃描';

  @override
  String get tabMap => '地圖';

  @override
  String get tabResponse => '響應';

  @override
  String get tabDesign => '設計';

  @override
  String get tabSignals => '訊號';

  @override
  String get rtaSnapshotFailed => '快照未能儲存。';

  @override
  String rtaSavedAsPoint(String id) {
    return '已儲存為點 $id。';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return '已儲存為點 $id（無位置）。';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個點',
    );
    return '校正 $name：$_temp0，$min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return '無法讀取檔案：$message';
  }

  @override
  String get rtaOffsetTitle => '偏移 dB SPL';

  @override
  String get rtaOffsetHelp =>
      '播放 1 kHz 音調，在聲壓計上讀出位準，然後輸入它與分析儀顯示值之間的差。偏移不為零時，位準會標為估計的 SPL；為零時仍為 dBFS。';

  @override
  String get commonReset => '重設';

  @override
  String get commonCancel => '取消';

  @override
  String get commonSave => '儲存';

  @override
  String get commonStop => '停止';

  @override
  String get commonStartMic => '啟動麥克風';

  @override
  String get tabAnalyzer => '分析儀';

  @override
  String get rtaUnfreeze => '取消凍結';

  @override
  String get rtaFreeze => '凍結';

  @override
  String get rtaPeakHold => '峰值保持';

  @override
  String get rtaMaxMinTraces => '最大 / 最小軌跡';

  @override
  String get rtaResetTraces => '重設軌跡';

  @override
  String get rtaSaveAsPoint => '儲存為點（3 秒）';

  @override
  String get rtaMicCalibration => '麥克風校正…';

  @override
  String get rtaRemoveCalibration => '移除校正';

  @override
  String get rtaOffsetMenu => '偏移 dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · 無訊號處理';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 個點',
    );
    return '校正 $name：$_temp0，修正 $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL（估計）';

  @override
  String get rtaFrozenHint => '已凍結 — 麥克風仍在運作，只是不再繪製。';

  @override
  String get rtaRelativeHint => '位準為相對值（dBFS）。儲存第一個點後會出現輪廓，它將作為其他點的參考。';

  @override
  String get rtaReferenceHint => '實心柱 = 此處。輪廓 = 參考點。';

  @override
  String get rtaEnvelopeHint => '紅色 = 最大，綠色 = 最小（自重設以來）。';

  @override
  String get rtaMicStopped => '麥克風已停止';

  @override
  String get rtaSilence => '靜音 — 訊號有在播放嗎？';

  @override
  String get rtaPlaceholder => '啟動麥克風，並向房間播放訊號。';

  @override
  String rtaBandsInfo(int count) {
    return '$count 個 1/3 倍頻程頻段，20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => '房間掃描';

  @override
  String scanPointCount(int count) {
    return '$count 點';
  }

  @override
  String get commonMicNotRunning => '麥克風未運作';

  @override
  String get scanMicNeeded => '沒有麥克風時只會測量位置，不會測量聲音。';

  @override
  String get scanContinuous => '連續測量';

  @override
  String get scanContinuousHint => '每走 0.5 m 自動記錄一個點';

  @override
  String get scanMeasuring => '測量中…';

  @override
  String get scanMeasureHere => '在此測量';

  @override
  String scanPointSaved(String id, String position) {
    return '點 $id 已儲存到 $position';
  }

  @override
  String get scanStartTracking => '開始位置追蹤';

  @override
  String get scanStartTrackingHint => 'ARKit — 應用程式藉此知道你在房間中的位置。';

  @override
  String scanPosition(String position) {
    return '位置：距原點 $position m';
  }

  @override
  String get scanSetOriginHint => '站到聆聽位置，並設定原點。';

  @override
  String get scanOriginHere => '這裡是原點';

  @override
  String get scanNoPoints => '還沒有點。';

  @override
  String scanPointStats(String variation, String rms) {
    return '40–300 Hz 離散度：$variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => '客廳';

  @override
  String get scanNewMeasurement => '新測量';

  @override
  String get scanRoomName => '房間名稱';

  @override
  String get scanExcitation => '用什麼激發房間';

  @override
  String get scanPhoneNoiseHint => '僅供參考 — 手機喇叭幾乎發不出低音。';

  @override
  String get scanStart => '開始';

  @override
  String get mapExportTooltip => '匯出 FRD + JSON';

  @override
  String get mapNeedsTwoPoints => '地圖至少需要兩個點。請在房間裡走動並持續測量。';

  @override
  String get mapShareText => '依點匯出的 FRD（可匯入 REW / VituixCAD）以及完整工作階段的 JSON。';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return '最平坦的位置：$id，位於 $position m（40–300 Hz 離散度 $variation dB）';
  }

  @override
  String get signalsSweepHelp =>
      '這是唯一能計算出脈衝響應、殘響時間和早期反射的訊號。請從電腦或 DAC 經喇叭播放，手機負責錄音。';

  @override
  String get signalsLength => '長度';

  @override
  String get signalsFrom => '起始';

  @override
  String get signalsTo => '終止';

  @override
  String get signalsMonoNoChannel => '單聲道（無聲道）';

  @override
  String get signalsExportWav => '匯出 WAV';

  @override
  String get signalsPinkNoise => '粉紅雜訊';

  @override
  String get signalsPinkHelp =>
      '每個倍頻程的能量相同。只能得到頻率響應，沒有時間資訊，也沒有反射 — 用來快速確認「這裡有沒有效果？」就夠了。';

  @override
  String get signalsExportPink => '匯出 30 秒 WAV';

  @override
  String get signalsHowTo => '如何測量';

  @override
  String get signalsStep1 => '訊號請從電腦經喇叭播放，不要從手機播放。';

  @override
  String get signalsStep2 => '調整音量，使分析儀顯示約 −20 dBFS。過載看起來像反射。';

  @override
  String get signalsStep3 => '直立持握手機，手臂伸直，麥克風朝向喇叭。';

  @override
  String get signalsStep4 => '中斷藍牙耳機 — 壓縮和延遲會破壞測量。';

  @override
  String get signalsNoteMono =>
      '將單聲道同時送到兩只喇叭，L 和 R 會相加，它們的差異就會在和中消失。要測量某個聲道，請選擇該聲道。';

  @override
  String get signalsNoteStereo => '只在一個聲道中帶有訊號的立體聲檔案 — 任何能播放立體聲的裝置都可以播放。';

  @override
  String get signalsNoteChannel =>
      '依聲道命名的單聲道檔案。請透過 DAW 或多聲道輸入把它送到接收機的正確輸入；只有立體聲輸出的筆電無法把它送到這個聲道。';

  @override
  String get channelsTitle => '聲道測量';

  @override
  String get channelsHelp =>
      '站在聆聽位置。對每個聲道：開始錄音，從「訊號」分頁播放掃頻，點「完成」。沒有這些點，設計就無法產生 EQ 和音量。';

  @override
  String channelsSweepLength(int seconds) {
    return '掃頻 $seconds 秒';
  }

  @override
  String get channelsVerifyAfterEq => '輸入 EQ 後驗證';

  @override
  String get channelsVerifyAfterEqHint => '該點會儲存為「EQ 後」，不會覆蓋用來計算 EQ 的那個點。';

  @override
  String channelsRecording(String seconds) {
    return '正在錄音 $seconds 秒 — 現在播放掃頻';
  }

  @override
  String get channelsNotMeasured => '未測量';

  @override
  String get channelsMeasuredNoise => '已用雜訊測量';

  @override
  String channelsSummary(int count, String ms) {
    return '$count 次 · 直達聲 $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count 次 · 直達聲 $ms ms，T20 $t20 秒';
  }

  @override
  String get commonDone => '完成';

  @override
  String get channelsMeasure => '測量';

  @override
  String get channelsAdd => '新增';

  @override
  String get channelsAgain => '重來';

  @override
  String get compareTitle => '比較';

  @override
  String get compareNeedsTwoPoints => '比較至少需要兩個點。';

  @override
  String get commonWithRoom => '含房間';

  @override
  String get commonDirectSound => '直達聲';

  @override
  String get compareAfterEq => 'EQ 後';

  @override
  String get compareBandsA => 'A（頻段）';

  @override
  String get compareBandsB => 'B（頻段）';

  @override
  String get compareArrivalDiff => '到達時間差 A − B';

  @override
  String get compareBroadbandDiff => '寬頻位準差 A − B';

  @override
  String get compareWorstBelow300 => '300 Hz 以下的最大差異';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz 頻段 $db dB';
  }

  @override
  String get compareTrimNote =>
      '距離與位準微調可以對齊到達時間和位準的差異，但無法對齊 300 Hz 以下的形狀差異 — 那是不同距離上的不同牆面造成的，需要透過移動位置來解決。';

  @override
  String get designRt60Live => '最近一次響應的 T20 125–500 Hz';

  @override
  String get designRt60Stored => '已儲存掃頻的 T20 125–500 Hz';

  @override
  String get designRt60Guess => '估計值 — 請測量掃頻，施羅德頻率目前只是提示';

  @override
  String get designExportTooltip => '匯出設定';

  @override
  String get designCompute => '計算設計';

  @override
  String get designLidarChecking => '正在偵測是否有 LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR 可用';

  @override
  String get designLidarMissing => '無 LiDAR — 請手動輸入尺寸';

  @override
  String get designLidarHint => '掃描能把牆面精確到公分，因此反射點和到邊界的距離也準確，而不只是模態。';

  @override
  String get designManualHint => '模態計算只需要三個數字，但你會失去反射點和到牆面的精確距離。';

  @override
  String get designStopScan => '結束掃描';

  @override
  String get designScanRoom => '掃描房間';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls 面牆',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings 個開口',
    );
    return '$_temp0，$_temp1';
  }

  @override
  String get designRoomDimensions => '房間尺寸';

  @override
  String get designLength => '長';

  @override
  String get designWidth => '寬';

  @override
  String get designHeight => '高';

  @override
  String get designWhatToDo => '該怎麼辦';

  @override
  String get designRoomModes => '房間模態';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '在施羅德頻率 $schroeder Hz 以上，單一模態已無意義。RT60 $rt60 秒：$source。';
  }

  @override
  String get designEqTitle => 'EQ：測量、目標、預測';

  @override
  String get designEqHelp =>
      '預測值是測得的響應加上接收機十五頻段的模型。輸入 EQ 後，請開啟「EQ 後」開關重新測量該聲道，以看出模型有多接近。';

  @override
  String get designReceiverConfig => '接收機設定';

  @override
  String get designGeometryOnly =>
      '沒有用掃頻測量聲道時，這裡只有幾何資訊：距離和分頻點。EQ 和音量會在有了每個聲道的點之後加入。';

  @override
  String get designShareSubject => '設定建議';

  @override
  String get impulseTitle => '脈衝響應';

  @override
  String get impulseCompareTooltip => '比較各點';

  @override
  String get impulseExportTooltip => '匯出含相位的 FRD';

  @override
  String get impulseTapToStart => '點一下開始。';

  @override
  String get impulseSweepTitle => '要從喇叭播放的掃頻';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz，$seconds 秒。必須與你播放的內容一致 — 否則反卷積會得出無意義的結果。';
  }

  @override
  String impulseRecording(String seconds) {
    return '正在錄音 — $seconds 秒';
  }

  @override
  String get impulsePlaySweepNow => '現在請從電腦播放掃頻。';

  @override
  String get impulseStartRecording => '先開始錄音，再播放掃頻';

  @override
  String get impulseFrequencyResponse => '頻率響應';

  @override
  String get impulseWithRoom => '含房間（1 秒）';

  @override
  String impulseDirectWindow(String ms) {
    return '直達聲（視窗 $ms ms）';
  }

  @override
  String get impulseWindow => '視窗';

  @override
  String impulseWindowHelp(String hz) {
    return '視窗越長，能看到的頻率越低（目前在 $hz Hz 以上有效），但會混入第一次反射。低於這個界限，曲線不做平滑也不作評論：看到的是視窗，而不是房間。';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return '到第一次反射（$ms ms）';
  }

  @override
  String get impulseTime => '時間';

  @override
  String get impulseImpulse => '脈衝';

  @override
  String get impulseTimeHelp => '藍色是視窗，橘色線是找到的第一次反射。時間零點是直達聲。';

  @override
  String get impulseSpectrogram => '頻譜圖';

  @override
  String get commonHide => '隱藏';

  @override
  String get commonShow => '顯示';

  @override
  String get impulseSpectrogramHelp =>
      '從直達聲起算的時間（ms），頻率向上，顏色是低至 −60 dB 的位準。其他成分消失後仍留下的水平條帶就是模態；上方的表格用數字說明同一件事。';

  @override
  String get impulseDecayByOctave => '依倍頻程的衰減';

  @override
  String get impulseMidNoT20 => '中頻段衰減得還不夠，無法得到 T20。';

  @override
  String impulseMidT20(String seconds) {
    return '中頻 125–500 Hz：T20 $seconds 秒 — 設計使用的就是這個 RT60。';
  }

  @override
  String get impulseDecayHelp =>
      '在低頻，手機測得的 RT60 更像是估計：背景雜訊在那裡最接近，「—」表示殘響沒有衰減到它以下。C50 大於零：直達聲加早期反射攜帶的能量多於殘響。';

  @override
  String get impulseResult => '結果';

  @override
  String get impulseDirectArrived => '直達聲到達於';

  @override
  String get impulseDirectArrivedHelp =>
      '播放延遲加傳播時間 — 本身說明不了什麼，但 L 與 R 喇叭之間的差值有意義。';

  @override
  String get impulseFirstReflection => '第一次反射';

  @override
  String get impulseNotFound => '未找到';

  @override
  String impulseAfterDirect(String time) {
    return '直達聲之後 $time';
  }

  @override
  String get impulseNoReflectionHelp => '要嘛沒有反射，要嘛藏在直達脈衝的振鈴裡。';

  @override
  String impulseExtraPath(String metres) {
    return '額外路程 ≈ $metres m。';
  }

  @override
  String get impulseUnmeasurable => '無法測量';

  @override
  String get impulseRt60NoiseHelp => '殘響沒有衰減到足夠高於背景雜訊的位置 — 請提高音量，或在更安靜的時候測量。';

  @override
  String get impulseRt60Help => 'T20 與 T30 的差異說明衰減有多乾淨。';

  @override
  String get impulseGating => '視窗（加窗）';

  @override
  String impulseValidAbove(String hz) {
    return '在 $hz Hz 以上有效';
  }

  @override
  String get impulseGatingHelp => '低於這個值，視窗連一個週期都看不到 — 那裡的曲線是視窗的偽影，不是房間。';

  @override
  String get impulseSchroeder => '施羅德衰減曲線';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz 處的 HD$order';
  }

  @override
  String get impulseHd2Help => '諧波位於法里納反卷積的負時間部分；這裡讀取它們，而不是丟棄。−40 dB 即 1 %。';

  @override
  String get impulseHd3Help => '三次諧波隨過載增長得比二次諧波更快。';

  @override
  String get impulseDistortionHot => '失真超過 −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      '要嘛掃頻音量太大，要嘛喇叭已到極限。失真的拖尾在脈衝中看起來像反射 — 先降低音量重新測量，再下結論。';

  @override
  String get eqMeasured => '測量';

  @override
  String get eqTarget => '目標';

  @override
  String get eqPredicted => 'EQ 後預測';

  @override
  String get eqMeasuredAfter => 'EQ 後測量';

  @override
  String eqDeviation(int maxHz) {
    return '與目標的偏差 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => '輸入接收機後';

  @override
  String get eqPredictionVsReality => '預測與實際';

  @override
  String eqStubborn(String bands) {
    return '與目標的差距仍將超過 6 dB：$bands。這是干涉，不是功率不足 — 要靠移動喇叭或聆聽者來解決，而不是再提升。';
  }

  @override
  String get eqModelOk => '接收機的濾波器表現大致與模型一致。';

  @override
  String get eqModelOff => '接收機的實際濾波器與模型的差異超出預期 — 它的頻段可能比這裡假設的更寬或更窄。';

  @override
  String get eqTargetCurve => '目標曲線';

  @override
  String get eqFlat => '平直';

  @override
  String get eqTargetHelp =>
      '不是平直的：在幾 kHz 以上，耳朵聽到的是直達聲，而麥克風會把反射也加在一起，把測得的曲線拉平後聽起來會悶。高頻略微傾斜、低頻稍微抬升，是盲聽時人們會選的。';

  @override
  String get eqBassLift => '低頻提升';

  @override
  String get eqBassBelow => '低頻範圍低於';

  @override
  String get eqTilt => '傾斜';

  @override
  String get eqDbPerOctave => 'dB/倍頻程';

  @override
  String get eqTiltFrom => '傾斜起點';

  @override
  String get errorMicPermission =>
      '沒有麥克風權限就無法測量。請在 設定 → AudioScanner → 麥克風 中允許。';

  @override
  String errorMic(String error) {
    return '麥克風：$error';
  }

  @override
  String errorMicStart(String error) {
    return '無法啟動麥克風：$error';
  }

  @override
  String get errorNoArkit => '此裝置不支援 ARKit 世界追蹤 — 無法把點放置到空間中。';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return '錄音比掃頻短（$expected 秒中的 $recorded 秒）。請在播放訊號之前開始錄音。';
  }

  @override
  String get sessionSnapshots => '快照';

  @override
  String get errorTrackingUnreliable => '位置追蹤不可靠 — 該點可能與你所站的位置不符。';

  @override
  String errorNoSound(int seconds) {
    return '$seconds 秒內沒有收到任何聲音。';
  }

  @override
  String get noteSnapshotNoPose => '來自分析儀的快照，無位置';

  @override
  String get sessionChannels => '聲道';

  @override
  String get trackingOk => '追蹤正常';

  @override
  String get trackingLimited => '追蹤較弱';

  @override
  String get trackingUnavailable => '無追蹤';

  @override
  String get poseHintFeatures => '畫面細節太少 — 請把手機對準有層次的物體，不要對著空白牆面。';

  @override
  String get poseHintMotion => '移動太快 — 請慢一點。';

  @override
  String get poseHintLight => '光線太暗 — 請開燈，相機看不清自己在哪裡。';

  @override
  String get poseHintInitializing => 'ARKit 正在啟動，請先移動一會兒。';

  @override
  String get poseHintRelocalizing => '正在尋找原來的點 — 請回到出發的地方。';

  @override
  String get signalPhonePink => '手機粉紅雜訊';

  @override
  String get signalExternalPink => '喇叭粉紅雜訊';

  @override
  String get signalExternalSweep => '喇叭掃頻';

  @override
  String get captureWarningBluetooth => '藍牙麥克風：壓縮和延遲會破壞測量。請中斷耳機，使用內建麥克風測量。';

  @override
  String get captureWarningProcessing => '系統沒有關閉訊號處理（AGC / 降噪）。各點之間測得的差異會失真。';

  @override
  String get captureWarningMeasurementMode => '無法開啟測量模式 — 麥克風帶有自己的頻率響應修正。';

  @override
  String get captureRouteUnknown => '未知';

  @override
  String get axisLength => '長';

  @override
  String get axisWidth => '寬';

  @override
  String get axisHeight => '高';
}
