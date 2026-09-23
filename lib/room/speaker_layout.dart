import 'dart:math' as math;

import 'room_geometry.dart';

/// The channels of a 7.1.4 bed with Front High + Rear Height — the layout in
/// the diagram, and what the Integra calls Height 1 / Height 2.
enum Channel {
  frontLeft,
  center,
  frontRight,
  surroundLeft,
  surroundRight,
  surroundBackLeft,
  surroundBackRight,
  heightFrontLeft,
  heightFrontRight,
  heightRearLeft,
  heightRearRight,
  subwoofer;

  String get label => switch (this) {
        Channel.frontLeft => 'Front Left',
        Channel.center => 'Center',
        Channel.frontRight => 'Front Right',
        Channel.surroundLeft => 'Surround Left',
        Channel.surroundRight => 'Surround Right',
        Channel.surroundBackLeft => 'Surround Back Left',
        Channel.surroundBackRight => 'Surround Back Right',
        Channel.heightFrontLeft => 'Height 1 Left (Front High)',
        Channel.heightFrontRight => 'Height 1 Right (Front High)',
        Channel.heightRearLeft => 'Height 2 Left (Rear Height)',
        Channel.heightRearRight => 'Height 2 Right (Rear Height)',
        Channel.subwoofer => 'Subwoofer',
      };

  /// The channel's mirror image, or null for the ones on the centre line.
  /// Symmetry checks are the most productive thing this file does, so the
  /// pairing is data rather than a series of if-statements.
  Channel? get pair => switch (this) {
        Channel.frontLeft => Channel.frontRight,
        Channel.frontRight => Channel.frontLeft,
        Channel.surroundLeft => Channel.surroundRight,
        Channel.surroundRight => Channel.surroundLeft,
        Channel.surroundBackLeft => Channel.surroundBackRight,
        Channel.surroundBackRight => Channel.surroundBackLeft,
        Channel.heightFrontLeft => Channel.heightFrontRight,
        Channel.heightFrontRight => Channel.heightFrontLeft,
        Channel.heightRearLeft => Channel.heightRearRight,
        Channel.heightRearRight => Channel.heightRearLeft,
        _ => null,
      };

  bool get isHeight => switch (this) {
        Channel.heightFrontLeft ||
        Channel.heightFrontRight ||
        Channel.heightRearLeft ||
        Channel.heightRearRight =>
          true,
        _ => false,
      };
}

/// The angle window Dolby publishes for a channel, seen from the seat.
///
/// Azimuth is measured from straight ahead, positive to either side (the check
/// works on magnitudes, so one table serves both L and R). Elevation is above
/// the ear plane. Ranges are Dolby's home Atmos guidance; the ideal is the
/// middle of the window unless Dolby names a preferred value.
class ChannelTarget {
  const ChannelTarget({
    required this.azimuthMin,
    required this.azimuthIdeal,
    required this.azimuthMax,
    this.elevationMin = 0,
    this.elevationIdeal = 0,
    this.elevationMax = 0,
  });

  final double azimuthMin;
  final double azimuthIdeal;
  final double azimuthMax;
  final double elevationMin;
  final double elevationIdeal;
  final double elevationMax;

  bool get hasElevation => elevationMax > 0;
}

const Map<Channel, ChannelTarget> dolbyTargets = {
  Channel.frontLeft: ChannelTarget(azimuthMin: 22, azimuthIdeal: 26, azimuthMax: 30),
  Channel.frontRight: ChannelTarget(azimuthMin: 22, azimuthIdeal: 26, azimuthMax: 30),
  Channel.center: ChannelTarget(azimuthMin: 0, azimuthIdeal: 0, azimuthMax: 5),
  Channel.surroundLeft:
      ChannelTarget(azimuthMin: 90, azimuthIdeal: 100, azimuthMax: 110),
  Channel.surroundRight:
      ChannelTarget(azimuthMin: 90, azimuthIdeal: 100, azimuthMax: 110),
  Channel.surroundBackLeft:
      ChannelTarget(azimuthMin: 135, azimuthIdeal: 145, azimuthMax: 150),
  Channel.surroundBackRight:
      ChannelTarget(azimuthMin: 135, azimuthIdeal: 145, azimuthMax: 150),
  Channel.heightFrontLeft: ChannelTarget(
      azimuthMin: 30,
      azimuthIdeal: 45,
      azimuthMax: 55,
      elevationMin: 30,
      elevationIdeal: 45,
      elevationMax: 55),
  Channel.heightFrontRight: ChannelTarget(
      azimuthMin: 30,
      azimuthIdeal: 45,
      azimuthMax: 55,
      elevationMin: 30,
      elevationIdeal: 45,
      elevationMax: 55),
  Channel.heightRearLeft: ChannelTarget(
      azimuthMin: 125,
      azimuthIdeal: 135,
      azimuthMax: 150,
      elevationMin: 30,
      elevationIdeal: 45,
      elevationMax: 55),
  Channel.heightRearRight: ChannelTarget(
      azimuthMin: 125,
      azimuthIdeal: 135,
      azimuthMax: 150,
      elevationMin: 30,
      elevationIdeal: 45,
      elevationMax: 55),
};

/// Where one speaker physically is.
class SpeakerPlacement {
  const SpeakerPlacement({required this.channel, required this.position});

  final Channel channel;
  final RoomPoint position;
}

/// How a speaker sits relative to the seat, and how far that is from Dolby's
/// window.
class AngleCheck {
  const AngleCheck({
    required this.channel,
    required this.azimuth,
    required this.elevation,
    required this.distance,
    required this.azimuthError,
    required this.elevationError,
  });

  final Channel channel;

  /// Degrees from straight ahead, unsigned.
  final double azimuth;

  /// Degrees above the ear plane.
  final double elevation;
  final double distance;

  /// Degrees outside the allowed window; 0 when inside it.
  final double azimuthError;
  final double elevationError;

  bool get withinSpec => azimuthError == 0 && elevationError == 0;

  String? get advice {
    if (withinSpec) return null;
    final parts = <String>[];
    final target = dolbyTargets[channel];
    if (azimuthError > 0 && target != null) {
      parts.add(azimuth < target.azimuthMin
          ? 'je moc blízko ose — odsuň ho do strany'
          : 'je moc do strany — přisuň ho k ose');
      parts.add('(${azimuth.toStringAsFixed(0)}°, má být '
          '${target.azimuthMin.toStringAsFixed(0)}–'
          '${target.azimuthMax.toStringAsFixed(0)}°)');
    }
    if (elevationError > 0 && target != null) {
      parts.add(elevation < target.elevationMin
          ? 'visí moc nízko'
          : 'visí moc vysoko');
      parts.add('(${elevation.toStringAsFixed(0)}° nad uchem, má být '
          '${target.elevationMin.toStringAsFixed(0)}–'
          '${target.elevationMax.toStringAsFixed(0)}°)');
    }
    return parts.join(' ');
  }
}

/// Measures one speaker against the Dolby window.
///
/// [forward] is the direction the seat faces, as a floor-plane angle in the
/// room's own frame: 0 means facing along +x.
AngleCheck checkAngle(
  SpeakerPlacement speaker, {
  required RoomPoint seat,
  double forward = 0,
}) {
  final dx = speaker.position.x - seat.x;
  final dy = speaker.position.y - seat.y;
  final dz = speaker.position.z - seat.z;

  // Rotate into the listener's frame so "ahead" is +x regardless of which way
  // the sofa points.
  final c = math.cos(-forward);
  final s = math.sin(-forward);
  final ax = dx * c - dy * s;
  final ay = dx * s + dy * c;

  final horizontal = math.sqrt(ax * ax + ay * ay);
  final azimuth = math.atan2(ay.abs(), ax) * 180 / math.pi;
  final elevation = math.atan2(dz, horizontal) * 180 / math.pi;
  final distance = math.sqrt(dx * dx + dy * dy + dz * dz);

  final target = dolbyTargets[speaker.channel];
  double outside(double v, double lo, double hi) =>
      v < lo ? lo - v : (v > hi ? v - hi : 0);

  return AngleCheck(
    channel: speaker.channel,
    azimuth: azimuth,
    elevation: elevation,
    distance: distance,
    azimuthError: target == null
        ? 0
        : outside(azimuth, target.azimuthMin, target.azimuthMax),
    elevationError: target == null || !target.hasElevation
        ? 0
        : outside(elevation, target.elevationMin, target.elevationMax),
  );
}

/// A left/right mismatch.
class SymmetryIssue {
  const SymmetryIssue({
    required this.left,
    required this.right,
    required this.distanceDifference,
    required this.azimuthDifference,
  });

  final Channel left;
  final Channel right;
  final double distanceDifference;
  final double azimuthDifference;
}

/// Left/right pairs that are not mirror images of each other.
///
/// Worth its own check because the receiver hides it so well. Distance trim
/// and level trim will time-align and level-match an asymmetric pair at exactly
/// one point in space, and the numbers will look perfect — but the two speakers
/// still meet different walls at different distances, so their reflections and
/// their bass loading stay different, and the phantom image between them stays
/// smeared. No amount of trim fixes geometry.
List<SymmetryIssue> symmetryIssues(
  List<SpeakerPlacement> speakers, {
  required RoomPoint seat,
  double forward = 0,
  double distanceTolerance = 0.15,
  double azimuthTolerance = 5,
}) {
  final checks = {
    for (final s in speakers)
      s.channel: checkAngle(s, seat: seat, forward: forward)
  };
  final out = <SymmetryIssue>[];
  final seen = <Channel>{};

  for (final entry in checks.entries) {
    final pair = entry.key.pair;
    if (pair == null || seen.contains(entry.key)) continue;
    final other = checks[pair];
    if (other == null) continue;
    seen..add(entry.key)..add(pair);

    final dd = (entry.value.distance - other.distance).abs();
    final da = (entry.value.azimuth - other.azimuth).abs();
    if (dd > distanceTolerance || da > azimuthTolerance) {
      out.add(SymmetryIssue(
        left: entry.key,
        right: pair,
        distanceDifference: dd,
        azimuthDifference: da,
      ));
    }
  }
  out.sort((a, b) => b.distanceDifference.compareTo(a.distanceDifference));
  return out;
}
