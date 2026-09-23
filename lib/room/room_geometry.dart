import 'dart:math' as math;

import '../model/measurement.dart';

/// A point in room coordinates: metres from one floor corner, x along the
/// length, y along the width, z upward.
///
/// Deliberately not [Vec3]. ARKit's frame has y up and an arbitrary origin
/// wherever the user tapped; the modal maths needs an origin at a corner with
/// axes along the walls, and silently mixing the two would put every
/// calculation in the wrong place. [RoomGeometry.fromAr] is the one crossing
/// point between them.
class RoomPoint {
  const RoomPoint(this.x, this.y, this.z);

  final double x;
  final double y;
  final double z;

  double distanceTo(RoomPoint o) => math.sqrt(math.pow(x - o.x, 2) +
      math.pow(y - o.y, 2) +
      math.pow(z - o.z, 2));

  @override
  String toString() => '(${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)}, '
      '${z.toStringAsFixed(2)})';

  Map<String, dynamic> toJson() => {'x': x, 'y': y, 'z': z};

  factory RoomPoint.fromJson(Map<String, dynamic> j) => RoomPoint(
      (j['x'] as num).toDouble(),
      (j['y'] as num).toDouble(),
      (j['z'] as num).toDouble());
}

/// Which boundary a surface is.
enum Boundary { frontWall, backWall, leftWall, rightWall, floor, ceiling }

extension BoundaryLabel on Boundary {
  String get label => switch (this) {
        Boundary.frontWall => 'přední stěna',
        Boundary.backWall => 'zadní stěna',
        Boundary.leftWall => 'levá stěna',
        Boundary.rightWall => 'pravá stěna',
        Boundary.floor => 'podlaha',
        Boundary.ceiling => 'strop',
      };
}

/// The room as the analysis needs it.
///
/// Dimensions are a shoebox fit, because that is what modal theory can actually
/// solve in closed form. A LiDAR scan of a real room is never a perfect box —
/// [irregularity] carries how badly it fits, so the report can say "these mode
/// frequencies are indicative" instead of quoting them to a tenth of a hertz
/// for an L-shaped room.
class RoomGeometry {
  RoomGeometry({
    required this.length,
    required this.width,
    required this.height,
    this.irregularity = 0,
    this.rt60 = 0.4,
    this.source = GeometrySource.manual,
    this.arOrigin = Vec3.zero,
    this.arYaw = 0,
  });

  /// Longest floor dimension, metres.
  final double length;

  /// The other floor dimension.
  final double width;
  final double height;

  /// 0 = a perfect box, 1 = nothing like one. From LiDAR: the fraction of the
  /// scanned floor area that the fitted rectangle misses.
  final double irregularity;

  /// Reverberation time, from a measured impulse response when there is one.
  /// Drives modal damping — with no damping every mode is an infinitely sharp
  /// spike and the predicted response is nonsense.
  final double rt60;

  final GeometrySource source;

  /// Where the room's corner sits in ARKit's world, and how the room is rotated
  /// in it. Together these map a measurement's AR position into room
  /// coordinates.
  final Vec3 arOrigin;
  final double arYaw;

  double get volume => length * width * height;
  double get floorArea => length * width;

  /// Total boundary area, for the statistical estimates.
  double get surfaceArea =>
      2 * (length * width + length * height + width * height);

  /// Schroeder frequency: above it the modes overlap so densely that they stop
  /// behaving as individual resonances and statistical acoustics takes over.
  ///
  /// This is the honest upper limit of everything modal in this file. Quoting a
  /// mode at 300 Hz in a living room is numerology.
  double get schroederFrequency => 2000 * math.sqrt(rt60 / volume);

  /// Sabine estimate of RT60 from an average absorption coefficient — a
  /// fallback for when no impulse response has been measured yet.
  static double sabineRt60(double volume, double surfaceArea,
          {double absorption = 0.2}) =>
      0.161 * volume / (surfaceArea * absorption);

  /// Converts an AR-frame measurement position into room coordinates.
  RoomPoint fromAr(Vec3 p) {
    final dx = p.x - arOrigin.x;
    final dz = p.z - arOrigin.z;
    final c = math.cos(-arYaw);
    final s = math.sin(-arYaw);
    return RoomPoint(
      dx * c - dz * s,
      dx * s + dz * c,
      p.y - arOrigin.y,
    );
  }

  bool contains(RoomPoint p) =>
      p.x >= 0 && p.x <= length && p.y >= 0 && p.y <= width && p.z >= 0 && p.z <= height;

  /// Distance from a point to each boundary.
  Map<Boundary, double> distancesToBoundaries(RoomPoint p) => {
        Boundary.frontWall: p.x,
        Boundary.backWall: length - p.x,
        Boundary.leftWall: p.y,
        Boundary.rightWall: width - p.y,
        Boundary.floor: p.z,
        Boundary.ceiling: height - p.z,
      };

  /// How close the room's proportions are to the ratios known to spread modes
  /// out evenly. Returns the worst offender, or null when nothing stands out.
  ///
  /// Dimensions in a small integer ratio stack modes on top of each other:
  /// a 5 × 2.5 m room puts the length's second mode exactly on the width's
  /// first, doubling that frequency's peak and leaving a wider gap next to it.
  /// Nothing can be done about it after the fact — but it explains a stubborn
  /// boom that no amount of subwoofer moving will fix.
  String? proportionWarning() {
    final dims = [length, width, height]..sort();
    for (final pair in [
      (dims[2], dims[1], 'délka', 'šířka'),
      (dims[2], dims[0], 'délka', 'výška'),
      (dims[1], dims[0], 'šířka', 'výška'),
    ]) {
      final ratio = pair.$1 / pair.$2;
      final nearest = ratio.roundToDouble();
      if (nearest >= 1 && nearest <= 3 && (ratio - nearest).abs() < 0.06) {
        return '${pair.$3} a ${pair.$4} jsou v poměru '
            '${ratio.toStringAsFixed(2)} : 1 — téměř přesně '
            '${nearest.toInt()} : 1. Módy obou rozměrů padají na sebe, '
            'což dělá úzký a tvrdohlavý hrb, se kterým posun subwooferu nehne.';
      }
    }
    return null;
  }
}

enum GeometrySource {
  /// Dimensions typed in by hand.
  manual,

  /// RoomPlan's parametric walls — a LiDAR device.
  lidar,

  /// ARCore's detected vertical planes, boxed. Android has no RoomPlan, so
  /// walls are whatever plane detection managed to see: usually the big
  /// ones, rarely the corners, never behind furniture. Good enough to name
  /// which mode a peak belongs to; not good enough for reflection points.
  arPlanes,

  /// A bounding box over the walked measurement points. Rough: it only knows
  /// where someone walked, which is never all the way into the corners.
  measurementHull,
}
