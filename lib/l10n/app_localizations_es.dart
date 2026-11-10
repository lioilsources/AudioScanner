// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get tabScan => 'Escaneo';

  @override
  String get tabMap => 'Mapa';

  @override
  String get tabResponse => 'Respuesta';

  @override
  String get tabDesign => 'Diseño';

  @override
  String get tabSignals => 'Señales';

  @override
  String get rtaSnapshotFailed => 'No se guardó la captura.';

  @override
  String rtaSavedAsPoint(String id) {
    return 'Guardado como punto $id.';
  }

  @override
  String rtaSavedAsPointNoPose(String id) {
    return 'Guardado como punto $id (sin posición).';
  }

  @override
  String rtaCalibrationLoaded(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count puntos',
      one: '1 punto',
    );
    return 'Calibración $name: $_temp0, $min … $max dB';
  }

  @override
  String rtaFileUnreadable(String message) {
    return 'No se puede leer el archivo: $message';
  }

  @override
  String get rtaOffsetTitle => 'Offset dB SPL';

  @override
  String get rtaOffsetHelp =>
      'Reproduce un tono de 1 kHz, lee el nivel en un sonómetro e introduce la diferencia con lo que muestra el analizador. Con un offset distinto de cero, los niveles se marcan como estimación SPL; sin él se quedan en dBFS.';

  @override
  String get commonReset => 'Restablecer';

  @override
  String get commonCancel => 'Cancelar';

  @override
  String get commonSave => 'Guardar';

  @override
  String get commonStop => 'Detener';

  @override
  String get commonStartMic => 'Iniciar micrófono';

  @override
  String get tabAnalyzer => 'Analizador';

  @override
  String get rtaUnfreeze => 'Descongelar';

  @override
  String get rtaFreeze => 'Congelar';

  @override
  String get rtaPeakHold => 'Retención de picos';

  @override
  String get rtaMaxMinTraces => 'Trazas máx. / mín.';

  @override
  String get rtaResetTraces => 'Restablecer trazas';

  @override
  String get rtaSaveAsPoint => 'Guardar como punto (3 s)';

  @override
  String get rtaMicCalibration => 'Calibración del micrófono…';

  @override
  String get rtaRemoveCalibration => 'Quitar calibración';

  @override
  String get rtaOffsetMenu => 'Offset dB SPL…';

  @override
  String rtaRouteChip(String route, String rate) {
    return '$route · $rate Hz · sin procesado de señal';
  }

  @override
  String rtaCalibrationChip(String name, int count, String min, String max) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count puntos',
      one: '1 punto',
    );
    return 'Calibración $name: $_temp0, corrección $min … $max dB';
  }

  @override
  String get rtaSplEstimate => 'dB SPL (estimación)';

  @override
  String get rtaFrozenHint =>
      'Congelado — el micrófono sigue funcionando, solo no se dibuja.';

  @override
  String get rtaRelativeHint =>
      'Los niveles son relativos (dBFS). El contorno aparece cuando guardas el primer punto — es la referencia para los demás.';

  @override
  String get rtaReferenceHint =>
      'Barras llenas = aquí. Contorno = punto de referencia.';

  @override
  String get rtaEnvelopeHint =>
      'Rojo = máx., verde = mín. desde el restablecimiento.';

  @override
  String get rtaMicStopped => 'micrófono detenido';

  @override
  String get rtaSilence => 'silencio — ¿suena alguna señal?';

  @override
  String get rtaPlaceholder =>
      'Inicia el micrófono y reproduce una señal en la sala.';

  @override
  String rtaBandsInfo(int count) {
    return '$count bandas de tercio de octava, 20 Hz – 20 kHz';
  }

  @override
  String get scanTitle => 'Escaneo de la sala';

  @override
  String scanPointCount(int count) {
    return '$count ptos.';
  }

  @override
  String get commonMicNotRunning => 'El micrófono no está activo';

  @override
  String get scanMicNeeded => 'Sin él solo se mide la posición, no el sonido.';

  @override
  String get scanContinuous => 'Medición continua';

  @override
  String get scanContinuousHint =>
      'Un punto automático cada 0,5 m de recorrido';

  @override
  String get scanMeasuring => 'Midiendo…';

  @override
  String get scanMeasureHere => 'Medir aquí';

  @override
  String scanPointSaved(String id, String position) {
    return 'Punto $id guardado en $position';
  }

  @override
  String get scanStartTracking => 'Iniciar seguimiento de posición';

  @override
  String get scanStartTrackingHint =>
      'ARKit — así sabe la app dónde estás en la sala.';

  @override
  String scanPosition(String position) {
    return 'Posición: $position m desde el origen';
  }

  @override
  String get scanSetOriginHint =>
      'Colócate en el punto de escucha y fija el origen.';

  @override
  String get scanOriginHere => 'El origen está aquí';

  @override
  String get scanNoPoints => 'Aún no hay puntos.';

  @override
  String scanPointStats(String variation, String rms) {
    return 'dispersión 40–300 Hz: $variation dB · $rms dBFS';
  }

  @override
  String get scanDefaultRoomName => 'Salón';

  @override
  String get scanNewMeasurement => 'Nueva medición';

  @override
  String get scanRoomName => 'Nombre de la sala';

  @override
  String get scanExcitation => 'Con qué vas a excitar la sala';

  @override
  String get scanPhoneNoiseHint =>
      'Solo orientativo — el altavoz del teléfono no reproduce graves en absoluto.';

  @override
  String get scanStart => 'Empezar';

  @override
  String get mapExportTooltip => 'Exportar FRD + JSON';

  @override
  String get mapNeedsTwoPoints =>
      'El mapa necesita al menos dos puntos. Recorre la sala y mide sobre la marcha.';

  @override
  String get mapShareText =>
      'FRD por punto (importar en REW / VituixCAD) y la sesión completa en JSON.';

  @override
  String mapFlattestSpot(String id, String position, String variation) {
    return 'Punto más uniforme: $id en $position m (dispersión $variation dB en 40–300 Hz)';
  }

  @override
  String get signalsSweepHelp =>
      'La única señal con la que se puede calcular la respuesta al impulso, el tiempo de reverberación y las primeras reflexiones. Reprodúcela desde un ordenador o DAC por los altavoces y deja que el teléfono grabe.';

  @override
  String get signalsLength => 'Duración';

  @override
  String get signalsFrom => 'Desde';

  @override
  String get signalsTo => 'Hasta';

  @override
  String get signalsMonoNoChannel => 'Mono (sin canal)';

  @override
  String get signalsExportWav => 'Exportar WAV';

  @override
  String get signalsPinkNoise => 'Ruido rosa';

  @override
  String get signalsPinkHelp =>
      'La misma energía en cada octava. Solo da la respuesta en frecuencia, sin tiempo ni reflexiones — basta para un rápido «¿pasa algo aquí?».';

  @override
  String get signalsExportPink => 'Exportar WAV de 30 s';

  @override
  String get signalsHowTo => 'Cómo medir';

  @override
  String get signalsStep1 =>
      'Reproduce la señal desde un ordenador por los altavoces, no desde el teléfono.';

  @override
  String get signalsStep2 =>
      'Ajusta el volumen para que el analizador marque unos −20 dBFS. La saturación parece una reflexión.';

  @override
  String get signalsStep3 =>
      'Sujeta el teléfono en vertical con el brazo extendido, con el micrófono hacia los altavoces.';

  @override
  String get signalsStep4 =>
      'Desconecta los auriculares Bluetooth — la compresión y la latencia arruinan la medición.';

  @override
  String get signalsNoteMono =>
      'Mono en ambos altavoces a la vez suma L y R, y su diferencia desaparece en la suma. Para medir canales, elige un canal.';

  @override
  String get signalsNoteStereo =>
      'Archivo estéreo con la señal en un solo canal — lo reproduce cualquier cosa que reproduzca estéreo.';

  @override
  String get signalsNoteChannel =>
      'Archivo mono con el nombre del canal. Dirígelo a la entrada correcta del receptor desde un DAW o por una entrada multicanal; un portátil con salida estéreo no lo llevará a este canal.';

  @override
  String get channelsTitle => 'Medición de canales';

  @override
  String get channelsHelp =>
      'Colócate en el punto de escucha. Para cada canal: empieza a grabar, reproduce un sweep desde la pestaña Señales y toca Hecho. Sin estos puntos, el diseño no tiene de dónde sacar el EQ y los niveles.';

  @override
  String channelsSweepLength(int seconds) {
    return 'Sweep $seconds s';
  }

  @override
  String get channelsVerifyAfterEq => 'Verificación tras introducir el EQ';

  @override
  String get channelsVerifyAfterEqHint =>
      'El punto se guarda como «tras EQ» y no sobrescribe aquel del que se calculó el EQ.';

  @override
  String channelsRecording(String seconds) {
    return 'Grabando $seconds s — reproduce ahora el sweep';
  }

  @override
  String get channelsNotMeasured => 'sin medir';

  @override
  String get channelsMeasuredNoise => 'medido con ruido';

  @override
  String channelsSummary(int count, String ms) {
    return '$count× · sonido directo a los $ms ms';
  }

  @override
  String channelsSummaryT20(int count, String ms, String t20) {
    return '$count× · sonido directo a los $ms ms, T20 $t20 s';
  }

  @override
  String get commonDone => 'Hecho';

  @override
  String get channelsMeasure => 'Medir';

  @override
  String get channelsAdd => 'Añadir';

  @override
  String get channelsAgain => 'Repetir';

  @override
  String get compareTitle => 'Comparación';

  @override
  String get compareNeedsTwoPoints =>
      'La comparación necesita al menos dos puntos.';

  @override
  String get commonWithRoom => 'con sala';

  @override
  String get commonDirectSound => 'sonido directo';

  @override
  String get compareAfterEq => 'tras EQ';

  @override
  String get compareBandsA => 'A (bandas)';

  @override
  String get compareBandsB => 'B (bandas)';

  @override
  String get compareArrivalDiff => 'Diferencia de llegada A − B';

  @override
  String get compareBroadbandDiff => 'Nivel de banda ancha A − B';

  @override
  String get compareWorstBelow300 => 'Mayor diferencia por debajo de 300 Hz';

  @override
  String compareWorstValue(String db, String band) {
    return '$db dB en la banda de $band Hz';
  }

  @override
  String get compareTrimNote =>
      'Distance y level trim igualan la diferencia de llegada y de nivel. No igualan la diferencia de forma por debajo de 300 Hz — esa la causa otra pared a otra distancia y se resuelve moviendo cosas.';

  @override
  String get designRt60Live => 'T20 125–500 Hz de la última respuesta';

  @override
  String get designRt60Stored => 'T20 125–500 Hz de un sweep guardado';

  @override
  String get designRt60Guess =>
      'estimación — mide un sweep, Schroeder es por ahora solo una pista';

  @override
  String get designExportTooltip => 'Exportar configuración';

  @override
  String get designCompute => 'Calcular diseño';

  @override
  String get designLidarChecking => 'Comprobando si hay LiDAR…';

  @override
  String get designLidarAvailable => 'LiDAR disponible';

  @override
  String get designLidarMissing => 'Sin LiDAR — introduce las medidas a mano';

  @override
  String get designLidarHint =>
      'El escaneo da las paredes al centímetro, así que también cuadran los puntos de reflexión y las distancias a los límites, no solo los modos.';

  @override
  String get designManualHint =>
      'El cálculo modal solo necesita tres números — pero pierdes los puntos de reflexión y las distancias exactas a las paredes.';

  @override
  String get designStopScan => 'Terminar escaneo';

  @override
  String get designScanRoom => 'Escanear la sala';

  @override
  String designWallsOpenings(int walls, int openings) {
    String _temp0 = intl.Intl.pluralLogic(
      walls,
      locale: localeName,
      other: '$walls paredes',
      one: '1 pared',
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
  String get designRoomDimensions => 'Medidas de la sala';

  @override
  String get designLength => 'Largo';

  @override
  String get designWidth => 'Ancho';

  @override
  String get designHeight => 'Alto';

  @override
  String get designWhatToDo => 'Qué hacer al respecto';

  @override
  String get designRoomModes => 'Modos de la sala';

  @override
  String designModesNote(String schroeder, String rt60, String source) {
    return 'Por encima de $schroeder Hz (Schroeder) los modos individuales ya no tienen sentido. RT60 $rt60 s: $source.';
  }

  @override
  String get designEqTitle => 'EQ: medido, objetivo, predicción';

  @override
  String get designEqHelp =>
      'La predicción es la respuesta medida más un modelo de las quince bandas del receptor. Tras introducir el EQ, vuelve a medir el canal con el interruptor «tras EQ» para ver cuánto se acercó el modelo.';

  @override
  String get designReceiverConfig => 'Configuración del receptor';

  @override
  String get designGeometryOnly =>
      'Sin mediciones de canales con sweep solo hay geometría: distancias y frecuencias de cruce. El EQ y los niveles llegarán cuando haya puntos por canal.';

  @override
  String get designShareSubject => 'Propuesta de configuración';

  @override
  String get impulseTitle => 'Respuesta al impulso';

  @override
  String get impulseCompareTooltip => 'Comparar puntos';

  @override
  String get impulseExportTooltip => 'Exportar FRD con fase';

  @override
  String get impulseTapToStart => 'Toca para iniciar.';

  @override
  String get impulseSweepTitle => 'El sweep que reproduces por los altavoces';

  @override
  String impulseSweepHelp(int startHz, int endHz, int seconds) {
    return '$startHz – $endHz Hz, $seconds s. Debe coincidir con lo que reproduces — si no, la deconvolución devuelve disparates.';
  }

  @override
  String impulseRecording(String seconds) {
    return 'Grabando — $seconds s';
  }

  @override
  String get impulsePlaySweepNow =>
      'Reproduce ahora el sweep desde el ordenador.';

  @override
  String get impulseStartRecording =>
      'Empezar a grabar y luego reproducir el sweep';

  @override
  String get impulseFrequencyResponse => 'Respuesta en frecuencia';

  @override
  String get impulseWithRoom => 'con sala (1 s)';

  @override
  String impulseDirectWindow(String ms) {
    return 'sonido directo (ventana $ms ms)';
  }

  @override
  String get impulseWindow => 'Ventana';

  @override
  String impulseWindowHelp(String hz) {
    return 'Una ventana más larga ve más abajo (ahora válida por encima de $hz Hz), pero deja entrar la primera reflexión. Por debajo del límite la curva no se suaviza ni se comenta: es la ventana, no la sala.';
  }

  @override
  String impulseToFirstReflection(String ms) {
    return 'Hasta la primera reflexión ($ms ms)';
  }

  @override
  String get impulseTime => 'Tiempo';

  @override
  String get impulseImpulse => 'impulso';

  @override
  String get impulseTimeHelp =>
      'En azul la ventana, la línea naranja es la primera reflexión encontrada. El tiempo cero es el sonido directo.';

  @override
  String get impulseSpectrogram => 'Espectrograma';

  @override
  String get commonHide => 'Ocultar';

  @override
  String get commonShow => 'Mostrar';

  @override
  String get impulseSpectrogramHelp =>
      'Tiempo en ms desde el sonido directo, frecuencia hacia arriba, el color es el nivel hasta −60 dB. Una franja horizontal que sobrevive a las demás es un modo; la tabla de arriba dice lo mismo con números.';

  @override
  String get impulseDecayByOctave => 'Decaimiento por octavas';

  @override
  String get impulseMidNoT20 =>
      'Las bandas medias no decayeron lo suficiente para T20.';

  @override
  String impulseMidT20(String seconds) {
    return 'Medios 125–500 Hz: T20 $seconds s — es el RT60 con el que cuenta el diseño.';
  }

  @override
  String get impulseDecayHelp =>
      'En los graves, el RT60 medido con el teléfono es más bien una estimación: allí el ruido de fondo está más cerca y «—» significa que la reverberación no bajó por debajo de él. C50 por encima de cero: el sonido directo con las primeras reflexiones lleva más energía que la reverberación.';

  @override
  String get impulseResult => 'Resultado';

  @override
  String get impulseDirectArrived => 'El sonido directo llegó a los';

  @override
  String get impulseDirectArrivedHelp =>
      'Retardo de reproducción más tiempo de vuelo — por sí solo no dice nada, pero la diferencia entre el altavoz izquierdo y el derecho sí.';

  @override
  String get impulseFirstReflection => 'Primera reflexión';

  @override
  String get impulseNotFound => 'no encontrada';

  @override
  String impulseAfterDirect(String time) {
    return '$time después del sonido directo';
  }

  @override
  String get impulseNoReflectionHelp =>
      'O no hay ninguna, o se esconde en el ringing del impulso directo.';

  @override
  String impulseExtraPath(String metres) {
    return 'Recorrido adicional ≈ $metres m.';
  }

  @override
  String get impulseUnmeasurable => 'no medible';

  @override
  String get impulseRt60NoiseHelp =>
      'La reverberación no decayó lo suficiente por encima del ruido de fondo — más fuerte, o en un momento más tranquilo.';

  @override
  String get impulseRt60Help =>
      'La diferencia entre T20 y T30 indica lo limpio que es el decaimiento.';

  @override
  String get impulseGating => 'Ventana (gating)';

  @override
  String impulseValidAbove(String hz) {
    return 'válida por encima de $hz Hz';
  }

  @override
  String get impulseGatingHelp =>
      'Por debajo, la ventana no ve ni un periodo — ahí la curva es un artefacto de la ventana, no de la sala.';

  @override
  String get impulseSchroeder => 'Curva de decaimiento de Schroeder';

  @override
  String impulseHdAt(int order) {
    return 'HD$order a 100 Hz / 1 kHz';
  }

  @override
  String get impulseHd2Help =>
      'Los armónicos están en el tiempo negativo de la deconvolución de Farina; aquí se leen de ahí en lugar de descartarlos. −40 dB es el 1 %.';

  @override
  String get impulseHd3Help =>
      'El tercer armónico crece con la saturación más rápido que el segundo.';

  @override
  String get impulseDistortionHot => 'Distorsión por encima de −30 dB';

  @override
  String get impulseDistortionHotHelp =>
      'O el sweep está demasiado alto, o el altavoz está al límite. Una cola de distorsión parece una reflexión en el impulso — baja el volumen y vuelve a medir antes de creerte nada.';

  @override
  String get eqMeasured => 'medido';

  @override
  String get eqTarget => 'objetivo';

  @override
  String get eqPredicted => 'predicción tras EQ';

  @override
  String get eqMeasuredAfter => 'medido tras EQ';

  @override
  String eqDeviation(int maxHz) {
    return 'Desviación del objetivo 40–$maxHz Hz';
  }

  @override
  String get eqAfterEntering => 'Tras introducirlo en el receptor';

  @override
  String get eqPredictionVsReality => 'Predicción vs. realidad';

  @override
  String eqStubborn(String bands) {
    return 'Queda a más de 6 dB del objetivo: $bands. Es interferencia, no falta de potencia — se resuelve moviendo el altavoz o al oyente, no con más realce.';
  }

  @override
  String get eqModelOk =>
      'El filtro del receptor se comporta más o menos como el modelo.';

  @override
  String get eqModelOff =>
      'El filtro real del receptor se aleja del modelo más de lo esperado — sus bandas son probablemente más anchas o más estrechas de lo que se supone aquí.';

  @override
  String get eqTargetCurve => 'Curva objetivo';

  @override
  String get eqFlat => 'plana';

  @override
  String get eqTargetHelp =>
      'No plana: por encima de unos kHz el oído oye el sonido directo, el micrófono suma también las reflexiones, y una curva medida aplanada suena apagada. Una ligera caída arriba y algo de grave abajo es lo que la gente elige en escuchas a ciegas.';

  @override
  String get eqBassLift => 'Realce de graves';

  @override
  String get eqBassBelow => 'Graves bajo';

  @override
  String get eqTilt => 'Inclinación';

  @override
  String get eqDbPerOctave => 'dB/oct';

  @override
  String get eqTiltFrom => 'Inclinación desde';

  @override
  String get errorMicPermission =>
      'Sin acceso al micrófono no se puede medir. Permítelo en Ajustes → AudioScanner → Micrófono.';

  @override
  String errorMic(String error) {
    return 'Micrófono: $error';
  }

  @override
  String errorMicStart(String error) {
    return 'No se pudo iniciar el micrófono: $error';
  }

  @override
  String get errorNoArkit =>
      'Este dispositivo no admite ARKit world tracking — no se pueden situar puntos en el espacio.';

  @override
  String errorRecordingTooShort(String recorded, String expected) {
    return 'La grabación es más corta que el sweep ($recorded s de $expected s). Empieza a grabar antes de reproducir la señal.';
  }

  @override
  String get sessionSnapshots => 'Capturas';

  @override
  String get errorTrackingUnreliable =>
      'El seguimiento de posición no es fiable — el punto quedaría en otro sitio del que estás.';

  @override
  String errorNoSound(int seconds) {
    return 'No llegó ningún sonido en $seconds s.';
  }

  @override
  String get noteSnapshotNoPose => 'captura del analizador, sin posición';

  @override
  String get sessionChannels => 'Canales';

  @override
  String get trackingOk => 'Seguimiento OK';

  @override
  String get trackingLimited => 'Seguimiento débil';

  @override
  String get trackingUnavailable => 'Sin seguimiento';

  @override
  String get poseHintFeatures =>
      'Poco detalle en la imagen — apunta el teléfono a algo con textura, no a una pared lisa.';

  @override
  String get poseHintMotion =>
      'Movimiento demasiado rápido — camina más despacio.';

  @override
  String get poseHintLight =>
      'Poca luz — enciende la luz, la cámara no ve dónde está.';

  @override
  String get poseHintInitializing => 'ARKit está arrancando, muévete un poco.';

  @override
  String get poseHintRelocalizing =>
      'Buscando de nuevo el punto original — vuelve a donde empezaste.';

  @override
  String get signalPhonePink => 'Ruido rosa desde el teléfono';

  @override
  String get signalExternalPink => 'Ruido rosa desde los altavoces';

  @override
  String get signalExternalSweep => 'Sweep desde los altavoces';

  @override
  String get captureWarningBluetooth =>
      'Micrófono Bluetooth: la compresión y la latencia arruinan la medición. Desconecta los auriculares y mide con el micrófono integrado.';

  @override
  String get captureWarningProcessing =>
      'El sistema no desactivó el procesado de señal (AGC / supresión de ruido). Las diferencias medidas entre puntos estarán distorsionadas.';

  @override
  String get captureWarningMeasurementMode =>
      'No se pudo activar el measurement mode — el micrófono aplica su propia corrección de respuesta en frecuencia.';

  @override
  String get captureRouteUnknown => 'desconocido';

  @override
  String get axisLength => 'largo';

  @override
  String get axisWidth => 'ancho';

  @override
  String get axisHeight => 'alto';
}
