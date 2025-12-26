import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ClinicalFindingsSection extends StatelessWidget {
  const ClinicalFindingsSection({
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
          Text(
            "Clinical Findings",
            style: StyleApp.font14GrayMedium
                .copyWith(color: AppColors.OrangeWarning),
          ),
          Gap(
            3.h,
          ),
          Text(
            """Fasting Blood Glucose: 145 mg/dL (elevated) HbA1c: 7.2% (above normal range) BMI: 31.5 (obese) Blood Pressure: 138/88 mmHg (slightly elevated)""",
            style: StyleApp.font14graySecondaryRegular
                .copyWith(color: Colors.black),
          ),
          Gap(10.h),
          Align(
            alignment: Alignment.center,
            child: CustomAppButton(
              onTap: () {},
              text: 'Edit',
              width: 100.w,
              borderRedius: 25.r,
            ),
          ),
        ],
      ),
    ));
  }
}
