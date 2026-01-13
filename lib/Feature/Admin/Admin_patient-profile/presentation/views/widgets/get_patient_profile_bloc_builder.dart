import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/patient_profile_item.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_profile_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_management_state.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetPatientProfileBlocBuilder extends StatelessWidget {
  const GetPatientProfileBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientsMangementCubit, PatientsManagementState>(
      builder: (context, state) {
        if (state is GetPatientsLoading) {
          return Skeletonizer(
            enabled: true,
            child: PatientProfileItem(
              patientEntity: PatientProfileEntity.empty(),
            ),
          );
        } else if (state is GetPatientProfileError) {
          return Center(child: Text(state.message));
        } else if (state is GetPatientProfileSuccess) {
          final patientProfile = state.patientEntity;
          return PatientProfileItem(patientEntity: patientProfile);
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
