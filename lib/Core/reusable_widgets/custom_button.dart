import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Theme App/Fonts.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    // this.width = 120,
    required this.width,
    // this.height = 40,
    required this.height,
    required this.backgroundColor,
    required this.textColor,
    this.fontSize = 15,
    // required this.fontSize,
    this.fontWeight = Fonts.bold,
    this.borderRadius = 8,
    // required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.r),
          ),
        ),
        child: CustomText(
          text: text,
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
