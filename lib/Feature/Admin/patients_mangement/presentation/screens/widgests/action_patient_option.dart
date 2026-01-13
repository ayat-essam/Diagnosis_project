import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ActionPatientOption extends StatelessWidget {
  const ActionPatientOption(
      {super.key,
      required this.title,
      required this.image,
      required this.onTap});
  final String title;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(image),
          Gap(10.w),
          Text(
            title,
            style: StyleApp.font12BlackSemiBold.copyWith(
                color: title == 'Delete patient'
                    ? AppColors.RedError
                    : AppColors.grayDark),
          )
        ],
      ),
    );
  }
}
