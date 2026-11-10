// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get tabScan => 'Leitura';

  @override
  String get tabMap => 'Mapa';

  @override
  String get tabResponse => 'Resposta';

  @override
  String get tabDesign => 'Projeto';

  @override
  String get tabSignals => 'Sinais';

  @override
  String get rtaSnapshotFailed => 'A captura não foi guardada.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Guardado como ponto $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Guardado como ponto $id (sem posição).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pontos',
      one: '1 ponto',
    );
    return 'Calibração $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Não é possível ler o ficheiro: $message';
  }

  @override
  String get rtaOffsetTitle => 'Offset dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Reproduz um tom de 1 kHz, lê o nível num sonómetro e introduz a diferença em relação ao que o analisador mostra. Com um offset diferente de zero, os níveis são marcados como estimativa SPL; sem ele, ficam em dBFS.';

  @override
  String get commonReset => 'Repor';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonStop => 'Parar';

  @override
  String get commonStartMic => 'Iniciar microfone';

  @override
  String get tabAnalyzer => 'Analisador';

  @override
  String get rtaUnfreeze => 'Descongelar';

  @override
  String get rtaFreeze => 'Congelar';

  @override
  String get rtaPeakHold => 'Retenção de picos';

  @override
  String get rtaMaxMinTraces => 'Traços máx. / mín.';

  @override
  String get rtaResetTraces => 'Repor traços';

  @override
  String get rtaSaveAsPoint => 'Guardar como ponto (3 s)';

  @override
  String get rtaMicCalibration => 'Calibração do microfone…';

  @override
  String get rtaRemoveCalibration => 'Remover calibração';

  @override
  String get rtaOffsetMenu => 'Offset dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · sem processamento de sinal';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pontos',
      one: '1 ponto',
    );
    return 'Calibração $name: $_temp0, correção $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (estimativa)';

  @override
  String get rtaFrozenHint =>
      'Congelado — o microfone continua a funcionar, apenas não é desenhado.';

  @override
  String get rtaRelativeHint =>
      'Os níveis são relativos (dBFS). O contorno aparece quando guardares o primeiro ponto — é a referência para os restantes.';

  @override
  String get rtaReferenceHint =>
      'Barras cheias = aqui. Contorno = ponto de referência.';

  @override
  String get rtaEnvelopeHint =>
      'Vermelho = máx., verde = mín. desde a reposição.';

  @override
  String get rtaMicStopped => 'microfone parado';

  @override
  String get rtaSilence => 'silêncio — está a tocar algum sinal?';

  @override
  String get rtaPlaceholder =>
      'Inicia o microfone e reproduz um sinal na sala.';

  @override
  String rtaBandsInfo(int count) {
    return '$count bandas de terço de oitava, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Leitura da sala';

  @override
  String scanPointCount(int count) {
    return '$count pts';
  }

  @override
  String get commonMicNotRunning => 'O microfone não está ativo';

  @override
  String get scanMicNeeded => 'Sem ele só se mede a posição, não o som.';

  @override
  String get scanContinuous => 'Medição contínua';

  @override
  String get scanContinuousHint =>
      'Um ponto automático a cada 0,5 m percorridos';

  @override
  String get scanMeasuring => 'A medir…';

  @override
  String get scanMeasureHere => 'Medir aqui';

  @override
  String scanPointSaved(String id, String position) {
    return 'Ponto $id guardado em $position';
  }

  @override
  String get scanStartTracking => 'Iniciar seguimento da posição';

  @override
  String get scanStartTrackingHint =>
      'ARKit — é assim que a app sabe onde estás na sala.';

  @override
  String scanPosition(String position) {
    return 'Posição: $position m da origem';
  }

  @override
  String get scanSetOriginHint =>
      'Coloca-te no ponto de escuta e define a origem.';

  @override
  String get scanOriginHere => 'A origem é aqui';

  @override
  String get scanNoPoints => 'Ainda não há pontos.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'dispersão 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Sala de estar';

  @override
  String get scanNewMeasurement => 'Nova medição';

  @override
  String get scanRoomName => 'Nome da sala';

  @override
  String get scanExcitation => 'Com que vais excitar a sala';

  @override
  String get scanPhoneNoiseHint =>
      'Apenas indicativo — o altifalante do telemóvel não reproduz graves nenhuns.';

  @override
  String get scanStart => 'Começar';

  @override
  String get mapExportTooltip => 'Exportar FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'O mapa precisa de pelo menos dois pontos. Percorre a sala e vai medindo.';

  @override
  String get mapShareText =>
      'FRD por ponto (importar no REW / VituixCAD) e a sessão completa em JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Ponto mais uniforme: $id em $position m (dispersão $variation dB em 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'O único sinal a partir do qual se calcula a resposta ao impulso, o tempo de reverberação e as primeiras reflexões. Reproduz-o a partir de um computador ou DAC nas colunas e deixa o telemóvel gravar.';

  @override
  String get signalsLength => 'Duração';

  @override
  String get signalsFrom => 'De';

  @override
  String get signalsTo => 'Até';

  @override
  String get signalsMonoNoChannel => 'Mono (sem canal)';

  @override
  String get signalsExportWav => 'Exportar WAV';

  @override
  String get signalsPinkNoise => 'Ruído rosa';

  @override
  String get signalsPinkHelp =>
      'A mesma energia em cada oitava. Dá apenas a resposta em frequência, sem tempo nem reflexões — chega para um rápido «passa-se aqui alguma coisa?».';

  @override
  String get signalsExportPink => 'Exportar WAV de 30 s';

  @override
  String get signalsHowTo => 'Como medir';

  @override
  String get signalsStep1 =>
      'Reproduz o sinal a partir do computador nas colunas, não do telemóvel.';

  @override
  String get signalsStep2 =>
      'Ajusta o volume para que o analisador mostre cerca de −20 dBFS. A saturação parece uma reflexão.';

  @override
  String get signalsStep3 =>
      'Segura o telemóvel na vertical com o braço esticado, microfone virado para as colunas.';

  @override
  String get signalsStep4 =>
      'Desliga os auscultadores Bluetooth — a compressão e a latência estragam a medição.';

  @override
  String get signalsNoteMono =>
      'Mono nas duas colunas ao mesmo tempo soma L e R, e a diferença entre elas desaparece na soma. Para medir canais, escolhe um canal.';

  @override
  String get signalsNoteStereo =>
      'Ficheiro estéreo com o sinal só num canal — reproduz-se em qualquer coisa que toque estéreo.';

  @override
  String get signalsNoteChannel =>
      'Ficheiro mono com o nome do canal. Encaminha-o para a entrada certa do recetor a partir de uma DAW ou por uma entrada multicanal; um portátil com saída estéreo não o leva a este canal.';

  @override
  String get channelsTitle => 'Medição de canais';

  @override
  String get channelsHelp =>
      'Coloca-te no ponto de escuta. Para cada canal: começa a gravar, reproduz um sweep a partir do separador Sinais e toca em Concluído. Sem estes pontos, o projeto não tem de onde tirar o EQ e os níveis.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Verificação após introduzir o EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'O ponto é guardado como «após EQ» e não substitui aquele a partir do qual o EQ foi calculado.';

  @override
  String channelsRecording(String seconds) {
    return 'A gravar $seconds s — reproduz agora o sweep';
  }

  @override
  String get channelsNotMeasured => 'não medido';

  @override
  String get channelsMeasuredNoise => 'medido com ruído';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · som direto após $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · som direto após $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Concluído';

  @override
  String get channelsMeasure => 'Medir';

  @override
  String get channelsAdd => 'Adicionar';

  @override
  String get channelsAgain => 'Repetir';

  @override
  String get compareTitle => 'Comparação';

  @override
  String get compareNeedsTwoPoints =>
      'A comparação precisa de pelo menos dois pontos.';

  @override
  String get commonWithRoom => 'com a sala';

  @override
  String get commonDirectSound => 'som direto';

  @override
  String get compareAfterEq => 'após EQ';

  @override
  String get compareBandsA => 'A (bandas)';

  @override
  String get compareBandsB => 'B (bandas)';

  @override
  String get compareArrivalDiff => 'Diferença de chegada A − B';

  @override
  String get compareBroadbandDiff => 'Nível de banda larga A − B';

  @override
  String get compareWorstBelow300 => 'Maior diferença abaixo de 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB na banda de $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance e level trim compensam a diferença de chegada e de nível. Não compensam a diferença de forma abaixo de 300 Hz — essa vem de outra parede a outra distância e resolve-se mudando as coisas de sítio.';

  @override
  String get designRt60Live => 'T20 125–500 Hz da última resposta';

  @override
  String get designRt60Stored => 'T20 125–500 Hz de um sweep guardado';

  @override
  String get designRt60Guess =>
      'estimativa — mede um sweep, o Schroeder por agora é só uma pista';

  @override
  String get designExportTooltip => 'Exportar configuração';

  @override
  String get designCompute => 'Calcular projeto';

  @override
  String get designLidarChecking => 'A verificar se há LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR disponível';

  @override
  String get designLidarMissing => 'Sem LiDAR — introduz as dimensões à mão';

  @override
  String get designLidarHint =>
      'A leitura apanha as paredes ao centímetro, por isso os pontos de reflexão e as distâncias aos limites também batem certo, não só os modos.';

  @override
  String get designManualHint =>
      'O cálculo modal só precisa de três números — mas perdes os pontos de reflexão e as distâncias exatas às paredes.';

  @override
  String get designStopScan => 'Terminar leitura';

  @override
  String get designScanRoom => 'Ler a sala';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls paredes',
      one: '1 parede',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings aberturas',
      one: '1 abertura',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Dimensões da sala';

  @override
  String get designLength => 'Comprimento';

  @override
  String get designWidth => 'Largura';

  @override
  String get designHeight => 'Altura';

  @override
  String get designWhatToDo => 'O que fazer';

  @override
  String get designRoomModes => 'Modos da sala';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Acima de $schroeder Hz (Schroeder) os modos individuais deixam de fazer sentido. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: medido, alvo, previsão';

  @override
  String get designEqHelp =>
      'A previsão é a resposta medida mais um modelo das quinze bandas do recetor. Depois de introduzir o EQ, volta a medir o canal com o interruptor «após EQ» para ver quão perto o modelo esteve.';

  @override
  String get designReceiverConfig => 'Configuração do recetor';

  @override
  String get designGeometryOnly =>
      'Sem medições dos canais com sweep, aqui só há geometria: distâncias e frequências de corte. O EQ e os níveis aparecem quando houver pontos por canal.';

  @override
  String get designShareSubject => 'Proposta de configuração';

  @override
  String get impulseTitle => 'Resposta ao impulso';

  @override
  String get impulseCompareTooltip => 'Comparar pontos';

  @override
  String get impulseExportTooltip => 'Exportar FRD com fase';

  @override
  String get impulseTapToStart => 'Toca para iniciar.';

  @override
  String get impulseSweepTitle => 'O sweep que reproduzes nas colunas';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Tem de coincidir com o que reproduzes — caso contrário a desconvolução devolve disparates.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'A gravar — $seconds s';
  }

  @override
  String get impulsePlaySweepNow =>
      'Agora reproduz o sweep a partir do computador.';

  @override
  String get impulseStartRecording =>
      'Começar a gravar e depois reproduzir o sweep';

  @override
  String get impulseFrequencyResponse => 'Resposta em frequência';

  @override
  String get impulseWithRoom => 'com a sala (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'som direto (janela $ms ms)';
  }

  @override
  String get impulseWindow => 'Janela';

  @override
  String impulseWindowHelp(String hz) {
    return 'Uma janela mais longa vê mais abaixo (agora válida acima de $hz Hz), mas deixa entrar a primeira reflexão. Abaixo do limite a curva não é suavizada nem comentada: é a janela, não a sala.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Até à primeira reflexão ($ms ms)';
  }

  @override
  String get impulseTime => 'Tempo';

  @override
  String get impulseImpulse => 'impulso';

  @override
  String get impulseTimeHelp =>
      'A azul está a janela, a linha laranja é a primeira reflexão encontrada. O tempo zero é o som direto.';

  @override
  String get impulseSpectrogram => 'Espectrograma';

  @override
  String get commonHide => 'Ocultar';

  @override
  String get commonShow => 'Mostrar';

  @override
  String get impulseSpectrogramHelp =>
      'Tempo em ms desde o som direto, frequência para cima, a cor é o nível até −60 dB. Uma faixa horizontal que sobrevive às outras é um modo; a tabela acima diz o mesmo em números.';

  @override
  String get impulseDecayByOctave => 'Decaimento por oitava';

  @override
  String get impulseMidNoT20 =>
      'As bandas médias não decaíram o suficiente para o T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Médios 125–500 Hz: T20 $seconds s — é o RT60 com que o projeto conta.';
  }

  @override
  String get impulseDecayHelp =>
      'Nos graves, o RT60 medido pelo telemóvel é mais uma estimativa: aí o ruído de fundo está mais perto e «—» significa que a reverberação não desceu abaixo dele. C50 acima de zero: o som direto com as primeiras reflexões transporta mais energia do que a reverberação.';

  @override
  String get impulseResult => 'Resultado';

  @override
  String get impulseDirectArrived => 'O som direto chegou após';

  @override
  String get impulseDirectArrivedHelp =>
      'Atraso de reprodução mais tempo de voo — por si só não diz nada, mas a diferença entre a coluna esquerda e a direita diz.';

  @override
  String get impulseFirstReflection => 'Primeira reflexão';

  @override
  String get impulseNotFound => 'não encontrada';

  @override
  String impulseAfterDirect(String time) {
    return '$time após o som direto';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Ou não existe nenhuma, ou está escondida no ringing do impulso direto.';

  @override
  String impulseExtraPath(String metres) {
    return 'Percurso extra ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'não mensurável';

  @override
  String get impulseRt60NoiseHelp =>
      'A reverberação não desceu o suficiente acima do ruído de fundo — mais alto, ou num momento mais silencioso.';

  @override
  String get impulseRt60Help =>
      'A diferença entre T20 e T30 indica quão limpo é o decaimento.';

  @override
  String get impulseGating => 'Janela (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'válida acima de $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Abaixo disto a janela não vê nem um período — a curva aí é um artefacto da janela, não da sala.';

  @override
  String get impulseSchroeder => 'Curva de decaimento de Schroeder';

  @override
  String impulseHdAt(int order) {
    return 'HD$order a 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Os harmónicos estão no tempo negativo da desconvolução de Farina; aqui são lidos daí em vez de deitados fora. −40 dB é 1 %.';

  @override
  String get impulseHd3Help =>
      'O terceiro harmónico cresce com a saturação mais depressa do que o segundo.';

  @override
  String get impulseDistortionHot => 'Distorção acima de −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Ou o sweep está demasiado alto, ou a coluna está no limite. Uma cauda de distorção parece uma reflexão no impulso — baixa o volume e volta a medir antes de acreditares em alguma coisa.';

  @override
  String get eqMeasured => 'medido';

  @override
  String get eqTarget => 'alvo';

  @override
  String get eqPredicted => 'previsão após EQ';

  @override
  String get eqMeasuredAfter => 'medido após EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Desvio do alvo 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Após introduzir no recetor';

  @override
  String get eqPredictionVsReality => 'Previsão vs. realidade';

  @override
  String eqStubborn(String bands) {
    return 'Fica a mais de 6 dB do alvo: $bands. É interferência, não falta de potência — resolve-se mudando a coluna ou o ouvinte de sítio, não com mais reforço.';
  }

  @override
  String get eqModelOk =>
      'O filtro do recetor comporta-se mais ou menos como o modelo.';

  @override
  String get eqModelOff =>
      'O filtro real do recetor afasta-se do modelo mais do que se esperava — as suas bandas são provavelmente mais largas ou mais estreitas do que aqui se supõe.';

  @override
  String get eqTargetCurve => 'Curva alvo';

  @override
  String get eqFlat => 'plana';

  @override
  String get eqTargetHelp =>
      'Não plana: acima de alguns kHz o ouvido ouve o som direto, o microfone soma também as reflexões, e uma curva medida aplanada soa abafada. Uma ligeira inclinação em cima e um pouco de grave em baixo é o que as pessoas escolhem em audições cegas.';

  @override
  String get eqBassLift => 'Reforço de graves';

  @override
  String get eqBassBelow => 'Graves abaixo de';

  @override
  String get eqTilt => 'Inclinação';

  @override
  String get eqDbPerOctave => 'dB/oit';

  @override
  String get eqTiltFrom => 'Inclinação a partir de';

  @override
  String get errorMicPermission =>
      'Sem acesso ao microfone não é possível medir. Permite-o em Definições → AudioScanner → Microfone.';

  @override
  String errorMic(String error) {
    return 'Microfone: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Não foi possível iniciar o microfone: $error';
  }

  @override
  String get errorNoArkit =>
      'Este dispositivo não suporta ARKit world tracking — não é possível colocar pontos no espaço.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'A gravação é mais curta do que o sweep ($recorded s de $expected s). Começa a gravar antes de reproduzir o sinal.';
  }

  @override
  String get sessionSnapshots => 'Capturas';

  @override
  String get errorTrackingUnreliable =>
      'O seguimento da posição não é fiável — o ponto ficaria noutro sítio que não onde estás.';

  @override
  String errorNoSound(int seconds) {
    return 'Não chegou som nenhum em $seconds s.';
  }

  @override
  String get noteSnapshotNoPose => 'captura do analisador, sem posição';

  @override
  String get sessionChannels => 'Canais';

  @override
  String get trackingOk => 'Seguimento OK';

  @override
  String get trackingLimited => 'Seguimento fraco';

  @override
  String get trackingUnavailable => 'Sem seguimento';

  @override
  String get poseHintFeatures =>
      'Pouco detalhe na imagem — aponta o telemóvel para algo com textura, não para uma parede lisa.';

  @override
  String get poseHintMotion =>
      'Movimento demasiado rápido — anda mais devagar.';

  @override
  String get poseHintLight =>
      'Pouca luz — acende a luz, a câmara não vê onde está.';

  @override
  String get poseHintInitializing =>
      'O ARKit está a arrancar, mexe-te um pouco.';

  @override
  String get poseHintRelocalizing =>
      'A procurar de novo o ponto original — volta para onde começaste.';

  @override
  String get signalPhonePink => 'Ruído rosa do telemóvel';

  @override
  String get signalExternalPink => 'Ruído rosa das colunas';

  @override
  String get signalExternalSweep => 'Sweep das colunas';

  @override
  String get captureWarningBluetooth =>
      'Microfone Bluetooth: a compressão e a latência estragam a medição. Desliga os auscultadores e mede com o microfone integrado.';

  @override
  String get captureWarningProcessing =>
      'O sistema não desligou o processamento de sinal (AGC / supressão de ruído). As diferenças medidas entre pontos vão ficar distorcidas.';

  @override
  String get captureWarningMeasurementMode =>
      'Não foi possível ativar o measurement mode — o microfone aplica a sua própria correção de resposta em frequência.';

  @override
  String get captureRouteUnknown => 'desconhecido';

  @override
  String get axisLength => 'comprimento';

  @override
  String get axisWidth => 'largura';

  @override
  String get axisHeight => 'altura';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get tabScan => 'Escaneamento';

  @override
  String get tabMap => 'Mapa';

  @override
  String get tabResponse => 'Resposta';

  @override
  String get tabDesign => 'Projeto';

  @override
  String get tabSignals => 'Sinais';

  @override
  String get rtaSnapshotFailed => 'A captura não foi salva.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Salvo como ponto $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Salvo como ponto $id (sem posição).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pontos',
      one: '1 ponto',
    );
    return 'Calibração $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'Não foi possível ler o arquivo: $message';
  }

  @override
  String get rtaOffsetTitle => 'Offset dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Toque um tom de 1 kHz, leia o nível em um decibelímetro e digite a diferença em relação ao que o analisador mostra. Com um offset diferente de zero, os níveis aparecem como estimativa de SPL; sem ele, continuam em dBFS.';

  @override
  String get commonReset => 'Zerar';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Salvar';

  @override
  String get commonStop => 'Parar';

  @override
  String get commonStartMic => 'Ligar microfone';

  @override
  String get tabAnalyzer => 'Analisador';

  @override
  String get rtaUnfreeze => 'Descongelar';

  @override
  String get rtaFreeze => 'Congelar';

  @override
  String get rtaPeakHold => 'Retenção de picos';

  @override
  String get rtaMaxMinTraces => 'Traços máx. / mín.';

  @override
  String get rtaResetTraces => 'Zerar traços';

  @override
  String get rtaSaveAsPoint => 'Salvar como ponto (3 s)';

  @override
  String get rtaMicCalibration => 'Calibração do microfone…';

  @override
  String get rtaRemoveCalibration => 'Remover calibração';

  @override
  String get rtaOffsetMenu => 'Offset dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · sem processamento de sinal';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count pontos',
      one: '1 ponto',
    );
    return 'Calibração $name: $_temp0, correção $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (estimativa)';

  @override
  String get rtaFrozenHint =>
      'Congelado — o microfone continua funcionando, só não está sendo desenhado.';

  @override
  String get rtaRelativeHint =>
      'Os níveis são relativos (dBFS). O contorno aparece quando você salvar o primeiro ponto — ele é a referência para os outros.';

  @override
  String get rtaReferenceHint =>
      'Barras cheias = aqui. Contorno = ponto de referência.';

  @override
  String get rtaEnvelopeHint =>
      'Vermelho = máx., verde = mín. desde que foi zerado.';

  @override
  String get rtaMicStopped => 'microfone parado';

  @override
  String get rtaSilence => 'silêncio — tem algum sinal tocando?';

  @override
  String get rtaPlaceholder =>
      'Ligue o microfone e toque um sinal no ambiente.';

  @override
  String rtaBandsInfo(int count) {
    return '$count bandas de terço de oitava, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Escaneamento do ambiente';

  @override
  String scanPointCount(int count) {
    return '$count pts';
  }

  @override
  String get commonMicNotRunning => 'O microfone não está ligado';

  @override
  String get scanMicNeeded => 'Sem ele só a posição é medida, não o som.';

  @override
  String get scanContinuous => 'Medição contínua';

  @override
  String get scanContinuousHint =>
      'Um ponto automático a cada 0,5 m de caminhada';

  @override
  String get scanMeasuring => 'Medindo…';

  @override
  String get scanMeasureHere => 'Medir aqui';

  @override
  String scanPointSaved(String id, String position) {
    return 'Ponto $id salvo em $position';
  }

  @override
  String get scanStartTracking => 'Iniciar rastreamento de posição';

  @override
  String get scanStartTrackingHint =>
      'ARKit — é assim que o app sabe onde você está no ambiente.';

  @override
  String scanPosition(String position) {
    return 'Posição: $position m da origem';
  }

  @override
  String get scanSetOriginHint =>
      'Fique no ponto de audição e defina a origem.';

  @override
  String get scanOriginHere => 'A origem é aqui';

  @override
  String get scanNoPoints => 'Nenhum ponto ainda.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'dispersão 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Sala de estar';

  @override
  String get scanNewMeasurement => 'Nova medição';

  @override
  String get scanRoomName => 'Nome do ambiente';

  @override
  String get scanExcitation => 'Com o que você vai excitar o ambiente';

  @override
  String get scanPhoneNoiseHint =>
      'Só para ter uma ideia — o alto-falante do celular não reproduz grave nenhum.';

  @override
  String get scanStart => 'Começar';

  @override
  String get mapExportTooltip => 'Exportar FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'O mapa precisa de pelo menos dois pontos. Ande pelo ambiente medindo continuamente.';

  @override
  String get mapShareText =>
      'FRD por ponto (importar no REW / VituixCAD) e a sessão inteira em JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Ponto mais uniforme: $id em $position m (dispersão $variation dB em 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'O único sinal que permite calcular a resposta ao impulso, o tempo de reverberação e as primeiras reflexões. Toque-o de um computador ou DAC nas caixas e deixe o celular gravar.';

  @override
  String get signalsLength => 'Duração';

  @override
  String get signalsFrom => 'De';

  @override
  String get signalsTo => 'Até';

  @override
  String get signalsMonoNoChannel => 'Mono (sem canal)';

  @override
  String get signalsExportWav => 'Exportar WAV';

  @override
  String get signalsPinkNoise => 'Ruído rosa';

  @override
  String get signalsPinkHelp =>
      'A mesma energia em cada oitava. Dá só a resposta em frequência, sem tempo nem reflexões — serve para um rápido “está acontecendo alguma coisa aqui?”.';

  @override
  String get signalsExportPink => 'Exportar WAV de 30 s';

  @override
  String get signalsHowTo => 'Como medir';

  @override
  String get signalsStep1 =>
      'Toque o sinal do computador nas caixas, não do celular.';

  @override
  String get signalsStep2 =>
      'Ajuste o volume para o analisador mostrar cerca de −20 dBFS. Saturação parece uma reflexão.';

  @override
  String get signalsStep3 =>
      'Segure o celular na vertical com o braço esticado, microfone voltado para as caixas.';

  @override
  String get signalsStep4 =>
      'Desconecte os fones Bluetooth — compressão e latência estragam a medição.';

  @override
  String get signalsNoteMono =>
      'Mono nas duas caixas ao mesmo tempo soma L e R, e a diferença entre elas some na soma. Para medir canais, escolha um canal.';

  @override
  String get signalsNoteStereo =>
      'Arquivo estéreo com o sinal em um só canal — qualquer coisa que toque estéreo reproduz.';

  @override
  String get signalsNoteChannel =>
      'Arquivo mono com o nome do canal. Direcione-o para a entrada certa do receiver a partir de uma DAW ou por uma entrada multicanal; um notebook com saída estéreo não vai levá-lo a esse canal.';

  @override
  String get channelsTitle => 'Medição de canais';

  @override
  String get channelsHelp =>
      'Fique no ponto de audição. Para cada canal: comece a gravar, toque um sweep nele pela aba Sinais e toque em Concluído. Sem esses pontos, o projeto não tem de onde tirar o EQ e os níveis.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Verificação depois de aplicar o EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'O ponto é salvo como “depois do EQ” e não substitui aquele usado para calcular o EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Gravando $seconds s — toque o sweep agora';
  }

  @override
  String get channelsNotMeasured => 'não medido';

  @override
  String get channelsMeasuredNoise => 'medido com ruído';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · som direto após $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · som direto após $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Concluído';

  @override
  String get channelsMeasure => 'Medir';

  @override
  String get channelsAdd => 'Adicionar';

  @override
  String get channelsAgain => 'Refazer';

  @override
  String get compareTitle => 'Comparação';

  @override
  String get compareNeedsTwoPoints =>
      'A comparação precisa de pelo menos dois pontos.';

  @override
  String get commonWithRoom => 'com o ambiente';

  @override
  String get commonDirectSound => 'som direto';

  @override
  String get compareAfterEq => 'depois do EQ';

  @override
  String get compareBandsA => 'A (bandas)';

  @override
  String get compareBandsB => 'B (bandas)';

  @override
  String get compareArrivalDiff => 'Diferença de chegada A − B';

  @override
  String get compareBroadbandDiff => 'Nível de banda larga A − B';

  @override
  String get compareWorstBelow300 => 'Maior diferença abaixo de 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB na banda de $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance e level trim igualam a diferença de chegada e de nível. Não igualam a diferença de forma abaixo de 300 Hz — ela vem de outra parede a outra distância e se resolve mudando as coisas de lugar.';

  @override
  String get designRt60Live => 'T20 125–500 Hz da última resposta';

  @override
  String get designRt60Stored => 'T20 125–500 Hz de um sweep salvo';

  @override
  String get designRt60Guess =>
      'estimativa — meça um sweep, por enquanto o Schroeder é só um palpite';

  @override
  String get designExportTooltip => 'Exportar configuração';

  @override
  String get designCompute => 'Calcular projeto';

  @override
  String get designLidarChecking => 'Verificando se há LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR disponível';

  @override
  String get designLidarMissing => 'Sem LiDAR — digite as dimensões à mão';

  @override
  String get designLidarHint =>
      'O escaneamento pega as paredes no centímetro, então os pontos de reflexão e as distâncias até os limites também batem, não só os modos.';

  @override
  String get designManualHint =>
      'O cálculo modal só precisa de três números — mas você perde os pontos de reflexão e as distâncias exatas até as paredes.';

  @override
  String get designStopScan => 'Encerrar escaneamento';

  @override
  String get designScanRoom => 'Escanear o ambiente';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls paredes',
      one: '1 parede',
    );
    String _temp1 = intl.Intl.pluralLogic(
      openings,
      locale: localeName,
      other: '$openings aberturas',
      one: '1 abertura',
    );
    return '$_temp0, $_temp1';
  }

  @override
  String get designRoomDimensions => 'Dimensões do ambiente';

  @override
  String get designLength => 'Comprimento';

  @override
  String get designWidth => 'Largura';

  @override
  String get designHeight => 'Altura';

  @override
  String get designWhatToDo => 'O que fazer';

  @override
  String get designRoomModes => 'Modos do ambiente';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Acima de $schroeder Hz (Schroeder) os modos individuais não fazem mais sentido. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: medido, alvo, previsão';

  @override
  String get designEqHelp =>
      'A previsão é a resposta medida mais um modelo das quinze bandas do receiver. Depois de aplicar o EQ, meça o canal de novo com a chave “depois do EQ” para ver o quanto o modelo acertou.';

  @override
  String get designReceiverConfig => 'Configuração do receiver';

  @override
  String get designGeometryOnly =>
      'Sem medições dos canais com sweep, aqui só tem geometria: distâncias e frequências de crossover. EQ e níveis aparecem quando houver pontos por canal.';

  @override
  String get designShareSubject => 'Proposta de configuração';

  @override
  String get impulseTitle => 'Resposta ao impulso';

  @override
  String get impulseCompareTooltip => 'Comparar pontos';

  @override
  String get impulseExportTooltip => 'Exportar FRD com fase';

  @override
  String get impulseTapToStart => 'Toque para iniciar.';

  @override
  String get impulseSweepTitle => 'O sweep que você toca nas caixas';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Precisa bater com o que você toca — senão a deconvolução devolve bobagem.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Gravando — $seconds s';
  }

  @override
  String get impulsePlaySweepNow => 'Agora toque o sweep no computador.';

  @override
  String get impulseStartRecording => 'Começar a gravar e depois tocar o sweep';

  @override
  String get impulseFrequencyResponse => 'Resposta em frequência';

  @override
  String get impulseWithRoom => 'com o ambiente (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'som direto (janela $ms ms)';
  }

  @override
  String get impulseWindow => 'Janela';

  @override
  String impulseWindowHelp(String hz) {
    return 'Uma janela mais longa enxerga mais abaixo (agora válida acima de $hz Hz), mas deixa entrar a primeira reflexão. Abaixo do limite a curva não é suavizada nem comentada: é a janela, não o ambiente.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Até a primeira reflexão ($ms ms)';
  }

  @override
  String get impulseTime => 'Tempo';

  @override
  String get impulseImpulse => 'impulso';

  @override
  String get impulseTimeHelp =>
      'Em azul está a janela, a linha laranja é a primeira reflexão encontrada. O tempo zero é o som direto.';

  @override
  String get impulseSpectrogram => 'Espectrograma';

  @override
  String get commonHide => 'Ocultar';

  @override
  String get commonShow => 'Mostrar';

  @override
  String get impulseSpectrogramHelp =>
      'Tempo em ms desde o som direto, frequência para cima, a cor é o nível até −60 dB. Uma faixa horizontal que dura mais que as outras é um modo; a tabela acima diz o mesmo em números.';

  @override
  String get impulseDecayByOctave => 'Decaimento por oitava';

  @override
  String get impulseMidNoT20 =>
      'As bandas médias não decaíram o bastante para o T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Médios 125–500 Hz: T20 $seconds s — esse é o RT60 que o projeto usa.';
  }

  @override
  String get impulseDecayHelp =>
      'Nos graves, o RT60 do celular é mais uma estimativa: ali o ruído de fundo fica mais perto e “—” significa que a reverberação não caiu abaixo dele. C50 acima de zero: o som direto com as primeiras reflexões carrega mais energia que a reverberação.';

  @override
  String get impulseResult => 'Resultado';

  @override
  String get impulseDirectArrived => 'O som direto chegou após';

  @override
  String get impulseDirectArrivedHelp =>
      'Atraso de reprodução mais tempo de voo — sozinho não diz nada, mas a diferença entre a caixa L e a R diz.';

  @override
  String get impulseFirstReflection => 'Primeira reflexão';

  @override
  String get impulseNotFound => 'não encontrada';

  @override
  String impulseAfterDirect(String time) {
    return '$time após o som direto';
  }

  @override
  String get impulseNoReflectionHelp =>
      'Ou não tem nenhuma, ou ela está escondida no ringing do impulso direto.';

  @override
  String impulseExtraPath(String metres) {
    return 'Percurso extra ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'não mensurável';

  @override
  String get impulseRt60NoiseHelp =>
      'A reverberação não caiu o suficiente acima do ruído de fundo — mais alto, ou num momento mais silencioso.';

  @override
  String get impulseRt60Help =>
      'A diferença entre T20 e T30 indica o quanto o decaimento é limpo.';

  @override
  String get impulseGating => 'Janela (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'válida acima de $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Abaixo disso a janela não enxerga nem um período — ali a curva é um artefato da janela, não do ambiente.';

  @override
  String get impulseSchroeder => 'Curva de decaimento de Schroeder';

  @override
  String impulseHdAt(int order) {
    return 'HD$order em 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Os harmônicos ficam no tempo negativo da deconvolução de Farina; aqui eles são lidos de lá em vez de descartados. −40 dB é 1 %.';

  @override
  String get impulseHd3Help =>
      'O terceiro harmônico cresce com a saturação mais rápido que o segundo.';

  @override
  String get impulseDistortionHot => 'Distorção acima de −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'Ou o sweep está alto demais, ou a caixa está no limite. Uma cauda de distorção parece uma reflexão no impulso — abaixe o volume e meça de novo antes de acreditar em qualquer coisa.';

  @override
  String get eqMeasured => 'medido';

  @override
  String get eqTarget => 'alvo';

  @override
  String get eqPredicted => 'previsão depois do EQ';

  @override
  String get eqMeasuredAfter => 'medido depois do EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Desvio do alvo 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Depois de aplicar no receiver';

  @override
  String get eqPredictionVsReality => 'Previsão vs. realidade';

  @override
  String eqStubborn(String bands) {
    return 'Fica a mais de 6 dB do alvo: $bands. Isso é interferência, não falta de potência — resolve-se mudando a caixa ou o ouvinte de lugar, não com mais reforço.';
  }

  @override
  String get eqModelOk =>
      'O filtro do receiver se comporta mais ou menos como o modelo.';

  @override
  String get eqModelOff =>
      'O filtro real do receiver difere do modelo mais do que o esperado — as bandas dele provavelmente são mais largas ou mais estreitas do que se supõe aqui.';

  @override
  String get eqTargetCurve => 'Curva alvo';

  @override
  String get eqFlat => 'plana';

  @override
  String get eqTargetHelp =>
      'Não plana: acima de alguns kHz o ouvido escuta o som direto, o microfone soma também as reflexões, e uma curva medida achatada soa abafada. Uma leve inclinação em cima e um pouco de grave embaixo é o que as pessoas escolhem em audições às cegas.';

  @override
  String get eqBassLift => 'Reforço de grave';

  @override
  String get eqBassBelow => 'Grave abaixo de';

  @override
  String get eqTilt => 'Inclinação';

  @override
  String get eqDbPerOctave => 'dB/oit';

  @override
  String get eqTiltFrom => 'Inclinação a partir de';

  @override
  String get errorMicPermission =>
      'Sem acesso ao microfone não dá para medir. Permita em Ajustes → AudioScanner → Microfone.';

  @override
  String errorMic(String error) {
    return 'Microfone: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'Não foi possível ligar o microfone: $error';
  }

  @override
  String get errorNoArkit =>
      'Este aparelho não suporta ARKit world tracking — não dá para posicionar pontos no espaço.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'A gravação é mais curta que o sweep ($recorded s de $expected s). Comece a gravar antes de tocar o sinal.';
  }

  @override
  String get sessionSnapshots => 'Capturas';

  @override
  String get errorTrackingUnreliable =>
      'O rastreamento de posição não é confiável — o ponto ficaria em outro lugar, não onde você está.';

  @override
  String errorNoSound(int seconds) {
    return 'Nenhum som chegou em $seconds s.';
  }

  @override
  String get noteSnapshotNoPose => 'captura do analisador, sem posição';

  @override
  String get sessionChannels => 'Canais';

  @override
  String get trackingOk => 'Rastreamento OK';

  @override
  String get trackingLimited => 'Rastreamento fraco';

  @override
  String get trackingUnavailable => 'Sem rastreamento';

  @override
  String get poseHintFeatures =>
      'Pouco detalhe na imagem — aponte o celular para algo com textura, não para uma parede lisa.';

  @override
  String get poseHintMotion => 'Movimento rápido demais — ande mais devagar.';

  @override
  String get poseHintLight =>
      'Pouca luz — acenda a luz, a câmera não vê onde está.';

  @override
  String get poseHintInitializing =>
      'O ARKit está iniciando, mexa-se um pouco.';

  @override
  String get poseHintRelocalizing =>
      'Procurando o ponto original de novo — volte para onde você começou.';

  @override
  String get signalPhonePink => 'Ruído rosa do celular';

  @override
  String get signalExternalPink => 'Ruído rosa das caixas';

  @override
  String get signalExternalSweep => 'Sweep das caixas';

  @override
  String get captureWarningBluetooth =>
      'Microfone Bluetooth: compressão e latência estragam a medição. Desconecte os fones e meça com o microfone embutido.';

  @override
  String get captureWarningProcessing =>
      'O sistema não desligou o processamento de sinal (AGC / supressão de ruído). As diferenças medidas entre pontos ficarão distorcidas.';

  @override
  String get captureWarningMeasurementMode =>
      'Não foi possível ativar o measurement mode — o microfone aplica sua própria correção de resposta em frequência.';

  @override
  String get captureRouteUnknown => 'desconhecido';

  @override
  String get axisLength => 'comprimento';

  @override
  String get axisWidth => 'largura';

  @override
  String get axisHeight => 'altura';
}
