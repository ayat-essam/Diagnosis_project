import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/add_doctors_widgets/add_doctor_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';

class DoctorManagementHeader extends StatelessWidget {
  const DoctorManagementHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Doctor Management",
                style: StyleApp.font25grayDarkMedium,
              ),
              Text(
                "Manage doctor accounts and monitor activity",
                style: StyleApp.font16graySecondaryRegular,
              ),
            ],
          ),
        ),
        CustomAppButton(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const AddDoctorDialog(),
            );
          },
          text: 'Add doctor',
          width: 145.w,
          prefixIcon: Icons.add,
        )
      ],
    );
  }
}
