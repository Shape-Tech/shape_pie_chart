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
        child: SizedBox(
            width: 700,
            height: 300,
            child: PieChartWidget(
              data: createPieChartData(),
            )),
      ),
    );
  }

  PieChartData createPieChartData() {
    return PieChartData(
      segments: [
        PieChartSegment(segment: 'Value 1', value: 10, color: Colors.red),
        PieChartSegment(segment: 'Value 2', value: 35, color: Colors.blue),
        PieChartSegment(segment: 'Value 3', value: 50, color: Colors.yellow),
        PieChartSegment(segment: 'Value 4', value: 5, color: Colors.green),
      ],
      title: "Testing",
    );
  }
}
