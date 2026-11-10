// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get tabScan => 'スキャン';

  @override
  String get tabMap => 'マップ';

  @override
  String get tabResponse => 'レスポンス';

  @override
  String get tabDesign => '設計';

  @override
  String get tabSignals => '信号';

  @override
  String get rtaSnapshotFailed => 'スナップショットを保存できませんでした。';

  @override
  String rtaSavedAsPoint(String id) {
    return 'ポイント $id として保存しました。';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'ポイント $id として保存しました（位置なし）。';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 点',
    );
    return 'キャリブレーション $name: $_temp0、$min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'ファイルを読み込めません: $message';
  }

  @override
  String get rtaOffsetTitle => 'オフセット dB SPL';

  @override
  String get rtaOffsetHelp =>
      '1 kHz のトーンを再生し、SPL メーターの値を読み取って、アナライザーの表示との差を入力します。オフセットが 0 以外のとき、レベルは SPL の推定値として表示されます。0 の場合は dBFS のままです。';

  @override
  String get commonReset => 'リセット';

  @override
  String get commonCancel => 'キャンセル';

  @override
  String get commonSave => '保存';

  @override
  String get commonStop => '停止';

  @override
  String get commonStartMic => 'マイクを開始';

  @override
  String get tabAnalyzer => 'アナライザー';

  @override
  String get rtaUnfreeze => '固定を解除';

  @override
  String get rtaFreeze => '固定';

  @override
  String get rtaPeakHold => 'ピークホールド';

  @override
  String get rtaMaxMinTraces => '最大 / 最小トレース';

  @override
  String get rtaResetTraces => 'トレースをリセット';

  @override
  String get rtaSaveAsPoint => 'ポイントとして保存（3 秒）';

  @override
  String get rtaMicCalibration => 'マイクのキャリブレーション…';

  @override
  String get rtaRemoveCalibration => 'キャリブレーションを削除';

  @override
  String get rtaOffsetMenu => 'オフセット dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · 信号処理なし';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 点',
    );
    return 'キャリブレーション $name: $_temp0、補正 $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL（推定）';

  @override
  String get rtaFrozenHint => '固定中 — マイクは動作を続けますが、描画は止まっています。';

  @override
  String get rtaRelativeHint =>
      'レベルは相対値（dBFS）です。最初のポイントを保存すると輪郭が表示され、それが他のポイントの基準になります。';

  @override
  String get rtaReferenceHint => '塗りつぶしの棒 = 現在地。輪郭 = 基準ポイント。';

  @override
  String get rtaEnvelopeHint => '赤 = 最大、緑 = 最小（リセット以降）。';

  @override
  String get rtaMicStopped => 'マイク停止中';

  @override
  String get rtaSilence => '無音 — 信号は再生されていますか？';

  @override
  String get rtaPlaceholder => 'マイクを開始して、部屋に信号を再生してください。';

  @override
  String rtaBandsInfo(int count) {
    return '1/3 オクターブ $count バンド、20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => '部屋のスキャン';

  @override
  String scanPointCount(int count) {
    return '$count 点';
  }

  @override
  String get commonMicNotRunning => 'マイクが動作していません';

  @override
  String get scanMicNeeded => 'マイクがないと、音ではなく位置だけが記録されます。';

  @override
  String get scanContinuous => '連続測定';

  @override
  String get scanContinuousHint => '0.5 m 歩くごとに自動でポイントを記録';

  @override
  String get scanMeasuring => '測定中…';

  @override
  String get scanMeasureHere => 'ここで測定';

  @override
  String scanPointSaved(String id, String position) {
    return 'ポイント $id を $position に保存しました';
  }

  @override
  String get scanStartTracking => '位置追跡を開始';

  @override
  String get scanStartTrackingHint => 'ARKit — アプリはこれで部屋のどこにいるかを把握します。';

  @override
  String scanPosition(String position) {
    return '位置: 原点から $position m';
  }

  @override
  String get scanSetOriginHint => 'リスニング位置に立って、原点を決めてください。';

  @override
  String get scanOriginHere => 'ここが原点';

  @override
  String get scanNoPoints => 'ポイントはまだありません。';

  @override
  String scanPointStats(String variation, String rms) {
    return '40–300 Hz のばらつき: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'リビング';

  @override
  String get scanNewMeasurement => '新しい測定';

  @override
  String get scanRoomName => '部屋の名前';

  @override
  String get scanExcitation => '部屋を励起する音源';

  @override
  String get scanPhoneNoiseHint => 'あくまで目安です — スマートフォンのスピーカーは低音をほとんど出せません。';

  @override
  String get scanStart => '開始';

  @override
  String get mapExportTooltip => 'FRD + JSON をエクスポート';

  @override
  String get mapNeedsTwoPoints => 'マップには少なくとも 2 つのポイントが必要です。部屋を歩きながら測定してください。';

  @override
  String get mapShareText =>
      'ポイントごとの FRD（REW / VituixCAD にインポート可）と、セッション全体の JSON。';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return '最も平坦な場所: $position m の $id（40–300 Hz のばらつき $variation dB）';
  }

  @override
  String get signalsSweepHelp =>
      'インパルス応答、残響時間、初期反射を計算できる唯一の信号です。パソコンまたは DAC からスピーカーで再生し、スマートフォンは録音に使います。';

  @override
  String get signalsLength => '長さ';

  @override
  String get signalsFrom => '開始';

  @override
  String get signalsTo => '終了';

  @override
  String get signalsMonoNoChannel => 'モノラル（チャンネルなし）';

  @override
  String get signalsExportWav => 'WAV をエクスポート';

  @override
  String get signalsPinkNoise => 'ピンクノイズ';

  @override
  String get signalsPinkHelp =>
      '各オクターブのエネルギーが同じ信号です。周波数特性だけが得られ、時間や反射は分かりません。「何か効いているか？」の確認には十分です。';

  @override
  String get signalsExportPink => '30 秒の WAV をエクスポート';

  @override
  String get signalsHowTo => '測定のしかた';

  @override
  String get signalsStep1 => '信号はスマートフォンではなく、パソコンからスピーカーで再生してください。';

  @override
  String get signalsStep2 => 'アナライザーが約 −20 dBFS を示す音量に設定してください。過入力は反射のように見えます。';

  @override
  String get signalsStep3 => 'スマートフォンを縦に持ち、腕を伸ばして、マイクをスピーカーに向けてください。';

  @override
  String get signalsStep4 => 'Bluetooth ヘッドホンは外してください — 圧縮と遅延で測定が台無しになります。';

  @override
  String get signalsNoteMono =>
      'モノラルを両方のスピーカーに同時に送ると L と R が加算され、その差が打ち消されます。チャンネルを測るときは、チャンネルを選んでください。';

  @override
  String get signalsNoteStereo =>
      '信号が片方のチャンネルだけに入ったステレオファイルです。ステレオ再生できるものなら何でも再生できます。';

  @override
  String get signalsNoteChannel =>
      'チャンネル名のついたモノラルファイルです。DAW またはマルチチャンネル入力から、レシーバーの正しい入力に送ってください。ステレオ出力のノートパソコンでは、このチャンネルに送れません。';

  @override
  String get channelsTitle => 'チャンネル測定';

  @override
  String get channelsHelp =>
      'リスニング位置に立ってください。各チャンネルで、録音を開始し、「信号」タブのスイープを再生して、「完了」をタップします。これらのポイントがないと、設計から EQ と音量を作れません。';

  @override
  String channelsSweepLength(int seconds) {
    return 'スイープ $seconds 秒';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ 入力後の検証';

  @override
  String get channelsVerifyAfterEqHint =>
      'ポイントは「EQ 後」として保存され、EQ の計算元になったポイントは上書きされません。';

  @override
  String channelsRecording(String seconds) {
    return '$seconds 秒録音中 — 今すぐスイープを再生してください';
  }

  @override
  String get channelsNotMeasured => '未測定';

  @override
  String get channelsMeasuredNoise => 'ノイズで測定済み';

  @override
  String channelsSummary(int count, String ms) {
    return '$count 回 · 直接音まで $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count 回 · 直接音まで $ms ms、T20 $t20 秒';
  }

  @override
  String get commonDone => '完了';

  @override
  String get channelsMeasure => '測定';

  @override
  String get channelsAdd => '追加';

  @override
  String get channelsAgain => 'もう一度';

  @override
  String get compareTitle => '比較';

  @override
  String get compareNeedsTwoPoints => '比較には少なくとも 2 つのポイントが必要です。';

  @override
  String get commonWithRoom => '部屋あり';

  @override
  String get commonDirectSound => '直接音';

  @override
  String get compareAfterEq => 'EQ 後';

  @override
  String get compareBandsA => 'A（バンド）';

  @override
  String get compareBandsB => 'B（バンド）';

  @override
  String get compareArrivalDiff => '到達時間の差 A − B';

  @override
  String get compareBroadbandDiff => '広帯域レベルの差 A − B';

  @override
  String get compareWorstBelow300 => '300 Hz 以下の最大差';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz のバンドで $db dB';
  }

  @override
  String get compareTrimNote =>
      'ディスタンスとレベルのトリムで、到達時間とレベルの差は揃えられます。300 Hz 以下の形状の差は揃えられません。これは別の壁が別の距離にあることによるもので、位置を動かして対処します。';

  @override
  String get designRt60Live => '直近のレスポンスの T20 125–500 Hz';

  @override
  String get designRt60Stored => '保存済みスイープの T20 125–500 Hz';

  @override
  String get designRt60Guess => '推定値 — スイープを測定してください。シュレーダー周波数は目安にすぎません';

  @override
  String get designExportTooltip => '設定をエクスポート';

  @override
  String get designCompute => '設計を計算';

  @override
  String get designLidarChecking => 'LiDAR の有無を確認しています…';

  @override
  String get designLidarAvailable => 'LiDAR が利用できます';

  @override
  String get designLidarMissing => 'LiDAR なし — 寸法を手入力してください';

  @override
  String get designLidarHint =>
      'スキャンは壁をセンチメートル単位で捉えるので、モードだけでなく反射点や境界までの距離も正確になります。';

  @override
  String get designManualHint => 'モード計算に必要な数値は 3 つだけですが、反射点や壁までの正確な距離は得られません。';

  @override
  String get designStopScan => 'スキャンを終了';

  @override
  String get designScanRoom => '部屋をスキャン';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '壁 $walls 面',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '開口部 $openings か所',
    );
    return '$_temp0、$_temp1';
  }

  @override
  String get designRoomDimensions => '部屋の寸法';

  @override
  String get designLength => '長さ';

  @override
  String get designWidth => '幅';

  @override
  String get designHeight => '高さ';

  @override
  String get designWhatToDo => '対処方法';

  @override
  String get designRoomModes => '部屋のモード';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'シュレーダー周波数 $schroeder Hz より上では、個々のモードは意味を持ちません。RT60 $rt60 秒: $source。';
  }

  @override
  String get designEqTitle => 'EQ: 測定値、目標、予測';

  @override
  String get designEqHelp =>
      '予測は、測定したレスポンスにレシーバーの 15 バンドモデルを適用したものです。EQ を入力したら「EQ 後」スイッチをオンにしてチャンネルを再測定し、モデルがどれだけ近かったかを確認してください。';

  @override
  String get designReceiverConfig => 'レシーバーの設定';

  @override
  String get designGeometryOnly =>
      'チャンネルをスイープで測定しない限り、あるのはジオメトリだけです（距離とクロスオーバー周波数）。EQ と音量は、チャンネルごとのポイントがそろうと追加されます。';

  @override
  String get designShareSubject => '設定の提案';

  @override
  String get impulseTitle => 'インパルス応答';

  @override
  String get impulseCompareTooltip => 'ポイントを比較';

  @override
  String get impulseExportTooltip => '位相付き FRD をエクスポート';

  @override
  String get impulseTapToStart => 'タップして開始します。';

  @override
  String get impulseSweepTitle => 'スピーカーで再生するスイープ';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz、$seconds 秒。再生するものと一致している必要があります。そうでないと、デコンボリューションの結果が無意味になります。';
  }

  @override
  String impulseRecording(String seconds) {
    return '録音中 — $seconds 秒';
  }

  @override
  String get impulsePlaySweepNow => '今、パソコンからスイープを再生してください。';

  @override
  String get impulseStartRecording => '録音を開始してからスイープを再生';

  @override
  String get impulseFrequencyResponse => '周波数特性';

  @override
  String get impulseWithRoom => '部屋あり（1 秒）';

  @override
  String impulseDirectWindow(String ms) {
    return '直接音（ウィンドウ $ms ms）';
  }

  @override
  String get impulseWindow => 'ウィンドウ';

  @override
  String impulseWindowHelp(String hz) {
    return 'ウィンドウが長いほど低域まで見えます（現在は $hz Hz 以上が有効）が、最初の反射も入ってきます。この下限より下では、曲線は平滑化もコメントもされません。見えているのは部屋ではなくウィンドウです。';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return '最初の反射まで（$ms ms）';
  }

  @override
  String get impulseTime => '時間';

  @override
  String get impulseImpulse => 'インパルス';

  @override
  String get impulseTimeHelp => '青がウィンドウ、オレンジの線が最初に見つかった反射です。時間 0 が直接音です。';

  @override
  String get impulseSpectrogram => 'スペクトログラム';

  @override
  String get commonHide => '非表示';

  @override
  String get commonShow => '表示';

  @override
  String get impulseSpectrogramHelp =>
      '直接音からの時間（ms）、周波数は上方向、色は −60 dB までのレベルです。他が消えても残る水平の帯がモードです。上の表は同じことを数値で示しています。';

  @override
  String get impulseDecayByOctave => 'オクターブごとの減衰';

  @override
  String get impulseMidNoT20 => '中域の減衰が T20 に必要な量まで届きませんでした。';

  @override
  String impulseMidT20(String seconds) {
    return '中域 125–500 Hz: T20 $seconds 秒 — 設計が使う RT60 はこの値です。';
  }

  @override
  String get impulseDecayHelp =>
      '低域では、スマートフォンでの RT60 は推定値にすぎません。暗騒音が最も近いためで、「—」は残響がそれ以下まで下がらなかったことを示します。C50 が 0 を超える場合: 直接音と初期反射のエネルギーが残響より大きいことを意味します。';

  @override
  String get impulseResult => '結果';

  @override
  String get impulseDirectArrived => '直接音の到達時間';

  @override
  String get impulseDirectArrivedHelp =>
      '再生遅延と伝搬時間の合計です。それ自体は意味を持ちませんが、L と R のスピーカーの差は重要です。';

  @override
  String get impulseFirstReflection => '最初の反射';

  @override
  String get impulseNotFound => '見つかりません';

  @override
  String impulseAfterDirect(String time) {
    return '直接音の $time 後';
  }

  @override
  String get impulseNoReflectionHelp => '反射がないか、直接インパルスのリンギングに隠れています。';

  @override
  String impulseExtraPath(String metres) {
    return '余分な経路 ≈ $metres m。';
  }

  @override
  String get impulseUnmeasurable => '測定不可';

  @override
  String get impulseRt60NoiseHelp =>
      '残響が暗騒音より十分に高いところまで減衰しませんでした — 音量を上げるか、静かなときに測定してください。';

  @override
  String get impulseRt60Help => 'T20 と T30 の差は、減衰がどれだけきれいかを示します。';

  @override
  String get impulseGating => 'ウィンドウ（ゲーティング）';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz 以上で有効';
  }

  @override
  String get impulseGatingHelp =>
      'それより下では、ウィンドウに 1 周期も入りません。そこの曲線はウィンドウのアーティファクトであり、部屋ではありません。';

  @override
  String get impulseSchroeder => 'シュレーダー減衰曲線';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz での HD$order';
  }

  @override
  String get impulseHd2Help =>
      '高調波はファリナのデコンボリューションの負の時間側にあります。ここではそれを捨てずに読み取っています。−40 dB は 1 % です。';

  @override
  String get impulseHd3Help => '3 次高調波は、過入力に対して 2 次より速く増えます。';

  @override
  String get impulseDistortionHot => '−30 dB を超える歪み';

  @override
  String get impulseDistortionHotHelp =>
      'スイープの音量が大きすぎるか、スピーカーが限界です。歪みの尾はインパルスでは反射のように見えます — 音量を下げて再測定してから判断してください。';

  @override
  String get eqMeasured => '測定値';

  @override
  String get eqTarget => '目標';

  @override
  String get eqPredicted => 'EQ 後の予測';

  @override
  String get eqMeasuredAfter => 'EQ 後の測定値';

  @override
  String eqDeviation(int maxHz) {
    return '目標からの偏差 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'レシーバーに入力後';

  @override
  String get eqPredictionVsReality => '予測と実際';

  @override
  String eqStubborn(String bands) {
    return '目標から 6 dB 以上離れたままになります: $bands。これは干渉であり、パワー不足ではありません — ブーストを増やすのではなく、スピーカーまたはリスナーの位置を動かして対処します。';
  }

  @override
  String get eqModelOk => 'レシーバーのフィルターは、ほぼモデルどおりに動作しています。';

  @override
  String get eqModelOff =>
      'レシーバーの実際のフィルターは、想定よりもモデルとの差が大きくなっています — バンドの幅が、ここでの想定より広いか狭い可能性があります。';

  @override
  String get eqTargetCurve => '目標カーブ';

  @override
  String get eqFlat => 'フラット';

  @override
  String get eqTargetHelp =>
      'フラットではありません: 数 kHz より上では耳は直接音を聞きますが、マイクは反射も合算します。測定した曲線を平らにすると、音がこもって聞こえます。高域のわずかな傾斜と低域の少しの持ち上げが、ブラインドテストで人が選ぶ特性です。';

  @override
  String get eqBassLift => '低域の持ち上げ';

  @override
  String get eqBassBelow => '低域の対象';

  @override
  String get eqTilt => '傾斜';

  @override
  String get eqDbPerOctave => 'dB/oct';

  @override
  String get eqTiltFrom => '傾斜の開始';

  @override
  String get errorMicPermission =>
      'マイクにアクセスできないと測定できません。「設定」→「AudioScanner」→「マイク」で許可してください。';

  @override
  String errorMic(String error) {
    return 'マイク: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'マイクを開始できませんでした: $error';
  }

  @override
  String get errorNoArkit =>
      'このデバイスは ARKit のワールドトラッキングに対応していません — ポイントを空間内に配置できません。';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return '録音がスイープより短いです（$expected 秒のうち $recorded 秒）。信号を再生する前に録音を開始してください。';
  }

  @override
  String get sessionSnapshots => 'スナップショット';

  @override
  String get errorTrackingUnreliable => '位置追跡が不安定です — ポイントが実際の位置とずれる可能性があります。';

  @override
  String errorNoSound(int seconds) {
    return '$seconds 秒以内に音が届きませんでした。';
  }

  @override
  String get noteSnapshotNoPose => 'アナライザーからのスナップショット、位置なし';

  @override
  String get sessionChannels => 'チャンネル';

  @override
  String get trackingOk => '追跡 OK';

  @override
  String get trackingLimited => '追跡が弱い';

  @override
  String get trackingUnavailable => '追跡なし';

  @override
  String get poseHintFeatures => '画像の特徴が少なすぎます — 何もない壁ではなく、凹凸のあるものに向けてください。';

  @override
  String get poseHintMotion => '動きが速すぎます — ゆっくり歩いてください。';

  @override
  String get poseHintLight => '光が足りません — 照明をつけてください。カメラが現在地を認識できません。';

  @override
  String get poseHintInitializing => 'ARKit を準備中です。しばらく動き回ってください。';

  @override
  String get poseHintRelocalizing => '元の地点を探しています — 出発した場所に戻ってください。';

  @override
  String get signalPhonePink => 'スマートフォンのピンクノイズ';

  @override
  String get signalExternalPink => 'スピーカーのピンクノイズ';

  @override
  String get signalExternalSweep => 'スピーカーのスイープ';

  @override
  String get captureWarningBluetooth =>
      'Bluetooth マイク: 圧縮と遅延で測定が台無しになります。ヘッドホンを外して内蔵マイクで測定してください。';

  @override
  String get captureWarningProcessing =>
      'システムが信号処理（AGC / ノイズ抑制）をオフにしませんでした。地点間の測定差が歪みます。';

  @override
  String get captureWarningMeasurementMode =>
      '測定モードを有効にできませんでした — マイクに独自の周波数特性補正がかかっています。';

  @override
  String get captureRouteUnknown => '不明';

  @override
  String get axisLength => '長さ';

  @override
  String get axisWidth => '幅';

  @override
  String get axisHeight => '高さ';
}
