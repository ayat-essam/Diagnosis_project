import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_management_state.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Treatment/presentation/widgets/patientCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class patientData extends StatelessWidget {
  const patientData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PatientsMangementCubit,
        PatientsManagementState>(builder: (context, state) {
      if (state is GetPatientsLoading) {
        return const CircularProgressIndicator();
      }
      if (state is GetPatientsError) {
        return Text(state.message);
      }
      if (state is GetPatientsSuccess) {
        return PatientCard(patient: state.patients[1]);
      }
      return const SizedBox();
    });
  }
}