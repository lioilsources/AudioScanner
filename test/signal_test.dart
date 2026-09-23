import 'dart:math' as math;
import 'dart:typed_data';

import 'package:audio_scanner/dsp/impulse_response.dart';
import 'package:audio_scanner/dsp/octave_bands.dart';
import 'package:audio_scanner/dsp/spectrum.dart';
import 'package:audio_scanner/signal/log_sweep.dart';
import 'package:audio_scanner/signal/pink_noise.dart';
import 'package:audio_scanner/signal/wav.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('PinkNoise', () {
    test('falls about 3 dB per octave', () {
      // Two octaves apart, measured through the same analyser the app uses.
      final noise = PinkNoise(seed: 7).generate(8192 * 8);
      final analyzer = SpectrumAnalyzer(fftSize: 8192, sampleRate: 48000);
      final avg = BandAverager(OctaveBands.all.length);
      for (var i = 0; i + 8192 <= noise.length; i += 8192) {
        avg.add(analyzer.analyze(noise.sublist(i, i + 8192)).bandsDb);
      }
      final bands = avg.meanDb;

      double at(double hz) =>
          bands[OctaveBands.all.indexWhere((b) => b.nominal == hz)];

      // Equal energy per octave means equal energy per 1/3-octave band, so
      // the band levels themselves should be flat, not sloped.
      expect(at(500) - at(2000), closeTo(0, 2.0));
      expect(at(250) - at(1000), closeTo(0, 2.0));
    });

    test('stays inside the rails', () {
      final noise = PinkNoise(seed: 3).generate(48000);
      for (final s in noise) {
        expect(s.abs(), lessThanOrEqualTo(1.0));
      }
    });

    test('is reproducible for a given seed', () {
      expect(PinkNoise(seed: 42).generate(256),
          orderedEquals(PinkNoise(seed: 42).generate(256)));
    });
  });

  group('LogSweep', () {
    final sweep = LogSweep(
      startHz: 50,
      endHz: 8000,
      duration: const Duration(seconds: 2),
      sampleRate: 48000,
    );

    test('sweeps from the start frequency up to the end frequency', () {
      final x = sweep.generate();
      expect(x.length, 96000);
      // Zero crossings per second early vs late tell us the frequency rose.
      int crossings(int from, int to) {
        var n = 0;
        for (var i = from + 1; i < to; i++) {
          if ((x[i - 1] < 0) != (x[i] < 0)) n++;
        }
        return n;
      }

      final early = crossings(2000, 6000);
      final late = crossings(90000, 94000);
      expect(late, greaterThan(early * 5));
    });

    test('fades in and out so the ends do not click', () {
      final x = sweep.generate();
      expect(x.first.abs(), lessThan(0.01));
      expect(x.last.abs(), lessThan(0.01));
    });

    test('deconvolving the sweep with its own inverse collapses it to t=0', () {
      // The measurement chain with nothing in it: the impulse must land at the
      // very start, because there is no delay to find.
      final ir = deconvolveSweep(recording: sweep.generate(), sweep: sweep);
      expect(ir.directSoundIndex, lessThan(3));
      expect(ir.samples[ir.directSoundIndex].abs(), closeTo(1.0, 0.02));
    });

    test('concentrates the energy into a couple of milliseconds', () {
      // A band-limited sweep cannot produce a mathematical delta — the result
      // is a bandpass impulse that rings, and for 50 Hz–8 kHz the first
      // sidelobe sits near −10 dB. What has to hold is that the energy is
      // *concentrated*: if it were not, a reflection 5 ms later would be
      // buried under the direct sound's own ringing.
      final ir = deconvolveSweep(recording: sweep.generate(), sweep: sweep);
      final peak = ir.directSoundIndex;
      final guard = (0.002 * sweep.sampleRate).round();

      var near = 0.0, total = 0.0;
      for (var i = 0; i < ir.samples.length; i++) {
        final e = ir.samples[i] * ir.samples[i];
        total += e;
        if ((i - peak).abs() <= guard) near += e;
      }
      expect(near / total, greaterThan(0.9));
    });

    test('recovers both arrivals of a two-path recording at their true delays',
        () {
      // The measurement phase 3 actually has to make: direct sound plus one
      // reflection, each landing at its own delay with its own level.
      //
      // Note what is *not* asserted here: that firstReflectionIndex picks the
      // echo out automatically. A sweep starting at 50 Hz produces an impulse
      // that rings for roughly 1/50 s, so an echo 10 ms behind the direct sound
      // arrives inside that ringing and no peak-picking rule can separate the
      // two. That is physics, not a bug — automatic picking is covered by the
      // sparse-response test below, where there is no ringing to hide in.
      final x = sweep.generate();
      const direct = 2400; // 50 ms
      const echo = direct + 480; // 10 ms later
      final recorded = Float64List(x.length + echo);
      for (var i = 0; i < x.length; i++) {
        recorded[i + direct] += x[i];
        recorded[i + echo] += x[i] * 0.5;
      }

      final ir = deconvolveSweep(recording: recorded, sweep: sweep);
      expect(ir.directSoundIndex, closeTo(direct, 2));
      expect(ir.samples[direct].abs(), closeTo(1.0, 0.1));
      // The echo is present, at half the level, exactly where it was planted.
      expect(ir.samples[echo].abs(), closeTo(0.5, 0.12));
    });

    test('a delayed, attenuated recording puts the impulse at that delay', () {
      final x = sweep.generate();
      const delay = 4800; // 100 ms
      final recorded = Float64List(x.length + delay);
      for (var i = 0; i < x.length; i++) {
        recorded[i + delay] = x[i] * 0.5;
      }
      final ir = deconvolveSweep(recording: recorded, sweep: sweep);
      expect(ir.directSoundIndex, closeTo(delay, 2));
      expect(ir.arrival.inMilliseconds, closeTo(100, 1));
      // Half the amplitude in, half the amplitude out.
      expect(ir.samples[ir.directSoundIndex].abs(), closeTo(0.5, 0.02));
    });
  });

  group('ImpulseResponse', () {
    ImpulseResponse decaying({
      required double rt60Seconds,
      double rate = 48000,
      int length = 48000,
    }) {
      // Synthetic exponential decay: amplitude −60 dB over rt60 seconds.
      //
      // For an envelope exp(−t/τ) the level falls 20/ln10 ≈ 8.686 dB per τ, so
      // a full 60 dB takes 3·ln10 ≈ 6.908 τ. Getting this constant wrong is an
      // easy way to "discover" a bug in the RT60 code that is really a bug in
      // the test signal.
      final s = Float64List(length);
      final rnd = math.Random(11);
      final tau = rt60Seconds / (3 * math.ln10);
      for (var i = 0; i < length; i++) {
        final t = i / rate;
        s[i] = (rnd.nextDouble() * 2 - 1) * math.exp(-t / tau);
      }
      s[0] = 1.0;
      return ImpulseResponse(samples: s, sampleRate: rate);
    }

    test('recovers a known RT60 within a tenth of a second', () {
      final ir = decaying(rt60Seconds: 0.6);
      final rt = ir.rt60(decayDb: 20);
      expect(rt, isNotNull);
      expect(rt!.inMilliseconds / 1000.0, closeTo(0.6, 0.1));
    });

    test('T20 and T30 agree on a clean exponential decay', () {
      final ir = decaying(rt60Seconds: 0.8);
      final t20 = ir.rt60(decayDb: 20)!.inMilliseconds;
      final t30 = ir.rt60(decayDb: 30)!.inMilliseconds;
      expect((t20 - t30).abs(), lessThan(120));
    });

    test('returns null rather than a number when the decay never gets there',
        () {
      final flat = ImpulseResponse(
        samples: Float64List.fromList([1, 1, 1, 1, 1]),
        sampleRate: 48000,
      );
      expect(flat.rt60(), isNull);
    });

    test('finds a reflection planted after the direct sound', () {
      final s = Float64List(4800);
      s[100] = 1.0;
      s[100 + 240] = 0.4; // 5 ms later
      final ir = ImpulseResponse(samples: s, sampleRate: 48000);
      expect(ir.directSoundIndex, 100);
      expect(ir.firstReflectionIndex(skip: const Duration(milliseconds: 1)),
          100 + 240);
    });

    test('gating states the frequency below which it says nothing', () {
      final s = Float64List(48000);
      s[500] = 1.0;
      final ir = ImpulseResponse(samples: s, sampleRate: 48000);
      final gated = ir.gated(window: const Duration(milliseconds: 5));
      // A 5 ms window cannot resolve below about 200 Hz.
      expect(gated.gatedResponseValidAbove, closeTo(200, 5));
    });
  });

  group('Wav', () {
    test('writes a RIFF header that says what the payload actually is', () {
      final bytes = Wav.pcm16(samples: [0, 0.5, -0.5], sampleRate: 48000);
      expect(String.fromCharCodes(bytes.sublist(0, 4)), 'RIFF');
      expect(String.fromCharCodes(bytes.sublist(8, 12)), 'WAVE');
      final view = ByteData.sublistView(bytes);
      expect(view.getUint16(20, Endian.little), 1); // PCM
      expect(view.getUint16(22, Endian.little), 1); // mono
      expect(view.getUint32(24, Endian.little), 48000);
      expect(view.getUint16(34, Endian.little), 16); // bits
      expect(view.getUint32(40, Endian.little), 6); // 3 samples × 2 bytes
      expect(bytes.length, 44 + 6);
    });

    test('clamps rather than wrapping around on overload', () {
      final bytes = Wav.pcm16(samples: [2.0, -2.0]);
      final view = ByteData.sublistView(bytes);
      expect(view.getInt16(44, Endian.little), 32767);
      expect(view.getInt16(46, Endian.little), -32767);
    });

    test('stereo puts the signal in one channel and silence in the other', () {
      final st = Wav.toStereo([1, 1, 1], left: true);
      expect(st, [1, 0, 1, 0, 1, 0]);
      expect(Wav.toStereo([1], left: false), [0, 1]);
    });
  });
}
