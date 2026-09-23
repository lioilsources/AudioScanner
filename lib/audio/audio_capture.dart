import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';

/// What the OS actually gave us, as opposed to what we asked for.
///
/// Every field here exists because it can silently differ from the request and
/// quietly invalidate a measurement. A session recorded through automatic gain
/// control is not a worse measurement, it is a measurement of the AGC.
class CaptureStatus {
  const CaptureStatus({
    required this.sampleRate,
    required this.measurementMode,
    required this.processingDisabled,
    required this.route,
    required this.isBluetooth,
  });

  final double sampleRate;

  /// iOS `AVAudioSession.Mode.measurement` was accepted.
  final bool measurementMode;

  /// AGC, noise suppression and echo cancellation are all off.
  final bool processingDisabled;

  /// Human-readable input route, e.g. "iPhone Microphone".
  final String route;
  final bool isBluetooth;

  /// Whether the numbers this produces are worth comparing between points.
  bool get isTrustworthy =>
      measurementMode && processingDisabled && !isBluetooth;

  /// Why not, in the user's language, or null when it is fine.
  String? get warning {
    if (isBluetooth) {
      return 'Bluetooth mikrofon: komprese a latence měření znehodnotí. '
          'Odpoj sluchátka a měř vestavěným mikrofonem.';
    }
    if (!processingDisabled) {
      return 'Systém nevypnul úpravy signálu (AGC / potlačení šumu). '
          'Naměřené rozdíly mezi místy budou zkreslené.';
    }
    if (!measurementMode) {
      return 'Nepodařilo se zapnout measurement mode — mikrofon má vlastní '
          'korekci frekvenční charakteristiky.';
    }
    return null;
  }

  factory CaptureStatus.fromMap(Map<dynamic, dynamic> m) => CaptureStatus(
        sampleRate: (m['sampleRate'] as num?)?.toDouble() ?? 0,
        measurementMode: m['measurementMode'] as bool? ?? false,
        processingDisabled: m['processingDisabled'] as bool? ?? false,
        route: m['route'] as String? ?? 'neznámý',
        isBluetooth: m['isBluetooth'] as bool? ?? false,
      );
}

/// Raw PCM capture from the platform.
///
/// No Flutter audio plugin gives raw, unprocessed PCM with the session
/// configured for measurement, so this is a thin channel onto Swift rather than
/// a package. The native side owns the audio session; Dart only asks and is
/// told what it got.
class AudioCapture {
  AudioCapture({
    MethodChannel? method,
    EventChannel? events,
  })  : _method = method ?? const MethodChannel('audioscanner/capture'),
        _events = events ?? const EventChannel('audioscanner/capture/pcm');

  final MethodChannel _method;
  final EventChannel _events;

  Stream<Float64List>? _stream;

  /// Requests microphone permission. Returns false if the user said no.
  Future<bool> requestPermission() async =>
      await _method.invokeMethod<bool>('requestPermission') ?? false;

  /// Starts capture at [sampleRate] Hz, mono, with all processing disabled.
  Future<CaptureStatus> start({double sampleRate = 48000}) async {
    final m = await _method.invokeMethod<Map<dynamic, dynamic>>(
      'start',
      {'sampleRate': sampleRate},
    );
    if (m == null) throw StateError('capture start returned nothing');
    return CaptureStatus.fromMap(m);
  }

  Future<void> stop() async {
    await _method.invokeMethod<void>('stop');
    _stream = null;
  }

  Future<CaptureStatus> status() async {
    final m = await _method.invokeMethod<Map<dynamic, dynamic>>('status');
    if (m == null) throw StateError('capture status returned nothing');
    return CaptureStatus.fromMap(m);
  }

  /// Mono float samples in −1…1, in whatever block size the OS delivers.
  Stream<Float64List> get pcm => _stream ??= _events
      .receiveBroadcastStream()
      .map((e) => _toFloat64(e as Float32List));

  static Float64List _toFloat64(Float32List src) {
    final out = Float64List(src.length);
    for (var i = 0; i < src.length; i++) {
      out[i] = src[i];
    }
    return out;
  }
}

/// Reassembles the OS's arbitrary block sizes into fixed-size analysis frames.
///
/// The FFT needs exactly 8192 samples; Core Audio hands over whatever the
/// hardware buffer happens to be. [hopSize] below [frameSize] gives overlapping
/// frames, which is what keeps a 60 fps display fed without raising the FFT
/// rate.
class FrameAssembler {
  FrameAssembler({required this.frameSize, int? hopSize})
      : hopSize = hopSize ?? frameSize,
        _buffer = Float64List(frameSize * 2);

  final int frameSize;
  final int hopSize;
  final Float64List _buffer;
  int _filled = 0;

  /// Feeds samples in, yields every complete frame they produced.
  Iterable<Float64List> add(List<double> samples) sync* {
    var offset = 0;
    while (offset < samples.length) {
      final take = _buffer.length - _filled < samples.length - offset
          ? _buffer.length - _filled
          : samples.length - offset;
      if (take <= 0) {
        _filled = 0; // overflow: drop rather than drift out of real time
        continue;
      }
      for (var i = 0; i < take; i++) {
        _buffer[_filled + i] = samples[offset + i];
      }
      _filled += take;
      offset += take;

      while (_filled >= frameSize) {
        yield Float64List.fromList(_buffer.sublist(0, frameSize));
        _buffer.setRange(0, _filled - hopSize, _buffer.sublist(hopSize, _filled));
        _filled -= hopSize;
      }
    }
  }

  void reset() => _filled = 0;
}
