import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_profile_entity.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PatientPersonalInfoCard extends StatelessWidget {
  const PatientPersonalInfoCard(
      {super.key, required this.patientProfileEntity});
  final PatientProfileEntity patientProfileEntity;
  @override
  Widget build(BuildContext context) {
    return GradientBorder(
      child: Container(
        padding:
            const EdgeInsets.only(top: 40, bottom: 20, left: 33, right: 33),
        decoration: BoxDecoration(
          color: const Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Skeleton.keep(
              child: Text(
                "Personal Information",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff505050),
                    fontFamily: 'Poppins'),
              ),
            ),
            const SizedBox(height: 15),
            infoRow("Full Name", patientProfileEntity.firstName),
            const SizedBox(height: 25),
            infoRow("Second Name", patientProfileEntity.lastName),
            const SizedBox(height: 25),
            infoRow("Email", patientProfileEntity.email),
            const SizedBox(height: 25),
            infoRow("Gender", patientProfileEntity.gender),
          ],
        ),
      ),
    );
  }

  Widget infoRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Skeleton.keep(
              child: Text(
                label,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff505050),
                    fontFamily: 'Poppins'),
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff747474),
                  fontFamily: 'Poppins'),
            ),
          ],
        ),
        const SizedBox(
          height: 9,
        ),
        const Divider(),
      ],
    );
  }
}
