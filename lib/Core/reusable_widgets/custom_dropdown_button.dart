import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButton extends StatelessWidget {
  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.borderRadius = 12,
    this.width = double.infinity,
    this.backgroundColor = AppColors.greyLight,
  });
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final double borderRadius;
  final double width;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 38.h,
      padding: const EdgeInsets.only(left: 15,top: 5,bottom: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: AppColors.BluePrimary,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedValue,
          onChanged: onChanged,
          items: items.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: backgroundColor == AppColors.BluePrimary
                    ? StyleApp.font14BlueSemiBold
                        .copyWith(color: AppColors.whiteBackground)
                    : StyleApp.font14BlueSemiBold,
              ),
            );
          }).toList(),
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.BluePrimary,
          ),
          isExpanded: true,
          style: backgroundColor == AppColors.BluePrimary
              ? StyleApp.font14BlueSemiBold
                  .copyWith(color: AppColors.whiteBackground)
              : StyleApp.font14BlueSemiBold,
          dropdownColor: backgroundColor,
        ),
      ),
    );
  }
}
