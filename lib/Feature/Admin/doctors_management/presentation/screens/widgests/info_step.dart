import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/text_form_field_and_title.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/two_button_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InfoStep extends StatelessWidget {
  const InfoStep({
    super.key,
    required this.onNext,
    required this.onCancel,
  });

  final VoidCallback onNext;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextformFieldAndTitle(
          title: "Name",
        ),
        Gap(8.h),
        const TextformFieldAndTitle(
          title: "Email",
        ),
        Gap(8.h),
        const TextformFieldAndTitle(
          title: "Phone Number",
        ),
        Gap(8.h),
        const TextformFieldAndTitle(
          title: "Address",
        ),
        Gap(15.h),
        TwoButtonRow(
          primaryText: 'Next',
          onPrimaryTap: onNext,
          secondaryText: 'Cancel',
          onSecondaryTap: onCancel,
        ),
      ],
    );
  }
}