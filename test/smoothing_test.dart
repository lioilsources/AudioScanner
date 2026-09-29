import 'dart:math' as math;

import 'package:audio_scanner/dsp/smoothing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // A linear frequency axis like an FFT produces: 0 … 24 kHz in 2 Hz steps.
  final freqs = [for (var i = 0; i <= 12000; i++) i * 2.0];
  int binOf(double hz) => (hz / 2).round();

  group('fractional-octave smoothing', () {
    test('leaves a flat response flat', () {
      final flat = List<double>.filled(freqs.length, -12.0);
      final out = smoothFractionalOctave(freqs, flat, octaveFraction: 3);
      for (var i = 1; i < out.length; i++) {
        expect(out[i], closeTo(-12.0, 1e-9));
      }
    });

    test('lowers a lone spike and spreads it symmetrically on the log axis',
        () {
      final levels = List<double>.filled(freqs.length, 0.0);
      levels[binOf(1000)] = 20;
      final out = smoothFractionalOctave(freqs, levels, octaveFraction: 3);

      expect(out[binOf(1000)], lessThan(20));
      expect(out[binOf(1000)], greaterThan(0));
      // Half a third-octave either side, in octaves, is the window edge:
      // symmetric in log frequency, so 1000/2^(1/6) and 1000·2^(1/6) match.
      final ratio = math.pow(2, 1 / 6).toDouble();
      final below = out[binOf(1000 / ratio * 1.01)];
      final above = out[binOf(1000 * ratio / 1.01)];
      expect(below, closeTo(above, 0.5));
      // Two octaves away nothing of the spike remains.
      expect(out[binOf(4000)], closeTo(0, 1e-6));
      expect(out[binOf(250)], closeTo(0, 1e-6));
    });

    test('a finer fraction smooths less', () {
      final levels = List<double>.filled(freqs.length, 0.0);
      levels[binOf(1000)] = 20;
      final coarse = smoothFractionalOctave(freqs, levels, octaveFraction: 3);
      final fine = smoothFractionalOctave(freqs, levels, octaveFraction: 24);
      expect(fine[binOf(1000)], greaterThan(coarse[binOf(1000)]));
    });

    test('averages energy, so a null next to a peak does not swallow it', () {
      final levels = List<double>.filled(freqs.length, 0.0);
      levels[binOf(1000)] = 20;
      levels[binOf(1004)] = -60;
      final out = smoothFractionalOctave(freqs, levels, octaveFraction: 3);
      // The window holds ~120 bins. Energy mean: (119 + 100) / 120 → +2.6 dB.
      // A dB mean would give (20 − 60) / 120 → −0.3 dB, i.e. the null would
      // have pulled the peak below the surrounding level.
      expect(out[binOf(1000)], greaterThan(1.5));
      expect(out[binOf(1000)], lessThan(4));
    });

    test('does not touch anything below the validity limit', () {
      final rnd = math.Random(3);
      final levels = [for (final _ in freqs) rnd.nextDouble() * 40 - 20];
      final out = smoothFractionalOctave(freqs, levels,
          octaveFraction: 3, validAbove: 200);
      for (var i = 0; i < binOf(200); i++) {
        expect(out[i], levels[i]);
      }
      // …and does smooth above it.
      var changed = 0;
      for (var i = binOf(300); i < binOf(2000); i++) {
        if (out[i] != levels[i]) changed++;
      }
      expect(changed, greaterThan(100));
    });

    test('rejects mismatched inputs', () {
      expect(() => smoothFractionalOctave([1, 2], [1], octaveFraction: 3),
          throwsArgumentError);
    });
  });
}
