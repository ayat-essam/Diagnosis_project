import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/line_chart_legand.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RowNewVsReturningLeganed extends StatelessWidget {
  const RowNewVsReturningLeganed({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const LineChartLegand(
          color: AppColors.BluePrimary,
          text: 'New',
        ),
        Gap(10.w),
        const LineChartLegand(
          color: AppColors.blueDark,
          text: 'Returning',
        ),
      ],
    );
  }
}
