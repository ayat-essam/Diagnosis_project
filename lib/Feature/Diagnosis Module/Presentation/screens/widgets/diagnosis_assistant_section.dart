import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/Presentation/screens/widgets/diagnosis_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DiagnosisAssistantSection extends StatelessWidget {
  const DiagnosisAssistantSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Diagnosis Assistant",
              style: StyleApp.font20BlackMedium,
            ),
            Gap(
              10.h,
            ),
            DiagnosisTextFormField(
              hintText: 'Patient Symptoms....*',
              height: 100.h,
            ),
            Gap(
              10.h,
            ),
            DiagnosisTextFormField(
              hintText: 'Notes / Description*',
              height: 100.h,
            ),
            Gap(
              10.h,
            ),
            DiagnosisTextFormField(hintText: 'Diagnosis Title', height: 215.h),
            Gap(
              10.h,
            ),
            CustomAppButton(
              onTap: () {},
              text: 'Save diagnosis',
              borderRedius: 25.r,
            ),
            Gap(
              10.h,
            ),
            CustomAppButton(
              onTap: () {},
              text: 'Analyze with AI',
              borderRedius: 25.r,
            ),
          ],
        ),
      ),
    );
  }
}
