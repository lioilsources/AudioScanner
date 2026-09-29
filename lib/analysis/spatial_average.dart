import 'dart:math' as math;

import '../dsp/octave_bands.dart';
import '../model/measurement.dart';

/// The mean response over a patch of floor, and how much it varies there.
///
/// This is the one idea worth borrowing from multi-position correction
/// systems: a peak that is there at every seat is the room and can be cut; a
/// peak that is there at one seat and gone half a metre away is position, and
/// correcting it moves the problem rather than removing it. [spreadDb] per
/// band is the standard deviation across the points and is what the EQ uses
/// to decide how much of a correction to believe.
class SpatialAverage {
  const SpatialAverage({
    required this.meanBandsDb,
    required this.spreadDb,
    required this.count,
  });

  final List<double> meanBandsDb;
  final List<double> spreadDb;
  final int count;

  /// Fewer than three points is not an average, it is a guess with error bars
  /// that cannot be estimated.
  bool get lowConfidence => count < 3;

  static SpatialAverage empty = SpatialAverage(
    meanBandsDb: List<double>.filled(OctaveBands.all.length, -160),
    spreadDb: List<double>.filled(OctaveBands.all.length, 0),
    count: 0,
  );
}

/// Energy mean and spread of the points within [radiusM] of [around] in the
/// floor plane.
///
/// Energy mean, as everywhere else: averaging dB would let one deep null
/// drag the average down by more than the peak next to it lifts it, which is
/// the opposite of what the ear does. The spread stays in dB because that is
/// the unit the decision is made in.
SpatialAverage spatialAverage(
  Iterable<Measurement> points, {
  Vec3 around = Vec3.zero,
  double radiusM = 1.0,
}) {
  final n = OctaveBands.all.length;
  final selected = [
    for (final p in points)
      if (p.position.planarDistanceTo(around) <= radiusM) p
  ];
  if (selected.isEmpty) return SpatialAverage.empty;

  final sumPower = List<double>.filled(n, 0);
  for (final p in selected) {
    for (var i = 0; i < n; i++) {
      sumPower[i] += math.pow(10, p.bandsDb[i] / 10).toDouble();
    }
  }
  final mean = [
    for (final s in sumPower)
      s <= 0 ? -160.0 : 10 * math.log(s / selected.length) / math.ln10
  ];

  final spread = List<double>.filled(n, 0);
  if (selected.length > 1) {
    for (var i = 0; i < n; i++) {
      var meanDb = 0.0;
      for (final p in selected) {
        meanDb += p.bandsDb[i];
      }
      meanDb /= selected.length;
      var ss = 0.0;
      for (final p in selected) {
        ss += math.pow(p.bandsDb[i] - meanDb, 2);
      }
      spread[i] = math.sqrt(ss / selected.length);
    }
  }
  return SpatialAverage(
      meanBandsDb: mean, spreadDb: spread, count: selected.length);
}
