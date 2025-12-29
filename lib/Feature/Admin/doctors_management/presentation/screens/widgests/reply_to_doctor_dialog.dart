import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'custom_text_form_field.dart';
import 'dialog_actions.dart';
import 'dialog_header.dart';

class ReplyToDoctorDialog extends StatelessWidget {
  const ReplyToDoctorDialog({super.key});

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
              const DialogHeader(title: 'Subject'),
              CustomTextFormFieldWidget(
                hintText: 'subject',
                height: 30.h,
                maxLines: 2, 
              ),
              Gap(16.h),
              const DialogHeader(title: 'Details'),
              CustomTextFormFieldWidget(
                hintText: 'Details',
                height: 200.h,
                maxLines: 6,
              ),
              Gap(16.h),
              const DialogHeader(title: 'Reply'),
              CustomTextFormFieldWidget(
                hintText: 'Enter Your Reply',
                height: 100.h,
                maxLines: 3,
              ),
              Gap(24.h),
              const DialogActions(),
            ],
          ),
        ),
      ),
    );
  }
}