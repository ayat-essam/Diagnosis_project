import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentGreyContainer extends StatelessWidget {
  const AppointmentGreyContainer({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34.h,
      width: double.infinity,
      color: AppColors.grayF2,
      alignment: Alignment.center,
      child: Text(
        title,
        style: StyleApp.font14graySecondaryRegular,
      ),
    );
  }
}
