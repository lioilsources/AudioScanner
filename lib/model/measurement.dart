import 'dart:math' as math;

import '../dsp/octave_bands.dart';

/// A position in the room, in metres, relative to the session origin.
///
/// ARKit's axes as taken at origin time: x right, y up, z toward the viewer.
/// Only position is ever stored. The phone's orientation is deliberately not
/// part of a measurement — a single omni microphone cannot tell where a sound
/// came from, and recording a heading would invite a map that claims it can.
class Vec3 {
  const Vec3(this.x, this.y, this.z);

  final double x;
  final double y;
  final double z;

  static const zero = Vec3(0, 0, 0);

  /// Distance in the floor plane, ignoring height — the distance that matters
  /// for a 2-D plan heatmap.
  double planarDistanceTo(Vec3 o) =>
      math.sqrt(math.pow(x - o.x, 2) + math.pow(z - o.z, 2));

  double distanceTo(Vec3 o) => math.sqrt(
      math.pow(x - o.x, 2) + math.pow(y - o.y, 2) + math.pow(z - o.z, 2));

  Map<String, dynamic> toJson() => {'x': x, 'y': y, 'z': z};

  factory Vec3.fromJson(Map<String, dynamic> j) =>
      Vec3((j['x'] as num).toDouble(), (j['y'] as num).toDouble(),
          (j['z'] as num).toDouble());

  @override
  String toString() =>
      '(${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)}, ${z.toStringAsFixed(2)})';
}

/// One measurement point: where the phone was, and what it heard there.
class Measurement {
  Measurement({
    required this.id,
    required this.position,
    required this.timestamp,
    required this.bandsDb,
    required this.rmsDbfs,
    this.arAccuracy,
    this.note,
  });

  final String id;
  final Vec3 position;
  final DateTime timestamp;

  /// 1/3-octave levels aligned with [OctaveBands.all], in dB relative to full
  /// scale. Not SPL: the phone's microphone is uncalibrated, so only
  /// differences between points carry meaning.
  final List<double> bandsDb;
  final double rmsDbfs;

  /// ARKit's own confidence in the pose when this point was taken, if known.
  final String? arAccuracy;
  final String? note;

  double levelAt(OctaveBand band) {
    final i = OctaveBands.all.indexWhere((b) => b.index == band.index);
    return i < 0 ? -160 : bandsDb[i];
  }

  /// Spread of the response across a frequency range, in dB.
  ///
  /// The plan's "flattest seat" metric: standard deviation of the band levels
  /// between [low] and [high]. Low is flat, high means peaks and nulls.
  double variationDb({double low = 40, double high = 300}) {
    final bands = OctaveBands.inRange(low, high);
    if (bands.isEmpty) return 0;
    final levels = [for (final b in bands) levelAt(b)];
    final mean = levels.reduce((a, b) => a + b) / levels.length;
    final variance =
        levels.map((l) => math.pow(l - mean, 2)).reduce((a, b) => a + b) /
            levels.length;
    return math.sqrt(variance);
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'position': position.toJson(),
        'timestamp': timestamp.toIso8601String(),
        'bandsDb': bandsDb,
        'rmsDbfs': rmsDbfs,
        if (arAccuracy != null) 'arAccuracy': arAccuracy,
        if (note != null) 'note': note,
      };

  factory Measurement.fromJson(Map<String, dynamic> j) => Measurement(
        id: j['id'] as String,
        position: Vec3.fromJson(j['position'] as Map<String, dynamic>),
        timestamp: DateTime.parse(j['timestamp'] as String),
        bandsDb: [for (final v in j['bandsDb'] as List) (v as num).toDouble()],
        rmsDbfs: (j['rmsDbfs'] as num).toDouble(),
        arAccuracy: j['arAccuracy'] as String?,
        note: j['note'] as String?,
      );
}
