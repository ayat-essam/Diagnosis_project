import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../Core/Theme App/colors.dart';
import '../../data/doctors_dummy_data.dart';

class DoctorsWidget extends StatelessWidget {
  const DoctorsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: doctors.length,
        separatorBuilder: (_, __) => Gap(12.w),
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
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
              width: 200.w,
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: AppColors.whiteBackground,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: Image.network(doctor.image,
                        width: 180.w, height: 90.h, fit: BoxFit.fill),
                  ),
                  Gap(8.h),
                  Text(doctor.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14.sp)),
                  Text(doctor.specialty,
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                  Gap(6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Gap(4.w),
                      Text(doctor.rating.toString()),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
