import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';

class DoctorManagementHeader extends StatelessWidget {
  const DoctorManagementHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Doctor Management",
          style: StyleApp.font25grayDarkMedium,
        ),
        SizedBox(
          width: 250.w,
          child: Text(
            "Manage doctor accounts and monitor activity",
            style: StyleApp.font16graySecondaryRegular,
          ),
        ),
        Gap(20.h),
      ],
    );
  }
}