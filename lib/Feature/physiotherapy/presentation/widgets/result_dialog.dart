import 'package:diagnosis_project/Feature/physiotherapy/presentation/widgets/metrics_text_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/reusable_widgets/custom_button.dart';
import '../../../../Core/reusable_widgets/custom_text.dart';

void showAIResultDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return Dialog(
        backgroundColor: Colors.transparent, // مهم
        insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
          decoration: BoxDecoration(
            color: AppColors.whiteBackground,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: AppColors.BluePrimary,
              width: 1.5,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "AI Results",
                fontSize: 20.sp,
                fontWeight: Fonts.bold,
                color: AppColors.grayTextChart,
              ),
              Gap(12.h),
              const MetricText(
                title: 'Accuracy',
                value: '87%',
                valueColor: AppColors.BluePrimary,
              ),
              Gap(8.h),
              const MetricText(
                title: 'Repetitions',
                value: '45',
                valueColor: AppColors.BluePrimary,
              ),
              Gap(8.h),
              const MetricText(
                title: 'Errors',
                value: '3',
                valueColor: AppColors.BluePrimary,
              ),
              Gap(8.h),
              const MetricText(
                title: 'Duration',
                value: '15 minutes',
                valueColor: AppColors.BluePrimary,
              ),
              Gap(8.h),
              const MetricText(
                title: 'Doctor’s Note',
                value: '“Good performance, focus more on shoulder posture”',
                valueColor: AppColors.BluePrimary,
              ),
              Gap(15.h),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  text: 'Done',
                  onPressed: () => Navigator.pop(context),
                  height: 45,
                  backgroundColor: AppColors.BluePrimary,
                  textColor: AppColors.whiteBackground,
                  width: 177,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
