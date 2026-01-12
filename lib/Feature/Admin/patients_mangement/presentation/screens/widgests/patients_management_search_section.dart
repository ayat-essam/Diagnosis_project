import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_dropdown_button.dart';
import '../../../../presention/Widgets/search_text_form_field.dart';

class PatientsManagementSearchSection extends StatefulWidget {
  const PatientsManagementSearchSection({super.key});

  @override
  State<PatientsManagementSearchSection> createState() =>
      _PatientsManagementSearchSectionState();
}

class _PatientsManagementSearchSectionState
    extends State<PatientsManagementSearchSection> {
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
                  context.read<PatientsMangementCubit>().getpatients(
                        search: value,
                        isActive: selectedStatus == 'Active',
                      );
                });
              },
            ),
            Gap(10.w),
            CustomDropdownButton(
              items: const ['Active', 'All','Deleted'],
              selectedValue: selectedStatus,
              onChanged: (value) {
                setState(() {
                  selectedStatus = value!;
                  context.read<PatientsMangementCubit>().getpatients(
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
