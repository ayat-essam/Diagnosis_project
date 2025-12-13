import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/Theme App/colors.dart';

class RequiredLabel extends StatelessWidget {
  final String text;

  const RequiredLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            height: 1.0,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 3),
        Text(
          "*",
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 16.sp,
            height: 1.0,
            color: AppColors.RedError,
          ),
        ),
      ],
    );
  }
}
