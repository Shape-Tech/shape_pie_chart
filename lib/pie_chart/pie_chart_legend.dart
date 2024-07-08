import 'package:flutter/material.dart';
import 'package:shape_pie_chart/pie_chart/pie_chart_data.dart';

class PieChartLegend extends StatelessWidget {
  final List<PieChartSegment> segments;

  PieChartLegend({required this.segments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: segments.map((segment) {
          return segment.buildSegmentLegend();
        }).toList(),
      ),
    );
  }
}
