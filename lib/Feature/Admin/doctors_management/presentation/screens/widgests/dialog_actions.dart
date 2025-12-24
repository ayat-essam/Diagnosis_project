import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DialogActions extends StatelessWidget {
  const DialogActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CustomAppButton(
            onTap: () {},
            text: 'Send Reply',
            width: 140.w,
            borderRedius: 8.r,
            verticalPadding: 12,
          ),
        ),
        Gap(10.w),
        Expanded(
          child: CustomAppButton(
            onTap: () {
              Navigator.pop(context);
            },
            text: 'Cancel',
            width: 140.w,
            borderRedius: 8.r,
            verticalPadding: 12,
            backgroundColor: AppColors.greyLight,
            borderColor: AppColors.gray74,
          ),
        ),
    ]
    );
  }
}