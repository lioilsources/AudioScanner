import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../dsp/impulse_response.dart';

/// The impulse response against time, or its energy-time curve.
///
/// Time zero is the direct sound. The gate is drawn as a shaded band so the
/// choice of window can be checked against what it actually keeps and what it
/// throws away; the first reflection, when found, is marked.
class TimeChart extends StatelessWidget {
  const TimeChart({
    super.key,
    required this.ir,
    required this.gate,
    this.etc = true,
    this.spanMs = 200,
    this.preMs = 2,
  });

  final ImpulseResponse ir;
  final Duration gate;
  final bool etc;
  final double spanMs;
  final double preMs;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _TimePainter(
          ir: ir,
          gate: gate,
          etc: etc,
          spanMs: spanMs,
          preMs: preMs,
          scheme: Theme.of(context).colorScheme,
        ),
        child: const SizedBox.expand(),
      );
}

class _TimePainter extends CustomPainter {
  _TimePainter({
    required this.ir,
    required this.gate,
    required this.etc,
    required this.spanMs,
    required this.preMs,
    required this.scheme,
  });

  final ImpulseResponse ir;
  final Duration gate;
  final bool etc;
  final double spanMs;
  final double preMs;
  final ColorScheme scheme;

  static const _leftMargin = 30.0;
  static const _bottomMargin = 16.0;

  @override
  void paint(Canvas canvas, Size size) {
    final plotW = math.max(1.0, size.width - _leftMargin);
    final plotH = math.max(1.0, size.height - _bottomMargin);
    final direct = ir.directSoundIndex;
    final rate = ir.sampleRate;
    double xForMs(double ms) => _leftMargin + (ms + preMs) / (spanMs + preMs) * plotW;

    // Gate window.
    final gateMs = gate.inMicroseconds / 1000;
    canvas.drawRect(
      Rect.fromLTRB(xForMs(-0.5), 0, xForMs(math.min(gateMs - 0.5, spanMs)), plotH),
      Paint()..color = scheme.primaryContainer.withValues(alpha: 0.35),
    );

    final grid = Paint()
      ..color = scheme.outlineVariant.withValues(alpha: 0.5)
      ..strokeWidth = 1;
    final labelStyle = TextStyle(fontSize: 10, color: scheme.onSurfaceVariant);
    final stepMs = spanMs >= 100 ? 20.0 : spanMs >= 40 ? 5.0 : 1.0;
    for (var ms = 0.0; ms <= spanMs; ms += stepMs) {
      final x = xForMs(ms);
      canvas.drawLine(Offset(x, 0), Offset(x, plotH), grid);
      final tp = TextPainter(
        text: TextSpan(text: ms.round().toString(), style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(x - tp.width / 2, plotH + 2));
    }

    final path = Path();
    final line = Paint()
      ..color = scheme.primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;

    if (etc) {
      const floor = -80.0;
      double yForDb(double db) => (-db / -floor).clamp(0.0, 1.0) * plotH;
      for (var db = 0.0; db >= floor; db -= 20) {
        final y = yForDb(db);
        canvas.drawLine(Offset(_leftMargin, y), Offset(size.width, y), grid);
        final tp = TextPainter(
          text: TextSpan(text: db.round().toString(), style: labelStyle),
          textDirection: TextDirection.ltr,
        )..layout();
        tp.paint(canvas, Offset(_leftMargin - tp.width - 3, y - tp.height / 2));
      }
      const bin = Duration(microseconds: 100);
      final curve = ir.energyTimeCurveDb(binSize: bin);
      final binMs = 0.1;
      final startBin = math.max(0, ((direct / rate * 1000 - preMs) / binMs).floor());
      var started = false;
      for (var b = startBin; b < curve.length; b++) {
        final ms = b * binMs - direct / rate * 1000;
        if (ms > spanMs) break;
        final p = Offset(xForMs(ms), yForDb(curve[b]));
        if (!started) {
          path.moveTo(p.dx, p.dy);
          started = true;
        } else {
          path.lineTo(p.dx, p.dy);
        }
      }
    } else {
      final ref = ir.samples[direct].abs();
      double yFor(double v) => plotH / 2 - (ref <= 0 ? 0 : v / ref) * plotH / 2;
      canvas.drawLine(Offset(_leftMargin, plotH / 2), Offset(size.width, plotH / 2), grid);
      final start = math.max(0, direct - (preMs / 1000 * rate).round());
      final end = math.min(ir.samples.length, direct + (spanMs / 1000 * rate).round());
      final perPx = math.max(1, ((end - start) / plotW).floor());
      var started = false;
      // Min and max per pixel column so peaks survive the decimation.
      for (var i = start; i < end; i += perPx) {
        var lo = double.infinity, hi = -double.infinity;
        for (var j = i; j < math.min(end, i + perPx); j++) {
          final v = ir.samples[j];
          if (v < lo) lo = v;
          if (v > hi) hi = v;
        }
        final x = xForMs((i - direct) / rate * 1000);
        if (!started) {
          path.moveTo(x, yFor(hi));
          started = true;
        } else {
          path.lineTo(x, yFor(hi));
        }
        path.lineTo(x, yFor(lo));
      }
    }
    canvas.save();
    canvas.clipRect(Rect.fromLTWH(_leftMargin, 0, plotW, plotH));
    canvas.drawPath(path, line);

    final reflection = ir.firstReflectionIndex();
    if (reflection != null) {
      final x = xForMs((reflection - direct) / rate * 1000);
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, plotH),
        Paint()
          ..color = scheme.tertiary
          ..strokeWidth = 1,
      );
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(_TimePainter old) =>
      old.ir != ir || old.gate != gate || old.etc != etc || old.spanMs != spanMs;
}
