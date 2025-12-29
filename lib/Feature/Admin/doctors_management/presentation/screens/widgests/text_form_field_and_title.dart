
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/custom_text_form_field.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TextformFieldAndTitle extends StatelessWidget {
  const TextformFieldAndTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style:
              StyleApp.font12BlackSemiBold.copyWith(color: AppColors.grayDark),
        ),
        Gap(4.h),
         CustomTextFormFieldWidget(borderRedius: 14.r,),
      ],
    );
  }
}