import 'package:diagnosis_project/Core/Theme%20App/Fonts.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../Core/Theme App/colors.dart';

class CameraBoxItem extends StatelessWidget {
  const CameraBoxItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey.shade700,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/image_SVG/camera.svg'),
            const Gap(8),
            CustomText(
                text: "Camera + AI Interface",
                fontSize: 20.sp,
                color: AppColors.greyLight,
                fontWeight: Fonts.medium)
          ],
        ),
      ),
    );
  }
}
