import 'dart:math' as math;

import '../dsp/octave_bands.dart';
import '../model/measurement.dart';
import '../model/session.dart';

/// FRD export — the plain "frequency, magnitude, phase" text file that REW,
/// VituixCAD and everything else in the speaker world reads.
///
/// Phase is written as 0 throughout for band data. That is not a placeholder to
/// be filled in later: a 1/3-octave magnitude average has no phase to report,
/// and writing an invented one would let VituixCAD build a crossover on it.
/// Only [fromImpulseResponse] carries real phase.
class FrdExport {
  const FrdExport._();

  static String fromMeasurement(
    Measurement point, {
    Session? session,
    double offsetDb = 0,
  }) {
    final b = StringBuffer();
    _header(b, session: session, point: point);
    b.writeln('* Uncalibrated phone microphone — levels are RELATIVE (dBFS).');
    b.writeln('* 1/3-octave band magnitudes; phase column is zero by design.');
    b.writeln('*');
    b.writeln('* Freq(Hz)  SPL(dB)  Phase(deg)');
    for (var i = 0; i < OctaveBands.all.length; i++) {
      final band = OctaveBands.all[i];
      final level = point.bandsDb[i] + offsetDb;
      b.writeln('${_num(band.nominal, 2)}  ${_num(level, 3)}  0.000');
    }
    return b.toString();
  }

  /// Full-resolution export from a gated impulse response, with phase.
  ///
  /// [validAbove] is written into the header because a gated response is
  /// meaningless below it, and an FRD file that does not say so will be
  /// happily imported and trusted all the way down to 20 Hz.
  static String fromImpulseResponse({
    required List<double> frequencies,
    required List<double> magnitudesDb,
    required List<double> phasesDeg,
    Session? session,
    Measurement? point,
    double validAbove = 0,
    double maxFrequency = 20000,
  }) {
    final b = StringBuffer();
    _header(b, session: session, point: point);
    if (validAbove > 0) {
      b.writeln('* Gated response — valid only above '
          '${validAbove.toStringAsFixed(0)} Hz. Below that the gate, not the '
          'room, sets the curve.');
    }
    b.writeln('*');
    b.writeln('* Freq(Hz)  SPL(dB)  Phase(deg)');
    for (var i = 0; i < frequencies.length; i++) {
      if (frequencies[i] <= 0 || frequencies[i] > maxFrequency) continue;
      b.writeln('${_num(frequencies[i], 3)}  ${_num(magnitudesDb[i], 3)}  '
          '${_num(phasesDeg[i], 3)}');
    }
    return b.toString();
  }

  static void _header(StringBuffer b, {Session? session, Measurement? point}) {
    b.writeln('* AudioScanner FRD export');
    if (session != null) {
      b.writeln('* Session: ${session.name}  (${session.signal.label})');
    }
    if (point != null) {
      b.writeln('* Point: ${point.id} at ${point.position} m from origin');
      b.writeln('* Taken: ${point.timestamp.toIso8601String()}');
    }
  }

  static String _num(double v, int decimals) {
    if (v.isNaN || v.isInfinite) return (0.0).toStringAsFixed(decimals);
    return v.toStringAsFixed(decimals);
  }

  /// Unwrapped phase in degrees from a complex spectrum's real/imaginary parts.
  static List<double> phaseDegrees(List<double> re, List<double> im) {
    final out = <double>[];
    var offset = 0.0;
    double? previous;
    for (var i = 0; i < re.length; i++) {
      var p = math.atan2(im[i], re[i]) * 180 / math.pi;
      if (previous != null) {
        final d = p + offset - previous;
        if (d > 180) {
          offset -= 360;
        } else if (d < -180) {
          offset += 360;
        }
      }
      p += offset;
      previous = p;
      out.add(p);
    }
    return out;
  }
}
