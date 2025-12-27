import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../Core/Theme App/colors.dart';

class FinanceBarChart extends StatelessWidget {
  const FinanceBarChart({super.key});
  static const List<String> _types = [
    'Emergency',
    'Specialist',
    'Follow-up',
    'Consultation',
  ];

  static const List<double> _values = [
    5800,
    4200,
    5000,
    2200,
  ];
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        maxY: 6000,
        barTouchData: BarTouchData(enabled: false),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(
          show: false,
        ),
        titlesData: FlTitlesData(
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 42,
              interval: 1000,
              getTitlesWidget: (value, meta) {
                return Text(
                  value.toInt().toString(),
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: AppColors.graySecondary,
                  ),
                );
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                final index = value.toInt();
                if (index < 0 || index >= _types.length) {
                  return const SizedBox();
                }

                return Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: Text(
                    _types[index],
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 10,
                      color: AppColors.graySecondary,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        barGroups: List.generate(
          _values.length,
          (index) => _barGroup(index, _values[index]),
        ),
      ),
    );
  }

  BarChartGroupData _barGroup(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          width: 49,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          color: AppColors.BluePrimary,
        ),
      ],
    );
  }
}
