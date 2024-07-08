import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'pie_chart_data.dart';
import 'pie_chart_painter.dart';
import 'pie_chart_legend.dart';
import 'dart:math' as math;

class PieChartWidget extends StatefulWidget {
  final PieChartData data;
  final bool? showLegend;

  PieChartWidget({
    required this.data,
    this.showLegend,
  });

  @override
  _PieChartWidgetState createState() => _PieChartWidgetState();
}

class _PieChartWidgetState extends State<PieChartWidget> {
  PieChartSegment? hoveredSegment;

  void onHover(PieChartSegment? segment) {
    setState(() {
      hoveredSegment = segment;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double size = constraints.maxWidth >= 300 ? 300 : constraints.maxWidth;
        List<Widget> children = [
          if (widget.showLegend == true) ...[
            PieChartLegend(segments: widget.data.segments),
            Gap(20),
          ],
          GestureDetector(
            onPanUpdate: (details) {
              final RenderBox box = context.findRenderObject() as RenderBox;
              final Offset localOffset =
                  box.globalToLocal(details.globalPosition);
              final painter = PieChartPainter(
                segments: widget.data.segments,
                onHover: onHover,
                center: Offset(size / 2, size / 2),
                radius: size / 2,
                hoveredSegment: hoveredSegment,
              );
              painter.hitTest(localOffset);
            },
            child: CustomPaint(
              size: Size(size, size),
              painter: PieChartPainter(
                segments: widget.data.segments,
                onHover: onHover,
                center: Offset(size / 2, size / 2),
                radius: size / 2,
                hoveredSegment: hoveredSegment,
              ),
            ),
          ),
          if (hoveredSegment != null) ...[
            Gap(20),
            hoveredSegment!.buildSelectedDisplay(widget.data.totalValue()),
          ],
        ];
        if (constraints.maxWidth >= 700) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: children,
          );
        } else {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: children,
          );
        }
      },
    );
  }
}
