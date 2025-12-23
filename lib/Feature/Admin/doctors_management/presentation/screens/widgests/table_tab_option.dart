import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class TableTapOption extends StatelessWidget {
  const TableTapOption(
      {super.key,
      this.isActive = false,
      required this.image,
      required this.text});
  final bool isActive;
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    final color = isActive ? AppColors.BluePrimary : AppColors.gray7A;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SvgPicture.asset(image, color: color),
            Gap(3.w),
            Text(
              text,
              style: isActive
                  ? StyleApp.font16BlueSemiBold
                  : StyleApp.font16BlueSemiBold
                      .copyWith(color: AppColors.gray7A),
            ),
          ],
        ),
        Gap(3.h),
        Container(
          width: 145.w,
          height: 1,
          color: color,
        )
      ],
    );
  }
}
