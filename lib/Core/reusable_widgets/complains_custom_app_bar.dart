import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme App/Fonts.dart';
import '../Theme App/colors.dart';

class ComplaintsCustomAppBar extends StatelessWidget {
  const ComplaintsCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Menu + greeting
            Row(
              children: [
                const Icon(Icons.menu, size: 26),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good morning, Ahmed",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: Fonts.semiBold,
                        fontFamily: 'Poppins',
                        color: AppColors.black,
                        height: 16 / 12,
                        letterSpacing: 0,
                      ),
                    ),

                  ],
                ),
              ],
            ),

            // Notifications + User Image
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Image.asset(
                      'assets/image/notification_icon.png',
                      width: 36,
                      height: 36,
                    ),


                    Positioned(
                      top: -4,
                      right: -4,
                      child: Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          color: AppColors.BluePrimary,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.white,
                            width: 1,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "5",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

                  ],
                )
                ,



                SizedBox(width: 14.w),
                const CircleAvatar(
                  backgroundColor: AppColors.BluePrimary,
                  radius: 20,
                  backgroundImage: AssetImage("assets/image/profile.png"),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
}
