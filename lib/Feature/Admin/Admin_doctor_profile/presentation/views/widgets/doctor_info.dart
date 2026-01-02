import 'package:diagnosis_project/Feature/Doctor/SettingDoctor/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  const DoctorInfo({super.key});

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
            infoRow("Phone Number", "+20 101 234 5678"),
            const SizedBox(height: 25),
            infoRow("Gender", "Female"),
            const SizedBox(height: 25),
            infoRow("Date of birth", "May 5, 1999"),
            const SizedBox(height: 25),
            infoRow("Address", "123 Medical Street,\n Cairo, Egypt"),
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
