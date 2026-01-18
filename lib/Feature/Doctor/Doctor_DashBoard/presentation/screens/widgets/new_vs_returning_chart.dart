import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/row_new_vs_returning_leganed.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../domain/entities/doctor_dashboard_entity.dart';
import 'custom_linear_gradiant_circle.dart';

class NewVsReturningChart extends StatelessWidget {
  final List<NewVsReturningEntity> data;

  const NewVsReturningChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final maxValue = data.isEmpty
        ? 10
        : data
            .map((e) => e.newPatients > e.returningPatients
                ? e.newPatients
                : e.returningPatients)
            .reduce((a, b) => a > b ? a : b)
            .toDouble();

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
                      maxY: maxValue + 10,
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
                            getTitlesWidget: (value, meta) {
                              final index = value.toInt();
                              if (index < 0 || index >= data.length) {
                                return const SizedBox.shrink();
                              }
                              return SideTitleWidget(
                                axisSide: meta.axisSide,
                                child: Text(
                                  data[index].day,
                                  style: StyleApp.font9grayTextChart,
                                ),
                              );
                            },

                           
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
    return List.generate(data.length, (i) {
      final item = data[i];

      return BarChartGroupData(
        x: i,
        barsSpace: 4,
        barRods: [
          BarChartRodData(
            toY: item.newPatients.toDouble(),
            color: AppColors.BluePrimary,
            width: 16,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          BarChartRodData(
            toY: item.returningPatients.toDouble(),
            color: AppColors.blueDark,
            width: 16,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      );
    });
  }
}
