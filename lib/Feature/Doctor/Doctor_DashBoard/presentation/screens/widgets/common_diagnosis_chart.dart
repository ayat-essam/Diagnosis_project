import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'custom_linear_gradiant_circle.dart';

class CommonDiagnosisChart extends StatelessWidget {
  const CommonDiagnosisChart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      child: SizedBox(
          height: 220.h,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(children: [
                    const CustomLinearGradiantCircle(
                        image: 'assets/image/comman_diagnosis.png'),
                    Gap(6.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Common Diagnosis',
                          style: StyleApp.font18BlackSemiBold,
                        ),
                        Text(
                          'Most frequent diagnoses',
                          style: StyleApp.font16graySecondaryRegular,
                        ),
                      ],
                    ),
                    Gap(6.w),
                    CustomAppButton(
                      onTap: () {},
                      text: 'All patients',
                      borderRedius: 25.r,
                      width: 110.w,
                    ),
                    Gap(10.w),
                    CustomAppButton(
                      onTap: () {},
                      text: 'This month',
                      borderColor: AppColors.BluePrimary,
                      borderRedius: 25.r,
                      width: 110.w,
                      backgroundColor: AppColors.whiteBackground,
                    )
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
                              child: Text(
                                  CommonDiagnosisChartData.diagnosisData.keys
                                      .toList()[value.toInt()],
                                  style: StyleApp.font9grayTextChart),
                            ),
                          ),
                        ),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              if (value == 0 ||
                                  value == 20 ||
                                  value == 40 ||
                                  value == 60) {
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
    final diagnosisData =
        CommonDiagnosisChartData.diagnosisData.values.toList();

    return List.generate(diagnosisData.length, (i) {
      return BarChartGroupData(
        x: i,
        barRods: [
          BarChartRodData(
            toY: diagnosisData[i],
            color: AppColors.BluePrimary,
            width: 35,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(3), topRight: Radius.circular(2)),
          ),
        ],
      );
    });
  }
}

class CommonDiagnosisChartData {
  static final Map<String, double> diagnosisData = {
    'Bursitis': 55,
    'Scoliosis': 45,
    'Tendonitis': 60,
    'Osteoporosis': 35,
    'Fracture': 50,
    'Osteoarthritis': 30,
  };
}
