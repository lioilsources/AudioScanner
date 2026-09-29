import 'dart:math' as math;

/// Q of one band of the receiver's graphic equaliser, as modelled here.
///
/// The Integra does not publish its filter shapes. What is known is the band
/// spacing — two thirds of an octave — and that a graphic EQ is meant to sum
/// flat when every slider sits at the same gain. Those two facts fix Q: too
/// narrow and equal gains ripple between the centres, too wide and each
/// slider drags its neighbours. The value here keeps the ripple of an
/// all-bands-equal setting under 1 dB, which the test pins down; it is an
/// approximation of the receiver, not a measurement of it, and the
/// verification pass after entering the EQ is what says how close it came.
const double integraEqQ = 2.0;

/// Magnitude in dB of a peaking filter at [hz].
///
/// Analog prototype (RBJ), which is what a graphic EQ approximates and needs
/// no sample rate: H(s) = (s² + s·A/Q + 1) / (s² + s/(A·Q) + 1) with
/// A = 10^(gain/40) and s = j·hz/center. Cut and boost are mirror images, as
/// they are in a symmetric peaking filter.
double peakingResponseDb(double hz, {required double centerHz, required double gainDb, double q = integraEqQ}) {
  if (gainDb == 0 || hz <= 0) return 0;
  final a = math.pow(10, gainDb / 40).toDouble();
  final w = hz / centerHz;
  final w2 = w * w;
  // |num|² and |den|² of (1 − w²) + j·w·k for k = A/Q and 1/(A·Q).
  final re = 1 - w2;
  final numMag2 = re * re + math.pow(w * a / q, 2);
  final denMag2 = re * re + math.pow(w / (a * q), 2);
  return 10 * math.log(numMag2 / denMag2) / math.ln10;
}

/// Combined response of the whole graphic EQ, one value per frequency.
///
/// Bands in cascade add in dB. Zero-gain bands contribute nothing, so a
/// preset that touches three bands costs three filters, not fifteen.
List<double> graphicEqResponseDb(
  List<double> frequencies,
  List<double> bandCenters,
  List<double> gainsDb, {
  double q = integraEqQ,
}) {
  if (bandCenters.length != gainsDb.length) {
    throw ArgumentError('one gain per band');
  }
  final out = List<double>.filled(frequencies.length, 0);
  for (var b = 0; b < bandCenters.length; b++) {
    final g = gainsDb[b];
    if (g == 0) continue;
    for (var i = 0; i < frequencies.length; i++) {
      out[i] += peakingResponseDb(frequencies[i], centerHz: bandCenters[b], gainDb: g, q: q);
    }
  }
  return out;
}

/// Standard deviation of (levels − target) over [low]…[high] Hz.
///
/// The one number the EQ is judged by: how far, on average, the response
/// strays from where it was meant to be in the range the EQ works.
double deviationFromTargetDb(
  List<double> frequencies,
  List<double> levelsDb,
  List<double> targetDb, {
  double low = 40,
  double high = 300,
}) {
  var sum = 0.0, sumSq = 0.0;
  var n = 0;
  for (var i = 0; i < frequencies.length; i++) {
    final f = frequencies[i];
    if (f < low || f > high) continue;
    final d = levelsDb[i] - targetDb[i];
    if (!d.isFinite) continue;
    sum += d;
    sumSq += d * d;
    n++;
  }
  if (n == 0) return 0;
  final mean = sum / n;
  return math.sqrt(math.max(0, sumSq / n - mean * mean));
}
