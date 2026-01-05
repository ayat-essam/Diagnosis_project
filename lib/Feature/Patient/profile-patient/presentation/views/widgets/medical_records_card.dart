import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/gradient_border.dart';
import 'package:diagnosis_project/Feature/Patient/profile-patient/presentation/views/widgets/lab_test_Item.dart';
import 'package:diagnosis_project/Feature/Patient/profile-patient/presentation/views/widgets/treatment_button.dart';
import 'package:flutter/material.dart';

class MedicalRecordsCard extends StatelessWidget {
  const MedicalRecordsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffF7F7F7),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Medical Records',
              style: textStyle().copyWith(
                fontSize: 17,
                color: const Color(0xff252525),
              ),
            ),
            const SizedBox(height: 10),
            Text('Previous Diseases:', style: textStyle()),
            const SizedBox(height: 4),
            Text('Diabetes, Blood Disorders', style: textStyle()),
            const SizedBox(height: 4),
            Text('Disorders', style: textStyle()),
            const SizedBox(height: 10),
            Text('Allergies:', style: textStyle()),
            const SizedBox(height: 4),
            Text('Milk, Penicillin', style: textStyle()),
            const SizedBox(height: 40),
            Text(
              'Lab Tests',
              style: textStyle().copyWith(
                fontSize: 17,
                color: const Color(0xff252525),
              ),
            ),
            const SizedBox(height: 4),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LabTestItem(date: '13th Nov2025'),
                LabTestItem(date: '13th Nov2025'),
                LabTestItem(date: '13th Nov2025'),
              ],
            ),
            const SizedBox(height: 20),
            const TreatmentButton()
          ],
        ),
      ),
    );
  }

  TextStyle textStyle() {
    return const TextStyle(
      fontSize: 15,
      color: Color(0xff222222),
      fontWeight: FontWeight.w500,
      fontFamily: 'Poppins',
    );
  }
}
