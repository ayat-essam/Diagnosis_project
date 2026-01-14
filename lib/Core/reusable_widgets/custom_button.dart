import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Theme App/Fonts.dart';
import 'custom_text.dart';


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;  // nullable
  final double? width;            // optional
  final double? height;           // optional
  final Color? backgroundColor;   // optional
  final Color? textColor;         // optional
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,           // optional
    this.width,
    this.height,
    this.backgroundColor,
    this.textColor,
    this.fontSize = 15,
    this.fontWeight = Fonts.bold,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width?.w,
      height: height?.h,
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
