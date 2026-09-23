import 'dart:math' as math;
import 'dart:typed_data';

/// An exponential ("log") sine sweep and the inverse filter that collapses it
/// back to an impulse.
///
/// Farina's method: the sweep's instantaneous frequency rises exponentially, so
/// deconvolving the recording with a time-reversed, −6 dB/octave-shaped copy of
/// the sweep yields the impulse response with the harmonic distortion products
/// pushed into negative time, where they can simply be cut away. That property
/// is why this is the signal to use rather than white noise or an MLS.
///
/// A. Farina, "Simultaneous measurement of impulse response and distortion with
/// a swept-sine technique", AES 108 (2000).
class LogSweep {
  LogSweep({
    this.startHz = 20,
    this.endHz = 20000,
    this.duration = const Duration(seconds: 10),
    this.sampleRate = 48000,
    this.amplitude = 0.5,
    this.fade = const Duration(milliseconds: 50),
  }) : assert(startHz > 0 && endHz > startHz);

  final double startHz;
  final double endHz;
  final Duration duration;
  final double sampleRate;

  /// Peak amplitude. Left at 0.5 (−6 dBFS) on purpose: a sweep at full scale
  /// clips the DAC or the amplifier on the first loud room mode, and clipping
  /// shows up in the impulse response as a distortion tail that looks exactly
  /// like a real reflection.
  final double amplitude;

  /// Raised-cosine fade at each end, to stop the discontinuity at the sweep's
  /// start and finish from ringing across the whole spectrum.
  final Duration fade;

  int get length => (duration.inMicroseconds * sampleRate / 1e6).round();

  double get _w1 => 2 * math.pi * startHz;
  double get _w2 => 2 * math.pi * endHz;

  /// Sweep rate constant: T / ln(ω₂/ω₁).
  double get _rate => (length / sampleRate) / math.log(_w2 / _w1);

  /// The excitation signal itself.
  Float64List generate() {
    final n = length;
    final out = Float64List(n);
    final l = _rate;
    for (var i = 0; i < n; i++) {
      final t = i / sampleRate;
      out[i] = amplitude * math.sin(_w1 * l * (math.exp(t / l) - 1));
    }
    _applyFades(out);
    return out;
  }

  /// The matched inverse filter.
  ///
  /// Time-reversed sweep with an envelope falling 6 dB per octave, which undoes
  /// the sweep's pink energy distribution. Without the envelope the
  /// deconvolution comes out tilted and every response reads bass-heavy.
  Float64List inverseFilter() {
    final n = length;
    final sweep = generate();
    final out = Float64List(n);
    final l = _rate;
    for (var i = 0; i < n; i++) {
      final tRev = (n - 1 - i) / sampleRate;
      out[i] = sweep[n - 1 - i] * math.exp(-tRev / l);
    }
    return out;
  }

  void _applyFades(Float64List buf) {
    final f = (fade.inMicroseconds * sampleRate / 1e6).round();
    if (f <= 0) return;
    final k = math.min(f, buf.length ~/ 2);
    for (var i = 0; i < k; i++) {
      final w = 0.5 * (1 - math.cos(math.pi * i / k));
      buf[i] *= w;
      buf[buf.length - 1 - i] *= w;
    }
  }
}
