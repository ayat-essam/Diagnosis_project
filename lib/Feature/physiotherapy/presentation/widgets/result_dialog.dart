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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                /// 🏆 العنوان
                Row(
                  children: [
                    Icon(
                      Icons.analytics_outlined,
                      color: AppColors.BluePrimary,
                      size: 24.sp,
                    ),
                    Gap(8.w),
                    Expanded(
                      child: CustomText(
                        text: "AI Analysis Results",
                        fontWeight: Fonts.bold,
                        color: AppColors.grayDark,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                Gap(16.h),

                /// 🏋️ Exercise Name
                _buildResultItem(
                  title: "Exercise Name:",
                  value: result.exerciseName,
                  icon: Icons.fitness_center,
                ),
                Gap(12.h),

                /// ⚠️ Errors
                _buildResultItem(
                  title: "Detected Errors:",
                  value: result.errors.isNotEmpty
                      ? result.errors.join("\n• ")
                      : "✅ No errors detected",
                  icon: Icons.warning_amber,
                  valueColor: result.errors.isNotEmpty
                      ? Colors.orange
                      : Colors.green,
                ),
                Gap(12.h),

                /// 💡 Feedback
                _buildResultItem(
                  title: "AI Feedback:",
                  value: result.feedback,
                  icon: Icons.lightbulb_outline,
                  valueColor: AppColors.BluePrimary,
                ),
                Gap(20.h),

                /// 📊 Score (إذا كان متوفراً في المستقبل)
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: AppColors.BluePrimary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppColors.BluePrimary),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.score_outlined,
                        color: AppColors.BluePrimary,
                        size: 20.sp,
                      ),
                      Gap(8.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: "Analysis Summary",
                              fontSize: 14.sp,
                              color: AppColors.grayDark,
                            ),
                            Gap(4.h),
                            CustomText(
                              text: result.errors.isEmpty
                                  ? "Excellent form! Keep it up! 💪"
                                  : "Focus on improving the detected areas",
                              fontSize: 12.sp,
                              color: result.errors.isEmpty
                                  ? Colors.green
                                  : Colors.orange,
                              fontWeight: Fonts.medium,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Gap(24.h),

                /// ✅ Done Button
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
      ),
    );
  }

  Widget _buildResultItem({
    required String title,
    required String value,
    required IconData icon,
    Color valueColor = AppColors.grayDark,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 16.sp,
              color: AppColors.grayDark,
            ),
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
            fontWeight: Fonts.medium,
          ),
        ),
      ],
    );
  }
}