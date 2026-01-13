import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_state.dart';
import 'package:diagnosis_project/Core/reusable_widgets/text_form_field_and_title.dart';
import 'package:diagnosis_project/Core/reusable_widgets/two_button_row.dart';
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextformFieldAndTitle(
            title: "Years of experience",
            initialValue: cubit.state.experienceYears,
            keyboardType: TextInputType.number,
            onChanged: (val) => cubit.onExperienceChanged(val)),
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
        Gap(8.h),
        Text(
          "Gender",
          style:
              StyleApp.font12BlackSemiBold.copyWith(color: AppColors.grayDark),
        ),
<<<<<<< HEAD
        BlocBuilder<AddDoctorCubit, AddDoctorState>(
          builder: (context, state) {
            return RadioGroup<String>(
              groupValue: cubit.state.gender,
              onChanged: (value) {
                if (value != null) {
                  cubit.onGenderChanged(value);
                }
              },
              child: Row(
                children: [
                  const Radio<String>(
                      value: 'Male', activeColor: AppColors.BluePrimary),
                  Text('Male',
                      style: StyleApp.font12BlackSemiBold
                          .copyWith(color: AppColors.grayDark)),
                  Gap(8.w),
                  const Radio<String>(
                      value: 'Female', activeColor: AppColors.BluePrimary),
                  Text(
                    'Female',
                    style: StyleApp.font12BlackSemiBold
                        .copyWith(color: AppColors.grayDark),
                  ),
                ],
              ),
            );
          },
        ),
=======
        // BlocBuilder<AddDoctorCubit, AddDoctorState>(
        //   builder: (context, state) {
        //     return RadioGroup<String>(
        //       groupValue: cubit.state.gender,
        //       onChanged: (value) {
        //         if (value != null) {
        //           cubit.onGenderChanged(value);
        //         }
        //       },
        //       child: Row(
        //         children: [
        //           const Radio<String>(
        //               value: 'Male', activeColor: AppColors.BluePrimary),
        //           Text('Male',
        //               style: StyleApp.font12BlackSemiBold
        //                   .copyWith(color: AppColors.grayDark)),
        //           Gap(8.w),
        //           const Radio<String>(
        //               value: 'Female', activeColor: AppColors.BluePrimary),
        //           Text(
        //             'Female',
        //             style: StyleApp.font12BlackSemiBold
        //                 .copyWith(color: AppColors.grayDark),
        //           ),
        //         ],
        //       ),
        //     );
        //   },
        // ),
>>>>>>> b59bc0e0c30810bbf52f75671c3352d782c29bc0
        Gap(8.h),
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
