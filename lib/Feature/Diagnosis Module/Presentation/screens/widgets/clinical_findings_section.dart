import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ClinicalFindingsSection extends StatelessWidget {
  const ClinicalFindingsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Clinical Findings",
          style:
              StyleApp.font14BlueSemiBold.copyWith(fontWeight: FontWeight.w400),
        ),
        Gap(
          3.h,
        ),
        Text(
          """Fasting Blood Glucose: 145 mg/dL (elevated)\nHbA1c: 7.2% (above normal range)\nBMI: 31.5 (obese)\nBlood Pressure: 138/88 mmHg (slightly elevated)""",
          style:
              StyleApp.font14graySecondaryRegular.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
