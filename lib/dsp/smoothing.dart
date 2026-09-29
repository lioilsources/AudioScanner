import 'dart:math' as math;
import 'dart:typed_data';

/// Fractional-octave smoothing of a magnitude response.
///
/// [octaveFraction] is the denominator: 3 for 1/3-octave, 6 for 1/6, and so
/// on. Each output bin is the energy mean of every input bin within
/// ±1/(2·fraction) octave of it, so the window is constant on a log axis and
/// the smoothing is as wide in octaves at 50 Hz as at 5 kHz — which is how the
/// ear and every other room-measurement tool treat it. Averaging energy
/// rather than dB keeps a narrow peak from disappearing into a neighbouring
/// null.
///
/// Bins below [validAbove] are copied through untouched. A gated response is
/// an artefact of the window there, not data, and smoothing an artefact only
/// makes it look like data.
///
/// [frequencies] must be ascending. Zero and negative frequencies are copied
/// through as well: there is no octave around DC.
Float64List smoothFractionalOctave(
  List<double> frequencies,
  List<double> levelsDb, {
  required int octaveFraction,
  double validAbove = 0,
}) {
  if (frequencies.length != levelsDb.length) {
    throw ArgumentError('frequencies and levels differ in length');
  }
  final n = frequencies.length;
  final out = Float64List(n);
  if (n == 0) return out;

  final halfWidth = math.pow(2, 1 / (2 * octaveFraction)).toDouble();
  final power = Float64List(n);
  for (var i = 0; i < n; i++) {
    power[i] = math.pow(10, levelsDb[i] / 10).toDouble();
  }

  // Sliding window over ascending frequencies: both edges only ever move
  // forward, so the whole pass is linear in the number of bins.
  var lo = 0, hi = 0;
  var sum = 0.0;
  for (var i = 0; i < n; i++) {
    final f = frequencies[i];
    if (f <= 0 || f < validAbove) {
      out[i] = levelsDb[i];
      continue;
    }
    final fLo = f / halfWidth;
    final fHi = f * halfWidth;
    while (hi < n && frequencies[hi] <= fHi) {
      sum += power[hi];
      hi++;
    }
    while (lo < hi && frequencies[lo] < fLo) {
      sum -= power[lo];
      lo++;
    }
    final count = hi - lo;
    if (count <= 0) {
      out[i] = levelsDb[i];
      continue;
    }
    final mean = sum / count;
    out[i] = mean <= 0 ? -160 : 10 * math.log(mean) / math.ln10;
  }
  return out;
}
