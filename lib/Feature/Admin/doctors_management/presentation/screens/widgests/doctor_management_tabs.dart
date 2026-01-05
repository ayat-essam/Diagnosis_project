import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../presention/Widgets/table_tab_option.dart';

class DoctorManagementTabs extends StatelessWidget {
  final bool isDoctorSelected;
  final Function(bool) onTabChanged;

  const DoctorManagementTabs({
    super.key,
    required this.isDoctorSelected,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => onTabChanged(true),
          child: TableTapOption(
            image: 'assets/image_SVG/doctor_diagnosis.svg',
            text: "Doctors Table",
            isActive: isDoctorSelected,
          ),
        ),
        Gap(20.w),
        GestureDetector(
          onTap: () => onTabChanged(false),
          child: TableTapOption(
            image: 'assets/image_SVG/help_requests.svg',
            text: 'Help Requests',
            isActive: !isDoctorSelected,
          ),
        ),
      ],
    );
  }
}
