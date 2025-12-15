import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/notification_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BookApointmentAppBar extends StatelessWidget {
  const BookApointmentAppBar({
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
      title: Image.asset(
        "assets/image/logo.png",
        height: 38.h,
        width: 138.w,
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: NotificationAppBarWdget(),
        ),
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("assets/image/person.png"),
        )
      ],
    );
  }
}
