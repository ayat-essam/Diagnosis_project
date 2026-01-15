import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_management_state.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientAppBarTitle extends StatelessWidget {
  const PatientAppBarTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<PatientsMangementCubit>()..getpatients(),
      child: BlocBuilder<PatientsMangementCubit, PatientsManagementState>(
        builder: (context, state) {
          if (state is GetPatientsSuccess) {
            final patient = state.patients.first;
            return Row(
              children: [
                CircleAvatar(
                  backgroundImage: patient.profileImageUrl != null
                      ? NetworkImage(patient.profileImageUrl!)
                      : const AssetImage("assets/image/patientProfile.png")
                          as ImageProvider,
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(patient.fullName),
                    Text(
                      "Patient ID: ${patient.id}",
                      style: const TextStyle(
                          fontSize: 12, color: Color(0xff777777)),
                    ),
                  ],
                ),
              ],
            );
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                child: Image.asset("assets/image/patientProfile.png"),
              ),
              const Text(
                "Emily Williams",
                style: TextStyle(fontSize: 12),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                "Patient ID: #PAT-2025-0123",
                style: TextStyle(fontSize: 12, color: Color(0xff777777)),
              )
            ],
          );
        },
      ),
    );
  }
}
