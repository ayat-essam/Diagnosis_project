import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FilterResultItem extends StatelessWidget {
  const FilterResultItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: CustomLinearGradiantContainer(
          child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0,right: 10,left: 10,top: 10),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28.r,
              backgroundImage: const AssetImage('assets/image/profile.png'),
            ),
            Gap(10.w),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    'Dr jelen Kaya',
                    style: StyleApp.font10blackSecondryMedium,
                  ),
                  Gap(8.w),
                  Text(
                    '15 years experience',
                    style: StyleApp.font10blackSecondryMedium,
                  ),
                ],
              ),
              Gap(3.h),
              Row(
                children: [
                  Text(
                    'Physiotherapy',
                    style: StyleApp.font10blackSecondryMedium
                        .copyWith(color: AppColors.BluePrimary),
                  ),
                  Gap(8.w),
                  Text('Next Available : Fri, 8:00 PM',
                      style: StyleApp.font10blackSecondryMedium),
                ],
              ),
              Gap(3.h),
              Row(
                children: [
                  Text(
                    'New York',
                    style: StyleApp.font10blackSecondryMedium
                        .copyWith(color: AppColors.gratext),
                  ),
                  Gap(8.w),
                  const Icon(
                    Icons.star,
                    color: AppColors.OrangeWarning,
                    size: 15,
                  ),
                  Gap(2.w),
                  Text(
                    '4.9',
                    style: StyleApp.font10blackSecondryMedium
                        .copyWith(color: AppColors.OrangeWarning),
                  ),
                ],
              ),
            
            ])
          ],
        ),
      )),
    );
  }
}
