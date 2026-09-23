import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../dsp/octave_bands.dart';

/// 1/3-octave bar display.
///
/// Bars, not a line: the data *is* 31 discrete bands, and drawing a smooth
/// curve through them would suggest a resolution the analysis does not have.
///
/// [reference] draws a second, hollow set of bars — the point every other
/// reading is compared against. Seeing "here versus the listening seat" is the
/// entire job of this screen.
class SpectrumBars extends StatelessWidget {
  const SpectrumBars({
    super.key,
    required this.bandsDb,
    this.reference,
    this.minDb = -90,
    this.maxDb = -10,
    this.highlight,
  });

  final List<double> bandsDb;
  final List<double>? reference;
  final double minDb;
  final double maxDb;

  /// Band index to mark, e.g. the one the heatmap slider is on.
  final int? highlight;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BarsPainter(
        bandsDb: bandsDb,
        reference: reference,
        minDb: minDb,
        maxDb: maxDb,
        highlight: highlight,
        scheme: Theme.of(context).colorScheme,
      ),
      child: const SizedBox.expand(),
    );
  }
}

class _BarsPainter extends CustomPainter {
  _BarsPainter({
    required this.bandsDb,
    required this.reference,
    required this.minDb,
    required this.maxDb,
    required this.highlight,
    required this.scheme,
  });

  final List<double> bandsDb;
  final List<double>? reference;
  final double minDb;
  final double maxDb;
  final int? highlight;
  final ColorScheme scheme;

  /// Decade-ish landmarks only — labelling all 31 bands turns the axis into a
  /// grey smear on a phone.
  static final _labelled = <double>{31.5, 125, 500, 2000, 8000};

  @override
  void paint(Canvas canvas, Size size) {
    if (bandsDb.isEmpty) return;

    const labelHeight = 18.0;
    final plotHeight = math.max(1.0, size.height - labelHeight);
    final n = bandsDb.length;
    final slot = size.width / n;
    final barWidth = math.max(1.0, slot * 0.72);

    double yFor(double db) {
      final t = ((db - minDb) / (maxDb - minDb)).clamp(0.0, 1.0);
      return plotHeight - t * plotHeight;
    }

    // Grid every 10 dB — enough to read a level off, sparse enough to stay out
    // of the way of the bars.
    final grid = Paint()
      ..color = scheme.outlineVariant.withValues(alpha: 0.4)
      ..strokeWidth = 1;
    for (var db = (minDb / 10).ceil() * 10; db <= maxDb; db += 10) {
      final y = yFor(db.toDouble());
      canvas.drawLine(Offset(0, y), Offset(size.width, y), grid);
    }

    final bar = Paint()..color = scheme.primary;
    final refPaint = Paint()
      ..color = scheme.onSurfaceVariant.withValues(alpha: 0.75)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    for (var i = 0; i < n; i++) {
      final x = i * slot + (slot - barWidth) / 2;
      final top = yFor(bandsDb[i]);
      bar.color = i == highlight ? scheme.tertiary : scheme.primary;
      canvas.drawRect(Rect.fromLTRB(x, top, x + barWidth, plotHeight), bar);

      final ref = reference;
      if (ref != null && i < ref.length) {
        final ry = yFor(ref[i]);
        canvas.drawRect(Rect.fromLTRB(x, ry, x + barWidth, plotHeight), refPaint);
      }
    }

    for (var i = 0; i < n && i < OctaveBands.all.length; i++) {
      final band = OctaveBands.all[i];
      if (!_labelled.contains(band.nominal)) continue;
      final tp = TextPainter(
        text: TextSpan(
          text: band.label,
          style: TextStyle(fontSize: 10, color: scheme.onSurfaceVariant),
        ),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(i * slot + (slot - tp.width) / 2, plotHeight + 3));
    }
  }

  @override
  bool shouldRepaint(_BarsPainter old) =>
      old.bandsDb != bandsDb ||
      old.reference != reference ||
      old.highlight != highlight ||
      old.minDb != minDb ||
      old.maxDb != maxDb;
}
