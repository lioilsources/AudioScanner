import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../dsp/graphic_eq.dart';
import '../../export/avr_config.dart';
import '../../model/measurement.dart';
import 'response_chart.dart';

/// Measured, target and predicted-after-EQ for one channel, plus the
/// verification measurement when there is one.
///
/// The prediction is measured + the modelled filter. It is honest about two
/// things: the receiver's real filter shape is unknown (so the verification
/// curve exists), and a null the EQ was not allowed to chase stays a null in
/// the prediction rather than being drawn as fixed.
class EqPreview extends StatelessWidget {
  const EqPreview({
    super.key,
    required this.label,
    required this.eq,
    this.verification,
    this.maxEqHz = 300,
  });

  final String label;
  final EqPreset eq;

  /// The after-EQ measurement for this channel, if taken.
  final Measurement? verification;
  final double maxEqHz;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final centers = eq.basisCenters;
    if (centers.isEmpty) return const SizedBox.shrink();

    final filter = graphicEqResponseDb(centers, eq.bands, eq.gainsDb);
    final predicted = [
      for (var i = 0; i < centers.length; i++) eq.basisDb[i] + filter[i]
    ];
    final before = deviationFromTargetDb(centers, eq.basisDb, eq.targetDb,
        high: maxEqHz);
    final after = deviationFromTargetDb(centers, predicted, eq.targetDb,
        high: maxEqHz);

    List<double>? verified;
    double? verifiedDeviation;
    double? predictionError;
    final v = verification;
    if (v != null && v.bandsDb.length == centers.length) {
      // Anchor the verification the same way generateEq anchored the basis:
      // at 1 kHz, so overall level (which the trim handles) drops out.
      final khz = centers.indexWhere((c) => c == 1000);
      final anchor = khz < 0 ? 0.0 : v.bandsDb[khz];
      verified = [for (final b in v.bandsDb) b - anchor];
      verifiedDeviation =
          deviationFromTargetDb(centers, verified, eq.targetDb, high: maxEqHz);
      predictionError = deviationFromTargetDb(centers, verified, predicted,
          high: maxEqHz);
    }

    final stubborn = <String>[];
    for (var i = 0; i < centers.length; i++) {
      if (centers[i] > maxEqHz || centers[i] < 40) continue;
      if ((predicted[i] - eq.targetDb[i]).abs() > 6) {
        stubborn.add('${_hz(centers[i])} (${(predicted[i] - eq.targetDb[i]).toStringAsFixed(0)} dB)');
      }
    }

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: t.textTheme.titleSmall),
            const SizedBox(height: 8),
            SizedBox(
              height: 200,
              child: ResponseChart(
                curves: [
                  ResponseCurve(
                    frequencies: centers,
                    levelsDb: eq.basisDb,
                    label: 'změřeno',
                    color: t.colorScheme.onSurfaceVariant.withValues(alpha: 0.7),
                    strokeWidth: 1.5,
                  ),
                  ResponseCurve(
                    frequencies: centers,
                    levelsDb: eq.targetDb,
                    label: 'cíl',
                    color: t.colorScheme.tertiary,
                    strokeWidth: 1.5,
                  ),
                  ResponseCurve(
                    frequencies: centers,
                    levelsDb: predicted,
                    label: 'předpověď po EQ',
                    color: t.colorScheme.primary,
                  ),
                  if (verified != null)
                    ResponseCurve(
                      frequencies: centers,
                      levelsDb: verified,
                      label: 'změřeno po EQ',
                      color: t.colorScheme.error,
                    ),
                ],
                centerDb: 0,
                spanDb: 40,
                maxHz: 4000,
              ),
            ),
            const SizedBox(height: 8),
            _line(t, 'Odchylka od cíle 40–${maxEqHz.round()} Hz',
                '${before.toStringAsFixed(1)} → ${after.toStringAsFixed(1)} dB'),
            if (verifiedDeviation != null)
              _line(t, 'Po zadání do přijímače',
                  '${verifiedDeviation.toStringAsFixed(1)} dB'),
            if (predictionError != null)
              _line(t, 'Předpověď vs. skutečnost',
                  '${predictionError.toStringAsFixed(1)} dB'),
            if (stubborn.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Zůstane dál od cíle než 6 dB: ${stubborn.join(', ')}. To je '
                  'interference, ne nedostatek výkonu — řeší se posunem repro '
                  'nebo posluchače, ne dalším zdvihem.',
                  style: t.textTheme.bodySmall,
                ),
              ),
            if (predictionError != null)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  predictionError <= 2
                      ? 'Filtr přijímače se chová zhruba jako model.'
                      : 'Skutečný filtr přijímače se od modelu liší o víc, než '
                          'se čekalo — jeho pásma jsou nejspíš širší nebo užší, '
                          'než se tu předpokládá.',
                  style: t.textTheme.bodySmall,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _line(ThemeData t, String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: t.textTheme.bodySmall),
            Text(value,
                style: t.textTheme.bodyMedium
                    ?.copyWith(color: t.colorScheme.primary)),
          ],
        ),
      );

  static String _hz(double hz) =>
      hz >= 1000 ? '${(hz / 1000).toStringAsFixed(1)} kHz' : '${hz.round()} Hz';
}

/// Sliders for the four numbers of a [TargetCurve], with a live preview.
class TargetCurveEditor extends StatelessWidget {
  const TargetCurveEditor({
    super.key,
    required this.target,
    required this.onChanged,
  });

  final TargetCurve target;
  final ValueChanged<TargetCurve> onChanged;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    final freqs = [for (var i = 0; i <= 200; i++) 20 * math.pow(2, i / 20).toDouble()];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cílová křivka', style: t.textTheme.titleMedium),
                Row(
                  children: [
                    Text('plochá', style: t.textTheme.bodySmall),
                    Switch(
                      value: target.isFlat,
                      onChanged: (flat) => onChanged(flat
                          ? TargetCurve.flat
                          : const TargetCurve()),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              'Ne rovná: nad pár kHz ucho slyší přímý zvuk, mikrofon sčítá i '
              'odrazy, a srovnaná měřená křivka zní tupě. Mírný sklon nahoře '
              'a trocha basu dole je to, co lidé v slepém poslechu volí.',
              style: t.textTheme.bodySmall,
            ),
            SizedBox(
              height: 120,
              child: ResponseChart(
                curves: [
                  ResponseCurve(
                    frequencies: freqs,
                    levelsDb: [for (final f in freqs) target.levelAt(f)],
                    label: 'cíl',
                    color: t.colorScheme.tertiary,
                  ),
                ],
                centerDb: 0,
                spanDb: 20,
                showLegend: false,
              ),
            ),
            _slider(t, 'Zdvih basů', target.bassLiftDb, 0, 8, 'dB',
                (v) => onChanged(target.copyWith(bassLiftDb: v)), 1),
            _slider(t, 'Basy pod', target.bassLiftBelowHz, 40, 160, 'Hz',
                (v) => onChanged(target.copyWith(bassLiftBelowHz: v)), 0),
            _slider(t, 'Sklon', target.tiltDbPerOctave, -2, 0, 'dB/okt',
                (v) => onChanged(target.copyWith(tiltDbPerOctave: v)), 1),
            _slider(t, 'Sklon od', target.tiltAboveHz, 500, 4000, 'Hz',
                (v) => onChanged(target.copyWith(tiltAboveHz: v)), 0),
          ],
        ),
      ),
    );
  }

  Widget _slider(ThemeData t, String label, double value, double min,
          double max, String unit, ValueChanged<double> onChanged, int decimals) =>
      Row(
        children: [
          SizedBox(width: 84, child: Text(label, style: t.textTheme.bodySmall)),
          Expanded(
            child: Slider(
              value: value.clamp(min, max),
              min: min,
              max: max,
              onChanged: (v) =>
                  onChanged(double.parse(v.toStringAsFixed(decimals))),
            ),
          ),
          SizedBox(
            width: 72,
            child: Text('${value.toStringAsFixed(decimals)} $unit',
                textAlign: TextAlign.end, style: t.textTheme.bodySmall),
          ),
        ],
      );
}
