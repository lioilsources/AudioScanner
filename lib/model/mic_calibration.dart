import 'dart:math' as math;

/// A microphone's own frequency response, as a calibration file describes it.
///
/// The format is the one miniDSP ships with a UMIK and REW writes: one
/// "frequency  dB" pair per line, whitespace or comma separated, with comment
/// lines starting with `*`, `#` or `;` and, on a UMIK file, a first line in
/// quotes carrying the sensitivity. A third column (phase) is ignored.
///
/// The value is what the microphone *adds*, so the correction is to subtract
/// it. Applied at display and export time, never to stored data: a session
/// file must stay what the phone heard, with the calibration alongside it,
/// or a corrected session re-corrected later would be wrong twice.
class MicCalibration {
  MicCalibration({required this.name, required List<(double, double)> points})
      : points = List.unmodifiable(points..sort((a, b) => a.$1.compareTo(b.$1))) {
    if (this.points.length < 2) {
      throw const FormatException('a calibration needs at least two points');
    }
  }

  final String name;

  /// (Hz, dB) ascending in frequency.
  final List<(double, double)> points;

  static MicCalibration parse(String text, {String name = 'kalibrace'}) {
    final pts = <(double, double)>[];
    for (final raw in text.split(RegExp(r'\r?\n'))) {
      final line = raw.trim();
      if (line.isEmpty) continue;
      if (line.startsWith('*') ||
          line.startsWith('#') ||
          line.startsWith(';') ||
          line.startsWith('"')) {
        continue;
      }
      final parts = line.split(RegExp(r'[\s,]+'));
      if (parts.length < 2) continue;
      final f = double.tryParse(parts[0]);
      final db = double.tryParse(parts[1]);
      if (f == null || db == null || f <= 0) continue;
      pts.add((f, db));
    }
    if (pts.length < 2) {
      throw const FormatException(
          'no "frequency dB" rows found — is this a calibration file?');
    }
    return MicCalibration(name: name, points: pts);
  }

  /// The microphone's deviation at [hz], interpolated on a log frequency
  /// axis and held constant beyond the first and last points.
  double responseAt(double hz) {
    if (hz <= points.first.$1) return points.first.$2;
    if (hz >= points.last.$1) return points.last.$2;
    var lo = 0, hi = points.length - 1;
    while (hi - lo > 1) {
      final mid = (lo + hi) ~/ 2;
      if (points[mid].$1 <= hz) {
        lo = mid;
      } else {
        hi = mid;
      }
    }
    final (f0, d0) = points[lo];
    final (f1, d1) = points[hi];
    final t = math.log(hz / f0) / math.log(f1 / f0);
    return d0 + (d1 - d0) * t;
  }

  /// What to add to a measured level at [hz] to undo the microphone.
  double correctionAt(double hz) => -responseAt(hz);

  double get minDb => points.map((p) => p.$2).reduce(math.min);
  double get maxDb => points.map((p) => p.$2).reduce(math.max);

  Map<String, dynamic> toJson() => {
        'name': name,
        'points': [
          for (final (f, db) in points) [f, db]
        ],
      };

  factory MicCalibration.fromJson(Map<String, dynamic> j) => MicCalibration(
        name: j['name'] as String? ?? 'kalibrace',
        points: [
          for (final p in j['points'] as List)
            ((p as List)[0] as num).toDouble()
                .let((f) => (f, (p[1] as num).toDouble()))
        ],
      );
}

extension<T> on T {
  R let<R>(R Function(T) f) => f(this);
}
