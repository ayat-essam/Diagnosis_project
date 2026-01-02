import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Theme App/colors.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final List<String> _labels = const [
    'Home',
    'Services',
    'Doctors',
    'Settings',
  ];

  final List<IconData> _items = const [
    Icons.home_outlined,
    Icons.hub_outlined,
    Icons.add_box_outlined,
    Icons.settings_outlined,
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
              color: AppColors.black.withOpacity(0.15),
              blurRadius: 10,
              offset: const Offset(0, 6),
            )
          ],
        ),
        // child: Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     _navItem(
        //       index: 0,
        //       icon: Icons.home_outlined,
        //       label: "Home",
        //     ),
        //     _navItem(
        //       index: 1,
        //       icon: Icons.hub_outlined,
        //       label: "Explore",
        //     ),
        //     _navItem(
        //       index: 2,
        //       icon: Icons.medical_services_outlined,
        //       label: "Doctors",
        //       isCenter: true,
        //     ),
        //     _navItem(
        //       index: 3,
        //       icon: Icons.settings_outlined,
        //       label: "Settings",

//           color: const Color(0xFF4A8CFF),
//           borderRadius: BorderRadius.circular(40),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             _navItem(
//               index: 0,
//               icon: Icons.home_outlined,
//               label: "Home",
//             ),
//             _navItem(
//               index: 1,
//               icon: Icons.hub_outlined,
//               label: "Explore",
//             ),
//             _navItem(
//               index: 2,
//               icon: Icons.medical_services_outlined,
//               label: "Doctors",
//               isCenter: true,
//             ),
//             _navItem(
//               index: 3,
//               icon: Icons.settings_outlined,
//               label: "Settings",
        //     ),
        //   ],
        // ),
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
                  color:
                      isActive ? AppColors.whiteBackground : Colors.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [
                    Icon(
                      _items[index],
                      color: isActive
                          ? AppColors.BluePrimary
                          : AppColors.whiteBackground,
                    ),
                    if (isActive) ...[
                      SizedBox(width: 6.w),
                      Text(
                        _labels[index],
                        style: TextStyle(
                          color: AppColors.BluePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                    ]
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
