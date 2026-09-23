import 'dart:async';

import 'package:flutter/services.dart';

import '../model/measurement.dart';

/// How much ARKit trusts its own pose right now.
enum TrackingQuality {
  /// No pose at all — session starting, or relocalising after an interruption.
  unavailable,

  /// Tracking, but degraded: too dark, too featureless, or moving too fast.
  limited,

  /// Usable.
  normal;

  static TrackingQuality parse(String? s) => switch (s) {
        'normal' => TrackingQuality.normal,
        'limited' => TrackingQuality.limited,
        _ => TrackingQuality.unavailable,
      };

  bool get usableForMeasurement => this == TrackingQuality.normal;

  String get label => switch (this) {
        TrackingQuality.normal => 'Sledování OK',
        TrackingQuality.limited => 'Slabé sledování',
        TrackingQuality.unavailable => 'Bez sledování',
      };
}

/// One pose sample from ARKit.
class ArPose {
  const ArPose({
    required this.position,
    required this.quality,
    required this.reason,
  });

  /// Metres from the session origin.
  final Vec3 position;
  final TrackingQuality quality;

  /// ARKit's reason for a limited state, e.g. "insufficientFeatures".
  final String? reason;

  factory ArPose.fromMap(Map<dynamic, dynamic> m) => ArPose(
        position: Vec3(
          (m['x'] as num?)?.toDouble() ?? 0,
          (m['y'] as num?)?.toDouble() ?? 0,
          (m['z'] as num?)?.toDouble() ?? 0,
        ),
        quality: TrackingQuality.parse(m['quality'] as String?),
        reason: m['reason'] as String?,
      );

  String? get hint => switch (reason) {
        'insufficientFeatures' =>
          'Málo detailů v obraze — namiř telefon na něco členitého, ne na holou stěnu.',
        'excessiveMotion' => 'Moc rychlý pohyb — jdi pomaleji.',
        'initializing' => 'ARKit se rozjíždí, chvíli se pohybuj.',
        'relocalizing' =>
          'Hledá se zpět původní bod — vrať se, kde jsi začínal.',
        _ => null,
      };
}

/// Position tracking through ARKit.
///
/// Position only. The phone's heading is reported for the "you are holding it
/// wrong" warning and for nothing else — a single omnidirectional microphone
/// carries no directional information, so treating the phone's facing as a
/// sound direction would fabricate data. See [holdingWarning].
class ArTracking {
  ArTracking({
    MethodChannel? method,
    EventChannel? events,
  })  : _method = method ?? const MethodChannel('audioscanner/ar'),
        _events = events ?? const EventChannel('audioscanner/ar/pose');

  final MethodChannel _method;
  final EventChannel _events;
  Stream<ArPose>? _stream;

  /// True when the device can do world tracking at all.
  Future<bool> isSupported() async =>
      await _method.invokeMethod<bool>('isSupported') ?? false;

  Future<void> start() => _method.invokeMethod<void>('start');

  Future<void> stop() async {
    await _method.invokeMethod<void>('stop');
    _stream = null;
  }

  /// Makes the current position the origin — the plan's "put the origin at the
  /// listening seat" step. Every stored coordinate is relative to it.
  Future<void> setOrigin() => _method.invokeMethod<void>('setOrigin');

  Stream<ArPose> get poses => _stream ??= _events
      .receiveBroadcastStream()
      .map((e) => ArPose.fromMap(e as Map<dynamic, dynamic>));
}

/// Warns when the phone is held in a way that shades the microphone.
///
/// [pitchDegrees] is 0 with the phone upright, +90 with the screen facing the
/// ceiling. Flat is the common mistake: it puts the body of the phone, and
/// usually a hand, between the microphone and the speakers.
String? holdingWarning(double pitchDegrees) {
  if (pitchDegrees.abs() > 60) {
    return 'Drž telefon svisle, displejem k sobě — naplocho si stíníš mikrofon.';
  }
  return null;
}
