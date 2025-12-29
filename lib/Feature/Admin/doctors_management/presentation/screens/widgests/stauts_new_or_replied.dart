import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';

class StautsNewOrReplied extends StatelessWidget {
  final String status;
  const StautsNewOrReplied({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    bool isNew = status.toLowerCase() == 'new';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
      width: 70.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: isNew
            ? AppColors.BluePrimary.withOpacity(0.1)
            : Colors.green.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          status,
          style: StyleApp.font12WhiteMedium.copyWith(
            color: isNew ? AppColors.BluePrimary : Colors.green,
          ),
        ),
      ),
    );
  }
}
