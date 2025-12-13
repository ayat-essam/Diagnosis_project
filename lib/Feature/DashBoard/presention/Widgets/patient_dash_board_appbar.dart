import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Guest%20Book%20Apoinment/Presention/screens/widgets/notification_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PationDashBoardAppbar extends StatelessWidget {
  const PationDashBoardAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.whiteBackground,
      surfaceTintColor: AppColors.whiteBackground,
      elevation: 5,
      shadowColor: AppColors.black.withOpacity(.8),
      leading: const Icon(Icons.menu, color: AppColors.black),
      title: Image.asset(
        "assets/image/logo2.png",
        height: 38.h,
        width: 138.w,
      ),
      actionsPadding: EdgeInsets.only(right: 20.w),
      actions: const [
        NotificationAppBarWdget(),
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/image/person.png"),
        )
      ],
    );
  }
}
