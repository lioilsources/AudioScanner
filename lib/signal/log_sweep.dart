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

  /// Sweep rate constant in seconds: T / ln(f₂/f₁). The n-th harmonic of the
  /// sweep deconvolves to an impulse this many times ln(n) seconds *before*
  /// the linear one.
  double get rate => (length / sampleRate) / math.log(_w2 / _w1);
  double get _rate => rate;

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
  /// Time-reversed sweep with an amplitude envelope that *rises* 6 dB per
  /// octave in frequency — which, since the reversed filter runs from high
  /// frequency to low, is an envelope that decays along the filter. The
  /// sweep spends its time in inverse proportion to frequency, so its
  /// spectrum is pink (−3 dB/octave in magnitude); the reversed copy is pink
  /// again, and the product would tilt −6 dB/octave. The envelope's +6 dB
  /// per octave cancels exactly that and the deconvolution comes out flat.
  ///
  /// The direction of the envelope is the whole point. With the sign the
  /// other way the product tilts −12 dB per octave, every response reads
  /// bass-heavy, and a reflection at 5 ms vanishes into a low-frequency blob
  /// that rings for twenty. The flat-chain test pins this down.
  Float64List inverseFilter() {
    final n = length;
    final sweep = generate();
    final out = Float64List(n);
    final l = _rate;
    final total = (n - 1) / sampleRate;
    for (var i = 0; i < n; i++) {
      final tOrig = (n - 1 - i) / sampleRate;
      // exp(+t/L), normalised so the loudest sample of the filter stays at
      // the sweep's own amplitude.
      out[i] = sweep[n - 1 - i] * math.exp((tOrig - total) / l);
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
