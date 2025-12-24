import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'table_tab_option.dart';

class DoctorManagementTabs extends StatelessWidget {
  const DoctorManagementTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const TableTapOption(
          image: 'assets/image_SVG/doctor_diagnosis.svg',
          text: "Doctors Table",
          isActive: true,
        ),
        Gap(20.w),
        const TableTapOption(
          image: 'assets/image_SVG/help_requests.svg',
          text: 'Help Requests',
        ),
      ],
    );
  }
}