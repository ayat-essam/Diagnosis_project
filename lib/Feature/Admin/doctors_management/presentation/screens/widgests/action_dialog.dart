import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/action_option.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/deactivate_dialog.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/reset_password_dailog.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ActionDialog extends StatelessWidget {
  const ActionDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.greyLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActionOption(
                title: 'view profile',
                image: 'assets/image/Eye.png',
                onTap: () {},
              ),
              Gap(5.h),
              ActionOption(
                title: 'Deactivate doctor',
                image: 'assets/image/deactivate.png',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const DeactivateDialog());
                },
              ),
              Gap(5.h),
              ActionOption(
                title: 'Rest Password',
                image: 'assets/image/reset_password.png',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const RestPasswordDailog());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
