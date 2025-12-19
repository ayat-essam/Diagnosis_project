import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/widgets/clinical_findings_section.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/widgets/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DiagnosisDetailsSection extends StatelessWidget {
  const DiagnosisDetailsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Diagnosis Details",
                      style: StyleApp.font20BlackMedium,
                    ),
                    Text(
                      "Type 2 Diabetes Mellitus",
                      style: StyleApp.font14graySecondaryRegular,
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "Sypmtons",
              style:
                  StyleApp.font14GrayMedium.copyWith(color: AppColors.RedError),
            ),
            const RowText(
              text: 'Increased thirst and frequent urination',
            ),
            const RowText(
              text: 'Unexplained weight loss',
            ),
            const RowText(
              text: 'Fatigue and weakness',
            ),
            const RowText(
              text: 'Blurred vision',
            ),
            const RowText(
              text: 'Slow-healing sores',
            ),
            Text(
              "Suggested Medication",
              style: StyleApp.font14GrayMedium.copyWith(color: AppColors.green),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text(
              """Metformin 500mg- Twice daily with meals
Glipizide 5mg - Once daily before breakfast
Atorvastatin 10mg - Once daily at bedtime""",
              style: StyleApp.font14graySecondaryRegular
                  .copyWith(color: Colors.black),
            ),
            Gap(24.h),
            const ClinicalFindingsSection()
          ],
        ),
      ),
    );
  }
}
