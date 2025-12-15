import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/Widgets/line_chart_legand.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      child: SizedBox(
          height: 220.h,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(
                        show: true,
                      ),
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
                              const months = [
                                'Jun',
                                'Jul',
                                'Aug',
                                'Sep',
                                'Oct',
                                'Nov'
                              ];
                              return FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Column(
                                  children: [
                                    // الخط الصغير قبل الرقم
                                    Container(
                                      width: 1,
                                      height: 5,
                                      margin: const EdgeInsets.only(bottom: 4),
                                      color: Colors.grey,
                                    ),
                                    // الرقم نفسه
                                    Text(
                                      months[value.toInt()],
                                      style: const TextStyle(fontSize: 15),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                          show: true,
                          border: const Border(
                            bottom: BorderSide(
                                color: AppColors.graySecondary, width: 1.3),
                            left: BorderSide(
                                color: AppColors.graySecondary, width: 1.3),
                          )),
                      lineBarsData: [
                        /// الخط الأزرق (Symptom Severity)
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

                        /// الأخضر (Dosage Consistency)
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

                        /// الأصفر (Routine Completion)
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
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                const LineChartLegend()
              ],
            ),
          )),
    );
  }
}
