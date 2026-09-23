import 'dart:math' as math;

import 'package:audio_scanner/export/avr_config.dart';
import 'package:audio_scanner/room/design_report.dart';
import 'package:audio_scanner/room/placement.dart';
import 'package:audio_scanner/room/room_capture.dart';
import 'package:audio_scanner/room/room_geometry.dart';
import 'package:audio_scanner/room/room_modes.dart';
import 'package:audio_scanner/room/speaker_layout.dart';
import 'package:audio_scanner/room/speaker_model.dart';
import 'package:flutter_test/flutter_test.dart';

/// A plain rectangular room: 6.86 m is exactly half a wavelength at 25 Hz, so
/// its first length mode must land there. Hand-checkable numbers make the
/// modal code falsifiable.
RoomGeometry room({double l = 6.86, double w = 4.9, double h = 2.45}) =>
    RoomGeometry(length: l, width: w, height: h, rt60: 0.4);

void main() {
  group('room modes', () {
    test('first axial mode is c / 2L', () {
      final modes = modesBelow(room(), maxHz: 40);
      final first = modes.first;
      expect(first.frequency, closeTo(speedOfSound / (2 * 6.86), 0.01));
      expect(first.frequency, closeTo(25.0, 0.2));
      expect(first.type, ModeType.axial);
      expect(first.axis, 'délka');
    });

    test('classifies axial, tangential and oblique by their indices', () {
      expect(const RoomMode(1, 0, 0, 25).type, ModeType.axial);
      expect(const RoomMode(1, 1, 0, 42).type, ModeType.tangential);
      expect(const RoomMode(1, 1, 1, 75).type, ModeType.oblique);
    });

    test('the second length mode is twice the first', () {
      final modes = modesBelow(room(), maxHz: 60);
      final length = modes.where((m) => m.nx > 0 && m.ny == 0 && m.nz == 0);
      expect(length.elementAt(1).frequency,
          closeTo(length.first.frequency * 2, 0.01));
    });

    test('Schroeder frequency marks where modal analysis stops meaning much',
        () {
      final r = room();
      // 2000·√(RT60/V) — for this room a bit over 100 Hz.
      expect(r.schroederFrequency,
          closeTo(2000 * math.sqrt(0.4 / r.volume), 0.01));
      expect(r.schroederFrequency, lessThan(150));
    });

    test('spots dimensions in a small integer ratio', () {
      expect(room(l: 6.0, w: 3.0, h: 2.4).proportionWarning(), isNotNull);
      expect(room(l: 6.86, w: 4.9, h: 2.45).proportionWarning(), isNotNull);
      expect(room(l: 5.3, w: 4.1, h: 2.45).proportionWarning(), isNull);
    });
  });

  group('modal response', () {
    test('a corner excites every mode, so it is never the flattest spot', () {
      final r = room();
      final seat = RoomPoint(r.length * 0.38, r.width / 2, 1.15);
      final freqs = bassFrequencies(to: 120);

      final corner = flatnessDb(modalResponseDb(r,
          source: const RoomPoint(0.3, 0.3, 0.3),
          receiver: seat,
          frequencies: freqs));
      final best = rankSubwooferPositions(r, seat: seat, step: 0.4).first;

      expect(best.flatnessDb, lessThan(corner));
    });

    test('is reciprocal: swapping source and receiver changes nothing', () {
      // The physical fact the software subwoofer crawl rests on. If this ever
      // fails, every placement recommendation in the app is worthless.
      final r = room();
      const a = RoomPoint(1.2, 0.8, 0.3);
      const b = RoomPoint(4.1, 3.2, 1.15);
      final freqs = bassFrequencies(to: 120, points: 40);

      final forward =
          modalResponseDb(r, source: a, receiver: b, frequencies: freqs);
      final backward =
          modalResponseDb(r, source: b, receiver: a, frequencies: freqs);

      for (var i = 0; i < forward.length; i++) {
        expect(forward[i], closeTo(backward[i], 0.01));
      }
    });

    test('a shorter RT60 damps the modes and flattens the response', () {
      final freqs = bassFrequencies(to: 120, points: 40);
      double spread(double rt60) => flatnessDb(modalResponseDb(
            RoomGeometry(length: 6.86, width: 4.9, height: 2.45, rt60: rt60),
            source: const RoomPoint(0.5, 0.5, 0.3),
            receiver: const RoomPoint(2.6, 2.45, 1.15),
            frequencies: freqs,
          ));
      expect(spread(1.2), greaterThan(spread(0.3)));
    });
  });

  group('boundary interference', () {
    test('puts the null at c / 4d', () {
      final r = room();
      // 0.86 m from the front wall → 343/(4·0.86) ≈ 100 Hz.
      final nulls = boundaryNulls(r, const RoomPoint(0.86, 2.0, 1.0));
      final front =
          nulls.firstWhere((n) => n.boundary == Boundary.frontWall);
      expect(front.frequency, closeTo(99.7, 0.5));
    });

    test('ignores boundaries too far to matter', () {
      final nulls = boundaryNulls(room(), const RoomPoint(3.4, 2.45, 1.2),
          maxDistance: 1.0);
      expect(nulls, isEmpty);
    });
  });

  group('first reflections', () {
    test('a symmetric speaker bounces off the side wall halfway along', () {
      final r = room(l: 6.0, w: 4.0, h: 2.5);
      // Speaker and listener both 1 m from the left wall: by symmetry the
      // bounce point must be exactly halfway between them.
      final refl = firstReflections(r,
          speaker: const RoomPoint(1.0, 1.0, 1.0),
          listener: const RoomPoint(4.0, 1.0, 1.0));
      final left = refl.firstWhere((p) => p.boundary == Boundary.leftWall);
      expect(left.position.x, closeTo(2.5, 0.01));
      expect(left.position.y, closeTo(0.0, 0.01));
    });

    test('the reflection always travels further than the direct sound', () {
      final refl = firstReflections(room(),
          speaker: const RoomPoint(1.5, 1.2, 1.1),
          listener: const RoomPoint(4.6, 2.45, 1.15));
      expect(refl, isNotEmpty);
      for (final p in refl) {
        expect(p.extraPathLength, greaterThan(0));
        expect(p.delay.inMicroseconds, greaterThan(0));
      }
    });
  });

  group('Dolby angles', () {
    RoomPoint seat() => const RoomPoint(4.6, 2.45, 1.15);

    test('a speaker at 26° off axis is in spec, one at 10° is not', () {
      // Seat looks along −x toward the front wall, so forward = π.
      final inSpec = checkAngle(
        SpeakerPlacement(
            channel: Channel.frontLeft,
            position: RoomPoint(4.6 - 3.0, 2.45 + 3.0 * math.tan(26 * math.pi / 180), 1.15)),
        seat: seat(),
        forward: math.pi,
      );
      expect(inSpec.azimuth, closeTo(26, 0.5));
      expect(inSpec.withinSpec, isTrue);

      final tooNarrow = checkAngle(
        SpeakerPlacement(
            channel: Channel.frontLeft,
            position: RoomPoint(4.6 - 3.0, 2.45 + 3.0 * math.tan(10 * math.pi / 180), 1.15)),
        seat: seat(),
        forward: math.pi,
      );
      expect(tooNarrow.withinSpec, isFalse);
      expect(tooNarrow.advice, contains('blízko ose'));
    });

    test('height channels are judged on elevation too', () {
      // Straight ahead and only 15° up: azimuth is fine, elevation is not.
      final low = checkAngle(
        SpeakerPlacement(
            channel: Channel.heightFrontLeft,
            position: RoomPoint(4.6 - 3.0, 2.45 + 3.0, 1.15 + 0.5)),
        seat: seat(),
        forward: math.pi,
      );
      expect(low.elevation, lessThan(30));
      expect(low.elevationError, greaterThan(0));
      expect(low.advice, contains('nízko'));
    });

    test('a seat off the centre line makes a symmetric pair asymmetric', () {
      // The speakers are mirror images of each other — both 1.85 m from the
      // room's centre line. It is the *seat* that sits 0.55 m left of centre,
      // and that alone turns them into a 1.1 m mismatch. This is the shape of
      // the asymmetry in the Integra printout, and the reason the check is
      // relative to the listener rather than to the room.
      const speakers = [
        SpeakerPlacement(
            channel: Channel.surroundLeft, position: RoomPoint(4.6, 0.6, 1.4)),
        SpeakerPlacement(
            channel: Channel.surroundRight, position: RoomPoint(4.6, 4.3, 1.4)),
      ];

      expect(symmetryIssues(speakers, seat: seat(), forward: math.pi), isEmpty);

      final offCentre = symmetryIssues(speakers,
          seat: const RoomPoint(4.6, 1.9, 1.15), forward: math.pi);
      expect(offCentre, hasLength(1));
      expect(offCentre.first.distanceDifference, closeTo(1.1, 0.1));
    });
  });

  group('crossover recommendation', () {
    test('never hands an Atmos module frequencies it cannot make', () {
      final atm = magnatSystem[Channel.heightFrontLeft]!;
      expect(atm.isAtmosModule, isTrue);
      expect(recommendedCrossover(atm), greaterThanOrEqualTo(100));
    });

    test('holds the 80 Hz floor even for a capable floorstander', () {
      final tower = magnatSystem[Channel.frontLeft]!;
      expect(recommendedCrossover(tower), 80);
      // Unless asked for full range explicitly, and then it still must not go
      // below what the cabinet does.
      expect(recommendedCrossover(tower, allowFullRange: true),
          greaterThanOrEqualTo(60));
    });

    test('only ever returns a value the receiver can be set to', () {
      for (final model in magnatSystem.values) {
        expect(integraCrossovers, contains(recommendedCrossover(model)));
      }
    });

    test('LPF of LFE never sits below the highest crossover', () {
      expect(lpfOfLfeFor([80, 100, 120]), 120);
      expect(lpfOfLfeFor([80, 80, 150]), 150);
      expect(lpfOfLfeFor([80, 80, 80]), 120);
    });
  });

  group('EQ generation', () {
    final centers = [31.5, 63.0, 125.0, 250.0, 500.0, 1000.0, 2000.0, 4000.0];

    test('cuts a peak but barely boosts a null', () {
      // +10 dB at 63 Hz and −10 dB at 125 Hz, flat elsewhere.
      final measured = [0.0, 10.0, -10.0, 0.0, 0.0, 0.0, 0.0, 0.0];
      final eq = generateEq(
        measuredBandsDb: measured,
        measuredBandCenters: centers,
        target: TargetCurve.flat,
        maxBoostDb: 3,
      );
      final at63 = eq.gainsDb[eq.bands.indexOf(63)];
      final at100 = eq.gainsDb[eq.bands.indexOf(100)];

      expect(at63, lessThan(-6)); // the peak is cut properly
      expect(at100, lessThanOrEqualTo(3)); // the null is not chased
      expect(eq.notes.join(), contains('interference'));
    });

    test('leaves everything above the Schroeder limit alone', () {
      final eq = generateEq(
        measuredBandsDb: List<double>.filled(centers.length, 12),
        measuredBandCenters: centers,
        maxEqHz: 300,
      );
      for (var i = 0; i < eq.bands.length; i++) {
        if (eq.bands[i] > 300) expect(eq.gainsDb[i], 0);
      }
    });

    test('stays inside the receiver\'s range and step', () {
      final eq = generateEq(
        measuredBandsDb: List<double>.generate(centers.length, (i) => i * 9.0),
        measuredBandCenters: centers,
      );
      for (final g in eq.gainsDb) {
        expect(g, inInclusiveRange(integraEqMaxCutDb, integraEqMaxBoostDb));
        expect((g / integraEqStepDb) % 1, 0);
      }
    });

    test('the target curve tilts down on top and lifts the bottom', () {
      const t = TargetCurve();
      expect(t.levelAt(40), greaterThan(t.levelAt(200)));
      expect(t.levelAt(10000), lessThan(t.levelAt(1000)));
      expect(TargetCurve.flat.levelAt(40), 0);
    });
  });

  group('geometry capture', () {
    test('parses RoomPlan output and puts the long side first', () {
      final scanned = RoomCapture.parseRoom({
        'length': 4.0,
        'width': 6.5,
        'height': 2.55,
        'originX': -1.0,
        'originZ': 2.0,
        'irregularity': 0.1,
        'wallCount': 4,
        'walls': [
          {'cx': 0.0, 'cy': 1.2, 'cz': 0.0, 'width': 4.0, 'height': 2.55,
           'nx': 0.0, 'ny': 0.0, 'nz': 1.0, 'confidence': 'high'},
        ],
        'openings': const [],
      });
      expect(scanned.geometry.length, 6.5);
      expect(scanned.geometry.width, 4.0);
      expect(scanned.geometry.source, GeometrySource.lidar);
      expect(scanned.walls.single.confidence, 'high');
      expect(scanned.boxLikeEnough, isTrue);
      expect(scanned.caveat, isNull);
    });

    test('Android plane geometry is labelled as the estimate it is', () {
      // The Android side boxes ARCore's vertical planes. Its "irregularity" is
      // really perimeter coverage, and the caveat must say the source is plane
      // detection — a user reading reflection points off this would be misled.
      final scanned = RoomCapture.parseRoom({
        'source': 'arPlanes',
        'length': 5.8, 'width': 4.1, 'height': 2.5,
        'irregularity': 0.35, 'wallCount': 3,
        'walls': const [], 'openings': const [],
      });
      expect(scanned.geometry.source, GeometrySource.arPlanes);
      expect(scanned.caveat, contains('ARCore'));
      expect(scanned.caveat, contains('65 % obvodu'));
      // Modal maths still runs on it — that is the whole point of having it.
      expect(modesBelow(scanned.geometry, maxHz: 40).first.frequency,
          closeTo(speedOfSound / (2 * 5.8), 0.01));
    });

    test('says so when the room is not a box', () {
      final scanned = RoomCapture.parseRoom({
        'length': 6.0, 'width': 4.0, 'height': 2.5,
        'irregularity': 0.45, 'wallCount': 7,
        'walls': const [], 'openings': const [],
      });
      expect(scanned.boxLikeEnough, isFalse);
      expect(scanned.caveat, contains('orientační'));
    });
  });

  group('design report', () {
    /// The layout from the diagram, in a 6.86 × 4.9 × 2.45 m room, seat two
    /// thirds back and facing the front wall.
    List<SpeakerPlacement> layout() => const [
          SpeakerPlacement(channel: Channel.frontLeft, position: RoomPoint(0.6, 1.3, 1.1)),
          SpeakerPlacement(channel: Channel.center, position: RoomPoint(0.5, 2.45, 0.7)),
          SpeakerPlacement(channel: Channel.frontRight, position: RoomPoint(0.6, 3.6, 1.1)),
          SpeakerPlacement(channel: Channel.surroundLeft, position: RoomPoint(4.4, 0.3, 1.4)),
          SpeakerPlacement(channel: Channel.surroundRight, position: RoomPoint(4.4, 4.6, 1.4)),
          SpeakerPlacement(channel: Channel.surroundBackLeft, position: RoomPoint(6.4, 1.2, 1.4)),
          SpeakerPlacement(channel: Channel.surroundBackRight, position: RoomPoint(6.4, 3.7, 1.4)),
          SpeakerPlacement(channel: Channel.heightFrontLeft, position: RoomPoint(1.1, 1.3, 2.3)),
          SpeakerPlacement(channel: Channel.heightFrontRight, position: RoomPoint(1.1, 3.6, 2.3)),
          SpeakerPlacement(channel: Channel.heightRearLeft, position: RoomPoint(5.8, 1.3, 2.4)),
          SpeakerPlacement(channel: Channel.heightRearRight, position: RoomPoint(5.8, 3.6, 2.4)),
          SpeakerPlacement(channel: Channel.subwoofer, position: RoomPoint(0.5, 0.4, 0.3)),
        ];

    test('produces a config the receiver can actually be set to', () {
      final report = buildDesignReport(
        room: room(),
        seat: const RoomPoint(4.6, 2.45, 1.15),
        speakers: layout(),
        forward: math.pi,
      );

      expect(report.config.channels, hasLength(12));
      for (final c in report.config.channels) {
        if (c.channel == Channel.subwoofer) continue;
        expect(integraCrossovers, contains(c.crossoverHz));
        expect(c.distanceM, greaterThan(0));
      }
      expect(report.config.lpfOfLfeHz, greaterThanOrEqualTo(120));
    });

    test('every Atmos module gets at least 100 Hz, never 40', () {
      final report = buildDesignReport(
        room: room(),
        seat: const RoomPoint(4.6, 2.45, 1.15),
        speakers: layout(),
        forward: math.pi,
      );
      final heights = report.config.channels.where((c) => c.channel.isHeight);
      expect(heights, hasLength(4));
      for (final c in heights) {
        expect(c.crossoverHz, greaterThanOrEqualTo(100));
      }
    });

    test('ranks findings worst first and explains the subwoofer corner', () {
      final report = buildDesignReport(
        room: room(),
        seat: const RoomPoint(4.6, 2.45, 1.15),
        speakers: layout(),
        forward: math.pi,
      );
      expect(report.findings, isNotEmpty);
      for (var i = 1; i < report.findings.length; i++) {
        expect(report.findings[i].severity.index,
            greaterThanOrEqualTo(report.findings[i - 1].severity.index));
      }
      expect(report.subwooferCandidates, isNotEmpty);
      expect(report.subwooferCandidates.first.flatnessDb,
          lessThan(report.subwooferCandidates.last.flatnessDb + 1));
    });

    test('the rendered sheet names the Schroeder limit rather than hiding it',
        () {
      final text = buildDesignReport(
        room: room(),
        seat: const RoomPoint(4.6, 2.45, 1.15),
        speakers: layout(),
        forward: math.pi,
      ).config.render();

      expect(text, contains('Schroeder'));
      expect(text, contains('Speaker Virtualizer: Off'));
      expect(text, contains('LPF of LFE'));
    });
  });
}
