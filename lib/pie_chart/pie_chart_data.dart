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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 20,
          height: 20,
          color: color,
        ),
        Gap(10),
        Text(segment),
      ],
    );
  }

  Widget buildSelectedDisplay() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("Hovered Segment: ${segment} : ${value}"),
      ),
    );
  }
}
