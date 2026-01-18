import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_management_state.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/screens/widgests/patients_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetPatientsBlocBuilder extends StatelessWidget {
  const GetPatientsBlocBuilder({super.key});

  @override Widget build(BuildContext context) {
    return BlocBuilder<PatientsMangementCubit, PatientsManagementState>(
      builder: (context, state) {
        if (state is GetPatientsLoading) {
          return Skeletonizer(
            enabled: true,
            child: PatientsTable(
              patients: List.generate(5, (_) => PatientEntity.empty()),
            ),
          );
        } else if (state is GetPatientsSuccess) {
          if (state.patients.isEmpty) {
            return const Center(
              child: Text('No patients found.'),
            );
          }
          return PatientsTable(patients: state.patients);
        } else if (state is GetPatientsError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
