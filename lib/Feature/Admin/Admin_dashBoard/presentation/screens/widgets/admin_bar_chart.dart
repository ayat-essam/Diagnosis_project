import 'package:diagnosis_project/Core/reusable_widgets/bar_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../domain/entities/admin_dashboard_entity.dart';

class AdminBarChart extends StatelessWidget {
  final List<TopDoctor> topDoctors;

  const AdminBarChart({super.key, required this.topDoctors});

  @override
  Widget build(BuildContext context) {
    return BarChartWidget(
      bottomLabels: topDoctors.map((e) => e.doctorName).toList(),
      barGroups: List.generate(topDoctors.length, (index) {
        return BarChartGroupData(
          x: index,
          barRods: [
            BarChartRodData(
              toY: topDoctors[index].diagnosisCount.toDouble(),
              color: Colors.blue,
              width: 20,
              borderRadius: BorderRadius.zero,
            ),
            
          ],
        );
      }),
    );
  }
}
