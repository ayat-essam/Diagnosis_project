import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FilterOption extends StatelessWidget {
  const FilterOption({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(children: [
        Image.asset(
          'assets/image/filters.png',
        ),
        Gap(3.w),
        Text(
          'Filter:',
          style: StyleApp.font16BlackRegular
              .copyWith(color: AppColors.blackSecondary),
        ),
        Gap(10.w),
        CustomAppButton(
          onTap: () {},
          text: 'Location',
          width: 85.w,
          backgroundColor: AppColors.greyLight,
          borderRedius: 16.r,
        ),
        Gap(5.w),
        CustomAppButton(
          onTap: () {},
          text: 'Experience',
          width: 85.w,
          backgroundColor: AppColors.greyLight,
          borderRedius: 16.r,
        ),
        Gap(5.w),
        CustomAppButton(
          onTap: () {},
          text: 'Availability',
          width: 85.w,
          backgroundColor: AppColors.greyLight,
          borderRedius: 16.r,
        ),
        Gap(5.w),
        CustomAppButton(
          onTap: () {},
          text: 'Rate',
          width: 85.w,
          backgroundColor: AppColors.greyLight,
          borderRedius: 16.r,
        ),
        Gap(5.w),
        Text(
          'Reset Filters',
          style: StyleApp.font12WhiteMedium
              .copyWith(color: AppColors.BluePrimary),
        ),
      ]),
    );
  }
}
