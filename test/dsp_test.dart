import 'dart:math' as math;

import 'package:audio_scanner/dsp/octave_bands.dart';
import 'package:audio_scanner/dsp/spectrum.dart';
import 'package:flutter_test/flutter_test.dart';

List<double> sine(double hz, int n, {double rate = 48000, double amp = 1.0}) =>
    [for (var i = 0; i < n; i++) amp * math.sin(2 * math.pi * hz * i / rate)];

void main() {
  group('1/3-octave bank', () {
    test('covers 20 Hz – 20 kHz in 31 bands, 1 kHz exactly on band 0', () {
      expect(OctaveBands.all.length, 31);
      final khz = OctaveBands.byNominal(1000);
      expect(khz.index, 0);
      expect(khz.center, closeTo(1000, 0.001));
    });

    test('band edges are a third of an octave apart and touch their neighbours',
        () {
      for (final b in OctaveBands.all) {
        // Upper/lower ratio of 2^(1/3) is what makes it a third-octave.
        expect(b.upper / b.lower, closeTo(math.pow(2, 1 / 3), 0.01));
      }
      for (var i = 1; i < OctaveBands.all.length; i++) {
        expect(OctaveBands.all[i].lower,
            closeTo(OctaveBands.all[i - 1].upper, 0.01));
      }
    });

    test('nominal labels never drift far from the exact centres', () {
      for (final b in OctaveBands.all) {
        expect((b.nominal - b.center).abs() / b.center, lessThan(0.02));
      }
    });
  });

  group('SpectrumAnalyzer', () {
    final analyzer = SpectrumAnalyzer(fftSize: 8192, sampleRate: 48000);

    test('a full-scale sine reads 0 dBFS, not the −6 dB a raw Hann gives', () {
      final s = analyzer.analyze(sine(1000, 8192));
      expect(s.rmsDbfs, closeTo(0, 0.1));
    });

    test('puts a 1 kHz tone in the 1 kHz band and nowhere else', () {
      final s = analyzer.analyze(sine(1000, 8192, amp: 0.5));
      final bands = s.bandsDb;
      final khz = OctaveBands.all.indexWhere((b) => b.nominal == 1000);

      var loudest = 0;
      for (var i = 1; i < bands.length; i++) {
        if (bands[i] > bands[loudest]) loudest = i;
      }
      expect(loudest, khz);
      // Leakage into bands two steps away must be far down, or every
      // measurement smears across the spectrum.
      expect(bands[khz] - bands[khz - 2], greaterThan(40));
      expect(bands[khz] - bands[khz + 2], greaterThan(40));
    });

    test('halving the amplitude drops the band by 6 dB', () {
      final loud = analyzer.analyze(sine(1000, 8192, amp: 0.5));
      final quiet = analyzer.analyze(sine(1000, 8192, amp: 0.25));
      final khz = OctaveBands.all.indexWhere((b) => b.nominal == 1000);
      expect(loud.bandsDb[khz] - quiet.bandsDb[khz], closeTo(6.02, 0.2));
    });

    test('rejects a block of the wrong length rather than analysing garbage',
        () {
      expect(() => analyzer.analyze(sine(1000, 4096)), throwsArgumentError);
    });
  });

  group('BandAverager', () {
    test('averages energy, not decibels', () {
      final avg = BandAverager(1);
      // 0 dB and −20 dB: the energy mean is −3.0 dB, the naive dB mean −10.
      avg.add([0]);
      avg.add([-20]);
      expect(avg.meanDb.first, closeTo(-2.99, 0.05));
    });

    test('an empty averager reports the floor, not NaN', () {
      expect(BandAverager(3).meanDb, everyElement(-160));
    });
  });
}
