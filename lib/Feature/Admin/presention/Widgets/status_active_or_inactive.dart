import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';

class StatusActiveOrInactive extends StatelessWidget {
  final String status;
  const StatusActiveOrInactive({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    bool isActive = status.toLowerCase() == 'active';
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
      width: 70.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: isActive
            ? AppColors.green.withOpacity(0.1)
            : Colors.red.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Text(
          status,
          style: StyleApp.font12WhiteMedium.copyWith(
            color: isActive ? AppColors.GreenSuccess : Colors.red,
          ),
        ),
      ),
    );
  }
}
