// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get tabScan => '스캔';

  @override
  String get tabMap => '지도';

  @override
  String get tabResponse => '응답';

  @override
  String get tabDesign => '설계';

  @override
  String get tabSignals => '신호';

  @override
  String get rtaSnapshotFailed => '스냅샷을 저장하지 못했습니다.';

  @override
  String rtaSavedAsPoint(String id) {
    return '포인트 $id(으)로 저장했습니다.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return '포인트 $id(으)로 저장했습니다(위치 없음).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 지점',
    );
    return '보정 $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return '파일을 읽을 수 없습니다: $message';
  }

  @override
  String get rtaOffsetTitle => '오프셋 dB SPL';

  @override
  String get rtaOffsetHelp =>
      '1 kHz 톤을 재생하고 SPL 미터의 값을 읽어, 분석기가 표시하는 값과의 차이를 입력하세요. 오프셋이 0이 아니면 레벨이 추정 SPL로 표시되고, 0이면 dBFS로 유지됩니다.';

  @override
  String get commonReset => '초기화';

  @override
  String get commonCancel => '취소';

  @override
  String get commonSave => '저장';

  @override
  String get commonStop => '중지';

  @override
  String get commonStartMic => '마이크 시작';

  @override
  String get tabAnalyzer => '분석기';

  @override
  String get rtaUnfreeze => '고정 해제';

  @override
  String get rtaFreeze => '고정';

  @override
  String get rtaPeakHold => '피크 홀드';

  @override
  String get rtaMaxMinTraces => '최대 / 최소 트레이스';

  @override
  String get rtaResetTraces => '트레이스 초기화';

  @override
  String get rtaSaveAsPoint => '포인트로 저장(3초)';

  @override
  String get rtaMicCalibration => '마이크 보정…';

  @override
  String get rtaRemoveCalibration => '보정 제거';

  @override
  String get rtaOffsetMenu => '오프셋 dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · 신호 처리 없음';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 지점',
    );
    return '보정 $name: $_temp0, 보정값 $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL(추정)';

  @override
  String get rtaFrozenHint => '고정됨 — 마이크는 계속 동작하지만 화면은 그려지지 않습니다.';

  @override
  String get rtaRelativeHint =>
      '레벨은 상대값(dBFS)입니다. 첫 포인트를 저장하면 윤곽선이 나타나며, 이것이 다른 포인트의 기준이 됩니다.';

  @override
  String get rtaReferenceHint => '채워진 막대 = 현재. 윤곽선 = 기준 포인트.';

  @override
  String get rtaEnvelopeHint => '빨강 = 최대, 초록 = 최소(초기화 이후).';

  @override
  String get rtaMicStopped => '마이크 멈춤';

  @override
  String get rtaSilence => '무음 — 신호가 재생되고 있나요?';

  @override
  String get rtaPlaceholder => '마이크를 시작하고 방에 신호를 재생하세요.';

  @override
  String rtaBandsInfo(int count) {
    return '1/3 옥타브 밴드 $count개, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => '방 스캔';

  @override
  String scanPointCount(int count) {
    return '$count개';
  }

  @override
  String get commonMicNotRunning => '마이크가 동작하지 않습니다';

  @override
  String get scanMicNeeded => '마이크가 없으면 소리가 아니라 위치만 측정됩니다.';

  @override
  String get scanContinuous => '연속 측정';

  @override
  String get scanContinuousHint => '0.5 m 걸을 때마다 자동으로 포인트 기록';

  @override
  String get scanMeasuring => '측정 중…';

  @override
  String get scanMeasureHere => '여기서 측정';

  @override
  String scanPointSaved(String id, String position) {
    return '포인트 $id을(를) $position에 저장했습니다';
  }

  @override
  String get scanStartTracking => '위치 추적 시작';

  @override
  String get scanStartTrackingHint => 'ARKit — 앱이 방 안에서 어디에 있는지 알게 해 줍니다.';

  @override
  String scanPosition(String position) {
    return '위치: 원점에서 $position m';
  }

  @override
  String get scanSetOriginHint => '청취 위치에 서서 원점을 정하세요.';

  @override
  String get scanOriginHere => '여기가 원점';

  @override
  String get scanNoPoints => '아직 포인트가 없습니다.';

  @override
  String scanPointStats(String variation, String rms) {
    return '40–300 Hz 편차: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => '거실';

  @override
  String get scanNewMeasurement => '새 측정';

  @override
  String get scanRoomName => '방 이름';

  @override
  String get scanExcitation => '방을 울릴 음원';

  @override
  String get scanPhoneNoiseHint => '참고용일 뿐입니다 — 스마트폰 스피커는 저음을 거의 내지 못합니다.';

  @override
  String get scanStart => '시작';

  @override
  String get mapExportTooltip => 'FRD + JSON 내보내기';

  @override
  String get mapNeedsTwoPoints => '지도에는 포인트가 최소 두 개 필요합니다. 방을 돌아다니며 계속 측정하세요.';

  @override
  String get mapShareText => '포인트별 FRD(REW / VituixCAD로 가져오기)와 전체 세션 JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return '가장 평탄한 곳: $position m 위치의 $id(40–300 Hz 편차 $variation dB)';
  }

  @override
  String get signalsSweepHelp =>
      '임펄스 응답, 잔향 시간, 초기 반사를 계산할 수 있는 유일한 신호입니다. 컴퓨터나 DAC에서 스피커로 재생하고, 스마트폰은 녹음하도록 두세요.';

  @override
  String get signalsLength => '길이';

  @override
  String get signalsFrom => '시작';

  @override
  String get signalsTo => '끝';

  @override
  String get signalsMonoNoChannel => '모노(채널 없음)';

  @override
  String get signalsExportWav => 'WAV 내보내기';

  @override
  String get signalsPinkNoise => '핑크 노이즈';

  @override
  String get signalsPinkHelp =>
      '모든 옥타브에서 에너지가 같습니다. 주파수 특성만 알 수 있고 시간이나 반사는 알 수 없습니다. \"뭔가 효과가 있나?\"를 확인하는 데는 충분합니다.';

  @override
  String get signalsExportPink => '30초 WAV 내보내기';

  @override
  String get signalsHowTo => '측정 방법';

  @override
  String get signalsStep1 => '신호는 스마트폰이 아니라 컴퓨터에서 스피커로 재생하세요.';

  @override
  String get signalsStep2 => '분석기가 약 −20 dBFS를 가리키도록 볼륨을 맞추세요. 과입력은 반사처럼 보입니다.';

  @override
  String get signalsStep3 => '스마트폰을 세로로, 팔을 뻗어 마이크가 스피커를 향하게 드세요.';

  @override
  String get signalsStep4 => '블루투스 헤드폰은 분리하세요 — 압축과 지연이 측정을 망칩니다.';

  @override
  String get signalsNoteMono =>
      '모노를 두 스피커에 동시에 보내면 L과 R이 합쳐져 그 차이가 사라집니다. 채널을 측정하려면 채널을 선택하세요.';

  @override
  String get signalsNoteStereo =>
      '신호가 한쪽 채널에만 있는 스테레오 파일입니다. 스테레오를 재생할 수 있으면 무엇으로든 재생됩니다.';

  @override
  String get signalsNoteChannel =>
      '채널 이름이 붙은 모노 파일입니다. DAW나 멀티채널 입력으로 리시버의 올바른 입력에 연결하세요. 스테레오 출력의 노트북으로는 이 채널로 보낼 수 없습니다.';

  @override
  String get channelsTitle => '채널 측정';

  @override
  String get channelsHelp =>
      '청취 위치에 서세요. 채널마다 녹음을 시작하고, 신호 탭의 스윕을 재생한 뒤 완료를 누르세요. 이 포인트가 없으면 설계에서 EQ와 볼륨을 만들 수 없습니다.';

  @override
  String channelsSweepLength(int seconds) {
    return '스윕 $seconds초';
  }

  @override
  String get channelsVerifyAfterEq => 'EQ 입력 후 검증';

  @override
  String get channelsVerifyAfterEqHint =>
      '포인트는 \"EQ 후\"로 저장되며, EQ 계산의 바탕이 된 포인트를 덮어쓰지 않습니다.';

  @override
  String channelsRecording(String seconds) {
    return '$seconds초 녹음 중 — 지금 스윕을 재생하세요';
  }

  @override
  String get channelsNotMeasured => '측정 안 됨';

  @override
  String get channelsMeasuredNoise => '노이즈로 측정됨';

  @override
  String channelsSummary(int count, String ms) {
    return '$count회 · 직접음 $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count회 · 직접음 $ms ms, T20 $t20초';
  }

  @override
  String get commonDone => '완료';

  @override
  String get channelsMeasure => '측정';

  @override
  String get channelsAdd => '추가';

  @override
  String get channelsAgain => '다시';

  @override
  String get compareTitle => '비교';

  @override
  String get compareNeedsTwoPoints => '비교에는 포인트가 최소 두 개 필요합니다.';

  @override
  String get commonWithRoom => '방 포함';

  @override
  String get commonDirectSound => '직접음';

  @override
  String get compareAfterEq => 'EQ 후';

  @override
  String get compareBandsA => 'A(밴드)';

  @override
  String get compareBandsB => 'B(밴드)';

  @override
  String get compareArrivalDiff => '도달 시간 차이 A − B';

  @override
  String get compareBroadbandDiff => '광대역 레벨 차이 A − B';

  @override
  String get compareWorstBelow300 => '300 Hz 이하 최대 차이';

  @override
  String compareWorstValue(String db, String band) {
    return '$band Hz 밴드에서 $db dB';
  }

  @override
  String get compareTrimNote =>
      '디스턴스와 레벨 트림은 도달 시간과 레벨의 차이를 맞춰 줍니다. 300 Hz 이하의 형태 차이는 맞춰 주지 못합니다. 다른 거리에 있는 다른 벽 때문이므로 위치를 옮겨 해결합니다.';

  @override
  String get designRt60Live => '최근 응답의 T20 125–500 Hz';

  @override
  String get designRt60Stored => '저장된 스윕의 T20 125–500 Hz';

  @override
  String get designRt60Guess => '추정값 — 스윕을 측정하세요. 슈뢰더 주파수는 아직 참고용입니다';

  @override
  String get designExportTooltip => '구성 내보내기';

  @override
  String get designCompute => '설계 계산';

  @override
  String get designLidarChecking => 'LiDAR가 있는지 확인하는 중…';

  @override
  String get designLidarAvailable => 'LiDAR 사용 가능';

  @override
  String get designLidarMissing => 'LiDAR 없음 — 치수를 직접 입력하세요';

  @override
  String get designLidarHint =>
      '스캔은 벽을 센티미터 단위로 잡아 주므로 모드뿐 아니라 반사 지점과 경계까지의 거리도 정확해집니다.';

  @override
  String get designManualHint =>
      '모드 계산에는 숫자 세 개면 충분하지만, 반사 지점과 벽까지의 정확한 거리는 얻을 수 없습니다.';

  @override
  String get designStopScan => '스캔 종료';

  @override
  String get designScanRoom => '방 스캔하기';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '벽 $walls개',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '개구부 $openings개',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => '방 치수';

  @override
  String get designLength => '길이';

  @override
  String get designWidth => '너비';

  @override
  String get designHeight => '높이';

  @override
  String get designWhatToDo => '해야 할 일';

  @override
  String get designRoomModes => '방 모드';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return '슈뢰더 주파수 $schroeder Hz 위에서는 개별 모드가 의미가 없습니다. RT60 $rt60초: $source.';
  }

  @override
  String get designEqTitle => 'EQ: 측정, 목표, 예측';

  @override
  String get designEqHelp =>
      '예측은 측정한 응답에 리시버의 15밴드 모델을 적용한 것입니다. EQ를 입력한 뒤 \"EQ 후\" 스위치를 켜고 채널을 다시 측정하면 모델이 얼마나 가까웠는지 볼 수 있습니다.';

  @override
  String get designReceiverConfig => '리시버 구성';

  @override
  String get designGeometryOnly =>
      '스윕으로 채널을 측정하지 않으면 거리와 크로스오버 주파수 같은 기하 정보만 있습니다. EQ와 볼륨은 채널별 포인트가 갖춰지면 추가됩니다.';

  @override
  String get designShareSubject => '구성 제안';

  @override
  String get impulseTitle => '임펄스 응답';

  @override
  String get impulseCompareTooltip => '포인트 비교';

  @override
  String get impulseExportTooltip => '위상 포함 FRD 내보내기';

  @override
  String get impulseTapToStart => '탭하여 시작합니다.';

  @override
  String get impulseSweepTitle => '스피커로 재생할 스윕';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds초. 재생하는 것과 일치해야 합니다. 그렇지 않으면 디컨볼루션 결과가 엉터리가 됩니다.';
  }

  @override
  String impulseRecording(String seconds) {
    return '녹음 중 — $seconds초';
  }

  @override
  String get impulsePlaySweepNow => '지금 컴퓨터에서 스윕을 재생하세요.';

  @override
  String get impulseStartRecording => '녹음을 시작한 다음 스윕 재생';

  @override
  String get impulseFrequencyResponse => '주파수 응답';

  @override
  String get impulseWithRoom => '방 포함(1초)';

  @override
  String impulseDirectWindow(String ms) {
    return '직접음(윈도우 $ms ms)';
  }

  @override
  String get impulseWindow => '윈도우';

  @override
  String impulseWindowHelp(String hz) {
    return '윈도우가 길수록 더 낮은 주파수까지 보이지만(현재 $hz Hz 이상 유효) 첫 반사가 들어옵니다. 이 한계 아래에서는 곡선을 평활화하거나 해석하지 않습니다. 보이는 것은 방이 아니라 윈도우입니다.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return '첫 반사까지($ms ms)';
  }

  @override
  String get impulseTime => '시간';

  @override
  String get impulseImpulse => '임펄스';

  @override
  String get impulseTimeHelp => '파란색은 윈도우, 주황색 선은 처음 찾은 반사입니다. 시간 0이 직접음입니다.';

  @override
  String get impulseSpectrogram => '스펙트로그램';

  @override
  String get commonHide => '숨기기';

  @override
  String get commonShow => '표시';

  @override
  String get impulseSpectrogramHelp =>
      '직접음 이후의 시간(ms), 주파수는 위쪽, 색은 −60 dB까지의 레벨입니다. 다른 것이 사라져도 남는 가로 띠가 모드입니다. 위의 표가 같은 내용을 숫자로 보여 줍니다.';

  @override
  String get impulseDecayByOctave => '옥타브별 감쇠';

  @override
  String get impulseMidNoT20 => '중간 대역이 T20에 필요한 만큼 감쇠하지 않았습니다.';

  @override
  String impulseMidT20(String seconds) {
    return '중간 125–500 Hz: T20 $seconds초 — 설계에서 사용하는 RT60이 이 값입니다.';
  }

  @override
  String get impulseDecayHelp =>
      '저음에서는 스마트폰으로 구한 RT60이 추정치에 가깝습니다. 배경 소음이 가장 가깝기 때문이며, \"—\"는 잔향이 그 아래로 내려가지 않았다는 뜻입니다. C50이 0보다 크면 직접음과 초기 반사가 잔향보다 더 많은 에너지를 가진다는 뜻입니다.';

  @override
  String get impulseResult => '결과';

  @override
  String get impulseDirectArrived => '직접음 도착 시간';

  @override
  String get impulseDirectArrivedHelp =>
      '재생 지연과 전달 시간의 합입니다. 그 자체로는 의미가 없지만 L과 R 스피커의 차이는 의미가 있습니다.';

  @override
  String get impulseFirstReflection => '첫 반사';

  @override
  String get impulseNotFound => '찾지 못함';

  @override
  String impulseAfterDirect(String time) {
    return '직접음 $time 후';
  }

  @override
  String get impulseNoReflectionHelp => '반사가 없거나 직접 임펄스의 링잉에 가려졌습니다.';

  @override
  String impulseExtraPath(String metres) {
    return '추가 경로 ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => '측정 불가';

  @override
  String get impulseRt60NoiseHelp =>
      '잔향이 배경 소음보다 충분히 위에서 감쇠하지 않았습니다 — 볼륨을 높이거나 더 조용할 때 측정하세요.';

  @override
  String get impulseRt60Help => 'T20과 T30의 차이는 감쇠가 얼마나 깨끗한지 알려 줍니다.';

  @override
  String get impulseGating => '윈도우(게이팅)';

  @override
  String impulseValidAbove(String hz) {
    return '$hz Hz 이상에서 유효';
  }

  @override
  String get impulseGatingHelp =>
      '그 아래에서는 윈도우에 한 주기도 들어가지 않습니다. 그 곡선은 방이 아니라 윈도우의 아티팩트입니다.';

  @override
  String get impulseSchroeder => '슈뢰더 감쇠 곡선';

  @override
  String impulseHdAt(int order) {
    return '100 Hz / 1 kHz에서의 HD$order';
  }

  @override
  String get impulseHd2Help =>
      '고조파는 파리나 디컨볼루션의 음의 시간에 있습니다. 여기서는 버리지 않고 거기서 읽습니다. −40 dB는 1 %입니다.';

  @override
  String get impulseHd3Help => '3차 고조파는 과입력에 따라 2차보다 빠르게 증가합니다.';

  @override
  String get impulseDistortionHot => '−30 dB를 넘는 왜곡';

  @override
  String get impulseDistortionHotHelp =>
      '스윕 볼륨이 너무 크거나 스피커가 한계입니다. 왜곡의 꼬리는 임펄스에서 반사처럼 보입니다 — 볼륨을 낮추고 다시 측정한 뒤에 판단하세요.';

  @override
  String get eqMeasured => '측정';

  @override
  String get eqTarget => '목표';

  @override
  String get eqPredicted => 'EQ 후 예측';

  @override
  String get eqMeasuredAfter => 'EQ 후 측정';

  @override
  String eqDeviation(int maxHz) {
    return '목표와의 편차 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => '리시버에 입력한 후';

  @override
  String get eqPredictionVsReality => '예측과 실제';

  @override
  String eqStubborn(String bands) {
    return '목표에서 6 dB 넘게 벗어난 채로 남습니다: $bands. 이는 출력 부족이 아니라 간섭입니다 — 더 올리지 말고 스피커나 청취자의 위치를 옮겨 해결하세요.';
  }

  @override
  String get eqModelOk => '리시버의 필터가 모델과 거의 비슷하게 동작합니다.';

  @override
  String get eqModelOff =>
      '리시버의 실제 필터가 예상보다 모델과 많이 다릅니다 — 밴드 폭이 여기서 가정한 것보다 넓거나 좁을 가능성이 큽니다.';

  @override
  String get eqTargetCurve => '목표 곡선';

  @override
  String get eqFlat => '평탄';

  @override
  String get eqTargetHelp =>
      '평탄하지 않습니다. 몇 kHz 위에서는 귀가 직접음을 듣지만 마이크는 반사까지 합산하기 때문에, 측정 곡선을 평평하게 맞추면 소리가 둔해집니다. 고역의 완만한 기울기와 저역의 약간의 부스트가 블라인드 청취에서 사람들이 고르는 특성입니다.';

  @override
  String get eqBassLift => '저음 부스트';

  @override
  String get eqBassBelow => '저음 기준';

  @override
  String get eqTilt => '기울기';

  @override
  String get eqDbPerOctave => 'dB/옥타브';

  @override
  String get eqTiltFrom => '기울기 시작';

  @override
  String get errorMicPermission =>
      '마이크에 접근할 수 없으면 측정할 수 없습니다. 설정 → AudioScanner → 마이크에서 허용하세요.';

  @override
  String errorMic(String error) {
    return '마이크: $error';
  }

  @override
  String errorMicStart(String error) {
    return '마이크를 시작하지 못했습니다: $error';
  }

  @override
  String get errorNoArkit =>
      '이 기기는 ARKit 월드 트래킹을 지원하지 않습니다 — 포인트를 공간에 배치할 수 없습니다.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return '녹음이 스윕보다 짧습니다($expected초 중 $recorded초). 신호를 재생하기 전에 녹음을 시작하세요.';
  }

  @override
  String get sessionSnapshots => '스냅샷';

  @override
  String get errorTrackingUnreliable =>
      '위치 추적이 불안정합니다 — 포인트가 실제 위치와 다를 수 있습니다.';

  @override
  String errorNoSound(int seconds) {
    return '$seconds초 안에 소리가 도착하지 않았습니다.';
  }

  @override
  String get noteSnapshotNoPose => '분석기에서 가져온 스냅샷, 위치 없음';

  @override
  String get sessionChannels => '채널';

  @override
  String get trackingOk => '추적 정상';

  @override
  String get trackingLimited => '추적 약함';

  @override
  String get trackingUnavailable => '추적 없음';

  @override
  String get poseHintFeatures => '화면에 특징이 너무 적습니다 — 빈 벽이 아니라 요철이 있는 곳으로 향하세요.';

  @override
  String get poseHintMotion => '너무 빨리 움직이고 있습니다 — 천천히 이동하세요.';

  @override
  String get poseHintLight => '빛이 부족합니다 — 불을 켜세요. 카메라가 위치를 알 수 없습니다.';

  @override
  String get poseHintInitializing => 'ARKit을 준비하는 중입니다. 잠시 움직여 주세요.';

  @override
  String get poseHintRelocalizing => '원래 지점을 찾는 중입니다 — 출발한 곳으로 돌아가세요.';

  @override
  String get signalPhonePink => '스마트폰 핑크 노이즈';

  @override
  String get signalExternalPink => '스피커 핑크 노이즈';

  @override
  String get signalExternalSweep => '스피커 스윕';

  @override
  String get captureWarningBluetooth =>
      '블루투스 마이크: 압축과 지연이 측정을 망칩니다. 헤드폰을 분리하고 내장 마이크로 측정하세요.';

  @override
  String get captureWarningProcessing =>
      '시스템이 신호 처리(AGC / 노이즈 억제)를 끄지 않았습니다. 지점 간 측정 차이가 왜곡됩니다.';

  @override
  String get captureWarningMeasurementMode =>
      '측정 모드를 켜지 못했습니다 — 마이크에 자체 주파수 특성 보정이 걸려 있습니다.';

  @override
  String get captureRouteUnknown => '알 수 없음';

  @override
  String get axisLength => '길이';

  @override
  String get axisWidth => '너비';

  @override
  String get axisHeight => '높이';
}
