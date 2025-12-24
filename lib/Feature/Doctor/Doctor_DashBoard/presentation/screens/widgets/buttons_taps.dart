import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ButtonsTaps extends StatelessWidget {
  const ButtonsTaps({super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomAppButton(
            onTap: () {},
            text: 'Daily',
            width: 160.w,
            borderRedius: 25.r,
          ),
          Gap(12.h),
          CustomAppButton(
            onTap: () {},
            text: 'Monthly',
            width: 160.w,
            borderRedius: 25.r,
            backgroundColor: AppColors.whiteBackground,
          ),
        ],
      ),
    );
  }
}
