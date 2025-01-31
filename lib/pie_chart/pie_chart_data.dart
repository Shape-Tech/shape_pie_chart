import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PieChartData extends Equatable {
  List<PieChartSegment> segments;
  String? title;

  PieChartData({
    required this.segments,
    this.title,
  });

  @override
  List<Object?> get props => [
        segments,
        title,
      ];

  double totalValue() {
    double _total = 0;
    for (var elem in segments) {
      _total += elem.value;
    }
    return _total;
  }
}

class PieChartSegment extends Equatable {
  final String segment;
  final double value;
  final Color color;

  PieChartSegment({
    required this.segment,
    required this.value,
    required this.color,
  });

  @override
  List<Object?> get props => [
        segment,
        value,
        color,
      ];

  Widget buildSegmentLegend() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: color,
            ),
          ),
          Gap(10),
          Expanded(
            child: Text(
              segment,
              maxLines: 3,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSelectedDisplay(double total) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          "${segment} : ${((value / total) * 100).toStringAsFixed(0)}%",
          maxLines: 3,
        ),
      ),
    );
  }
}
