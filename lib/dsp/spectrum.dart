import 'dart:math' as math;
import 'dart:typed_data';

import 'package:fftea/fftea.dart';

import 'octave_bands.dart';

/// One analysed block: a linear power spectrum plus the 1/3-octave reduction.
class Spectrum {
  Spectrum({
    required this.power,
    required this.bandsDb,
    required this.binHz,
    required this.rmsDbfs,
  });

  /// Power per FFT bin (squared magnitude), positive frequencies only.
  final Float64List power;

  /// 1/3-octave band levels in dB, aligned with [OctaveBands.all].
  final List<double> bandsDb;
  final double binHz;

  /// Broadband level of the block in dBFS. Full-scale sine reads 0 dBFS.
  final double rmsDbfs;

  double frequencyOfBin(int bin) => bin * binHz;
}

/// Real-time spectrum analyser: Hann-windowed FFT reduced to 1/3-octave bands.
///
/// Window gain is compensated so a full-scale sine reads 0 dBFS rather than the
/// −6 dB a raw Hann window would give. Without that the on-screen numbers drift
/// from anything another meter would show, and the whole point of this app is
/// comparing readings between points.
class SpectrumAnalyzer {
  SpectrumAnalyzer({this.fftSize = 8192, this.sampleRate = 48000})
      : _fft = FFT(fftSize),
        _window = Window.hanning(fftSize) {
    // Coherent gain of the window: a sine's peak bin is attenuated by this.
    var sum = 0.0;
    for (final w in _window) {
      sum += w;
    }
    _windowGain = sum / fftSize;
  }

  final int fftSize;
  final double sampleRate;
  final FFT _fft;
  final Float64List _window;
  late final double _windowGain;

  double get binHz => sampleRate / fftSize;

  /// Analyses one block. [samples] must be [fftSize] long and in −1…1.
  Spectrum analyze(List<double> samples) {
    if (samples.length != fftSize) {
      throw ArgumentError('expected $fftSize samples, got ${samples.length}');
    }

    final windowed = Float64List(fftSize);
    var sumSquares = 0.0;
    for (var i = 0; i < fftSize; i++) {
      final s = samples[i];
      sumSquares += s * s;
      windowed[i] = s * _window[i];
    }

    final freq = _fft.realFft(windowed);
    final half = fftSize ~/ 2;
    final power = Float64List(half + 1);

    // Scale so a full-scale sine lands at 0 dBFS: undo 1/N of the transform,
    // undo the window's coherent gain, and fold the negative-frequency twin
    // into every bin except DC and Nyquist, which have no twin.
    final norm = 2.0 / (fftSize * _windowGain);
    for (var k = 0; k <= half; k++) {
      final c = freq[k];
      final mag = math.sqrt(c.x * c.x + c.y * c.y) * norm;
      final corrected = (k == 0 || k == half) ? mag / 2 : mag;
      power[k] = corrected * corrected;
    }

    final rms = math.sqrt(sumSquares / fftSize);
    return Spectrum(
      power: power,
      bandsDb: bandLevelsDb(power, binHz: binHz),
      binHz: binHz,
      // ×√2 so a full-scale sine (RMS 0.707) reads 0 dBFS, matching the bands.
      rmsDbfs: rms <= 0 ? -160 : 20 * math.log(rms * math.sqrt2) / math.ln10,
    );
  }
}

/// Running average of band levels, in the power domain.
///
/// Averaging dB values directly would bias every reading toward the quiet
/// blocks; energy has to be averaged, then converted. [count] blocks are held
/// as a simple mean — the plan's "3 s averaging" per measurement point.
class BandAverager {
  BandAverager(int bandCount)
      : _sum = List<double>.filled(bandCount, 0),
        _count = 0;

  final List<double> _sum;
  int _count;

  int get blocks => _count;

  void add(List<double> bandsDb) {
    for (var i = 0; i < _sum.length; i++) {
      _sum[i] += math.pow(10, bandsDb[i] / 10).toDouble();
    }
    _count++;
  }

  void reset() {
    for (var i = 0; i < _sum.length; i++) {
      _sum[i] = 0;
    }
    _count = 0;
  }

  List<double> get meanDb {
    if (_count == 0) return List<double>.filled(_sum.length, -160);
    return [
      for (final s in _sum)
        s <= 0 ? -160.0 : 10 * math.log(s / _count) / math.ln10,
    ];
  }
}
