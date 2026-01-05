import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/add_doctors_widgets/custom_text_form_field.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TextformFieldAndTitle extends StatelessWidget {
  const TextformFieldAndTitle({
    super.key,
    required this.title,
    required this.onChanged,
    required this.initialValue,
    this.keyboardType,

  });
  final String title;
  final String initialValue;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              StyleApp.font16BlueSemiBold.copyWith(color: AppColors.gray6B),
        ),
        Gap(8.h),
        CustomTextFormFieldWidget(
          borderRedius: 14.r,
          onChanged: onChanged,
          keyboardType: keyboardType,
          initialValue: initialValue,
        ),
      ],
    );
  }
}
