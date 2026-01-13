import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/screens/widgests/delete_patient_bloc_listener.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../../Core/reusable_widgets/two_button_row.dart';
import '../../../../../../Core/reusable_widgets/dialog_header.dart';

class DeletePatientDialog extends StatelessWidget {
  const DeletePatientDialog({super.key, required this.patientEntity});
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
              const DialogHeader(title: 'Delete patient'),
              Text(
                """Are you sure you want to block "${patientEntity.fullName} ? This will prevent them from accessing the system.""",
                style: StyleApp.font12BlackSemiBold
                    .copyWith(color: AppColors.grayDark),
              ),
              Gap(24.h),
              TwoButtonRow(
                primaryText: 'Delete',
                backgroundColor: AppColors.RedError,
                onPrimaryTap: () {
                  context
                      .read<PatientsMangementCubit>()
                      .deletePatient(patientEntity.id);
                },
                secondaryText: 'Cancel',
                onSecondaryTap: () => Navigator.pop(context),
              ),
              const DeletePatientBlocListener()
            ],
          ),
        ),
      ),
    );
  }
}
