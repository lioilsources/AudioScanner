import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../analysis/heatmap.dart';
import '../../model/measurement.dart';

/// Floor-plan heatmap of one 1/3-octave band, with the measured points on top.
///
/// The colour ramp is diverging around the midpoint — blue for quiet, red for
/// loud — because what matters is the *deviation* across the room, not an
/// absolute level the phone cannot measure anyway. Cells the interpolation
/// refused to fill are left as background, so a sparse walk looks sparse.
class HeatmapView extends StatelessWidget {
  const HeatmapView({
    super.key,
    required this.grid,
    required this.points,
    this.origin = Vec3.zero,
    this.best,
  });

  final HeatmapGrid grid;
  final List<Measurement> points;
  final Vec3 origin;

  /// Point to mark as the flattest seat.
  final Measurement? best;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HeatmapPainter(
        grid: grid,
        points: points,
        best: best,
        scheme: Theme.of(context).colorScheme,
      ),
      child: const SizedBox.expand(),
    );
  }

  /// Blue → grey → red. Kept here so the legend and the map cannot drift apart.
  static Color colorFor(double t) {
    final c = t.clamp(0.0, 1.0);
    if (c < 0.5) {
      return Color.lerp(
          const Color(0xFF2B6CB0), const Color(0xFFE2E8F0), c * 2)!;
    }
    return Color.lerp(
        const Color(0xFFE2E8F0), const Color(0xFFC53030), (c - 0.5) * 2)!;
  }
}

class _HeatmapPainter extends CustomPainter {
  _HeatmapPainter({
    required this.grid,
    required this.points,
    required this.best,
    required this.scheme,
  });

  final HeatmapGrid grid;
  final List<Measurement> points;
  final Measurement? best;
  final ColorScheme scheme;

  @override
  void paint(Canvas canvas, Size size) {
    if (grid.width == 0 || grid.height == 0) return;

    // One uniform scale for both axes: a stretched plan would misrepresent
    // distances, and distances are the measurement.
    final scale =
        math.min(size.width / grid.width, size.height / grid.height);
    final drawnW = grid.width * scale;
    final drawnH = grid.height * scale;
    final dx = (size.width - drawnW) / 2;
    final dy = (size.height - drawnH) / 2;

    final cell = Paint()..style = PaintingStyle.fill;
    for (var row = 0; row < grid.height; row++) {
      for (var col = 0; col < grid.width; col++) {
        final t = grid.normalizedAt(col, row);
        if (t == null) continue;
        cell.color = HeatmapView.colorFor(t);
        canvas.drawRect(
          Rect.fromLTWH(dx + col * scale, dy + row * scale, scale + 0.5, scale + 0.5),
          cell,
        );
      }
    }

    Offset toCanvas(Vec3 p) => Offset(
          dx + (p.x - grid.minX) / grid.cellSize * scale,
          dy + (p.z - grid.minZ) / grid.cellSize * scale,
        );

    // Metre grid, so the plan can be read as a room rather than a blob.
    final metre = Paint()
      ..color = scheme.onSurface.withValues(alpha: 0.12)
      ..strokeWidth = 1;
    final perMetre = scale / grid.cellSize;
    for (var x = grid.minX.ceilToDouble();
        x <= grid.minX + grid.width * grid.cellSize;
        x += 1) {
      final cx = dx + (x - grid.minX) / grid.cellSize * scale;
      canvas.drawLine(Offset(cx, dy), Offset(cx, dy + drawnH), metre);
    }
    for (var z = grid.minZ.ceilToDouble();
        z <= grid.minZ + grid.height * grid.cellSize;
        z += 1) {
      final cz = dy + (z - grid.minZ) / grid.cellSize * scale;
      canvas.drawLine(Offset(dx, cz), Offset(dx + drawnW, cz), metre);
    }

    final dot = Paint()..color = scheme.onSurface;
    final ring = Paint()
      ..color = scheme.surface
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.5;
    for (final p in points) {
      final c = toCanvas(p.position);
      canvas.drawCircle(c, 4, dot);
      canvas.drawCircle(c, 4, ring);
    }

    // Origin: where the user said the listening seat is.
    final o = toCanvas(Vec3.zero);
    final cross = Paint()
      ..color = scheme.onSurface
      ..strokeWidth = 2;
    canvas.drawLine(o - const Offset(7, 0), o + const Offset(7, 0), cross);
    canvas.drawLine(o - const Offset(0, 7), o + const Offset(0, 7), cross);

    final b = best;
    if (b != null) {
      final c = toCanvas(b.position);
      canvas.drawCircle(
        c,
        10,
        Paint()
          ..color = scheme.tertiary
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5,
      );
    }

    // Scale bar — one metre, measured off the same transform as everything else.
    final barY = dy + drawnH - 12;
    final barPaint = Paint()
      ..color = scheme.onSurface
      ..strokeWidth = 2;
    canvas.drawLine(
        Offset(dx + 12, barY), Offset(dx + 12 + perMetre, barY), barPaint);
    final tp = TextPainter(
      text: TextSpan(
          text: '1 m',
          style: TextStyle(fontSize: 11, color: scheme.onSurface)),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, Offset(dx + 12, barY - 15));
  }

  @override
  bool shouldRepaint(_HeatmapPainter old) =>
      old.grid != grid || old.points != points || old.best != best;
}
