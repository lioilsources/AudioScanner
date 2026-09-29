import '../dsp/band_filter.dart';
import '../dsp/impulse_response.dart';

/// Per-band decay figures of one response, computed once.
///
/// Eight band-pass FFT pairs over a long recording take a noticeable moment
/// in Dart; this is keyed on the response's identity so screens can ask for
/// it freely. The response is cut to [tailWindow] after the direct sound
/// first — nothing a domestic room does lasts longer, and a ten-second
/// recording would otherwise mean million-point transforms for a decay that
/// ended two seconds in.
class DecayAnalysis {
  DecayAnalysis._(this.source, this.bands);

  static const tailWindow = Duration(seconds: 3);

  factory DecayAnalysis.of(ImpulseResponse ir) {
    final cut = ir.gated(
      window: tailWindow,
      preRoll: const Duration(milliseconds: 2),
    );
    return DecayAnalysis._(ir, decayPerBand(cut));
  }

  final ImpulseResponse source;
  final List<BandDecay> bands;

  double? get midBandRt60Seconds => midBandRt60(bands);

  bool matches(ImpulseResponse ir) => identical(ir, source);
}
