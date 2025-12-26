import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowText extends StatelessWidget {
  const RowText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.graySecondary,
          radius: 3.r,
        ),
        SizedBox(
          width: 10.w,
        ),
        Text(
          text,
          style: StyleApp.font16graySecondaryRegular
              .copyWith(color: Colors.black54),
        )
      ],
    );
  }
}
