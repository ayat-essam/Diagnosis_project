import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/add_doctors_widgets/text_form_field_and_title.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/two_button_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class DetailsStep extends StatelessWidget {
  const DetailsStep({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddDoctorCubit>();
    return Column(
      children: [
        TextformFieldAndTitle(
          title: "Years of experience",
          initialValue: cubit.state.experienceYears,
          keyboardType: TextInputType.number,
          onChanged: (val) => cubit.onExperienceChanged(val)
        ),
        Gap(8.h),
        TextformFieldAndTitle(
          title: "Date of Birth",
          initialValue: cubit.state.birthDate.toString(),
          onChanged: cubit.onBirthDateChanged,
        ),
        Gap(8.h),
        TextformFieldAndTitle(
          title: "National ID",
          initialValue: cubit.state.nationalId,
          onChanged: cubit.onNationalIdChanged,
        ),
        Gap(15.h),
        TwoButtonRow(
          primaryText: 'Save',
          onPrimaryTap: onSave,
          secondaryText: 'Cancel',
          onSecondaryTap: onCancel,
        ),
      ],
    );
  }
}
