import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Theme App/Fonts.dart';
import '../Theme App/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.showMenu = false,
    this.showBack = false,
    this.onMenuTap,
    this.onBackTap,
    this.showNotification = true,
    this.notificationCount = 0,
    this.showProfile = true,
    this.rightWidget,
    this.showLogo = false,
    this.logoPath,
    this.appName,
  });

  final String? title;

  final bool showMenu;
  final bool showBack;

  final VoidCallback? onMenuTap;
  final VoidCallback? onBackTap;

  final bool showNotification;
  final int notificationCount;

  final bool showProfile;

  final Widget? rightWidget;

  final bool showLogo;
  final String? logoPath;
  final String? appName;


  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      color: AppColors.whiteBackground,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              Row(
                children: [
                  if (showMenu)
                    GestureDetector(
                      onTap: onMenuTap,
                      child: const Icon(Icons.menu, size: 26),
                    ),

                  if (showBack)
                    GestureDetector(
                      onTap: onBackTap ?? () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back_ios, size: 22),
                    ),

                  if (showMenu || showBack || showLogo) SizedBox(width: 10.w),

                  if (showLogo && logoPath != null && appName != null)
                    Row(
                      children: [
                        Image.asset(
                          logoPath!,
                          width: 51,
                          height: 38,
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          appName!,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: Fonts.semiBold,
                            fontFamily: 'Poppins',
                            color: AppColors.BluePrimary,
                          ),
                        ),
                      ],
                    )

                  else
                    if (title != null)
                      Text(
                        title!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: Fonts.semiBold,
                          fontFamily: 'Poppins',
                          color: AppColors.black,
                        ),
                      ),
                ],
              ),

              Row(
                children: [
                  if (rightWidget != null) rightWidget!,
                  if (showNotification)
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Image.asset(
                          'assets/image/notification_icon.png',
                          width: 36,
                          height: 36,
                        ),
                        if (notificationCount > 0)
                          Positioned(
                            top: -4,
                            right: -4,
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                color: AppColors.BluePrimary,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.white),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                notificationCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  if (showProfile) ...[
                    SizedBox(width: 14.w),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage("assets/image/profile.png"),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

}
