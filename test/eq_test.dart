import 'dart:convert';
import 'dart:math' as math;

import 'package:audio_scanner/analysis/spatial_average.dart';
import 'package:audio_scanner/dsp/graphic_eq.dart';
import 'package:audio_scanner/dsp/octave_bands.dart';
import 'package:audio_scanner/export/avr_config.dart';
import 'package:audio_scanner/model/measurement.dart';
import 'package:audio_scanner/model/session.dart';
import 'package:flutter_test/flutter_test.dart';

Measurement at(double x, double z, List<double> bands) => Measurement(
      id: 'p',
      position: Vec3(x, 1.2, z),
      timestamp: DateTime.utc(2026),
      bandsDb: bands,
      rmsDbfs: -30,
    );

List<double> flat(double db) => List<double>.filled(OctaveBands.all.length, db);

int bandIndex(double nominal) =>
    OctaveBands.all.indexWhere((b) => b.nominal == nominal);

/// Log-spaced frequency axis for filter checks: 60 points per octave.
final freqs = [for (var i = 0; i <= 600; i++) 20 * math.pow(2, i / 60).toDouble()];

void main() {
  group('spatial average', () {
    test('averages energy and reports the spread in dB', () {
      final avg = spatialAverage([at(0, 0, flat(0)), at(0.5, 0, flat(-20))]);
      expect(avg.count, 2);
      expect(avg.meanBandsDb.first, closeTo(-2.99, 0.05));
      expect(avg.spreadDb.first, closeTo(10, 0.01));
      expect(avg.lowConfidence, isTrue);
    });

    test('only counts points inside the radius', () {
      final avg = spatialAverage(
        [at(0, 0, flat(0)), at(3, 0, flat(-40)), at(0.2, 0.2, flat(0))],
        radiusM: 1,
      );
      expect(avg.count, 2);
      expect(avg.meanBandsDb.first, closeTo(0, 1e-9));
      expect(avg.spreadDb.first, 0);
    });

    test('nothing nearby gives an empty average, not a crash', () {
      final avg = spatialAverage([at(5, 5, flat(0))]);
      expect(avg.count, 0);
      expect(avg.lowConfidence, isTrue);
    });
  });

  group('spread-weighted EQ', () {
    final centers = [for (final b in OctaveBands.all) b.nominal];

    test('halves the correction where the response depends on position', () {
      final measured = flat(0)..[bandIndex(63)] = 8;
      final steady = generateEq(
        measuredBandsDb: measured,
        measuredBandCenters: centers,
        target: TargetCurve.flat,
        spreadBandsDb: flat(1),
      );
      final shaky = generateEq(
        measuredBandsDb: measured,
        measuredBandCenters: centers,
        target: TargetCurve.flat,
        spreadBandsDb: flat(1)..[bandIndex(63)] = 9,
      );
      final i = integraEqBands.indexOf(63);
      expect(steady.gainsDb[i], closeTo(-8, 0.5));
      expect(shaky.gainsDb[i], closeTo(-4, 0.5));
      expect(shaky.notes.join(), contains('poloha'));
      expect(steady.notes, isEmpty);
    });
  });

  group('graphic EQ model', () {
    test('a single band reads its gain at the centre and nothing two octaves away',
        () {
      final r = graphicEqResponseDb(freqs, integraEqBands,
          List<double>.filled(integraEqBands.length, 0)..[integraEqBands.indexOf(100)] = 3);
      double atHz(double hz) {
        var best = 0;
        for (var i = 1; i < freqs.length; i++) {
          if ((freqs[i] - hz).abs() < (freqs[best] - hz).abs()) best = i;
        }
        return r[best];
      }

      expect(atHz(100), closeTo(3, 0.2));
      expect(atHz(25), closeTo(0, 0.3));
      expect(atHz(400), closeTo(0, 0.3));
      // Cut mirrors boost.
      final cut = graphicEqResponseDb(freqs, integraEqBands,
          List<double>.filled(integraEqBands.length, 0)..[integraEqBands.indexOf(100)] = -3);
      expect(cut[freqs.indexOf(freqs.firstWhere((f) => f >= 100))],
          closeTo(-atHz(100), 0.2));
    });

    test('every band at +3 dB sums to a curve with under 1 dB of ripple', () {
      // This is the test that fixes integraEqQ: too narrow ripples between
      // the centres, too wide overshoots.
      final r = graphicEqResponseDb(
          freqs, integraEqBands, List<double>.filled(integraEqBands.length, 3));
      var lo = double.infinity, hi = -double.infinity;
      for (var i = 0; i < freqs.length; i++) {
        if (freqs[i] < 40 || freqs[i] > 10000) continue;
        if (r[i] < lo) lo = r[i];
        if (r[i] > hi) hi = r[i];
      }
      expect(hi - lo, lessThan(1.0), reason: 'ripple $lo … $hi dB');
      expect(lo, greaterThan(2.0));
    });

    test('predicted response after EQ is closer to target on a hump and still '
        'short on a null', () {
      final hump = flat(0)..[bandIndex(63)] = 8;
      final humpEq = generateEq(
        measuredBandsDb: hump,
        measuredBandCenters: [for (final b in OctaveBands.all) b.nominal],
        target: TargetCurve.flat,
      );
      final bandHz = [for (final b in OctaveBands.all) b.nominal];
      final filter = graphicEqResponseDb(bandHz, humpEq.bands, humpEq.gainsDb);
      final after = [for (var i = 0; i < hump.length; i++) hump[i] + filter[i]];
      final target = flat(0);
      expect(deviationFromTargetDb(bandHz, after, target),
          lessThan(deviationFromTargetDb(bandHz, hump, target)));

      final dip = flat(0)..[bandIndex(100)] = -12;
      final dipEq = generateEq(
        measuredBandsDb: dip,
        measuredBandCenters: bandHz,
        target: TargetCurve.flat,
      );
      final dipFilter = graphicEqResponseDb(bandHz, dipEq.bands, dipEq.gainsDb);
      expect(dip[bandIndex(100)] + dipFilter[bandIndex(100)], lessThan(-6));
      expect(dipEq.notes.join(), contains('interference'));
    });
  });

  group('target curve in the session', () {
    test('round-trips through JSON and defaults when absent', () {
      final s = Session(
        id: 's',
        name: 's',
        createdAt: DateTime.utc(2026),
        signal: ExcitationSignal.externalSweep,
        target: const TargetCurve(bassLiftDb: 2, tiltDbPerOctave: -1.2),
      );
      final back = Session.fromJson(
          jsonDecode(jsonEncode(s.toJson())) as Map<String, dynamic>);
      expect(back.target, const TargetCurve(bassLiftDb: 2, tiltDbPerOctave: -1.2));

      final old = s.toJson()..remove('target');
      expect(Session.fromJson(old).target, const TargetCurve());
    });
  });
}
