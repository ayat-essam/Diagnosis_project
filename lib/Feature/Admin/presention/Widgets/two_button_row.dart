import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TwoButtonRow extends StatelessWidget {
  final String primaryText;
  final VoidCallback onPrimaryTap;
  final String secondaryText;
  final VoidCallback onSecondaryTap;
  final Color backgroundColor;

  const TwoButtonRow({
    super.key,
    required this.primaryText,
    required this.onPrimaryTap,
    required this.secondaryText,
    required this.onSecondaryTap,
    this.backgroundColor=AppColors.BluePrimary,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomAppButton(
            onTap: onPrimaryTap,
            text: primaryText,
            width: 140.w,
            borderRedius: 8.r,
            verticalPadding: 8.h,
            backgroundColor: backgroundColor,
          ),
        ),
        Gap(10.w),
        Expanded(
          child: CustomAppButton(
            onTap: onSecondaryTap,
            text: secondaryText,
            width: 140.w,
            borderRedius: 8.r,
            backgroundColor: AppColors.greyLight,
            borderColor: AppColors.gray74,
            verticalPadding: 8.h,
          ),
        ),
      ],
    );
  }
}
