import 'dart:math' as math;
import 'dart:typed_data';

import 'package:fftea/fftea.dart';

import '../signal/log_sweep.dart';

/// Recovers the impulse response from a sweep recording.
///
/// Farina's deconvolution is a plain convolution with the inverse filter — no
/// spectral division, so no blowing up where the recording has no energy. The
/// harmonic distortion of the speaker lands *before* the linear impulse in the
/// result; everything ahead of the main peak can be discarded.
///
/// No synchronisation with the playback device is needed. The position of the
/// peak is the round trip (playback latency + flight time), and every downstream
/// measurement is relative to that peak, which is exactly what the plan asks
/// for: relative time, not absolute.
ImpulseResponse deconvolveSweep({
  required List<double> recording,
  required LogSweep sweep,
}) {
  final inverse = sweep.inverseFilter();
  final raw = convolution(recording, inverse);

  // Normalise against the chain's own answer: sweep ⊛ inverse is the impulse
  // this method would produce from a perfect, unity-gain measurement. Dividing
  // by its peak makes the direct sound read 0 dB for a flat chain, so levels
  // between points are comparable.
  final reference = convolution(sweep.generate(), inverse);
  final refPeak = _peakMagnitude(reference);

  // A linear convolution with a time-reversed filter puts time zero at index
  // N−1, not at 0. Everything before it is Farina's negative-time region,
  // where the speaker's harmonic distortion lands — discarded here, which is
  // the whole reason for using a sweep rather than noise.
  //
  // Trimming it is what makes the index mean something: sample n of the result
  // is n samples after the recording started, so the peak position is the
  // round-trip delay and nothing downstream has to know about this offset.
  final offset = inverse.length - 1;
  final length = math.max(0, raw.length - offset);
  final out = Float64List(length);
  if (refPeak > 0) {
    for (var i = 0; i < length; i++) {
      out[i] = raw[offset + i] / refPeak;
    }
  }
  return ImpulseResponse(samples: out, sampleRate: sweep.sampleRate);
}

double _peakMagnitude(List<double> x) {
  var peak = 0.0;
  for (final v in x) {
    final a = v.abs();
    if (a > peak) peak = a;
  }
  return peak;
}

/// An impulse response and the measurements taken from it.
class ImpulseResponse {
  ImpulseResponse({required this.samples, required this.sampleRate});

  final Float64List samples;
  final double sampleRate;

  /// Index of the direct sound — the largest peak.
  ///
  /// Distortion products sit ahead of it and are always smaller than the linear
  /// impulse in a measurement that was not clipping, so "largest" is the right
  /// rule and a peak that is *not* the direct sound is itself the warning that
  /// the level was too hot.
  int get directSoundIndex {
    var best = 0;
    var bestVal = 0.0;
    for (var i = 0; i < samples.length; i++) {
      final a = samples[i].abs();
      if (a > bestVal) {
        bestVal = a;
        best = i;
      }
    }
    return best;
  }

  /// Delay from the start of the recording to the direct sound.
  Duration get arrival =>
      Duration(microseconds: (directSoundIndex / sampleRate * 1e6).round());

  /// First reflection after the direct sound.
  ///
  /// A fixed threshold is not enough. The impulse recovered from a band-limited
  /// sweep is a bandpass impulse, not a delta: it rings, and its first sidelobes
  /// sit around −10 dB — well above any sensible reflection threshold. Looking
  /// only for "a local peak above −20 dB" reliably finds the direct sound's own
  /// ringing and calls it a wall.
  ///
  /// So a candidate must also be a *new arrival*: louder than everything in the
  /// [lookback] window immediately before it. Ringing decays, so a sidelobe is
  /// always smaller than the ringing preceding it and is rejected; a reflection
  /// arriving into decayed ringing is not.
  ///
  /// The cost is that a reflection quieter than the ringing it lands in is
  /// missed — correct, because at that point it genuinely cannot be told apart
  /// from the direct sound. For the same reason nothing within [lookback] of
  /// the direct peak can ever qualify: the direct sound is still in the window.
  ///
  /// Returns null when nothing qualifies: an anechoic-ish measurement, a window
  /// too short, or reflections buried in the ringing.
  int? firstReflectionIndex({
    double thresholdDb = -20,
    Duration? skip,
    Duration lookback = const Duration(milliseconds: 1),
  }) {
    final direct = directSoundIndex;
    final directLevel = samples[direct].abs();
    if (directLevel <= 0) return null;

    final threshold = directLevel * math.pow(10, thresholdDb / 20);
    final earliest = direct + _toSamples(skip ?? const Duration(milliseconds: 1));
    final back = math.max(1, _toSamples(lookback));

    for (var i = math.max(1, earliest); i < samples.length - 1; i++) {
      final a = samples[i].abs();
      if (a < threshold) continue;
      if (a < samples[i - 1].abs() || a <= samples[i + 1].abs()) continue;

      var priorMax = 0.0;
      for (var j = math.max(0, i - back); j < i; j++) {
        final p = samples[j].abs();
        if (p > priorMax) priorMax = p;
      }
      if (a > priorMax) return i;
    }
    return null;
  }

  int _toSamples(Duration d) => (d.inMicroseconds * sampleRate / 1e6).round();

  /// Cuts the response to a window starting just before the direct sound,
  /// with a half-Hann fade-out at the far end.
  ///
  /// This is the "gating" the plan wants: keep the direct sound, drop the room.
  /// The price is a hard low-frequency limit — a window of length T cannot
  /// resolve anything below roughly 1/T, so a 5 ms gate says nothing valid
  /// below ~200 Hz. [gatedResponseValidAbove] states that limit rather than
  /// letting the plot imply bass data that is not there.
  ImpulseResponse gated({
    Duration window = const Duration(milliseconds: 5),
    Duration preRoll = const Duration(microseconds: 500),
  }) {
    final direct = directSoundIndex;
    final pre = (preRoll.inMicroseconds * sampleRate / 1e6).round();
    final len = (window.inMicroseconds * sampleRate / 1e6).round();
    final start = math.max(0, direct - pre);
    final end = math.min(samples.length, start + len);

    final out = Float64List(end - start);
    final fade = out.length ~/ 4;
    for (var i = 0; i < out.length; i++) {
      var w = 1.0;
      if (i >= out.length - fade) {
        final t = (i - (out.length - fade)) / fade;
        w = 0.5 * (1 + math.cos(math.pi * t));
      }
      out[i] = samples[start + i] * w;
    }
    return ImpulseResponse(samples: out, sampleRate: sampleRate);
  }

  /// Lowest frequency a response gated to this length can be trusted at.
  double get gatedResponseValidAbove => sampleRate / samples.length;

  /// Magnitude response in dB, one value per FFT bin.
  ///
  /// Returns (frequencies, levels). [fftSize] is rounded up to a power of two
  /// and the response is zero-padded into it, which interpolates the curve but
  /// adds no resolution — the real resolution is set by the window length.
  (Float64List, Float64List) frequencyResponse({int fftSize = 16384}) {
    var n = 1;
    while (n < math.max(fftSize, samples.length)) {
      n *= 2;
    }
    final padded = Float64List(n);
    padded.setRange(0, samples.length, samples);

    final spec = FFT(n).realFft(padded);
    final half = n ~/ 2;
    final freqs = Float64List(half + 1);
    final levels = Float64List(half + 1);
    for (var k = 0; k <= half; k++) {
      final c = spec[k];
      final mag = math.sqrt(c.x * c.x + c.y * c.y);
      freqs[k] = k * sampleRate / n;
      levels[k] = mag <= 0 ? -160 : 20 * math.log(mag) / math.ln10;
    }
    return (freqs, levels);
  }

  /// Reverberation time by Schroeder backward integration.
  ///
  /// [decayDb] picks the evaluation range: 20 gives T20 (−5 … −25 dB), 30 gives
  /// T30 (−5 … −35 dB), both extrapolated to a full 60 dB decay. The −5 dB head
  /// start is deliberate — the first few dB are the direct sound, not the room.
  ///
  /// Returns null when the decay never reaches the range, which in a phone
  /// measurement usually means the noise floor got there first. That is a real
  /// answer, not a failure: it says this recording cannot support an RT60.
  Duration? rt60({double decayDb = 20}) {
    final energy = schroederCurveDb();
    if (energy.isEmpty) return null;

    const startDb = -5.0;
    final endDb = startDb - decayDb;

    final i1 = _firstIndexBelow(energy, startDb);
    final i2 = _firstIndexBelow(energy, endDb);
    if (i1 == null || i2 == null || i2 <= i1) return null;

    // Least-squares slope over the range, in dB per sample.
    var sx = 0.0, sy = 0.0, sxx = 0.0, sxy = 0.0;
    final n = i2 - i1 + 1;
    for (var i = i1; i <= i2; i++) {
      final x = i.toDouble();
      final y = energy[i];
      sx += x;
      sy += y;
      sxx += x * x;
      sxy += x * y;
    }
    final denom = n * sxx - sx * sx;
    if (denom == 0) return null;
    final slope = (n * sxy - sx * sy) / denom;
    if (slope >= 0) return null;

    final samplesFor60 = -60 / slope;
    return Duration(microseconds: (samplesFor60 / sampleRate * 1e6).round());
  }

  /// Schroeder decay curve in dB, normalised to 0 dB at the direct sound.
  Float64List schroederCurveDb() {
    final direct = directSoundIndex;
    final tail = samples.length - direct;
    if (tail <= 1) return Float64List(0);

    // Integrate backwards: E(t) = ∫ₜ^∞ h²(τ) dτ.
    final energy = Float64List(tail);
    var running = 0.0;
    for (var i = tail - 1; i >= 0; i--) {
      final s = samples[direct + i];
      running += s * s;
      energy[i] = running;
    }
    final total = energy[0];
    if (total <= 0) return Float64List(0);

    final out = Float64List(tail);
    for (var i = 0; i < tail; i++) {
      out[i] = energy[i] <= 0 ? -160 : 10 * math.log(energy[i] / total) / math.ln10;
    }
    return out;
  }

  static int? _firstIndexBelow(Float64List curve, double db) {
    for (var i = 0; i < curve.length; i++) {
      if (curve[i] <= db) return i;
    }
    return null;
  }
}
