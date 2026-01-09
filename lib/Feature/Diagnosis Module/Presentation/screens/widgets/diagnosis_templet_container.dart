
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:diagnosis_project/Feature/Diagnosis%20Module/data/models/diagnosis_templates_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DiagnocsisTempletContainer extends StatelessWidget {
  const DiagnocsisTempletContainer({
    super.key,
    required this.diagnosisTemplatesModel,
  });

  final DiagnosisTemplatesModel diagnosisTemplatesModel;

  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 2.h,
            children: [
              Row(
                children: [
                  Container(
                    width: 45.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: diagnosisTemplatesModel.backgroundImageColor,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Image.asset(
                      diagnosisTemplatesModel.imgPath,
                    ),
                  ),
                  Gap(12.h),
                  Text(
                    diagnosisTemplatesModel.title,
                    style: StyleApp.font20BlackMedium,
                  ),
                ],
              ),
              Gap(12.h),
              CustomAppButton(
                onTap: () {},
                text: 'Use Template',
                width: 140.w,
                borderRedius: 8.r,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
