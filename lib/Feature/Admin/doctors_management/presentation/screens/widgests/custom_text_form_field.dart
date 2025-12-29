import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String? hintText;
  final double? height;
  final int maxLines;
  final double borderRedius;

  const CustomTextFormFieldWidget({
    super.key,
    this.hintText,
    this.height,
    this.maxLines = 1,
    this.borderRedius = 8,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      style: StyleApp.font14GrayMedium.copyWith(color: AppColors.gray74),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:
            StyleApp.font14GrayMedium.copyWith(color: Colors.grey.shade400),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        fillColor: AppColors.whiteBackground,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRedius),
          borderSide: const BorderSide(color: AppColors.gray74),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRedius),
          borderSide: const BorderSide(color: AppColors.BluePrimary),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRedius),
        ),
      ),
    );
  }
}
