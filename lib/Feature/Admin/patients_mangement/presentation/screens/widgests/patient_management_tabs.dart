import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../presention/Widgets/table_tab_option.dart';

class PatientManagementTabs extends StatelessWidget {
  final bool isPatientSelected;
  final Function(bool) onTabChanged;

  const PatientManagementTabs({
    super.key,
    required this.isPatientSelected,
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
            image: 'assets/image_SVG/myPatientIcon.svg',
            text: "Patients Table",
            isActive: isPatientSelected,
          ),
        ),
        Gap(20.w),
        GestureDetector(
          onTap: () => onTabChanged(false),
          child: TableTapOption(
            image: 'assets/image_SVG/help_requests.svg',
            text: 'Help Requests',
            isActive: !isPatientSelected,
          ),
        ),
      ],
    );
  }
}
