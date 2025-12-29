import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/text_form_field_and_title.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/two_button_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DetailsStep extends StatelessWidget {
  const DetailsStep({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextformFieldAndTitle(title: "Years of experience"),
        Gap(8.h),
        const TextformFieldAndTitle(title: "Date of Birth"),
        Gap(8.h),
        const TextformFieldAndTitle(title: "National ID"),
        Gap(15.h),
        TwoButtonRow(
          primaryText: 'Save',
          onPrimaryTap: onSave,
          secondaryText: 'Cancel',
          onSecondaryTap: onCancel,
        ),
      ],
    );
  }
}