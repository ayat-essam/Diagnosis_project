import 'package:diagnosis_project/Feature/notifications/presentation/views/widgets/custom_appBar.dart';
import 'package:diagnosis_project/Feature/notifications/presentation/views/widgets/notification_item.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.h), child: const CustomAppBar()),
      body: const SafeArea(
          child: Column(
        children: [
          NotificationItem(
              icon: Icons.abc_outlined, title: 'nkjgyf', subtitle: 'ghfdfrsdtr')
        ],
      )),
    );
  }
}
