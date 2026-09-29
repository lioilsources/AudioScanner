import 'dart:math' as math;
import 'dart:typed_data';

import '../dsp/impulse_response.dart';
import '../dsp/smoothing.dart';

/// Everything a screen wants to show about one impulse response, computed
/// once per (response, gate) pair.
///
/// The FFTs are the expensive part, and screens rebuild on every audio frame
/// while the microphone runs. Holding the results here, keyed on identity of
/// the response and the gate length, keeps the UI from redoing a 64k-point
/// transform thirty times a second for a curve that has not changed.
class ResponseAnalysis {
  ResponseAnalysis._({
    required this.source,
    required this.gate,
    required this.gated,
    required this.room,
    required this.frequencies,
    required this.gatedDb,
    required this.gatedRe,
    required this.gatedIm,
    required this.roomDb,
  });

  /// Length of the window that stands in for "the whole room". One second
  /// covers the decay of any domestic room and keeps the transform bounded;
  /// a ten-second recording would otherwise mean a million-point FFT for a
  /// curve that stops changing after the first few hundred milliseconds.
  static const roomWindow = Duration(seconds: 1);

  factory ResponseAnalysis.of(ImpulseResponse ir, {required Duration gate}) {
    final gated = ir.gated(window: gate);
    final room = ir.gated(window: roomWindow);

    // Same FFT length for both so the curves share a frequency axis and can
    // be drawn, subtracted and exported together without resampling.
    final n = _fftLengthFor(room.samples.length);
    final (freqs, re, im) = gated.complexResponse(fftSize: n);
    final (_, roomDb) = room.frequencyResponse(fftSize: n);

    final gatedDb = Float64List(freqs.length);
    for (var k = 0; k < freqs.length; k++) {
      final mag = _hypot(re[k], im[k]);
      gatedDb[k] = mag <= 0 ? -160 : 20 * _log10(mag);
    }

    return ResponseAnalysis._(
      source: ir,
      gate: gate,
      gated: gated,
      room: room,
      frequencies: freqs,
      gatedDb: gatedDb,
      gatedRe: re,
      gatedIm: im,
      roomDb: roomDb,
    );
  }

  final ImpulseResponse source;
  final Duration gate;
  final ImpulseResponse gated;
  final ImpulseResponse room;
  final Float64List frequencies;
  final Float64List gatedDb;
  final Float64List gatedRe;
  final Float64List gatedIm;
  final Float64List roomDb;

  double get validAbove => gated.gatedResponseValidAbove;

  /// True when this analysis still describes [ir] at [gate]; the screen keeps
  /// the instance while it does and rebuilds it when it does not.
  bool matches(ImpulseResponse ir, Duration gate) =>
      identical(ir, source) && gate == this.gate;

  final _smoothedGated = <int, Float64List>{};
  final _smoothedRoom = <int, Float64List>{};

  Float64List gatedSmoothed(int octaveFraction) =>
      _smoothedGated[octaveFraction] ??= smoothFractionalOctave(
        frequencies,
        gatedDb,
        octaveFraction: octaveFraction,
        validAbove: validAbove,
      );

  Float64List roomSmoothed(int octaveFraction) =>
      _smoothedRoom[octaveFraction] ??= smoothFractionalOctave(
        frequencies,
        roomDb,
        octaveFraction: octaveFraction,
        validAbove: room.gatedResponseValidAbove,
      );

  static int _fftLengthFor(int samples) {
    var n = 16384;
    while (n < samples) {
      n *= 2;
    }
    return n;
  }
}

double _hypot(double a, double b) => math.sqrt(a * a + b * b);
double _log10(double x) => math.log(x) / math.ln10;
