import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentsAddButton extends StatelessWidget {
  const AppointmentsAddButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 54.w,
      height: 54.h,
      child: FloatingActionButton(
        backgroundColor: AppColors.BluePrimary,
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 27.r,
        ),
      ),
    );
  }
}
