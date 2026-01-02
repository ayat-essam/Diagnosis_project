import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Doctor/SettingDoctor/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';

class FollowUpNotesCard extends StatelessWidget {
  const FollowUpNotesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 14),
            const Text(
              'Follow-up Notes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            _noteItem(),
            const SizedBox(height: 12),
            _noteItem(),
          ],
        ),
      ),
    );
  }

  Widget _noteItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.BluePrimary,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 37, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dr. Chen – 12th Feb 2020',
              style: StyleApp.font15blackSecondryMedium,
            ),
            const SizedBox(height: 6),
            Text(
              'Patient reported mild headaches. Blood pressure is stable. Continue medication.',
              style: StyleApp.font15blackSecondryMedium.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
