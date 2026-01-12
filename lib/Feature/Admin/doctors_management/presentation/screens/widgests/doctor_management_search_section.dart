import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_mangement_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_dropdown_button.dart';
import '../../../../presention/Widgets/search_text_form_field.dart';

class DoctorManagementSearchSection extends StatefulWidget {
  const DoctorManagementSearchSection({super.key});

  @override
  State<DoctorManagementSearchSection> createState() =>
      _DoctorManagementSearchSectionState();
}

class _DoctorManagementSearchSectionState
    extends State<DoctorManagementSearchSection> {
  String searchText = '';
  String selectedStatus = 'Active';
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
            SearchTextFormField(
              onChanged: (value) {
                setState(() {
                  context.read<DoctorsManagementCubit>().getDoctors(
                        search: value,
                        isActive: selectedStatus == 'Active',
                      );
                });
              },
            ),
            Gap(10.w),
            CustomDropdownButton(
              items: const ['Active', 'InActive'],
              selectedValue: selectedStatus,
              onChanged: (value) {
                setState(() {
                  selectedStatus = value!;
                  context.read<DoctorsManagementCubit>().getDoctors(
                        search: searchText,
                        isActive: selectedStatus == 'Active',
                      );
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
