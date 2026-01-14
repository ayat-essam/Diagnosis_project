import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:gap/gap.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_text.dart';
import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';

class CustomBodyPartDropdown extends StatefulWidget {
  final Function(String?) onChanged;
  const CustomBodyPartDropdown({super.key, required this.onChanged});

  @override
  State<CustomBodyPartDropdown> createState() => _CustomBodyPartDropdownState();
}

class _CustomBodyPartDropdownState extends State<CustomBodyPartDropdown> {
  final List<String> exercises = [
    'Arm_Abduction',
    'Arm_VW',
    'Table_PushUps',
    'Leg_Abduction',
    'Leg_Lunge',
    'Squat',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Select Your Exercise",
            fontSize: 14.sp,
            color: AppColors.graySecondary,
            fontWeight: Fonts.bold,
          ),
          Gap(6.h),
          DropdownButtonFormField2<String>(
            value: selectedValue,

            hint: Text(
              "Select Your Exercise",
              style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
            ),
            items: exercises.map((String exercise) {
              return DropdownMenuItem<String>(
                value: exercise,
                child: CustomText(
                  text: exercise,
                  fontSize: 14.sp,
                  color: selectedValue == exercise
                      ? AppColors.BluePrimary
                      : Colors.black,
                ),

              );
            }).toList(),
            onChanged: (value) {
              setState(() => selectedValue = value);
              widget.onChanged(value);
            },

            // buttonStyleData: ButtonStyleData(
            //   height: 30.h,
            //   width: double.infinity,
            // ),

            dropdownStyleData: DropdownStyleData(
              offset: const Offset(0, -8),
              maxHeight: 220.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: AppColors.BluePrimary, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 20,
                    offset: Offset(0, 8.h),
                  ),
                ],
              ),

              elevation: 0,
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 36.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(
                horizontal: 14.w,
                vertical: 8.h,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.r),
                borderSide: const BorderSide(color: AppColors.BluePrimary, width: 1.5),
              ),
              hintStyle: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
              isDense: true,
            ),
          ),
        ],
      ),
    );
  }
}