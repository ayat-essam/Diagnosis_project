import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../Core/Theme App/Fonts.dart';
import '../../../../../Core/Theme App/colors.dart';
import '../../../../../Core/reusable_widgets/custom_text.dart';

class InputField extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String hint;
  final String? helper;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final int maxLines;

  const InputField({
    super.key,
    required this.title,
    required this.hint,
    this.subTitle,
    this.helper,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: title,
          fontSize: 16.sp,
          color: AppColors.grayDark,
          fontWeight: Fonts.bold,
        ),
        if (subTitle != null) ...[
          Gap(4.h),
          CustomText(
            text: subTitle!,
            fontSize: 12.sp,
            color: AppColors.gratext,
            fontWeight: Fonts.medium,
          ),
        ],
        Gap(8.h),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
          ),
        ),
        if (helper != null) ...[
          Gap(4.h),
          CustomText(
            text: helper!,
            fontSize: 12.sp,
            color: AppColors.gratext,
            fontWeight: Fonts.medium,
          ),
        ],
      ],
    );
  }
}
