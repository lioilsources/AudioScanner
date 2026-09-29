import 'dart:math' as math;
import 'dart:typed_data';

import 'package:fftea/fftea.dart';

import 'impulse_response.dart';

/// Octave bands the time-domain figures are reported in.
///
/// 63 Hz to 8 kHz. Below 63 a phone recording rarely has a decay to measure
/// above its own noise, and above 8 kHz the phone's microphone is measuring
/// itself.
const List<double> octaveBandCenters = [63, 125, 250, 500, 1000, 2000, 4000, 8000];

/// Restricts an impulse response to one octave band.
///
/// Done in the frequency domain: transform, zero everything outside the band
/// with raised-cosine edges a sixth of an octave wide, transform back. An IIR
/// bandpass would be cheaper, but its group delay smears the start of the
/// decay and shows up as a longer EDT in the low bands — exactly the figures
/// this exists to produce. The response is short enough that one FFT per band
/// is nothing.
///
/// The direct sound index is preserved, so [ImpulseResponse.rt60],
/// [ImpulseResponse.clarityDb] and the rest work on the result unchanged.
ImpulseResponse bandLimit(
  ImpulseResponse ir, {
  required double centerHz,
  double octaves = 1,
}) {
  final n = _powerOfTwoAbove(ir.samples.length);
  final padded = Float64List(n)..setRange(0, ir.samples.length, ir.samples);
  final fft = FFT(n);
  final spec = fft.realFft(padded);

  final lower = centerHz / math.pow(2, octaves / 2);
  final upper = centerHz * math.pow(2, octaves / 2);
  // Edge width: a sixth of an octave either side, in log frequency.
  const edgeOctaves = 1 / 6;
  final binHz = ir.sampleRate / n;

  for (var k = 0; k < spec.length; k++) {
    final f = k * binHz;
    double w;
    if (f <= 0) {
      w = 0;
    } else {
      final logF = math.log(f) / math.ln2;
      final logLo = math.log(lower) / math.ln2;
      final logHi = math.log(upper) / math.ln2;
      if (logF < logLo - edgeOctaves || logF > logHi + edgeOctaves) {
        w = 0;
      } else if (logF < logLo) {
        w = 0.5 * (1 + math.cos(math.pi * (logLo - logF) / edgeOctaves));
      } else if (logF > logHi) {
        w = 0.5 * (1 + math.cos(math.pi * (logF - logHi) / edgeOctaves));
      } else {
        w = 1;
      }
    }
    spec[k] = Float64x2(spec[k].x * w, spec[k].y * w);
  }

  final back = fft.realInverseFft(spec);
  return ImpulseResponse(
    samples: Float64List.fromList(back.sublist(0, ir.samples.length)),
    sampleRate: ir.sampleRate,
  );
}

int _powerOfTwoAbove(int n) {
  var p = 1;
  while (p < n) {
    p *= 2;
  }
  return p;
}

/// The reverberation figures of one octave band.
class BandDecay {
  const BandDecay({
    required this.centerHz,
    this.edt,
    this.t20,
    this.t30,
    this.c50Db,
    this.c80Db,
  });

  final double centerHz;
  final Duration? edt;
  final Duration? t20;
  final Duration? t30;
  final double? c50Db;
  final double? c80Db;
}

/// EDT, T20, T30, C50 and C80 per octave band.
///
/// Each null is a band whose decay never got far enough above the noise
/// floor to be read — the normal case at 63 Hz on a phone, and a real answer
/// rather than a failure.
List<BandDecay> decayPerBand(ImpulseResponse ir,
    {List<double> centers = octaveBandCenters}) {
  return [
    for (final c in centers)
      () {
        final band = bandLimit(ir, centerHz: c);
        return BandDecay(
          centerHz: c,
          edt: band.rt60(decayDb: 10, startDb: 0),
          t20: band.rt60(decayDb: 20),
          t30: band.rt60(decayDb: 30),
          c50Db: band.clarityDb(const Duration(milliseconds: 50)),
          c80Db: band.clarityDb(const Duration(milliseconds: 80)),
        );
      }(),
  ];
}

/// Mean T20 over the mid bands, the figure the Schroeder frequency should be
/// computed from.
///
/// 125–500 Hz is where the room's damping is, and what the modal predictions
/// in the design report depend on. The broadband number is dominated by the
/// treble decay, which is short and says nothing about the modes.
double? midBandRt60(List<BandDecay> bands) {
  var sum = 0.0;
  var n = 0;
  for (final b in bands) {
    if (b.centerHz < 125 || b.centerHz > 500) continue;
    final t = b.t20 ?? b.t30;
    if (t == null) continue;
    sum += t.inMicroseconds / 1e6;
    n++;
  }
  return n == 0 ? null : sum / n;
}
