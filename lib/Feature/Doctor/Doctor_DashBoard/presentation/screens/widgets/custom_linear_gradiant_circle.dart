import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLinearGradiantCircle extends StatelessWidget {
  const CustomLinearGradiantCircle(
      {super.key, required this.image, this.color = AppColors.greyLight});
  final String image;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                AppColors.BluePrimary,
                AppColors.BluePrimary.withAlpha(70)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            )),
        child: Container(
          width: 30.w,
          height: 30.h,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  color,
                  color,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              )),
          child: Image.asset(image),
        ));
  }
}
