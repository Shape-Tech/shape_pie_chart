import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'pie_chart_data.dart';

typedef HoverCallback = void Function(PieChartSegment? segment);

class PieChartPainter extends CustomPainter {
  final List<PieChartSegment> segments;
  final HoverCallback onHover;
  final Offset center;
  final double radius;
  final PieChartSegment? hoveredSegment;

  PieChartPainter({
    required this.segments,
    required this.onHover,
    required this.center,
    required this.radius,
    required this.hoveredSegment,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;
    final double total = segments.map((e) => e.value).reduce((a, b) => a + b);
    double startAngle = -math.pi / 2;

    for (var segment in segments) {
      final sweepAngle = (segment.value / total) * 2 * math.pi;
      paint.color =
          segment.color.withOpacity(segment == hoveredSegment ? 1.0 : 0.7);
      final path = Path()
        ..moveTo(center.dx, center.dy)
        ..arcTo(Rect.fromCircle(center: center, radius: radius), startAngle,
            sweepAngle, false)
        ..close();

      canvas.drawPath(path, paint);
      startAngle += sweepAngle;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  @override
  bool hitTest(Offset position) {
    final dx = position.dx - center.dx;
    final dy = position.dy - center.dy;
    final distance = math.sqrt(dx * dx + dy * dy);

    if (distance <= radius) {
      double angle = math.atan2(dy, dx) + math.pi / 2;
      if (angle < 0) angle += 2 * math.pi;

      double startAngle = 0.0;
      final double total = segments.map((e) => e.value).reduce((a, b) => a + b);
      for (var segment in segments) {
        final sweepAngle = (segment.value / total) * 2 * math.pi;
        if (angle >= startAngle && angle <= startAngle + sweepAngle) {
          onHover(segment);
          return true;
        }
        startAngle += sweepAngle;
      }
    }
    onHover(null);
    return false;
  }
}
