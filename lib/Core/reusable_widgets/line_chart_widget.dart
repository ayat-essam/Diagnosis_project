import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Core/reusable_widgets/line_chart_legand.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LineChartWidget extends StatelessWidget {
  final List<LineChartBarData> lineBarsData;
  final List<Map<String, dynamic>>? legendItems;
  final List<String>? bottomLabels;

  const LineChartWidget({
    super.key,
    required this.lineBarsData,
    this.legendItems,
    this.bottomLabels = const ['Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov'],
  });

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
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(showTitles: false),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Wrap(
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
                            interval: 1,
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();

                              if (index < 0 || index >= bottomLabels!.length) {
                                return const SizedBox.shrink();
                              }

                              return FittedBox(
                                child: Column(
                                  children: [
                                    Container(
                                      width: 1,
                                      height: 5,
                                      margin: const EdgeInsets.only(bottom: 4),
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      bottomLabels![index],
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
                      lineBarsData: lineBarsData,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                legendItems != null
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: legendItems!
                            .map((item) => LineChartLegand(
                                color: item['color'], text: item['text']))
                            .toList(),
                      )
                    : SizedBox.shrink(),
              ],
            ),
          )),
    );
  }
}
