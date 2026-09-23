import 'dart:math' as math;

import '../dsp/octave_bands.dart';
import '../model/measurement.dart';

/// A sampled grid of interpolated levels, ready to paint.
class HeatmapGrid {
  HeatmapGrid({
    required this.values,
    required this.width,
    required this.height,
    required this.minX,
    required this.minZ,
    required this.cellSize,
    required this.minDb,
    required this.maxDb,
  });

  /// Row-major, [height] rows of [width]; NaN where no measurement is close
  /// enough to support a value.
  final List<double> values;
  final int width;
  final int height;
  final double minX;
  final double minZ;
  final double cellSize;
  final double minDb;
  final double maxDb;

  double valueAt(int col, int row) => values[row * width + col];

  /// 0…1 for painting, or null where the grid has no data.
  double? normalizedAt(int col, int row) {
    final v = valueAt(col, row);
    if (v.isNaN) return null;
    if (maxDb <= minDb) return 0.5;
    return ((v - minDb) / (maxDb - minDb)).clamp(0.0, 1.0);
  }
}

/// Inverse-distance-weighted interpolation of one frequency band across the
/// floor plan.
///
/// IDW is the right amount of cleverness here. It passes exactly through the
/// measured points, needs no grid fitting, and degrades honestly: where the
/// walk was sparse, the surface flattens toward the local average instead of
/// inventing structure. Kriging would look better and imply precision the
/// underlying data does not have.
///
/// [maxDistance] is what keeps it honest — beyond it a cell is left empty
/// rather than extrapolated. An unmeasured corner should read as unmeasured,
/// not as a confident blue patch.
HeatmapGrid interpolateBand(
  List<Measurement> points,
  OctaveBand band, {
  double cellSize = 0.15,
  double power = 2.0,
  double maxDistance = 1.5,
  double padding = 0.5,
}) {
  if (points.isEmpty) {
    return HeatmapGrid(
      values: const [],
      width: 0,
      height: 0,
      minX: 0,
      minZ: 0,
      cellSize: cellSize,
      minDb: 0,
      maxDb: 0,
    );
  }

  var minX = double.infinity, maxX = -double.infinity;
  var minZ = double.infinity, maxZ = -double.infinity;
  for (final p in points) {
    minX = math.min(minX, p.position.x);
    maxX = math.max(maxX, p.position.x);
    minZ = math.min(minZ, p.position.z);
    maxZ = math.max(maxZ, p.position.z);
  }
  minX -= padding;
  maxX += padding;
  minZ -= padding;
  maxZ += padding;

  final width = math.max(1, ((maxX - minX) / cellSize).ceil());
  final height = math.max(1, ((maxZ - minZ) / cellSize).ceil());
  final levels = [for (final p in points) p.levelAt(band)];

  final values = List<double>.filled(width * height, double.nan);
  var lo = double.infinity, hi = -double.infinity;

  for (var row = 0; row < height; row++) {
    for (var col = 0; col < width; col++) {
      final cx = minX + (col + 0.5) * cellSize;
      final cz = minZ + (row + 0.5) * cellSize;

      var weighted = 0.0;
      var weights = 0.0;
      var nearest = double.infinity;
      var exact = double.nan;

      for (var i = 0; i < points.length; i++) {
        final dx = points[i].position.x - cx;
        final dz = points[i].position.z - cz;
        final d = math.sqrt(dx * dx + dz * dz);
        nearest = math.min(nearest, d);
        if (d < 1e-6) {
          exact = levels[i];
          break;
        }
        if (d > maxDistance) continue;
        final w = 1 / math.pow(d, power);
        weighted += w * levels[i];
        weights += w;
      }

      double v;
      if (!exact.isNaN) {
        v = exact;
      } else if (weights > 0 && nearest <= maxDistance) {
        v = weighted / weights;
      } else {
        continue; // stays NaN — genuinely unmeasured
      }

      values[row * width + col] = v;
      lo = math.min(lo, v);
      hi = math.max(hi, v);
    }
  }

  if (lo == double.infinity) {
    lo = 0;
    hi = 0;
  }
  return HeatmapGrid(
    values: values,
    width: width,
    height: height,
    minX: minX,
    minZ: minZ,
    cellSize: cellSize,
    minDb: lo,
    maxDb: hi,
  );
}

/// The measured point with the flattest low-frequency response.
///
/// The plan's "best seat": lowest standard deviation across 40–300 Hz, the
/// range where room modes live and where a seat is either in a null or is not.
/// It reports a measured point rather than an interpolated optimum on purpose
/// — a recommendation you can walk to and re-measure is worth more than a
/// coordinate the interpolation invented.
Measurement? flattestListeningSpot(
  List<Measurement> points, {
  double low = 40,
  double high = 300,
}) {
  if (points.isEmpty) return null;
  return points.reduce((a, b) =>
      a.variationDb(low: low, high: high) <= b.variationDb(low: low, high: high)
          ? a
          : b);
}
