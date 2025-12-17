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
    this.backgroundColor=AppColors.BluePrimary,
  });
final String text;
final double borderRedius;
final double width;
final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(vertical: 3.h),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRedius),
          border: Border.all(color: AppColors.BluePrimary, ),
        ),
        child: Center(
          child: Text(text, style:backgroundColor==AppColors.BluePrimary?StyleApp.font12WhiteSemiBold: StyleApp.font13BlueSemiBold),
        ),
      ),
    );
  }
}
