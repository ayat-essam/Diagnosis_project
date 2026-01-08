import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/dialog_header.dart';
import 'package:diagnosis_project/Core/reusable_widgets/text_form_field_and_title.dart';
import 'package:diagnosis_project/Core/reusable_widgets/two_button_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ChangePasswordDialog extends StatelessWidget {
  const ChangePasswordDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        backgroundColor: AppColors.greyLight,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(20.h),
                const DialogHeader(title: 'Change Password'),
                Gap(15.h),
                TextformFieldAndTitle(
                  title: "Current Password",
                  initialValue: '',
                  onChanged: (value) {},
                ),
                Gap(17.h),
                TextformFieldAndTitle(
                  title: "New Password",
                  initialValue: '',
                  onChanged: (value) {},
                ),
                Gap(17.h),
                TextformFieldAndTitle(
                  title: "Confirm New Password",
                  initialValue: '',
                  onChanged: (value) {},
                ),
                Gap(20.h),
                TwoButtonRow(
                  primaryText: 'Change Password',
                  onPrimaryTap: () {},
                  secondaryText: 'Cancel',
                  onSecondaryTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
