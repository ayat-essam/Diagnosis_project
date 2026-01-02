import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/widgets/clinical_findings_section.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/widgets/row_text.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
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
                    Text("Type 2 Diabetes Mellitus",
                        style: StyleApp.font16BlueSemiBold
                            .copyWith(color: AppColors.grayDark)),
                  ],
                ),
              ],
            ),
            Gap(9.h),
            Text(
              "Sypmtons",
              style: StyleApp.font14BlueSemiBold
                  .copyWith(fontWeight: FontWeight.w400),
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
            Gap(5.h),
            Text(
              "Suggested Medication",
              style: StyleApp.font14BlueSemiBold
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            Gap(3.h),
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
