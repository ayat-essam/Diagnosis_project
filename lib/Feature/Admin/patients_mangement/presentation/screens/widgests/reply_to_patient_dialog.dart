import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/add_doctors_widgets/custom_text_form_field.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../../Core/reusable_widgets/two_button_row.dart';
import '../../../../../../Core/reusable_widgets/dialog_header.dart';

class ReplyToPatientDialog extends StatelessWidget {
  const ReplyToPatientDialog({super.key});

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
                height: 20.h,
                maxLines: 1,
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
              TwoButtonRow(
                primaryText: 'Send Reply',
                onPrimaryTap: () {},
                secondaryText: 'Cancel',
                onSecondaryTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
