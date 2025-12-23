import 'package:diagnosis_project/Core/reusable_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../Core/Theme App/Fonts.dart';
import '../../../../../Core/Theme App/colors.dart';
import '../../../../../Core/reusable_widgets/custom_text.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const ConfirmDialog({
    super.key,
    this.title = 'Confirm Settings Update\n',
    this.subtitle = 'This will affect all system users',
    this.description =
        'Are you sure you want to save these system settings? All changes will take effect immediately across the entire platform.',
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(20.w),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.dateSloteColor,
              AppColors.BluePrimary,
            ],
          ),
        ),
        padding: const EdgeInsets.all(2),
        child: Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.whiteBackground,
            borderRadius: BorderRadius.circular(14.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Icon(
                      Icons.info_outline,
                      color: AppColors.OrangeWarning,
                    ),
                  ),
                  Gap(8.w),
                  Expanded(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: title,
                            style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: Fonts.bold,
                              color: AppColors.grayDark,
                            ),
                          ),
                          TextSpan(
                            text: subtitle,
                            style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: Fonts.regular,
                              color: AppColors.grayDark,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(12.h),
              CustomText(
                text: description,
                fontSize: 14.sp,
                color: AppColors.gratext,
                fontWeight: Fonts.regular,
              ),
              Gap(20.h),
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Save Changes',
                      onPressed: onConfirm,
                      width: 120.w,
                      height: 40.h,
                      backgroundColor: AppColors.BluePrimary,
                      textColor: AppColors.whiteBackground,
                    ),

                  ),
                  const Gap(10),
                  Expanded(
                    child: CustomButton(
                        text: 'Cancel',
                        onPressed: onCancel,
                        width: 120.w,
                        height: 40.h,
                        backgroundColor: AppColors.whiteBackground,
                      textColor: AppColors.BluePrimary,),

                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
