import 'package:diagnosis_project/Core/reusable_widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';

import 'package:fl_chart/fl_chart.dart';

class PatientLineChart extends StatelessWidget {
  const PatientLineChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LineChartWidget(
      lineBarsData: [
        LineChartBarData(
            spots: const [
              FlSpot(0, 18),
              FlSpot(1, 17.5),
              FlSpot(2, 17),
              FlSpot(3, 16.5),
              FlSpot(4, 16),
              FlSpot(5, 15.8),
            ],
            isCurved: true,
            color: Colors.blue,
            barWidth: 3,
            isStrokeCapRound: true),
        LineChartBarData(
          spots: const [
            FlSpot(0, 12),
            FlSpot(1, 12.3),
            FlSpot(2, 12.8),
            FlSpot(3, 12.5),
            FlSpot(4, 12.2),
            FlSpot(5, 12.3),
          ],
          isCurved: true,
          color: Colors.green,
          barWidth: 3,
        ),
        LineChartBarData(
          spots: const [
            FlSpot(0, 8),
            FlSpot(1, 7.9),
            FlSpot(2, 7.6),
            FlSpot(3, 7.2),
            FlSpot(4, 7),
            FlSpot(5, 6.9),
          ],
          isCurved: true,
          color: Colors.orange,
          barWidth: 3,
        ),
      ],
      legendItems: const [
        {'color': Colors.green, 'text': 'Dosage\n Consistency'},
        {'color': Colors.orange, 'text': 'Routine\n Completion'},
        {'color': Colors.blue, 'text': 'Symptom\n Severity'},
      ],
    );
  }
}
