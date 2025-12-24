import 'package:diagnosis_project/Feature/Doctor/SettingDoctor/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';

class PatientInfoCard extends StatelessWidget {
  const PatientInfoCard({super.key});

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
          children: [
            CircleAvatar(
              radius: 36,
              child: CircleAvatar(
                radius: 36,
                backgroundImage: AssetImage('assets/image/patientProfile.png'),
              ),
            ),
            const SizedBox(height: 10),

            // Name
            const Text(
              'Emily Williams',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Color(0xff252525),
              ),
            ),

            const SizedBox(height: 20),

            _infoRow('Gender', 'Female'),
            _infoRow('Phone Number', '+1 (555) 123-4567'),
            _infoRow('Patient ID', 'P-1001'),
            _infoRow('Last Visit', '2025-01-15'),
          ],
        ),
      ),
    );
  }

  Widget _infoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title :',
            style: const TextStyle(
                color: Color(0xff252525),
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
          Text(
            value,
            style: const TextStyle(
                color: Color(0xff252525),
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
