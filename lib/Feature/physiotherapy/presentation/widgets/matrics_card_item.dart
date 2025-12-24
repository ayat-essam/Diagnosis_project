import 'package:diagnosis_project/Core/Theme%20App/Fonts.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_text.dart';
import 'package:diagnosis_project/Feature/physiotherapy/presentation/widgets/result_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'metrics_text_item.dart';

class MetricsCardItem extends StatelessWidget {
  const MetricsCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.graySecondary),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                  text: "Metrics",
                  fontSize: 22.sp,
                  color: AppColors.grayTextChart,
                  fontWeight: Fonts.bold),
              Gap(12.h),
              const MetricText(
                title: 'Repetitions',
                value: '12',
                valueColor: Colors.grey,
              ),
              Gap(8.h),
              const MetricText(
                title: 'Posture Correction',
                value: '8/12 correct',
                valueColor: Colors.grey,
              ),
              Gap(8.h),
              const MetricText(
                title: 'Tips',
                value: '"Raise your shoulder a bit"',
                valueColor: Colors.grey,
              ),
              Gap(8.h),
              const MetricText(
                title: 'Time',
                value: '05:20',
                valueColor: Colors.grey,
              ),
              Gap(30.h),
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          text: 'Submit Result',
                          onPressed: () {
                            showAIResultDialog(context);
                          },
                          width: 120,
                          height: 49,
                          backgroundColor: AppColors.BluePrimary,
                          textColor: AppColors.whiteBackground)),
                  Gap(8.w),
                  Expanded(
                      child: CustomButton(
                          text: 'Finish',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          width: 120,
                          height: 49,
                          backgroundColor: AppColors.RedError,
                          textColor: AppColors.whiteBackground)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
