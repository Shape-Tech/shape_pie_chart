import 'package:flutter/material.dart';
import 'package:shape_pie_chart/pie_chart/pie_chart_data.dart';
import 'package:shape_pie_chart/pie_chart/pie_chart_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: SingleChildScrollView(
          child: PieChartWidget(
            data: createPieChartData(),
            showLegend: true,
          ),
        ),
      ),
    );
  }

  PieChartData createPieChartData() {
    return PieChartData(
      segments: [
        PieChartSegment(
            segment: 'Value 1 really long title that is super long',
            value: 10,
            color: Colors.red),
        PieChartSegment(
            segment: 'Value 2 really long title that is super long',
            value: 0,
            color: Colors.blue),
        PieChartSegment(segment: 'Value 3', value: 50, color: Colors.yellow),
        PieChartSegment(segment: 'Value 5', value: 5, color: Colors.green),
        PieChartSegment(
            segment: 'Value 6 really long title that is super long',
            value: 50,
            color: Colors.orange),
        PieChartSegment(
            segment: 'Value 4', value: 5, color: Colors.purpleAccent),
      ],
      title: "Testing",
    );
  }
}
