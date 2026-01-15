import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/row_new_vs_returning_leganed.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'custom_linear_gradiant_circle.dart';

class NewVsReturningChart extends StatelessWidget {
  const NewVsReturningChart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      child: SizedBox(
          height: 220.h,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(children: [
                    const CustomLinearGradiantCircle(
                        image: 'assets/image/new_vs_returning.png'),
                    Gap(10.w),
                    Text(
                      'New vs Returning Patients',
                      style: StyleApp.font18BlackSemiBold,
                    ),
                    Gap(30.w),
                    const RowNewVsReturningLeganed()
                  ]),
                ),
                Expanded(
                  child: BarChart(
                    BarChartData(
                      alignment: BarChartAlignment.spaceBetween,
                      maxY: 70,
                      barTouchData: BarTouchData(enabled: false),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        show: true,
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 40,
                            getTitlesWidget: (value, meta) => SideTitleWidget(
                              axisSide: meta.axisSide,
                              child: Text(ChartData.days[value.toInt()],
                                  style: StyleApp.font9grayTextChart),
                            ),
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              if (value == 0 ||
                                  value == 10 ||
                                  value == 20 ||
                                  value == 30 ||
                                  value == 40 ||
                                  value == 50) {
                                return Text(value.toInt().toString(),
                                    style: StyleApp.font9grayTextChart);
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ),
                      ),
                      gridData: const FlGridData(
                        show: false,
                      ),
                      borderData: FlBorderData(show: false),
                      barGroups: _generateBarGroups(),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    final patientData = ChartData.patientData;
    const days = ChartData.days;

    return List.generate(days.length, (i) {
      final newPatients = patientData['New']![i];
      final returningPatients = patientData['Returning']![i];

      return BarChartGroupData(
        x: i,
        barsSpace: 2,
        barRods: [
          BarChartRodData(
            toY: newPatients,
            color: AppColors.BluePrimary,
            width: 20,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(3), topRight: Radius.circular(3)),
          ),
          BarChartRodData(
            toY: returningPatients,
            color: AppColors.blueDark,
            width: 20,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(3), topRight: Radius.circular(3)),
          ),
        ],
      );
    });
  }
}

class ChartData {
  static const List<String> days = [
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
  ];

  static final Map<String, List<double>> patientData = {
    'New': [30, 45, 35, 20, 50, 40, 30],
    'Returning': [15, 25, 10, 30, 15, 18, 20],
  };
}
