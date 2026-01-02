import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../Core/Theme App/Fonts.dart';
import '../../../../../Core/Theme App/colors.dart';
import '../../../../../Core/reusable_widgets/custom_text.dart';

class SettingsCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final Widget icon;
  final Widget child;

  const SettingsCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.dateSloteColor,
            AppColors.BluePrimary,
          ],
        ),
      ),
      padding: const EdgeInsets.all(2),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.greyLight,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                icon,
                Gap(8.w),
                CustomText(
                  text: title,
                  fontSize: 20.sp,
                  color: AppColors.grayTextChart,
                  fontWeight: Fonts.bold,
                ),
              ],
            ),
            const Gap(8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: CustomText(
                text: subTitle,
                fontSize: 12.sp,
                color: AppColors.gratext,
                fontWeight: Fonts.medium,
              ),
            ),
            const Gap(12),
            child,
          ],
        ),
      ),
    );
  }
}
