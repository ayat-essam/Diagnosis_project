import 'package:diagnosis_project/Core/reusable_widgets/bar_chart_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PatientBarChart extends StatelessWidget {
  const PatientBarChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BarChartWidget(
      barGroups: [
        BarChartGroupData(x: 0, barRods: [
          BarChartRodData(
              toY: 10,
              color: Colors.blue,
              borderRadius: BorderRadius.zero,
              width: 20)
        ]),
        BarChartGroupData(x: 1, barRods: [
          BarChartRodData(
              toY: 10,
              color: Colors.blue,
              borderRadius: BorderRadius.zero,
              width: 20)
        ]),
        BarChartGroupData(x: 2, barRods: [
          BarChartRodData(
              toY: 7,
              color: Colors.blue,
              borderRadius: BorderRadius.zero,
              width: 20)
        ]),
        BarChartGroupData(x: 3, barRods: [
          BarChartRodData(
              toY: 10,
              color: Colors.blue,
              borderRadius: BorderRadius.zero,
              width: 20)
        ]),
        BarChartGroupData(x: 4, barRods: [
          BarChartRodData(
              toY: 10,
              color: Colors.blue,
              borderRadius: BorderRadius.zero,
              width: 20)
        ]),
        BarChartGroupData(x: 5, barRods: [
          BarChartRodData(
              toY: 6,
              color: Colors.blue,
              borderRadius: BorderRadius.zero,
              width: 20)
        ]),
        BarChartGroupData(x: 6, barRods: [
          BarChartRodData(
              toY: 10,
              color: Colors.blue,
              width: 20,
              borderRadius: BorderRadius.zero),
        ]),
      ],
      legendItems: const [
        {'color': Colors.blue, 'text': 'symptomSeverity'},
      ],
    );
  }
}
