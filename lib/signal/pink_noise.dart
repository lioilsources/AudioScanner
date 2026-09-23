import 'dart:math' as math;
import 'dart:typed_data';

/// Pink noise generator — equal energy per octave, −3 dB per octave.
///
/// Paul Kellett's six-pole filter over white noise: accurate to about ±0.05 dB
/// from 10 Hz up, cheap enough to run per-sample on the audio thread, and
/// stateful, so it streams indefinitely rather than looping a buffer. A looped
/// buffer would put a comb of its own into every measurement.
///
/// Pink noise only gives a magnitude response — no phase, no impulse response,
/// no reflections. It is the quick "is the room doing something" signal; the
/// real measurement is [LogSweep].
class PinkNoise {
  PinkNoise({int seed = 1, this.amplitude = 0.3}) : _rnd = math.Random(seed);

  final math.Random _rnd;
  final double amplitude;

  double _b0 = 0, _b1 = 0, _b2 = 0, _b3 = 0, _b4 = 0, _b5 = 0, _b6 = 0;

  double next() {
    final white = _rnd.nextDouble() * 2 - 1;
    _b0 = 0.99886 * _b0 + white * 0.0555179;
    _b1 = 0.99332 * _b1 + white * 0.0750759;
    _b2 = 0.96900 * _b2 + white * 0.1538520;
    _b3 = 0.86650 * _b3 + white * 0.3104856;
    _b4 = 0.55000 * _b4 + white * 0.5329522;
    _b5 = -0.7616 * _b5 - white * 0.0168980;
    final pink = _b0 + _b1 + _b2 + _b3 + _b4 + _b5 + _b6 + white * 0.5362;
    _b6 = white * 0.115926;
    // The filter's output sits around ±3.5; scale into range before clamping so
    // that clamping is a guard, not the thing shaping the signal.
    return (pink * 0.11 * amplitude).clamp(-1.0, 1.0);
  }

  Float64List generate(int samples) {
    final out = Float64List(samples);
    for (var i = 0; i < samples; i++) {
      out[i] = next();
    }
    return out;
  }

  void reset() => _b0 = _b1 = _b2 = _b3 = _b4 = _b5 = _b6 = 0;
}
