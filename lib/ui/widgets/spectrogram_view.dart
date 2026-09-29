import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../dsp/spectrogram.dart';
import 'heatmap_view.dart';

/// Time across, log frequency up, level as colour.
class SpectrogramView extends StatelessWidget {
  const SpectrogramView({
    super.key,
    required this.spectrogram,
    this.minHz = 40,
    this.maxHz = 8000,
    this.floorDb = -60,
  });

  final Spectrogram spectrogram;
  final double minHz;
  final double maxHz;
  final double floorDb;

  @override
  Widget build(BuildContext context) => CustomPaint(
        painter: _SpectrogramPainter(
          s: spectrogram,
          minHz: minHz,
          maxHz: maxHz,
          floorDb: floorDb,
          scheme: Theme.of(context).colorScheme,
        ),
        child: const SizedBox.expand(),
      );
}

class _SpectrogramPainter extends CustomPainter {
  _SpectrogramPainter({
    required this.s,
    required this.minHz,
    required this.maxHz,
    required this.floorDb,
    required this.scheme,
  });

  final Spectrogram s;
  final double minHz;
  final double maxHz;
  final double floorDb;
  final ColorScheme scheme;

  static const _leftMargin = 30.0;
  static const _bottomMargin = 16.0;

  @override
  void paint(Canvas canvas, Size size) {
    if (s.timesMs.isEmpty) return;
    final plotW = math.max(1.0, size.width - _leftMargin);
    final plotH = math.max(1.0, size.height - _bottomMargin);
    final t0 = s.timesMs.first;
    final t1 = s.timesMs.last;
    final logMin = math.log(minHz);
    final logMax = math.log(maxHz);
    double xFor(double ms) => _leftMargin + (ms - t0) / (t1 - t0) * plotW;
    double yFor(double hz) =>
        plotH - (math.log(hz) - logMin) / (logMax - logMin) * plotH;

    // One rectangle per (frame, log-frequency row): rows are a twelfth of an
    // octave, which is finer than the eye and coarser than the bins up top.
    const rowsPerOctave = 12;
    final rows = ((logMax - logMin) / math.ln2 * rowsPerOctave).ceil();
    final paint = Paint();
    final frameW = plotW / s.timesMs.length + 0.5;
    final binHz = s.frequencies[1];
    for (var fi = 0; fi < s.timesMs.length; fi++) {
      final x = xFor(s.timesMs[fi]);
      final frame = s.levelsDb[fi];
      for (var r = 0; r < rows; r++) {
        final fLo = minHz * math.pow(2, r / rowsPerOctave).toDouble();
        final fHi = minHz * math.pow(2, (r + 1) / rowsPerOctave).toDouble();
        if (fLo > maxHz) break;
        // Max over the bins in the row, so a narrow mode is not averaged away.
        var kLo = (fLo / binHz).floor();
        var kHi = (fHi / binHz).ceil();
        if (kHi < kLo + 1) kHi = kLo + 1;
        kLo = kLo.clamp(0, frame.length - 1);
        kHi = kHi.clamp(0, frame.length - 1);
        var level = -160.0;
        for (var k = kLo; k <= kHi; k++) {
          if (frame[k] > level) level = frame[k];
        }
        final t = ((level - floorDb) / -floorDb).clamp(0.0, 1.0);
        paint.color = HeatmapView.colorFor(t);
        canvas.drawRect(
          Rect.fromLTRB(x, yFor(math.min(fHi, maxHz)), x + frameW, yFor(fLo)),
          paint,
        );
      }
    }

    final labelStyle = TextStyle(fontSize: 10, color: scheme.onSurfaceVariant);
    for (final hz in [50.0, 100, 200, 500, 1000, 2000, 5000]) {
      if (hz < minHz || hz > maxHz) continue;
      final tp = TextPainter(
        text: TextSpan(
            text: hz >= 1000 ? '${(hz / 1000).round()}k' : hz.round().toString(),
            style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(_leftMargin - tp.width - 3, yFor(hz) - tp.height / 2));
    }
    final stepMs = (t1 - t0) > 250 ? 100.0 : 50.0;
    for (var ms = 0.0; ms <= t1; ms += stepMs) {
      final tp = TextPainter(
        text: TextSpan(text: ms.round().toString(), style: labelStyle),
        textDirection: TextDirection.ltr,
      )..layout();
      tp.paint(canvas, Offset(xFor(ms) - tp.width / 2, plotH + 2));
    }
  }

  @override
  bool shouldRepaint(_SpectrogramPainter old) =>
      old.s != s || old.floorDb != floorDb;
}
