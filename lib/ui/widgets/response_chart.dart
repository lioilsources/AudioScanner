import 'dart:math' as math;

import 'package:flutter/material.dart';

/// One curve for [ResponseChart].
class ResponseCurve {
  const ResponseCurve({
    required this.frequencies,
    required this.levelsDb,
    required this.label,
    required this.color,
    this.strokeWidth = 2,
  });

  final List<double> frequencies;
  final List<double> levelsDb;
  final String label;
  final Color color;
  final double strokeWidth;
}

/// Magnitude versus frequency, log axis, several curves on one grid.
///
/// One widget for every place a response is drawn — the impulse screen, the
/// L/R comparison, the EQ preview — so that "measured", "target" and
/// "predicted" always share the same axes and can be read against each other.
///
/// The vertical range is centred on the median of the curves rather than
/// fixed, because levels here are dBFS relative to an uncalibrated chain and
/// the absolute number is arbitrary; the shape is what matters.
///
/// [validAbove] shades the region the data cannot speak for. A gated response
/// is an artefact of the window below that frequency, and the shading says so
/// instead of letting a confident-looking curve run all the way to 20 Hz.
class ResponseChart extends StatelessWidget {
  const ResponseChart({
    super.key,
    required this.curves,
    this.validAbove,
    this.minHz = 20,
    this.maxHz = 20000,
    this.spanDb = 60,
    this.centerDb,
    this.showLegend = true,
  });

  final List<ResponseCurve> curves;
  final double? validAbove;
  final double minHz;
  final double maxHz;

  /// Total height of the dB axis.
  final double spanDb;

  /// Fixed centre of the dB axis; when null, the median of the curves.
  final double? centerDb;
  final bool showLegend;

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: CustomPaint(
            painter: _ResponsePainter(
              curves: curves,
              validAbove: validAbove,
              minHz: minHz,
              maxHz: maxHz,
              spanDb: spanDb,
              centerDb: centerDb,
              scheme: t.colorScheme,
            ),
            child: const SizedBox.expand(),
          ),
        ),
        if (showLegend && curves.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Wrap(
              spacing: 12,
              runSpacing: 2,
              children: [
                for (final c in curves)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(width: 14, height: 3, color: c.color),
                      const SizedBox(width: 4),
                      Text(c.label, style: t.textTheme.bodySmall),
                    ],
                  ),
              ],
            ),
          ),
      ],
    );
  }
}

class _ResponsePainter extends CustomPainter {
  _ResponsePainter({
    required this.curves,
    required this.validAbove,
    required this.minHz,
    required this.maxHz,
    required this.spanDb,
    required this.centerDb,
    required this.scheme,
  });

  final List<ResponseCurve> curves;
  final double? validAbove;
  final double minHz;
  final double maxHz;
  final double spanDb;
  final double? centerDb;
  final ColorScheme scheme;

  static const _leftMargin = 34.0;
  static const _bottomMargin = 16.0;
  static const List<double> _labelledHz = [20.0, 50, 100, 200, 500, 1000, 2000, 5000, 10000, 20000];
  static const List<double> _gridHz = [
    20.0, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600, 700, 800,
    900, 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000, 9000, 10000, 20000,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final plotW = math.max(1.0, size.width - _leftMargin);
    final plotH = math.max(1.0, size.height - _bottomMargin);
    final logMin = math.log(minHz);
    final logMax = math.log(maxHz);

    double xFor(double hz) =>
        _leftMargin + (math.log(hz) - logMin) / (logMax - logMin) * plotW;

    final center = centerDb ?? _median();
    final double top = (center / 10).round() * 10 + spanDb / 2;
    final double bottom = top - spanDb;
    double yFor(double db) => (top - db) / spanDb * plotH;

    // Region the data cannot speak for.
    final valid = validAbove;
    if (valid != null && valid > minHz) {
      final x = xFor(math.min(valid, maxHz));
      canvas.drawRect(
        Rect.fromLTRB(_leftMargin, 0, x, plotH),
        Paint()..color = scheme.errorContainer.withValues(alpha: 0.35),
      );
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, plotH),
        Paint()
          ..color = scheme.error
          ..strokeWidth = 1,
      );
    }

    final grid = Paint()
      ..color = scheme.outlineVariant.withValues(alpha: 0.5)
      ..strokeWidth = 1;
    final labelStyle = TextStyle(fontSize: 10, color: scheme.onSurfaceVariant);

    for (final hz in _gridHz) {
      if (hz < minHz || hz > maxHz) continue;
      final x = xFor(hz);
      canvas.drawLine(Offset(x, 0), Offset(x, plotH), grid);
      if (_labelledHz.contains(hz)) {
        final tp = TextPainter(
          text: TextSpan(text: _hzLabel(hz), style: labelStyle),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(canvas, Offset(x - tp.width / 2, plotH + 2));
      }
    }
    for (var db = bottom; db <= top + 0.01; db += 10) {
      final y = yFor(db);
      canvas.drawLine(Offset(_leftMargin, y), Offset(size.width, y), grid);
      final tp = TextPainter(
        text: TextSpan(text: db.round().toString(), style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(_leftMargin - tp.width - 4, y - tp.height / 2));
    }

    canvas.save();
    canvas.clipRect(Rect.fromLTWH(_leftMargin, 0, plotW, plotH));
    for (final c in curves) {
      final paint = Paint()
        ..color = c.color
        ..style = PaintingStyle.stroke
        ..strokeWidth = c.strokeWidth
        ..strokeJoin = StrokeJoin.round;
      final path = Path();
      var started = false;
      // One vertex per pixel column at most: a 64k-bin response drawn as
      // 64k segments is slow and, at phone width, invisible anyway.
      var lastPx = -1;
      var sum = 0.0;
      var count = 0;
      for (var i = 0; i < c.frequencies.length; i++) {
        final hz = c.frequencies[i];
        if (hz < minHz || hz > maxHz) continue;
        final db = c.levelsDb[i];
        if (!db.isFinite) continue;
        final px = xFor(hz).round();
        if (px != lastPx && count > 0) {
          final y = yFor(sum / count);
          if (!started) {
            path.moveTo(lastPx.toDouble(), y);
            started = true;
          } else {
            path.lineTo(lastPx.toDouble(), y);
          }
          sum = 0;
          count = 0;
        }
        lastPx = px;
        sum += db;
        count++;
      }
      if (count > 0) {
        final y = yFor(sum / count);
        if (!started) {
          path.moveTo(lastPx.toDouble(), y);
        } else {
          path.lineTo(lastPx.toDouble(), y);
        }
      }
      canvas.drawPath(path, paint);
    }
    canvas.restore();
  }

  /// Median level across every curve inside the plotted range.
  double _median() {
    final values = <double>[];
    for (final c in curves) {
      // Subsample: the median of every 16th bin is the same median.
      for (var i = 0; i < c.frequencies.length; i += 16) {
        final hz = c.frequencies[i];
        if (hz < math.max(minHz, 40) || hz > math.min(maxHz, 10000)) continue;
        final db = c.levelsDb[i];
        if (db.isFinite && db > -150) values.add(db);
      }
    }
    if (values.isEmpty) return 0;
    values.sort();
    return values[values.length ~/ 2];
  }

  static String _hzLabel(double hz) =>
      hz >= 1000 ? '${(hz / 1000).round()}k' : hz.round().toString();

  @override
  bool shouldRepaint(_ResponsePainter old) =>
      old.curves != curves ||
      old.validAbove != validAbove ||
      old.spanDb != spanDb ||
      old.centerDb != centerDb;
}
