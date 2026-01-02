import 'package:diagnosis_project/Feature/Doctor/SettingDoctor/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: const Color(0xffF7F7F7),
        ),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.3,
          children: const [
            StatCard(
              title: 'Total Consultations',
              value: '124',
              image: 'assets/image/TotalConsultations.png',
            ),
            StatCard(
              title: 'AI-Assisted Consultations',
              value: '120',
              image: 'assets/image/AI-AssistedConsultations.png',
            ),
            StatCard(
              title: 'Doctor-Verified Diagnoses',
              value: '4',
              image: 'assets/image/Doctor-VerifiedDiagnoses.png',
            ),
            StatCard(
              title: 'Active Patients',
              value: '124',
              image: 'assets/image/ActivePatients.png',
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String image;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 144 / 103,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff565656)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(image),
            const SizedBox(height: 24),
            Text(title,
                style: TextStyle(
                    fontSize: 10.h,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                    color: Color(0xff565656))),
            const SizedBox(height: 1),
            Flexible(
              child: Text(value,
                  style: TextStyle(
                      fontSize: 16.h,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Poppins',
                      color: Color(0xff505050))),
            ),
          ],
        ),
      ),
    );
  }
}
