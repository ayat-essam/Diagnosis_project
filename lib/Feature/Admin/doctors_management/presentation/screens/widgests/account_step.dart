import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/text_form_field_and_title.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/two_button_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AccountStep extends StatelessWidget {
  const AccountStep({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextformFieldAndTitle(
          title: "Password",
        ),
        Gap(8.h),
        const TextformFieldAndTitle(
          title: "Confirm Password",
        ),
        Gap(15.h),
        TwoButtonRow(
          primaryText: 'Next',
          onPrimaryTap: onNext,
          secondaryText: 'Back',
          onSecondaryTap: onBack,
        ),
      ],
    );
  }
}