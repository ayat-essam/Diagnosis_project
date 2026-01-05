import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomAppButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomAppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.borderRedius = 14,
    this.prefixIcon,
    this.width = double.infinity,
    this.backgroundColor = AppColors.BluePrimary,
    this.verticalPadding = 6,
    this.borderColor = AppColors.BluePrimary,
  });
  final String text;
  final double borderRedius;
  final double width;
  final IconData? prefixIcon;
  final Color backgroundColor;
  final Color borderColor;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    final Color resolvedIconColor = backgroundColor == AppColors.BluePrimary
        ? AppColors.whiteBackground
        : borderColor;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: verticalPadding.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRedius),
          border: Border.all(
              color: backgroundColor == AppColors.greyLight
                  ? borderColor
                  : backgroundColor,
              width: 1),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null) ...[
                Icon(
                  prefixIcon,
                  size: 30.sp,
                  color: resolvedIconColor,
                ),
                Gap(6.w),
              ],
              Text(
                text,
                style: backgroundColor != AppColors.greyLight
                    ? StyleApp.font14BlueSemiBold
                        .copyWith(color: AppColors.whiteBackground)
                    : StyleApp.font14BlueSemiBold.copyWith(color: borderColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
