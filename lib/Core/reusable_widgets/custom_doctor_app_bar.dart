import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/notification_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CustomDoctorAppBar extends StatelessWidget {
  const CustomDoctorAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(65.h),
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.whiteBackground,
        title: Text(
          "Good Morning, Dr.Ahmed",
          style: StyleApp.font12BlackSemiBold,
        ),
        actionsPadding: EdgeInsets.only(right: 20.w),
        actions: const [
          NotificationAppBarWdget(),
          SizedBox(width: 5),
          CircleAvatar(
            radius: 18,
            backgroundImage: AssetImage("assets/image/profile.png"),
          )
        ],
      ),
    );
  }
}
