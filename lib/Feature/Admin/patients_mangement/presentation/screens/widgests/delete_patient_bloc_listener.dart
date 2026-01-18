import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_management_state.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeletePatientBlocListener extends StatelessWidget {
  const DeletePatientBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PatientsMangementCubit, PatientsManagementState>(
      listenWhen: (previous, current) =>
          current is DeletePatientsLoading ||
          current is DeletePatientSuccess ||
          current is DeletePatientError,
      listener: (context, state) {
        if (state is DeletePatientsLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is DeletePatientSuccess) {
          Navigator.pop(context); //close loading dialog
          Navigator.pop(context); //close delet dialog
          context.read<PatientsMangementCubit>().getpatients();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Patient deleted successfully'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is DeletePatientError) {
          Navigator.pop(context);
          Navigator.pop(context);
          context.read<PatientsMangementCubit>().getpatients();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: const SizedBox(),
    );
  }
}
