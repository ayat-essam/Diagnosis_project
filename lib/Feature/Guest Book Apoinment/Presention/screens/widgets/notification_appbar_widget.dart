
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationAppBarWdget extends StatelessWidget {
  const NotificationAppBarWdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.asset(
          "assets/image/notification_icon.png",
          width: 27.w,
          height: 27.h,
        ),
        Positioned(
          top: -10,
          right: -4,
          child: Container(
            width: 18.w,
            height: 18.h,
            decoration: BoxDecoration(
                color: AppColors.BluePrimary,
                borderRadius: BorderRadius.circular(8.r)),
            child: Center(
                child: Text(
              "5",
              style: StyleApp.font12WhiteRegular,
            )),
          ),
        )
      ],
    );
  }
}
