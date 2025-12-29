import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleItem extends StatelessWidget {
  const CircleItem({super.key, required this.index, required this.isActive});

  final int index;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 15.r,
      backgroundColor: isActive ? Colors.blue : AppColors.stepIndicatorGrey,
      child: Text(
        "${index + 1}",
        style: StyleApp.font16WhiteSemiBold,
      ),
    );
  }
}