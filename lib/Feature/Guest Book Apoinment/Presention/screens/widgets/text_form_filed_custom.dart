<<<<<<< HEAD
=======
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFiledCustom extends StatelessWidget {
  const TextFormFiledCustom({
    super.key,
    required this.hintText,
    required this.icon,
  });
  final String hintText;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Image.asset(
          icon,
        ),
        hintStyle: StyleApp.font15BlueMedium,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.BluePrimary, width: 1.w),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 16.h),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.BluePrimary, width: 1.w),
        ),
      ),
    );
  }
}
>>>>>>> Consultations-features
