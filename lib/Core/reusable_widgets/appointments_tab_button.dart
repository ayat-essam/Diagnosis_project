import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppointmentsTabButton extends StatelessWidget {
  const AppointmentsTabButton(
      {super.key,
      required this.title,
      required this.isSelected,
      required this.index,
      required this.onTap});
  final String title;
  final bool isSelected;
  final int index;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final List<Color> selectedColors = [
      AppColors.green, // زرار 1
      AppColors.orange, // زرار 2
      AppColors.RedError, // زرار 3
    ];
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.only(bottom: 10.h, top: 5.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isSelected ? selectedColors[index] : Colors.white,
                width: 4.w,
              ),
            ),
          ),
          child: Text(title, style: StyleApp.font14graySecondaryRegular),
        ),
      ),
    );
  }
}
