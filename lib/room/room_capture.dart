import 'package:flutter/services.dart';

import '../model/measurement.dart';
import 'room_geometry.dart';

/// A wall as RoomPlan saw it.
class ScannedWall {
  const ScannedWall({
    required this.center,
    required this.width,
    required this.height,
    required this.normal,
    required this.confidence,
  });

  final Vec3 center;
  final double width;
  final double height;

  /// Outward normal — which way the wall faces.
  final Vec3 normal;

  /// RoomPlan's own confidence: high, medium or low.
  final String confidence;
}

/// A scan result.
class ScannedRoom {
  const ScannedRoom({
    required this.geometry,
    required this.walls,
    required this.openings,
    required this.wallCount,
  });

  final RoomGeometry geometry;
  final List<ScannedWall> walls;

  /// Doors, windows and openings — the places a room leaks bass out of and
  /// where an absorber cannot go.
  final List<ScannedWall> openings;
  final int wallCount;

  /// Whether the shoebox fit is good enough to quote mode frequencies from.
  bool get boxLikeEnough => geometry.irregularity < 0.25;

  String? get caveat {
    if (boxLikeEnough) return null;
    return 'Místnost se od kvádru liší o '
        '${(geometry.irregularity * 100).toStringAsFixed(0)} % plochy stěn '
        '($wallCount stěn). Frekvence módů ber jako orientační — výklenek nebo '
        'otevřený průchod je posune a modální model o nich neví.';
  }
}

/// LiDAR room capture through Apple's RoomPlan.
///
/// Only on devices with a LiDAR scanner. [isSupported] is the gate: on anything
/// else the app falls back to typed-in dimensions, which costs the reflection
/// points and the wall normals but keeps every modal calculation, since those
/// need only three numbers.
class RoomCapture {
  RoomCapture({MethodChannel? method, EventChannel? events})
      : _method = method ?? const MethodChannel('audioscanner/room'),
        _events = events ?? const EventChannel('audioscanner/room/geometry');

  final MethodChannel _method;
  final EventChannel _events;
  Stream<ScannedRoom>? _stream;

  Future<bool> isSupported() async =>
      await _method.invokeMethod<bool>('isSupported') ?? false;

  Future<void> start() => _method.invokeMethod<void>('start');

  Future<void> stop() async {
    await _method.invokeMethod<void>('stop');
    _stream = null;
  }

  /// Updates as the scan fills in. The last one before [stop] is the good one.
  Stream<ScannedRoom> get rooms => _stream ??= _events
      .receiveBroadcastStream()
      .map((e) => parseRoom(e as Map<dynamic, dynamic>));

  /// Parsing kept public and pure so the whole geometry pipeline is testable
  /// without a LiDAR device — which is the only way it gets tested at all here.
  static ScannedRoom parseRoom(Map<dynamic, dynamic> m, {double rt60 = 0.4}) {
    double d(String k) => (m[k] as num?)?.toDouble() ?? 0;

    List<ScannedWall> walls(String key) => [
          for (final w in (m[key] as List? ?? []))
            if (w is Map)
              ScannedWall(
                center: Vec3((w['cx'] as num?)?.toDouble() ?? 0,
                    (w['cy'] as num?)?.toDouble() ?? 0,
                    (w['cz'] as num?)?.toDouble() ?? 0),
                width: (w['width'] as num?)?.toDouble() ?? 0,
                height: (w['height'] as num?)?.toDouble() ?? 0,
                normal: Vec3((w['nx'] as num?)?.toDouble() ?? 0,
                    (w['ny'] as num?)?.toDouble() ?? 0,
                    (w['nz'] as num?)?.toDouble() ?? 0),
                confidence: (w['confidence'] as String?) ?? 'unknown',
              )
        ];

    // RoomPlan reports the longer floor dimension in whichever axis it happens
    // to fall; the modal maths wants length ≥ width, so they are ordered here
    // once rather than at every call site.
    final a = d('length');
    final b = d('width');
    final length = a >= b ? a : b;
    final width = a >= b ? b : a;

    return ScannedRoom(
      geometry: RoomGeometry(
        length: length,
        width: width,
        height: d('height') > 0 ? d('height') : 2.6,
        irregularity: d('irregularity'),
        rt60: rt60,
        source: GeometrySource.lidar,
        arOrigin: Vec3(d('originX'), 0, d('originZ')),
      ),
      walls: walls('walls'),
      openings: walls('openings'),
      wallCount: (m['wallCount'] as num?)?.toInt() ?? 0,
    );
  }
}

/// Fallback geometry from where the user actually walked.
///
/// Rough on purpose, and it says so: a walk never reaches into the corners or
/// behind the sofa, so this box is always a little small. Good enough to get
/// mode frequencies within a few per cent, which is enough to recognise which
/// mode a measured peak belongs to.
RoomGeometry geometryFromMeasurements(
  List<Measurement> points, {
  double ceilingHeight = 2.6,
  double rt60 = 0.4,
  double margin = 0.4,
}) {
  if (points.isEmpty) {
    return RoomGeometry(
        length: 5, width: 4, height: ceilingHeight, rt60: rt60);
  }
  var minX = double.infinity, maxX = -double.infinity;
  var minZ = double.infinity, maxZ = -double.infinity;
  for (final p in points) {
    if (p.position.x < minX) minX = p.position.x;
    if (p.position.x > maxX) maxX = p.position.x;
    if (p.position.z < minZ) minZ = p.position.z;
    if (p.position.z > maxZ) maxZ = p.position.z;
  }
  final a = (maxX - minX) + 2 * margin;
  final b = (maxZ - minZ) + 2 * margin;
  return RoomGeometry(
    length: a >= b ? a : b,
    width: a >= b ? b : a,
    height: ceilingHeight,
    irregularity: 0.3,
    rt60: rt60,
    source: GeometrySource.measurementHull,
    arOrigin: Vec3(minX - margin, 0, minZ - margin),
  );
}
