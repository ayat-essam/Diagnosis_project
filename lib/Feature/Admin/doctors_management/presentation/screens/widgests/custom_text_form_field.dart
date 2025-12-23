import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final String hintText;
  final double height;
  final int maxLines;
  const CustomTextFormFieldWidget(
      {super.key, required this.hintText, this.height = 50, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.gray74),
          borderRadius: BorderRadius.circular(8),
          color: AppColors.whiteBackground),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 5),
        child: SizedBox(
          height: height,
          child: TextFormField(
            maxLines: maxLines,
            style: StyleApp.font14GrayMedium.copyWith(color: AppColors.gray74),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: hintText,
                hintStyle: StyleApp.font14GrayMedium
                    .copyWith(color: Colors.grey.shade400),
                fillColor: AppColors.whiteBackground,
                filled: true),
          ),
        ),
      ),
    );
  }
}