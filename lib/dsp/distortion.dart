import 'dart:math' as math;
import 'dart:typed_data';

import 'package:fftea/fftea.dart';

import '../signal/log_sweep.dart';
import 'impulse_response.dart';

/// One harmonic order's level against the fundamental, per fundamental
/// frequency.
class HarmonicLevel {
  const HarmonicLevel({
    required this.order,
    required this.fundamentalsHz,
    required this.levelsDb,
  });

  final int order;

  /// Frequencies of the *fundamental* that produced this harmonic.
  final List<double> fundamentalsHz;

  /// Harmonic level in dB relative to the fundamental at the same excitation
  /// frequency. −40 means the harmonic is 1 % of the fundamental.
  final List<double> levelsDb;

  /// Level at the fundamental nearest [hz].
  double at(double hz) {
    var best = 0;
    for (var i = 1; i < fundamentalsHz.length; i++) {
      if ((fundamentalsHz[i] - hz).abs() < (fundamentalsHz[best] - hz).abs()) {
        best = i;
      }
    }
    return levelsDb.isEmpty ? double.nan : levelsDb[best];
  }
}

/// Harmonic distortion from a sweep measurement, Farina's way.
///
/// A log sweep's n-th harmonic is the same sweep started earlier: its
/// deconvolution lands a separate impulse exactly L·ln(n) before the linear
/// one, with L the sweep's rate constant. Windowing each of those out and
/// transforming gives the harmonic's response — at the harmonic's own
/// frequency, so the axis is divided by n to read it against the
/// fundamental that caused it.
///
/// The level comes out right without a correction factor: the inverse
/// filter's −6 dB/octave envelope is applied at the *harmonic's* frequency,
/// which is n times higher, but the harmonic sweep is also n times shorter
/// in log-frequency terms, and the two cancel in the matched filter. The
/// test with a known y = x + 0.1·x² chain is what this statement rests on.
///
/// Returns nothing when the response has no negative-time region to look
/// in, i.e. did not come from a sweep.
List<HarmonicLevel> harmonicDistortion(
  ImpulseResponse ir,
  LogSweep sweep, {
  List<int> orders = const [2, 3],
  Duration window = const Duration(milliseconds: 2),
  double minHz = 40,
  double maxHz = 8000,
}) {
  if (ir.negativeTime == null || ir.samples.isEmpty) return const [];
  final rate = ir.sampleRate;
  final direct = ir.directSoundIndex;
  final half = math.max(8, (window.inMicroseconds * rate / 1e6).round());
  final n = _powerOfTwoAbove(2 * half * 4);

  Float64List spectrumAround(int center) {
    final buf = Float64List(n);
    // Hann over ±half, centred on the impulse.
    for (var i = -half; i <= half; i++) {
      final w = 0.5 * (1 + math.cos(math.pi * i / half));
      buf[(i + n) % n] = ir.sampleAt(center + i) * w;
    }
    final spec = FFT(n).realFft(buf);
    final mag = Float64List(spec.length);
    for (var k = 0; k < spec.length; k++) {
      mag[k] = math.sqrt(spec[k].x * spec[k].x + spec[k].y * spec[k].y);
    }
    return mag;
  }

  final binHz = rate / n;
  final linear = spectrumAround(direct);
  final out = <HarmonicLevel>[];

  for (final order in orders) {
    final advance = (sweep.rate * math.log(order) * rate).round();
    final at = direct - advance;
    if (at + half < -(ir.negativeTime!.length)) continue;
    final harmonic = spectrumAround(at);

    final fundamentals = <double>[];
    final levels = <double>[];
    // Read on a 1/6-octave grid of fundamental frequencies.
    for (var f = minHz; f <= maxHz; f *= math.pow(2, 1 / 6)) {
      final kFund = (f / binHz).round();
      final kHarm = (f * order / binHz).round();
      if (kFund < 1 || kHarm >= harmonic.length) continue;
      final fund = linear[kFund];
      final harm = harmonic[kHarm];
      if (fund <= 0) continue;
      fundamentals.add(f);
      levels.add(harm <= 0 ? -160 : 20 * math.log(harm / fund) / math.ln10);
    }
    out.add(HarmonicLevel(
        order: order, fundamentalsHz: fundamentals, levelsDb: levels));
  }
  return out;
}

int _powerOfTwoAbove(int n) {
  var p = 1;
  while (p < n) {
    p *= 2;
  }
  return p;
}
