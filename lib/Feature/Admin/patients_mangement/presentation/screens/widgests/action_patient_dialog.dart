import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/admin_patient_profile.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/action_option.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/screens/widgests/action_patient_option.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/screens/widgests/delete_patient_dialog.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ActionPatientDialog extends StatelessWidget {
  const ActionPatientDialog({super.key, required this.id});
  final int id;
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
              ActionOption(
                title: 'view profile',
                image: 'assets/image/Eye.png',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AdminPatientProfile(id: id);
                  }));
                },
              ),
              Gap(5.h),
              ActionPatientOption(
                title: 'Delete patient',
                image: 'assets/image/deactivate.png',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const DeletePatientDialog());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
