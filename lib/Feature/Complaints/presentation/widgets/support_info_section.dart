import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Core/Theme App/colors.dart';

class SupportInfoSection extends StatelessWidget {
  const SupportInfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 5.h, vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.whiteBackground,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.BluePrimary, width: 1),
            ),
            child: Text(
              "24/7 Support Available",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.BluePrimary,
                height: 1.2,
              ),
            ),
          ),
        ),
        SizedBox(width: 5.w),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.h),
            decoration: BoxDecoration(
              color: AppColors.whiteBackground,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.BluePrimary, width: 1),
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/image_SVG/Iconography.svg",
                  width: 24.w,
                  height: 25.w,
                  color: AppColors.BluePrimary,
                ),
                Expanded(
                  child: Text(
                    "Average Response:\n24–48 hours",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.BluePrimary,
                      height: 1.2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
