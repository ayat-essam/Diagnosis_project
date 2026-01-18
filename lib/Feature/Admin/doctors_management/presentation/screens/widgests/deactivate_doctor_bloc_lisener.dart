import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_management_state.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_mangement_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeactivateDoctorBlocLisener extends StatelessWidget {
  const DeactivateDoctorBlocLisener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<DoctorsManagementCubit, DoctorsManagementState>(
      listenWhen: (previous, current) =>
          current is DeactivateDoctorError ||
          current is DeactivateDoctorLoading ||
          current is DeactivateDoctorSuccess,
      listener: (context, state) {
        if (state is DeactivateDoctorLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is DeactivateDoctorSuccess) {
          Navigator.pop(context); //close loading dialog
          Navigator.pop(context); //close delet dialog
          context.read<DoctorsManagementCubit>().getDoctors();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Doctor Deactivated successfully'),
              backgroundColor: Colors.green,
            ),
          );
        } else if (state is DeactivateDoctorError) {
          Navigator.pop(context);
          Navigator.pop(context);
          context.read<DoctorsManagementCubit>().getDoctors();
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
