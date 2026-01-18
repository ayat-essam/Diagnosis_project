import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FilterOption extends StatefulWidget {
  const FilterOption({super.key});

  @override
  State<FilterOption> createState() => _FilterOptionState();
}

class _FilterOptionState extends State<FilterOption> {
  String? selectedLocation = 'All';
  String? selectedExperience = '10+ years';
  String? selectedAvailability = 'Available';
  String? selectedRate = '5 stars';

  final List<String> locationOptions = ['All', 'Cairo', 'Alexandria', 'Giza'];
  final List<String> experienceOptions = [
    'All',
    '1-5 years',
    '5-10 years',
    '10+ years'
  ];
  final List<String> availabilityOptions = [
    'All',
    'Available',
    'Not Available'
  ];
  final List<String> rateOptions = ['All', '1-2 stars', '3-4 stars', '5 stars'];

  void _resetFilters() {
    setState(() {
      selectedLocation = null;
      selectedExperience = null;
      selectedAvailability = null;
      selectedRate = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          Image.asset(
            'assets/image/filters.png',
            height: 24.h,
          ),
          Text(
            'Filter:',
            style: StyleApp.font16BlackRegular
                .copyWith(color: AppColors.blackSecondary),
          ),
          Gap(5.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomDropdownButton(
                    items: locationOptions,
                    selectedValue: selectedLocation,
                    onChanged: (value) =>
                        setState(() => selectedLocation = value),
                    width: 120.w,
                    backgroundColor: AppColors.greyLight,
                    borderRadius: 16.r,
                  ),
                  Gap(5.w),
                  CustomDropdownButton(
                    items: experienceOptions,
                    selectedValue: selectedExperience,
                    onChanged: (value) =>
                        setState(() => selectedExperience = value),
                    width: 120.w,
                    backgroundColor: AppColors.greyLight,
                    borderRadius: 16.r,
                  ),
                  Gap(5.w),
                  CustomDropdownButton(
                    items: availabilityOptions,
                    selectedValue: selectedAvailability,
                    onChanged: (value) =>
                        setState(() => selectedAvailability = value),
                    width: 120.w,
                    backgroundColor: AppColors.greyLight,
                    borderRadius: 16.r,
                  ),
                ],
              ),
              Gap(5.h),
              Row(
                children: [
                  CustomDropdownButton(
                    items: rateOptions,
                    selectedValue: selectedRate,
                    onChanged: (value) => setState(() => selectedRate = value),
                    width: 120.w,
                    backgroundColor: AppColors.greyLight,
                    borderRadius: 16.r,
                  ),
                  Gap(5.w),
                  GestureDetector(
                    onTap: _resetFilters,
                    child: Padding(
                      padding: EdgeInsets.only(left: 4.w),
                      child: Text(
                        'Reset Filters',
                        style: StyleApp.font12WhiteMedium
                            .copyWith(color: AppColors.BluePrimary),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
