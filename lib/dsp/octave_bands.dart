import 'dart:math' as math;

/// One 1/3-octave band per ISO 266.
///
/// [nominal] is the label people read (31.5, 63, 1000 …); [center] is the exact
/// base-ten midband frequency the edges are derived from. They differ by up to
/// ~1 %, and mixing them up shifts every band edge, so both are kept explicit.
class OctaveBand {
  const OctaveBand({
    required this.index,
    required this.nominal,
    required this.center,
    required this.lower,
    required this.upper,
  });

  /// Band number relative to the 1 kHz band, which is 0.
  final int index;
  final double nominal;
  final double center;
  final double lower;
  final double upper;

  String get label => nominal >= 1000
      ? '${(nominal / 1000).toStringAsFixed(nominal % 1000 == 0 ? 0 : 1)}k'
      : nominal.toStringAsFixed(nominal < 100 && nominal != nominal.roundToDouble() ? 1 : 0);

  @override
  String toString() => 'OctaveBand($label Hz)';
}

/// The 1/3-octave filter bank, 20 Hz – 20 kHz.
///
/// Exact midbands follow the base-ten system of ISO 266: f = 1000 · 10^(b/10),
/// with edges at f · 10^(±1/20). The nominal labels are the R10 preferred
/// numbers — these are what the UI shows and what FRD exports are keyed by.
class OctaveBands {
  OctaveBands._();

  /// Nominal (preferred) 1/3-octave centres, ISO 266 R10, band −17 … +13.
  static const List<double> nominals = [
    20, 25, 31.5, 40, 50, 63, 80, 100, 125, 160, //
    200, 250, 315, 400, 500, 630, 800, 1000, 1250, 1600,
    2000, 2500, 3150, 4000, 5000, 6300, 8000, 10000, 12500, 16000, 20000,
  ];

  static final List<OctaveBand> all = List.unmodifiable(
    List.generate(nominals.length, (i) {
      final b = i - 17; // nominals[17] is the 1 kHz band
      final center = 1000 * math.pow(10, b / 10).toDouble();
      return OctaveBand(
        index: b,
        nominal: nominals[i],
        center: center,
        lower: center * math.pow(10, -0.05).toDouble(),
        upper: center * math.pow(10, 0.05).toDouble(),
      );
    }),
  );

  static OctaveBand byNominal(double nominal) =>
      all.firstWhere((b) => b.nominal == nominal,
          orElse: () => throw ArgumentError('no 1/3-octave band at $nominal Hz'));

  /// Bands whose nominal centre falls within [low]…[high] Hz, inclusive.
  static List<OctaveBand> inRange(double low, double high) =>
      all.where((b) => b.nominal >= low && b.nominal <= high).toList();
}

/// Sums a linear power spectrum into 1/3-octave band levels, in dB.
///
/// [power] holds one value per FFT bin — squared magnitude, not magnitude, and
/// not yet in dB. [binHz] is the bin spacing (sampleRate / fftSize).
///
/// Bands narrower than a bin are the normal case at the bottom of the range: at
/// 48 kHz with an 8192-point FFT a bin is 5.86 Hz, while the 20 Hz band is only
/// 4.6 Hz wide. Such a band takes the single nearest bin rather than returning
/// silence, which is why low bands read as smeared rather than empty — an
/// honest limit of the transform, not of the room.
List<double> bandLevelsDb(
  List<double> power, {
  required double binHz,
  double floorDb = -160,
}) {
  final out = <double>[];
  for (final band in OctaveBands.all) {
    var lo = (band.lower / binHz).ceil();
    var hi = (band.upper / binHz).floor();
    if (hi < lo) {
      // Narrower than one bin — take the bin the centre lands in.
      lo = hi = (band.center / binHz).round();
    }
    if (lo < 0) lo = 0;
    if (hi >= power.length) hi = power.length - 1;

    var sum = 0.0;
    for (var k = lo; k <= hi; k++) {
      sum += power[k];
    }
    out.add(sum <= 0 ? floorDb : math.max(floorDb, 10 * math.log(sum) / math.ln10));
  }
  return out;
}
