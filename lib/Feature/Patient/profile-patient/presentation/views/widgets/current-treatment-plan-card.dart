import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Doctor/SettingDoctor/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';

class CurrentTreatmentPlanCard extends StatelessWidget {
  const CurrentTreatmentPlanCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Treatment Plan',
                style: StyleApp.font15blackSecondryMedium),
            const SizedBox(height: 12),
            Text("Doctor’s Instructions:",
                style: StyleApp.font15blackSecondryMedium),
            const SizedBox(height: 6),
            Text(
                'Patient is to continue with the prescribed medication and monitor blood sugar levels twice daily. Follow-up in 2 weeks.',
                style: StyleApp.font15blackSecondryMedium
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w400)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sessions', style: StyleApp.font15blackSecondryMedium),
                Text('Date', style: StyleApp.font15blackSecondryMedium),
                Text('Duration', style: StyleApp.font15blackSecondryMedium),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Heart Diseases',
                    style: StyleApp.font15blackSecondryMedium
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w400)),
                Text('202-01-15',
                    style: StyleApp.font15blackSecondryMedium
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w400)),
                Text('3 Months',
                    style: StyleApp.font15blackSecondryMedium
                        .copyWith(fontSize: 12, fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
