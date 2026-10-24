// Minimal charts drawn with CustomPainter, so the prototype needs no
// charting package.

import 'dart:math' as math;

import 'package:flutter/material.dart';

class LineChart extends StatelessWidget {
  const LineChart({
    super.key,
    required this.points,
    required this.xMax,
    required this.color,
    required this.label,
  });

  final List<(double, double)> points;
  final double xMax;
  final Color color;
  final String Function(double) label;

  @override
  Widget build(BuildContext context) => CustomPaint(
        size: Size.infinite,
        painter: _LinePainter(points, xMax, color, label,
            Theme.of(context).textTheme.bodySmall!),
      );
}

class _LinePainter extends CustomPainter {
  _LinePainter(this.points, this.xMax, this.color, this.label, this.style);

  final List<(double, double)> points;
  final double xMax;
  final Color color;
  final String Function(double) label;
  final TextStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;
    final ys = points.map((p) => p.$2);
    final yMin = ys.reduce(math.min) - 0.5;
    final yMax = ys.reduce(math.max) + 0.5;
    const left = 40.0, bottom = 4.0;
    final w = size.width - left, h = size.height - bottom;
    Offset at((double, double) p) => Offset(
          left + (p.$1 - 1) / math.max(1, xMax - 1) * w,
          h - (p.$2 - yMin) / (yMax - yMin) * h,
        );

    final grid = Paint()
      ..color = style.color!.withValues(alpha: 0.2)
      ..strokeWidth = 1;
    for (final y in [yMin + 0.5, yMax - 0.5]) {
      final dy = h - (y - yMin) / (yMax - yMin) * h;
      canvas.drawLine(Offset(left, dy), Offset(size.width, dy), grid);
      _text(canvas, label(y), Offset(0, dy - 7));
    }

    final path = Path()..moveTo(at(points.first).dx, at(points.first).dy);
    for (final p in points.skip(1)) {
      path.lineTo(at(p).dx, at(p).dy);
    }
    canvas.drawPath(
        path,
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.5);
    for (final p in points) {
      canvas.drawCircle(at(p), 4, Paint()..color = color);
    }
  }

  void _text(Canvas canvas, String s, Offset o) {
    final tp = TextPainter(
        text: TextSpan(text: s, style: style),
        textDirection: TextDirection.ltr)
      ..layout();
    tp.paint(canvas, o);
  }

  @override
  bool shouldRepaint(covariant _LinePainter old) =>
      old.points != points || old.color != color;
}

class BarChart extends StatelessWidget {
  const BarChart({
    super.key,
    required this.values,
    required this.color,
    required this.mutedColor,
    required this.targetColor,
    required this.label,
    this.target,
    this.highlightFirst = 0,
  });

  final List<double> values;
  final double? target;

  /// The first N bars are drawn in the muted colour (baseline week).
  final int highlightFirst;
  final Color color;
  final Color mutedColor;
  final Color targetColor;
  final String Function(double) label;

  @override
  Widget build(BuildContext context) => CustomPaint(
        size: Size.infinite,
        painter: _BarPainter(this, Theme.of(context).textTheme.bodySmall!),
      );
}

class _BarPainter extends CustomPainter {
  _BarPainter(this.c, this.style);

  final BarChart c;
  final TextStyle style;

  @override
  void paint(Canvas canvas, Size size) {
    if (c.values.isEmpty) return;
    const left = 44.0;
    final maxV = [...c.values, c.target ?? 0].reduce(math.max) * 1.1;
    final w = size.width - left, h = size.height;
    final slot = w / c.values.length;
    for (var i = 0; i < c.values.length; i++) {
      final bh = c.values[i] / maxV * h;
      final rect = RRect.fromRectAndRadius(
        Rect.fromLTWH(left + i * slot + slot * 0.15, h - bh, slot * 0.7, bh),
        const Radius.circular(3),
      );
      canvas.drawRRect(
          rect, Paint()..color = i < c.highlightFirst ? c.mutedColor : c.color);
    }
    _text(canvas, c.label(maxV / 1.1), const Offset(0, 0));
    if (c.target != null) {
      final y = h - c.target! / maxV * h;
      final paint = Paint()
        ..color = c.targetColor
        ..strokeWidth = 2;
      for (var x = left; x < size.width; x += 8) {
        canvas.drawLine(Offset(x, y), Offset(math.min(x + 4, size.width), y),
            paint);
      }
      _text(canvas, c.label(c.target!), Offset(0, y - 7),
          color: c.targetColor);
    }
  }

  void _text(Canvas canvas, String s, Offset o, {Color? color}) {
    final tp = TextPainter(
      text: TextSpan(
          text: s,
          style: color == null ? style : style.copyWith(color: color)),
      textDirection: TextDirection.ltr,
    )..layout(maxWidth: 44);
    tp.paint(canvas, o);
  }

  @override
  bool shouldRepaint(covariant _BarPainter old) => true;
}
