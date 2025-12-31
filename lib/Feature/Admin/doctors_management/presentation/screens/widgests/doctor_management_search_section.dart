import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_dropdown_button.dart';
import '../../../../presention/Widgets/search_text_form_field.dart';

class DoctorManagementSearchSection extends StatefulWidget {
  const DoctorManagementSearchSection({super.key});

  @override
  State<DoctorManagementSearchSection> createState() => _DoctorManagementSearchSectionState();
}

class _DoctorManagementSearchSectionState extends State<DoctorManagementSearchSection> {
  String? selectedValue = 'All Status';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.greyLight, width: 3),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SearchTextFormField(),
            Gap(10.w),
            CustomDropdownButton(
              items: const ['All Status', 'Replyed', 'New'],
              selectedValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
              width: 140,
              borderColor: AppColors.gray74,
              prefixIconPath: 'assets/image/filters.png',
            )
          ],
        ),
      ),
    );
  }
}