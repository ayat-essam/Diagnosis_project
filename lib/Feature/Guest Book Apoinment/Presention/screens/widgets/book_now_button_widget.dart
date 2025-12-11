import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookNowButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const BookNowButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.BluePrimary,
          borderRadius: BorderRadius.circular(14.r),
        ),
        child: Center(
          child: Text("Book Now", style: StyleApp.font20WhiteSemiBold),
        ),
      ),
    );
  }
}
