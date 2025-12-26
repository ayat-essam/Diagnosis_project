import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
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
            color: AppColors.BluePrimary,
            barWidth: 3,
            isStrokeCapRound: true),
        LineChartBarData(
          spots: const [
            FlSpot(0, 17),
            FlSpot(1, 16.5),
            FlSpot(2, 16),
            FlSpot(3, 15.5),
            FlSpot(4, 15),
            FlSpot(5, 14.8),
          ],
          isCurved: true,
          color: AppColors.GreenSuccess,
          barWidth: 3,
        ),
      ],
      legendItems: const [
        {
          'color': AppColors.GreenSuccess,
          'text': 'Physiotherapy\n Exercises Search'
        },
        {'color': AppColors.BluePrimary, 'text': 'AI Physiotherapy'},
      ],
    );
  }
}
