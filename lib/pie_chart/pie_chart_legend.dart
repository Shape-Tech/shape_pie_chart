import 'package:flutter/material.dart';
import 'package:shape_pie_chart/pie_chart/pie_chart_data.dart';

class PieChartLegend extends StatelessWidget {
  final List<PieChartSegment> segments;

  PieChartLegend({required this.segments});

  @override
  Widget build(BuildContext context) {
    final halfLength = (segments.length / 2).ceil();
    final firstColumn = segments.sublist(0, halfLength);
    final secondColumn = segments.sublist(halfLength);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: firstColumn.map((segment) {
              return segment.buildSegmentLegend();
            }).toList(),
          ),
        ),
        SizedBox(width: 10), // Add some spacing between columns
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: secondColumn.map((segment) {
              return segment.buildSegmentLegend();
            }).toList(),
          ),
        ),
      ],
    );
  }
}
