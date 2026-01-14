import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_text.dart';
import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/reusable_widgets/custom_button.dart';
import '../../domain/entity/physiotherapy_result_entity.dart';

class ResultDialog extends StatelessWidget {
  final PhysiotherapyResultEntity result;
  final VoidCallback onClose;

  const ResultDialog({
    super.key,
    required this.result,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.r),
        side: const BorderSide(
          color: AppColors.BluePrimary,
          width: 1.5,
        ),
      ),
      elevation: 24,
      child: Container(
        width: 340.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 30,
              offset: Offset(0, 12.h),
            ),
          ],
        ),

          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Gap(8.w),
                    const Expanded(
                      child: CustomText(
                        text: "AI Results",
                        fontWeight: Fonts.bold,
                        color: AppColors.grayDark,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Gap(16.h),
                _buildResultItem(
                  title: "Exercise Name:",
                  value: result.exerciseName,
                ),
                Gap(12.h),
                _buildResultItem(
                  title: "Errors:",
                  value: result.errors > 0
                      ? result.errors.toString()
                      : "✅ No errors detected",
                ),
                Gap(12.h),
                _buildResultItem(
                  title: "Feedback:",
                  value: result.feedback,
                ),
                Gap(20.h),
                CustomButton(
                  text: "Done",
                  onPressed: onClose,
                  width: double.infinity,
                  height: 40.h,
                  backgroundColor: AppColors.BluePrimary,
                  textColor: AppColors.whiteBackground,
                ),
              ],
            ),
          ),

      ),
    );
  }

  Widget _buildResultItem({
    required String title,
    required String value,
    Color valueColor = AppColors.BluePrimary,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Gap(8.w),
            Expanded(
              child: CustomText(
                text: title,
                color: AppColors.grayDark,
                fontSize: 14.sp,
                fontWeight: Fonts.bold,
              ),
            ),
          ],
        ),
        Gap(4.h),
        Padding(
          padding: EdgeInsets.only(left: 24.w),
          child: CustomText(
            text: value,
            color: valueColor,
            fontSize: 14.sp,
            fontWeight: Fonts.bold,
          ),
        ),
      ],
    );
  }
}
