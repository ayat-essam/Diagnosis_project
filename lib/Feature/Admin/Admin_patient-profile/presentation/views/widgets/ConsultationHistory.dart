import 'package:diagnosis_project/Feature/Admin/Admin_patient-profile/presentation/views/widgets/ConsultationCard.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';

class ConsultationHistory extends StatelessWidget {
  const ConsultationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
        child: Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xffF7F7F7),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Consultation history",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Color(0xff505050),
                fontFamily: 'Poppins'),
          ),
          SizedBox(height: 29),
          ConsultationCard(
            name: 'Sara Ahmed',
            diagnosis: 'Osteoarthritis',
            date: 'Dec 18, 2025',
            isAI: true,
          ),
          ConsultationCard(
            name: 'Sara Ahmed',
            diagnosis: 'Osteoarthritis',
            date: 'Dec 18, 2025',
            isInquire: true,
          ),
          ConsultationCard(
            name: 'Sara Ahmed',
            diagnosis: 'Osteoarthritis',
            date: 'Dec 18, 2025',
            isAI: true,
          ),
        ],
      ),
    ));
  }
}
