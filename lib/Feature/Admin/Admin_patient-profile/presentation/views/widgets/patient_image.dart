import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_profile_entity.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';

class PatientImage extends StatelessWidget {
  const PatientImage({super.key, required this.patientProfileEntity});
  final PatientProfileEntity patientProfileEntity;
  @override
  Widget build(BuildContext context) {
    return GradientBorder(
        child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffF7F7F7),
            ),
            child: Column(children: [
              const CircleAvatar(
                radius: 36,
                child: CircleAvatar(
                  radius: 36,
                  backgroundImage:
                      AssetImage('assets/image/patientProfile.png'),
                ),
              ),
              const SizedBox(height: 5),

              //first  Name
              Text(
                "${patientProfileEntity.firstName} ${patientProfileEntity.lastName}",
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                  color: Color(0xff747474),
                ),
              ),
              const SizedBox(height: 5),

              // email
              Text(
                patientProfileEntity.email,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                  color: AppColors.BluePrimary,
                ),
              ),
            ])));
  }
}
