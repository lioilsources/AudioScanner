import 'dart:math' as math;
import 'dart:typed_data';

import 'package:fftea/fftea.dart';

import 'impulse_response.dart';

/// Short-time spectrum of an impulse response: how each frequency decays.
///
/// Where the RT60 table gives one number per octave, this shows the shape:
/// a mode is a horizontal streak that outlives everything around it, a
/// flutter echo a row of vertical stripes. Frames of [window] every [hop],
/// Hann-weighted, levels in dB relative to the loudest cell.
class Spectrogram {
  Spectrogram._({
    required this.timesMs,
    required this.frequencies,
    required this.levelsDb,
  });

  /// Frame centres, ms after the direct sound.
  final List<double> timesMs;

  /// FFT bin frequencies, Hz.
  final Float64List frequencies;

  /// Row-major: levelsDb[frame][bin], 0 dB at the loudest cell.
  final List<Float64List> levelsDb;

  factory Spectrogram.of(
    ImpulseResponse ir, {
    Duration window = const Duration(milliseconds: 20),
    Duration hop = const Duration(milliseconds: 5),
    Duration before = const Duration(milliseconds: 10),
    Duration span = const Duration(milliseconds: 500),
    int fftSize = 2048,
  }) {
    final rate = ir.sampleRate;
    int samples(Duration d) => (d.inMicroseconds * rate / 1e6).round();
    final win = samples(window);
    final step = math.max(1, samples(hop));
    final direct = ir.directSoundIndex;
    final start = direct - samples(before);
    final end = math.min(ir.samples.length, direct + samples(span));

    var n = fftSize;
    while (n < win) {
      n *= 2;
    }
    final fft = FFT(n);
    final half = n ~/ 2;
    final freqs = Float64List(half + 1);
    for (var k = 0; k <= half; k++) {
      freqs[k] = k * rate / n;
    }

    final hann = Float64List(win);
    for (var i = 0; i < win; i++) {
      hann[i] = 0.5 * (1 - math.cos(2 * math.pi * i / (win - 1)));
    }

    final times = <double>[];
    final frames = <Float64List>[];
    var peak = 0.0;
    for (var c = start; c < end; c += step) {
      final buf = Float64List(n);
      for (var i = 0; i < win; i++) {
        final idx = c - win ~/ 2 + i;
        if (idx < 0 || idx >= ir.samples.length) continue;
        buf[i] = ir.samples[idx] * hann[i];
      }
      final spec = fft.realFft(buf);
      final mag = Float64List(half + 1);
      for (var k = 0; k <= half; k++) {
        final m = math.sqrt(spec[k].x * spec[k].x + spec[k].y * spec[k].y);
        mag[k] = m;
        if (m > peak) peak = m;
      }
      frames.add(mag);
      times.add((c - direct) / rate * 1000);
    }

    for (final f in frames) {
      for (var k = 0; k < f.length; k++) {
        f[k] = f[k] <= 0 || peak <= 0 ? -160 : 20 * math.log(f[k] / peak) / math.ln10;
      }
    }
    return Spectrogram._(timesMs: times, frequencies: freqs, levelsDb: frames);
  }

  /// Level at the frame nearest [ms] and the bin nearest [hz].
  double levelAt(double ms, double hz) {
    if (timesMs.isEmpty) return -160;
    var f = 0;
    for (var i = 1; i < timesMs.length; i++) {
      if ((timesMs[i] - ms).abs() < (timesMs[f] - ms).abs()) f = i;
    }
    final k = (hz / frequencies[1]).round().clamp(0, frequencies.length - 1);
    return levelsDb[f][k];
  }
}
