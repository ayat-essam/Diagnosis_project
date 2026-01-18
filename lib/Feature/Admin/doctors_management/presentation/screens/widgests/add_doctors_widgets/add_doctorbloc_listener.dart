import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/error_dialog.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDoctorblocListener extends StatelessWidget {
  const AddDoctorblocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddDoctorCubit, AddDoctorState>(
      listener: (context, state) {
        if (state.isLoading) {
          showDialog(
              context: context,
              builder: (context) => const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.BluePrimary,
                  )));
        }

        if (state.successMessage != null) {
          Navigator.of(context, rootNavigator: true).pop(true);

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(state.successMessage!),
                backgroundColor: AppColors.green),
          );
        }
        if (state.errorModel != null) {
          showErrorDialog(context, state.errorModel!);
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
