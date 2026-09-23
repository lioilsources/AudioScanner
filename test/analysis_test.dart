import 'dart:io';

import 'package:audio_scanner/analysis/heatmap.dart';
import 'package:audio_scanner/audio/audio_capture.dart';
import 'package:audio_scanner/dsp/octave_bands.dart';
import 'package:audio_scanner/export/frd.dart';
import 'package:audio_scanner/model/measurement.dart';
import 'package:audio_scanner/model/session.dart';
import 'package:audio_scanner/store/session_store.dart';
import 'package:flutter_test/flutter_test.dart';

Measurement point(String id, double x, double z, {List<double>? bands}) =>
    Measurement(
      id: id,
      position: Vec3(x, 1.2, z),
      timestamp: DateTime.utc(2026, 9, 23),
      bandsDb: bands ?? List<double>.filled(OctaveBands.all.length, -40),
      rmsDbfs: -30,
    );

/// Bands that are flat everywhere except one value, to make a point loud or
/// quiet in a known place.
List<double> bandsWith(double nominal, double db, {double rest = -40}) {
  final out = List<double>.filled(OctaveBands.all.length, rest);
  out[OctaveBands.all.indexWhere((b) => b.nominal == nominal)] = db;
  return out;
}

void main() {
  final band63 = OctaveBands.byNominal(63);

  group('IDW heatmap', () {
    test('passes exactly through the measured points', () {
      final points = [
        point('p1', 0, 0, bands: bandsWith(63, -30)),
        point('p2', 2, 0, bands: bandsWith(63, -50)),
      ];
      final grid = interpolateBand(points, band63, cellSize: 0.1);

      int col(double x) => ((x - grid.minX) / grid.cellSize).floor();
      int row(double z) => ((z - grid.minZ) / grid.cellSize).floor();

      expect(grid.valueAt(col(0), row(0)), closeTo(-30, 1.5));
      expect(grid.valueAt(col(2), row(0)), closeTo(-50, 1.5));
    });

    test('leaves unmeasured ground empty instead of extrapolating into it', () {
      final grid = interpolateBand(
        [point('p1', 0, 0)],
        band63,
        cellSize: 0.25,
        maxDistance: 0.5,
        padding: 2.0,
      );
      // A cell far outside the measured radius must be NaN, not a confident
      // colour.
      final farCol = ((1.8 - grid.minX) / grid.cellSize).floor();
      final farRow = ((1.8 - grid.minZ) / grid.cellSize).floor();
      expect(grid.valueAt(farCol, farRow).isNaN, isTrue);
      expect(grid.normalizedAt(farCol, farRow), isNull);
    });

    test('interpolates between two points rather than picking one', () {
      final points = [
        point('p1', 0, 0, bands: bandsWith(63, -30)),
        point('p2', 2, 0, bands: bandsWith(63, -50)),
      ];
      final grid = interpolateBand(points, band63, cellSize: 0.1);
      final midCol = ((1.0 - grid.minX) / grid.cellSize).floor();
      final midRow = ((0.0 - grid.minZ) / grid.cellSize).floor();
      expect(grid.valueAt(midCol, midRow), closeTo(-40, 3));
    });

    test('an empty session yields an empty grid, not a crash', () {
      final grid = interpolateBand([], band63);
      expect(grid.width, 0);
      expect(grid.normalizedAt, isNotNull);
    });
  });

  group('flattest listening spot', () {
    test('picks the point with the least variation in 40–300 Hz', () {
      final bumpy = List<double>.filled(OctaveBands.all.length, -40);
      for (final b in OctaveBands.inRange(40, 300)) {
        final i = OctaveBands.all.indexOf(b);
        bumpy[i] = i.isEven ? -25.0 : -55.0; // ±15 dB of room modes
      }
      final flat = point('flat', 0, 0);
      final rough = point('rough', 1, 0, bands: bumpy);

      expect(flattestListeningSpot([rough, flat])?.id, 'flat');
      expect(flat.variationDb(), lessThan(rough.variationDb()));
    });

    test('ignores what happens outside the bass range', () {
      final trebleMess = List<double>.filled(OctaveBands.all.length, -40);
      trebleMess[OctaveBands.all.indexWhere((b) => b.nominal == 8000)] = 0;
      final a = point('a', 0, 0, bands: trebleMess);
      expect(a.variationDb(low: 40, high: 300), closeTo(0, 0.001));
    });

    test('returns null for no points at all', () {
      expect(flattestListeningSpot([]), isNull);
    });
  });

  group('FRD export', () {
    test('writes one row per band, and says the levels are relative', () {
      final text = FrdExport.fromMeasurement(point('p1', 0, 0));
      final rows = text
          .split('\n')
          .where((l) => l.isNotEmpty && !l.startsWith('*'))
          .toList();
      expect(rows.length, OctaveBands.all.length);
      expect(text, contains('RELATIVE'));
      expect(rows.first.split(RegExp(r'\s+')).first, '20.00');
      expect(rows.last.split(RegExp(r'\s+')).first, '20000.00');
    });

    test('applies the calibration offset to the exported level', () {
      final p = point('p1', 0, 0, bands: bandsWith(63, -30));
      final plain = FrdExport.fromMeasurement(p);
      final shifted = FrdExport.fromMeasurement(p, offsetDb: 70);

      double levelAt63(String frd) => double.parse(frd
          .split('\n')
          .firstWhere((l) => l.startsWith('63.00'))
          .split(RegExp(r'\s+'))[1]);

      expect(levelAt63(plain), closeTo(-30, 0.01));
      expect(levelAt63(shifted), closeTo(40, 0.01));
    });

    test('a gated export carries its own validity limit', () {
      final text = FrdExport.fromImpulseResponse(
        frequencies: [100, 200, 1000],
        magnitudesDb: [-10, -10, -10],
        phasesDeg: [0, 0, 0],
        validAbove: 200,
      );
      expect(text, contains('valid only above 200 Hz'));
    });

    test('unwraps phase instead of jumping 360 degrees', () {
      // Points stepping past ±180°: the unwrapped result must stay monotonic.
      final phases = FrdExport.phaseDegrees(
        [1, 0, -1, 0, 1],
        [0, 1, 0, -1, 0],
      );
      for (var i = 1; i < phases.length; i++) {
        expect((phases[i] - phases[i - 1]).abs(), lessThanOrEqualTo(180.0));
      }
    });
  });

  group('FrameAssembler', () {
    test('reframes arbitrary OS block sizes into fixed analysis frames', () {
      final asm = FrameAssembler(frameSize: 8);
      final frames = <List<double>>[];
      // 3 + 7 + 9 = 19 samples → two complete frames of 8, 3 left over.
      for (final chunk in [
        List<double>.generate(3, (i) => i.toDouble()),
        List<double>.generate(7, (i) => (i + 3).toDouble()),
        List<double>.generate(9, (i) => (i + 10).toDouble()),
      ]) {
        frames.addAll(asm.add(chunk));
      }
      expect(frames.length, 2);
      expect(frames.first, [0, 1, 2, 3, 4, 5, 6, 7]);
      expect(frames[1], [8, 9, 10, 11, 12, 13, 14, 15]);
    });

    test('overlapping hop yields a frame every hopSize samples', () {
      final asm = FrameAssembler(frameSize: 8, hopSize: 4);
      final frames = asm.add(List<double>.generate(16, (i) => i.toDouble()));
      expect(frames.length, 3); // at 8, 12, 16
      expect(frames.last.first, 8);
    });
  });

  group('CaptureStatus', () {
    CaptureStatus status({
      bool measurement = true,
      bool processing = true,
      bool bluetooth = false,
    }) =>
        CaptureStatus(
          sampleRate: 48000,
          measurementMode: measurement,
          processingDisabled: processing,
          route: 'iPhone Microphone',
          isBluetooth: bluetooth,
        );

    test('a properly configured session is trustworthy and silent', () {
      expect(status().isTrustworthy, isTrue);
      expect(status().warning, isNull);
    });

    test('names the one thing that is wrong, bluetooth first', () {
      expect(status(bluetooth: true).warning, contains('Bluetooth'));
      expect(status(processing: false).warning, contains('AGC'));
      expect(status(measurement: false).warning, contains('measurement'));
      expect(status(processing: false).isTrustworthy, isFalse);
    });
  });

  group('SessionStore', () {
    late Directory dir;
    late SessionStore store;

    setUp(() {
      dir = Directory.systemTemp.createTempSync('audioscanner_test');
      store = SessionStore(dir);
    });

    tearDown(() => dir.deleteSync(recursive: true));

    test('round-trips a session with its points', () async {
      final s = Session(
        id: 'abc',
        name: 'Obývák',
        createdAt: DateTime.utc(2026, 9, 23, 12),
        signal: ExcitationSignal.externalSweep,
        points: [point('p1', 1, 2, bands: bandsWith(63, -33))],
      );
      await store.save(s);

      final back = await store.load('abc');
      expect(back, isNotNull);
      expect(back!.name, 'Obývák');
      expect(back.signal, ExcitationSignal.externalSweep);
      expect(back.points.single.position.x, 1);
      expect(back.points.single.levelAt(band63), closeTo(-33, 0.001));
    });

    test('skips a corrupt file instead of hiding every other session',
        () async {
      await store.save(Session(
        id: 'good',
        name: 'Dobrá',
        createdAt: DateTime.utc(2026, 9, 23),
        signal: ExcitationSignal.externalPinkNoise,
      ));
      File('${dir.path}/broken.json').writeAsStringSync('{nonsense');

      final all = await store.listAll();
      expect(all.map((s) => s.id), ['good']);
    });

    test('lists newest first', () async {
      for (var i = 0; i < 3; i++) {
        await store.save(Session(
          id: 's$i',
          name: 's$i',
          createdAt: DateTime.utc(2026, 9, 20 + i),
          signal: ExcitationSignal.externalSweep,
        ));
      }
      expect((await store.listAll()).map((s) => s.id), ['s2', 's1', 's0']);
    });

    test('an unknown id reads as null, not an exception', () async {
      expect(await store.load('nope'), isNull);
    });
  });
}
