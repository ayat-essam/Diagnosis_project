import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Theme App/styleApp.dart';
import 'bar_chart_legand.dart';

class BarChartWidget extends StatelessWidget {
  final List<BarChartGroupData> barGroups;
  final List<Map<String, dynamic>>? legendItems;
  final List<String>? bottomLabels;

  const BarChartWidget({
    super.key,
    required this.barGroups,
    this.legendItems,
    this.bottomLabels = const ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
  });

  @override
  Widget build(BuildContext context) {
    final labels =
        bottomLabels ?? ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
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
                                crossAxisAlignment: WrapCrossAlignment.start,
                                direction: Axis.horizontal,
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
                          reservedSize: 45,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();

                            if (index < 0 || index >= labels.length) {
                              return const SizedBox.shrink();
                            }

                            final parts = labels[index].split('.');

                            return SizedBox(
                              height: 40,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 1,
                                    height: 5,
                                    margin: const EdgeInsets.only(bottom: 4),
                                    color: Colors.grey,
                                  ),
                                  Text(parts[0],
                                      style: StyleApp.font9grayTextChart),
                                  if (parts.length > 1)
                                    Text(parts[1],
                                        style: StyleApp.font9grayTextChart),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    barGroups: barGroups,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              legendItems != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: legendItems!
                          .map((item) => BarLegendItem(
                              color: item['color'], text: item['text']))
                          .toList(),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
