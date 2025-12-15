import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  final List<String> _labels = const [
    'Home',
    'Services',
    'Doctors',
    'Settings',
  ];

  final List<String> _items = const [
    'assets/image_SVG/homeIcon.svg',
    'assets/image_SVG/servicesIcon.svg',
    'assets/image_SVG/doctorBagIcon.svg',
    'assets/image_SVG/iconSetting.svg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      child: Container(
        height: 70.h,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: AppColors.BluePrimary,
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(_items.length, (index) {
            final isActive = index == currentIndex;

            return GestureDetector(
              onTap: () => onTap(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: EdgeInsets.symmetric(
                  horizontal: isActive ? 18.w : 12.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: isActive ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      _items[index],
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(
                        isActive ? AppColors.BluePrimary : Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    if (isActive) ...[
                      const Gap(6),
                      Text(
                        _labels[index],
                        style: TextStyle(
                          color: AppColors.BluePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
