import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/bar_chart_legand.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      child: SizedBox(
        height: 230.h,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: BarChart(
                  BarChartData(
                    gridData: const FlGridData(
                      show: true,
                    ),
                    borderData: FlBorderData(
                        show: true,
                        border: const Border(
                          bottom: BorderSide(
                              color: AppColors.graySecondary, width: 1.3),
                          left: BorderSide(
                              color: AppColors.graySecondary, width: 1.3),
                        )),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Row(
                                spacing: 3,
                                children: [
                                  // الرقم نفسه
                                  Text(
                                    value.toInt().toString(),
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                  // الخط الصغير قبل الرقم
                                  Container(
                                    width: 5,
                                    height: 1.8,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            const days = [
                              'Mon',
                              'Tue',
                              'Wed',
                              'Thu',
                              'Fri',
                              'Sat',
                              'Sun'
                            ];
                            return FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Column(
                                children: [
                                  // الخط اللي برّه الرسم (قبل اسم اليوم)
                                  Container(
                                    width: 1,
                                    height: 5,
                                    margin: const EdgeInsets.only(bottom: 4),
                                    color: Colors.grey,
                                  ),

                                  // اسم اليوم
                                  Text(
                                    days[value.toInt()],
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
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
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              const BarChartLegand(),
            ],
          ),
        ),
      ),
    );
  }
}
