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
    this.prefixIconPath,
    this.backgroundColor = AppColors.greyLight,
    this.borderColor = AppColors.BluePrimary,
  });
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;
  final double borderRadius;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final String? prefixIconPath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 38.h,
      padding: const EdgeInsets.only(left: 15, top: 4, bottom: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor,
        ),
      ),
      child: Row(
        children: [
          if (prefixIconPath != null)
            Image.asset(
              prefixIconPath!,
              height: 16.h,
              color: AppColors.gray74,
            ),
          Expanded(
            child: DropdownButtonHideUnderline(
              child: Theme(
                data: Theme.of(context).copyWith(
                  focusColor: AppColors.BluePrimary,
                ),
                child: DropdownButton<String>(
                  value: selectedValue,
                  onChanged: onChanged,
                  selectedItemBuilder: (context) {
                    return items.map((value) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(value,
                            style: borderColor == AppColors.BluePrimary
                                ? StyleApp.font13BlueSemiBold
                                : StyleApp.font12gray7ARegular),
                      );
                    }).toList();
                  },
                  items: items.map((String value) {
                    bool isSelected = value == selectedValue;
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,
                          style: isSelected
                              ? StyleApp.font12WhiteMedium
                              : StyleApp.font12gray7ARegular),
                    );
                  }).toList(),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: borderColor,
                  ),
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
