import 'dart:math' as math;

import 'room_geometry.dart';
import 'room_modes.dart';

/// A candidate position with the flatness it would give.
class PlacementCandidate {
  const PlacementCandidate({required this.position, required this.flatnessDb});

  final RoomPoint position;
  final double flatnessDb;
}

/// The subwoofer placement search — a "subwoofer crawl" done in software.
///
/// The real crawl means putting the sub at the listening seat, crawling the
/// room with your ear at floor level, and placing the sub where the bass was
/// smoothest. It works because of acoustic reciprocity: source and receiver can
/// be swapped without changing the transfer function. The same reciprocity is
/// what makes this search legitimate — and it evaluates a hundred positions in
/// a second instead of ten on your knees.
///
/// Positions are kept off the walls by [wallClearance]: a driver hard against
/// plaster is both a cabinet-rattle problem and outside what the rigid-wall
/// model describes well.
List<PlacementCandidate> rankSubwooferPositions(
  RoomGeometry room, {
  required RoomPoint seat,
  double step = 0.25,
  double wallClearance = 0.3,
  double height = 0.3,
  double from = 20,
  double to = 120,
}) {
  final freqs = bassFrequencies(from: from, to: to);
  final modes = modesBelow(room, maxHz: to * 2.5);
  final out = <PlacementCandidate>[];

  for (var x = wallClearance; x <= room.length - wallClearance; x += step) {
    for (var y = wallClearance; y <= room.width - wallClearance; y += step) {
      final pos = RoomPoint(x, y, height);
      final response = modalResponseDb(
        room,
        source: pos,
        receiver: seat,
        frequencies: freqs,
        modes: modes,
      );
      out.add(PlacementCandidate(
          position: pos, flatnessDb: flatnessDb(response)));
    }
  }
  out.sort((a, b) => a.flatnessDb.compareTo(b.flatnessDb));
  return out;
}

/// The same search over seats instead of subs.
///
/// Run with the subwoofer where it actually is. Moving the sofa 40 cm is often
/// worth more than any amount of EQ, because a null cannot be equalised — there
/// is nothing there to boost.
List<PlacementCandidate> rankListeningPositions(
  RoomGeometry room, {
  required RoomPoint subwoofer,
  double step = 0.25,
  double wallClearance = 0.5,
  double earHeight = 1.15,
  double from = 20,
  double to = 120,
}) {
  final freqs = bassFrequencies(from: from, to: to);
  final modes = modesBelow(room, maxHz: to * 2.5);
  final out = <PlacementCandidate>[];

  for (var x = wallClearance; x <= room.length - wallClearance; x += step) {
    for (var y = wallClearance; y <= room.width - wallClearance; y += step) {
      final pos = RoomPoint(x, y, earHeight);
      final response = modalResponseDb(
        room,
        source: subwoofer,
        receiver: pos,
        frequencies: freqs,
        modes: modes,
      );
      out.add(PlacementCandidate(
          position: pos, flatnessDb: flatnessDb(response)));
    }
  }
  out.sort((a, b) => a.flatnessDb.compareTo(b.flatnessDb));
  return out;
}

/// A cancellation caused by a nearby boundary.
class BoundaryNull {
  const BoundaryNull({
    required this.boundary,
    required this.distance,
    required this.frequency,
  });

  final Boundary boundary;

  /// Speaker-to-boundary distance, metres.
  final double distance;

  /// Where the quarter-wave cancellation lands.
  final double frequency;
}

/// Speaker–boundary interference (SBIR).
///
/// Sound reaching the listener directly and after bouncing off a wall behind
/// the speaker travels a path difference of about 2·d. When that equals half a
/// wavelength the two arrive in opposition and cancel, at
///
///     f = c / (4·d)
///
/// This is the single most common cause of a "hole" in the upper bass that no
/// equaliser fixes — boosting a cancellation just pushes more energy into the
/// thing doing the cancelling. The fix is moving the speaker, which is why the
/// distance matters more than the EQ.
///
/// Only boundaries within [maxDistance] are reported; further away the null
/// falls below where it does audible damage.
List<BoundaryNull> boundaryNulls(
  RoomGeometry room,
  RoomPoint speaker, {
  double maxDistance = 2.0,
  double minFrequency = 30,
  double maxFrequency = 400,
}) {
  final out = <BoundaryNull>[];
  room.distancesToBoundaries(speaker).forEach((boundary, d) {
    if (d <= 0.05 || d > maxDistance) return;
    final f = speedOfSound / (4 * d);
    if (f < minFrequency || f > maxFrequency) return;
    out.add(BoundaryNull(boundary: boundary, distance: d, frequency: f));
  });
  out.sort((a, b) => a.frequency.compareTo(b.frequency));
  return out;
}

/// Where a first-order reflection bounces.
class ReflectionPoint {
  const ReflectionPoint({
    required this.boundary,
    required this.position,
    required this.extraPathLength,
  });

  final Boundary boundary;

  /// The spot on the surface, in room coordinates — walk to it and put your
  /// hand there.
  final RoomPoint position;

  /// How much further the reflected sound travels than the direct sound.
  final double extraPathLength;

  /// Delay behind the direct sound.
  Duration get delay =>
      Duration(microseconds: (extraPathLength / speedOfSound * 1e6).round());
}

/// First-order reflection points for one speaker–listener pair, by the mirror
/// image method.
///
/// The classic trick: reflect the speaker through each wall, draw a straight
/// line from that image to the listener, and the point where it crosses the
/// wall is where the bounce happens. With LiDAR the wall positions are known to
/// a couple of centimetres, so this stops being "hold a mirror and have a
/// friend walk around" and becomes a coordinate.
///
/// These are the spots where absorption pays for itself — they smear the stereo
/// image and blur dialogue far more than the later reverberant field does.
List<ReflectionPoint> firstReflections(
  RoomGeometry room, {
  required RoomPoint speaker,
  required RoomPoint listener,
}) {
  final out = <ReflectionPoint>[];

  void mirror(Boundary boundary, RoomPoint image) {
    final direct = speaker.distanceTo(listener);
    final reflected = image.distanceTo(listener);
    // Parametric crossing of the image-to-listener line with the surface.
    final t = switch (boundary) {
        Boundary.frontWall => image.x / (image.x - listener.x),
        Boundary.backWall => (image.x - room.length) / (image.x - listener.x),
        Boundary.leftWall => image.y / (image.y - listener.y),
        Boundary.rightWall => (image.y - room.width) / (image.y - listener.y),
        Boundary.floor => image.z / (image.z - listener.z),
        Boundary.ceiling => (image.z - room.height) / (image.z - listener.z),
      };
    if (t.isNaN || t.isInfinite || t <= 0 || t > 1) return;

    final hit = RoomPoint(
      image.x + (listener.x - image.x) * t,
      image.y + (listener.y - image.y) * t,
      image.z + (listener.z - image.z) * t,
    );
    out.add(ReflectionPoint(
      boundary: boundary,
      position: hit,
      extraPathLength: reflected - direct,
    ));
  }

  mirror(Boundary.frontWall, RoomPoint(-speaker.x, speaker.y, speaker.z));
  mirror(Boundary.backWall,
      RoomPoint(2 * room.length - speaker.x, speaker.y, speaker.z));
  mirror(Boundary.leftWall, RoomPoint(speaker.x, -speaker.y, speaker.z));
  mirror(Boundary.rightWall,
      RoomPoint(speaker.x, 2 * room.width - speaker.y, speaker.z));
  mirror(Boundary.floor, RoomPoint(speaker.x, speaker.y, -speaker.z));
  mirror(Boundary.ceiling,
      RoomPoint(speaker.x, speaker.y, 2 * room.height - speaker.z));

  return out;
}

/// The 38 % rule, for reference and for a starting point when there is no
/// geometry to search over.
///
/// Putting the seat 38 % of the way down the room's length keeps it off the
/// null of the first length mode (at 50 %) and off the peak at the wall. It is
/// a decent guess and nothing more — [rankListeningPositions] does the actual
/// work, and often disagrees, because a real room has three dimensions and a
/// subwoofer that is not in the corner.
RoomPoint thirtyEightPercentSeat(RoomGeometry room, {double earHeight = 1.15}) =>
    RoomPoint(room.length * 0.38, room.width / 2, earHeight);

/// Room gain: the rise below the lowest axial mode, where the room stops
/// behaving like a space and starts behaving like a pressure vessel.
///
/// Below this frequency a sealed room reinforces bass at roughly 12 dB/octave,
/// which is why a subwoofer that measures flat outdoors sounds heavy indoors.
double pressureZoneFrequency(RoomGeometry room) {
  final longest = [room.length, room.width, room.height].reduce(math.max);
  return speedOfSound / (2 * longest);
}
