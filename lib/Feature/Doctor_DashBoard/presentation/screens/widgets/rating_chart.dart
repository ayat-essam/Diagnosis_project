import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Doctor_DashBoard/presentation/screens/widgets/custom_linear_gradiant_circle.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RatingChart extends StatelessWidget {
  const RatingChart({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
        child: SizedBox(
      height: 220.h,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              const CustomLinearGradiantCircle(
                  image: 'assets/image/rating.png'),
              Gap(6.w),
              Text(
                'Rating',
                style: StyleApp.font18BlackSemiBold,
              ),
            ],
          ),
          Gap(6.w),
          Expanded(
            child: LineChart(
              LineChartData(
                minY: 10,
                maxY: 70,
                gridData: const FlGridData(show: false),
                borderData: FlBorderData(show: false),
                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: StyleApp.font9grayTextChart,
                        );
                      },
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          RatingChartData.days[value.toInt()],
                          style: StyleApp.font9grayTextChart,
                        );
                      },
                    ),
                  ),
                ),

                /// LINE
                lineBarsData: [
                  LineChartBarData(
                    spots: RatingChartData.spots,
                    isCurved: true,
                    barWidth: 0,
                    dotData: const FlDotData(show: false),

                    /// AREA FILL
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.blueDark.withAlpha(200),
                          AppColors.blueDark.withAlpha(120),
                          AppColors.blueDark.withAlpha(60),
                          AppColors.blueDark.withAlpha(30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    ));
  }
}

class RatingChartData {
  static const List<String> days = [
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri'
  ];

  static final List<FlSpot> spots = [
    const FlSpot(0, 55),
    const FlSpot(.5, 30),
    const FlSpot(1, 55),
    const FlSpot(1.5, 40),
    const FlSpot(2, 60),
    const FlSpot(2.5, 40),
    const FlSpot(3, 55),
    const FlSpot(3.5, 40),
    const FlSpot(4, 35),
    const FlSpot(4.5, 50),
    const FlSpot(5, 40),
    const FlSpot(5.5, 55),
    const FlSpot(6, 10),
  ];
}
