import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Doctor/SettingDoctor/presentation/views/widgets/gradient_border.dart';
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

class ConsultationCard extends StatelessWidget {
  final String name;
  final String diagnosis;
  final String date;
  final bool isAI;
  final bool isInquire;

  const ConsultationCard({
    required this.name,
    required this.diagnosis,
    required this.date,
    this.isAI = false,
    this.isInquire = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: 29, bottom: 12, left: 12, right: 10),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          border: Border.all(color: const Color(0xff565656), width: 1)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff505050),
                fontSize: 13,
                fontFamily: 'Poppins'),
          ),
          Text(
            diagnosis,
            style: const TextStyle(
                fontWeight: FontWeight.w400,
                color: Color(0xff6B6B6B),
                fontSize: 10,
                fontFamily: 'Poppins'),
          ),
          const SizedBox(
            height: 21,
          ),
          if (isInquire)
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff009947)),
                    color: const Color.fromARGB(255, 178, 219, 178),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Inquire',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Spacer(),
                Text(date),
              ],
            ),
          if (isAI)
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 8.0),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.BluePrimary),
                    color: const Color(0xffC6D8FD),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'AI',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Spacer(),
                Text(
                  date,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Color(0xff6B6B6B),
                      fontSize: 9,
                      fontFamily: 'Poppins'),
                ),
              ],
            )
        ],
      ),
    );
  }
}
