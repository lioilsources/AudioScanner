import 'dart:math' as math;

import 'room_geometry.dart';

/// Speed of sound at 20 °C, m/s. Every distance-to-frequency conversion in the
/// app goes through this one constant.
const double speedOfSound = 343.0;

enum ModeType {
  /// Between one opposing pair of surfaces. The strongest by far — these are
  /// the ones that boom.
  axial,

  /// Involves four surfaces; roughly 3 dB weaker than axial.
  tangential,

  /// All six; weaker again, and rarely worth chasing.
  oblique,
}

extension ModeTypeLabel on ModeType {
  String get label => switch (this) {
        ModeType.axial => 'axiální',
        ModeType.tangential => 'tangenciální',
        ModeType.oblique => 'šikmý',
      };
}

/// One standing wave of a rigid shoebox.
class RoomMode {
  const RoomMode(this.nx, this.ny, this.nz, this.frequency);

  final int nx;
  final int ny;
  final int nz;
  final double frequency;

  ModeType get type => switch ([nx, ny, nz].where((n) => n > 0).length) {
        1 => ModeType.axial,
        2 => ModeType.tangential,
        _ => ModeType.oblique,
      };

  /// Which axis an axial mode runs along, for the "it is the length" sentence.
  String? get axis {
    if (type != ModeType.axial) return null;
    if (nx > 0) return 'délka';
    if (ny > 0) return 'šířka';
    return 'výška';
  }

  @override
  String toString() =>
      '($nx,$ny,$nz) ${frequency.toStringAsFixed(1)} Hz ${type.label}';
}

/// Every mode of the room below [maxHz], lowest first.
List<RoomMode> modesBelow(RoomGeometry room, {double maxHz = 200}) {
  final out = <RoomMode>[];
  int limit(double dimension) =>
      (2 * maxHz * dimension / speedOfSound).floor() + 1;

  for (var nx = 0; nx <= limit(room.length); nx++) {
    for (var ny = 0; ny <= limit(room.width); ny++) {
      for (var nz = 0; nz <= limit(room.height); nz++) {
        if (nx == 0 && ny == 0 && nz == 0) continue;
        final f = speedOfSound /
            2 *
            math.sqrt(math.pow(nx / room.length, 2) +
                math.pow(ny / room.width, 2) +
                math.pow(nz / room.height, 2));
        if (f <= maxHz) out.add(RoomMode(nx, ny, nz, f));
      }
    }
  }
  out.sort((a, b) => a.frequency.compareTo(b.frequency));
  return out;
}

/// Modal summation: the pressure response at [receiver] from a source at
/// [source], over [frequencies].
///
/// This is the piece that makes the whole feature more than a rule of thumb. It
/// is the standard Green's-function sum over the room's eigenmodes (Kuttruff,
/// *Room Acoustics*, ch. 3):
///
///     p(r) ∝ Σₙ  ψₙ(r₀)·ψₙ(r) / (Λₙ · [k² − kₙ² + 2j·kₙ·δ/c])
///
/// with ψₙ the cosine eigenfunctions of a rigid box and δ = 3·ln10/RT60 the
/// damping that a measured reverberation time implies. Damping is not a detail:
/// undamped, every mode is an infinitely sharp spike and the predicted curve is
/// a comb of ±40 dB nonsense.
///
/// Returns dB relative to the loudest frequency in the set, because absolute
/// level from this model means nothing — the question is always "how flat", not
/// "how loud".
List<double> modalResponseDb(
  RoomGeometry room, {
  required RoomPoint source,
  required RoomPoint receiver,
  required List<double> frequencies,
  List<RoomMode>? modes,
}) {
  final ms = modes ?? modesBelow(room, maxHz: 300);
  // Amplitude decays as e^(−δt); 60 dB of level is 3·ln10 time constants.
  final delta = 3 * math.ln10 / math.max(room.rt60, 0.05);

  double eigen(RoomMode m, RoomPoint p) =>
      math.cos(m.nx * math.pi * p.x / room.length) *
      math.cos(m.ny * math.pi * p.y / room.width) *
      math.cos(m.nz * math.pi * p.z / room.height);

  // Λₙ: the eigenfunction norm. Halved for each axis the mode actually varies
  // along; leaving it out over-weights the oblique modes.
  double norm(RoomMode m) {
    var v = room.volume;
    if (m.nx > 0) v /= 2;
    if (m.ny > 0) v /= 2;
    if (m.nz > 0) v /= 2;
    return v;
  }

  final raw = <double>[];
  for (final f in frequencies) {
    final k = 2 * math.pi * f / speedOfSound;
    var re = 0.0, im = 0.0;
    for (final m in ms) {
      final kn = 2 * math.pi * m.frequency / speedOfSound;
      final numerator = eigen(m, source) * eigen(m, receiver) / norm(m);
      final dRe = k * k - kn * kn;
      final dIm = 2 * kn * delta / speedOfSound;
      final denom = dRe * dRe + dIm * dIm;
      if (denom == 0) continue;
      re += numerator * dRe / denom;
      im -= numerator * dIm / denom;
    }
    raw.add(math.sqrt(re * re + im * im));
  }

  final peak = raw.fold(0.0, math.max);
  if (peak <= 0) return List<double>.filled(frequencies.length, -60);
  return [
    for (final v in raw)
      v <= 0 ? -60.0 : math.max(-60, 20 * math.log(v / peak) / math.ln10),
  ];
}

/// Log-spaced frequencies for evaluating a bass response.
List<double> bassFrequencies({double from = 20, double to = 200, int points = 90}) {
  final out = <double>[];
  for (var i = 0; i < points; i++) {
    out.add(from * math.pow(to / from, i / (points - 1)));
  }
  return out;
}

/// Flatness of a response, as its standard deviation in dB.
///
/// The number the placement search minimises. Deviation, not average level:
/// a seat that is uniformly quiet is fixable with the volume knob, a seat with
/// a 15 dB hole at 45 Hz is not fixable at all.
double flatnessDb(List<double> responseDb) {
  if (responseDb.isEmpty) return 0;
  final mean = responseDb.reduce((a, b) => a + b) / responseDb.length;
  final variance =
      responseDb.map((v) => math.pow(v - mean, 2)).reduce((a, b) => a + b) /
          responseDb.length;
  return math.sqrt(variance);
}
