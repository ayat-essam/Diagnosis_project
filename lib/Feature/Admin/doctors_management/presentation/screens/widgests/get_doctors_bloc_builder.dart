import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_entity.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_management_state.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/doctors_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetDoctorsBlocBuilder extends StatelessWidget {
  const GetDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorsManagementCubit, DoctorsManagementState>(
      builder: (context, state) {
        if (state is GetDoctorsLoading) {
          return Skeletonizer(
            enabled: true,
            child: DoctorsTable(
              doctors: List.generate(5, (_) => DoctorEntity.empty()),
            ),
          );
        } else if (state is GetDoctorsSuccess) {
          if (state.doctors.isEmpty) {
            return const Center(
              child: Text('No doctors found.'),
            );
          }
          return DoctorsTable(doctors: state.doctors);
        } else if (state is GetDoctorsError) {
          return Center(child: Text(state.message));
        }
        return const SizedBox();
      },
    );
  }
}
