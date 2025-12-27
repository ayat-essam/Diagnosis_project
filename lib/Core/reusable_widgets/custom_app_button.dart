import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppButton extends StatelessWidget {
  final VoidCallback onTap;

  const CustomAppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.borderRedius = 14,
    this.width = double.infinity,
    this.backgroundColor = AppColors.BluePrimary,
    this.verticalPadding = 6,
    this.borderColor = AppColors.BluePrimary,
  });
  final String text;
  final double borderRedius;
  final double width;
<<<<<<< HEAD
  final Color backgroundColor;
  final Color borderColor;
  final double verticalPadding;

=======
>>>>>>> Consultations-features
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: verticalPadding.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRedius),
          border: Border.all(
            color: borderColor,
          ),
        ),
        child: Center(
          child: Text(text,
              style: backgroundColor == AppColors.BluePrimary
                  ? StyleApp.font16BlueSemiBold
                      .copyWith(color: AppColors.whiteBackground)
                  : StyleApp.font16BlueSemiBold.copyWith(color: borderColor)),
        ),
      ),
    );
  }
}
