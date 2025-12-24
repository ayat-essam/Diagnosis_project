import 'package:diagnosis_project/Core/reusable_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';
import '../../../../Core/reusable_widgets/custom_button.dart';
import '../screens/Ai_Performance_Measurement_Screen.dart';

class PhysioHeader extends StatelessWidget {
  const PhysioHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SvgPicture.asset(
              'assets/image_SVG/Physiotherapy.svg',
              color: AppColors.BluePrimary,
              width: 15.w,
              height: 15.h,
            ),
            Gap(10.w),
            CustomText(
                text: "Physiotherapy",
                fontSize: 22.sp,
                color: AppColors.grayTextChart,
                fontWeight: Fonts.bold)
          ],
        ),
        Gap(12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: CustomButton(
                  text: "Start AI-Based Measurement",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AIPerformanceScreen(),
                      ),
                    );
                  },
                  width: 100.w,
                  height: 40.h,
                  backgroundColor: AppColors.BluePrimary,
                  textColor: AppColors.whiteBackground),
            ),
            Gap(8.w),
            CustomText(
                text: "Active",
                fontSize: 12.sp,
                color: AppColors.BluePrimary,
                fontWeight: Fonts.bold)
          ],
        ),
      ],
    );
  }
}
