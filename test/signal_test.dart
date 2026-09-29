import 'dart:math' as math;
import 'dart:typed_data';

import 'package:audio_scanner/dsp/band_filter.dart';
import 'package:audio_scanner/dsp/distortion.dart';
import 'package:audio_scanner/dsp/impulse_response.dart';
import 'package:audio_scanner/export/frd.dart';
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

    test('a flat chain deconvolves to a flat response', () {
      // Regression: the inverse filter's envelope once ran the wrong way and
      // every response tilted −12 dB per octave. A sweep through nothing must
      // come back flat within a dB across the band the sweep covers.
      final x = sweep.generate();
      final recorded = Float64List(x.length + 4800);
      recorded.setRange(2400, 2400 + x.length, x);
      final ir = deconvolveSweep(recording: recorded, sweep: sweep);
      final gated = ir.gated(
          window: const Duration(milliseconds: 40),
          preRoll: const Duration(milliseconds: 20));
      final (freqs, levels) = gated.frequencyResponse(fftSize: 65536);
      final binHz = freqs[1];
      final at1k = levels[(1000 / binHz).round()];
      for (final hz in [100.0, 200, 400, 800, 1600, 3200, 6400]) {
        expect(levels[(hz / binHz).round()], closeTo(at1k, 1.0),
            reason: 'at $hz Hz');
      }
      // The absolute figure is not zero: normalisation is to the impulse's
      // peak in time, and a band-limited impulse with a peak of one has a
      // magnitude that depends on the sweep's bandwidth. Levels here are
      // relative, and everything downstream anchors at 1 kHz.
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

    test('harmonics land L·ln(n) before the direct sound and read their level',
        () {
      // y = x + 0.1·x²: with x = A·sin θ the second harmonic is
      // 0.1·A²/2·cos 2θ, so HD2 = 0.05·A / 1 = 0.025 for A = 0.5 → −32 dB.
      // No third harmonic at all.
      final x = sweep.generate();
      const delay = 2400;
      final recorded = Float64List(x.length + delay);
      for (var i = 0; i < x.length; i++) {
        recorded[i + delay] = x[i] + 0.1 * x[i] * x[i];
      }
      final ir = deconvolveSweep(recording: recorded, sweep: sweep);
      expect(ir.negativeTime, isNotNull);

      // The second-harmonic impulse sits L·ln 2 ahead of the linear one.
      final advance = (sweep.rate * math.ln2 * 48000).round();
      var peakAt = 0;
      var peak = 0.0;
      for (var i = -advance - 200; i < -advance + 200; i++) {
        final a = ir.sampleAt(ir.directSoundIndex + i).abs();
        if (a > peak) {
          peak = a;
          peakAt = i;
        }
      }
      expect(peakAt, closeTo(-advance, 3));

      final hd = harmonicDistortion(ir, sweep);
      final hd2 = hd.firstWhere((h) => h.order == 2);
      final hd3 = hd.firstWhere((h) => h.order == 3);
      expect(hd2.at(1000), closeTo(-32, 3));
      expect(hd2.at(300), closeTo(-32, 3));
      expect(hd3.at(1000), lessThan(-50));
    });

    test('a clean chain reads no distortion', () {
      final x = sweep.generate();
      final recorded = Float64List(x.length + 2400);
      recorded.setRange(2400, 2400 + x.length, x);
      final ir = deconvolveSweep(recording: recorded, sweep: sweep);
      for (final h in harmonicDistortion(ir, sweep)) {
        expect(h.at(1000), lessThan(-60));
      }
    });

    test('a response that is not from a sweep has nothing to say', () {
      final ir = ImpulseResponse(samples: Float64List(100)..[10] = 1, sampleRate: 48000);
      expect(harmonicDistortion(ir, sweep), isEmpty);
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

    test('phase is flat once the propagation delay is removed', () {
      final s = Float64List(4096);
      s[700] = 1.0;
      final ir = ImpulseResponse(samples: s, sampleRate: 48000);
      final (freqs, re, im) = ir.complexResponse(fftSize: 4096);
      final phase = FrdExport.phaseDegrees(re, im);
      for (var k = 1; k < freqs.length; k++) {
        expect(phase[k].abs(), lessThan(1.0));
      }
    });

    test('phase without delay removal slopes by exactly the delay', () {
      final s = Float64List(4096);
      s[700] = 1.0;
      final ir = ImpulseResponse(samples: s, sampleRate: 48000);
      final (freqs, re, im) =
          ir.complexResponse(fftSize: 4096, removeDelay: false);
      final phase = FrdExport.phaseDegrees(re, im);
      // A delay of N samples is a phase of −360·k·N/n degrees at bin k.
      for (final k in [1, 5, 40]) {
        expect(phase[k], closeTo(-360.0 * k * 700 / 4096, 0.5));
      }
      expect(freqs[1], closeTo(48000 / 4096, 1e-9));
    });

    test('a reflection shows up as ripple in magnitude and phase', () {
      final s = Float64List(4096);
      s[100] = 1.0;
      s[100 + 48] = 0.5; // 1 ms later: comb with 1 kHz spacing
      final ir = ImpulseResponse(samples: s, sampleRate: 48000);
      final (freqs, levels) = ir.frequencyResponse(fftSize: 4096);
      int binOf(double hz) => (hz / (48000 / 4096)).round();
      // Constructive at 1 kHz (path difference one period), destructive at
      // 500 Hz (half a period).
      expect(levels[binOf(1000)] - levels[binOf(500)], closeTo(9.5, 0.6));
      final (_, re, im) = ir.complexResponse(fftSize: 4096);
      final phase = FrdExport.phaseDegrees(re, im);
      expect(phase.any((p) => p.abs() > 5), isTrue);
      expect(freqs.length, 2049);
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

  group('decay per band', () {
    /// Noise decaying with one RT60 below [splitHz] and another above it.
    ImpulseResponse twoBandDecay({
      required double lowRt60,
      required double highRt60,
      double splitHz = 400,
      double rate = 48000,
      int length = 48000,
    }) {
      final rnd = math.Random(5);
      final noise = Float64List(length);
      for (var i = 0; i < length; i++) {
        noise[i] = rnd.nextDouble() * 2 - 1;
      }
      final base = ImpulseResponse(samples: noise, sampleRate: rate);
      // Split the noise into the two halves of the spectrum, decay each.
      final low = bandLimit(base, centerHz: splitHz / 4, octaves: 4);
      final high = bandLimit(base, centerHz: splitHz * 4, octaves: 4);
      final out = Float64List(length);
      final tauLow = lowRt60 / (3 * math.ln10);
      final tauHigh = highRt60 / (3 * math.ln10);
      for (var i = 0; i < length; i++) {
        final t = i / rate;
        out[i] = low.samples[i] * math.exp(-t / tauLow) +
            high.samples[i] * math.exp(-t / tauHigh);
      }
      out[0] = 1.0;
      return ImpulseResponse(samples: out, sampleRate: rate);
    }

    test('band limiting keeps the band and kills two octaves away', () {
      final rnd = math.Random(9);
      final noise = Float64List(16384);
      for (var i = 0; i < noise.length; i++) {
        noise[i] = rnd.nextDouble() * 2 - 1;
      }
      final band = bandLimit(
          ImpulseResponse(samples: noise, sampleRate: 48000),
          centerHz: 1000);
      final (freqs, levels) = band.frequencyResponse(fftSize: 16384);
      int binOf(double hz) => (hz / (48000 / 16384)).round();
      double around(double hz) {
        var sum = 0.0;
        var n = 0;
        for (var k = binOf(hz * 0.95); k <= binOf(hz * 1.05); k++) {
          sum += levels[k];
          n++;
        }
        return sum / n;
      }

      expect(around(1000) - around(250), greaterThan(40));
      expect(around(1000) - around(4000), greaterThan(40));
      expect(freqs.length, 8193);
    });

    test('recovers a different RT60 in each band', () {
      final ir = twoBandDecay(lowRt60: 0.8, highRt60: 0.3);
      final bands = decayPerBand(ir, centers: [63, 125, 1000, 2000]);
      final low = bands.firstWhere((b) => b.centerHz == 125);
      final high = bands.firstWhere((b) => b.centerHz == 2000);
      expect(low.t20, isNotNull);
      expect(high.t20, isNotNull);
      expect(low.t20!.inMilliseconds / 1000, closeTo(0.8, 0.12));
      expect(high.t20!.inMilliseconds / 1000, closeTo(0.3, 0.08));
    });

    test('EDT equals T20 on an ideal exponential decay', () {
      final rnd = math.Random(11);
      final s = Float64List(48000);
      final tau = 0.6 / (3 * math.ln10);
      for (var i = 0; i < s.length; i++) {
        s[i] = (rnd.nextDouble() * 2 - 1) * math.exp(-i / 48000 / tau);
      }
      final ir = ImpulseResponse(samples: s, sampleRate: 48000);
      final edt = ir.rt60(decayDb: 10, startDb: 0)!.inMilliseconds;
      final t20 = ir.rt60(decayDb: 20)!.inMilliseconds;
      expect((edt - t20).abs(), lessThan(100));
    });

    test('clarity is the early-to-late energy ratio', () {
      final s = Float64List(48000);
      s[100] = 1.0;
      s[100 + 2880] = math.sqrt(0.5); // 60 ms later, half the energy
      final ir = ImpulseResponse(samples: s, sampleRate: 48000);
      expect(ir.clarityDb(const Duration(milliseconds: 50)), closeTo(3.01, 0.05));
      // With the reflection inside the early window there is no late energy.
      expect(ir.clarityDb(const Duration(milliseconds: 80)), isNull);
    });

    test('mid-band RT60 averages 125–500 Hz and ignores the rest', () {
      const bands = [
        BandDecay(centerHz: 63, t20: Duration(seconds: 5)),
        BandDecay(centerHz: 125, t20: Duration(milliseconds: 600)),
        BandDecay(centerHz: 250),
        BandDecay(centerHz: 500, t20: Duration(milliseconds: 400)),
        BandDecay(centerHz: 4000, t20: Duration(milliseconds: 100)),
      ];
      expect(midBandRt60(bands), closeTo(0.5, 1e-9));
      expect(midBandRt60(const [BandDecay(centerHz: 250)]), isNull);
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
