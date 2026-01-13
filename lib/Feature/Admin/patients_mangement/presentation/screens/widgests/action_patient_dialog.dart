import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/admin_patient_profile.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/action_option.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/screens/widgests/action_patient_option.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/screens/widgests/delete_patient_dialog.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ActionPatientDialog extends StatelessWidget {
  const ActionPatientDialog({super.key, required this.patientEntity});
  final PatientEntity patientEntity;
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
                    return AdminPatientProfile(id: patientEntity.id);
                  }));
                },
              ),
              Gap(5.h),
              ActionPatientOption(
                title: 'Delete patient',
                image: 'assets/image/deactivate.png',
                onTap: () {
                  Navigator.pop(context); // Close Action Dialog first
                  final cubit = context.read<
                      PatientsMangementCubit>(); // get cubit from parent context

                  showDialog(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: cubit,
                      child: DeletePatientDialog(patientEntity: patientEntity),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
