

import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_linear_gradiant_container.dart';
import 'package:flutter/material.dart';

class DiagnosisTextFormField extends StatelessWidget {
  const DiagnosisTextFormField({
    super.key,
    required this.hintText,
    required this.height,
  });
  final String hintText;
  final double height;
  @override
  Widget build(BuildContext context) {
    return CustomLinearGradiantContainer(
      color: AppColors.whiteBackground,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SizedBox(
          height: height,
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: StyleApp.font16graySecondaryRegular,
                fillColor: AppColors.whiteBackground,
                filled: true),
          ),
        ),
      ),
    );
  }
}
