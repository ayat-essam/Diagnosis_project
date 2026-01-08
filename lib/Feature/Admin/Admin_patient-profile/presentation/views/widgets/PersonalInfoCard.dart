import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';

class PersonalInfoCard extends StatelessWidget {
  const PersonalInfoCard({super.key});

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
            const Text(
              "Personal Information",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff505050),
                  fontFamily: 'Poppins'),
            ),
            const SizedBox(height: 15),
            infoRow("First Name", "Lisa"),
            const SizedBox(height: 25),
            infoRow("Second Name", "Thompson"),
            const SizedBox(height: 25),
            infoRow("Email", "123patient@email.com"),
            const SizedBox(height: 25),
            infoRow("Gender", "Female"),
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
            Text(
              label,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff505050),
                  fontFamily: 'Poppins'),
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
