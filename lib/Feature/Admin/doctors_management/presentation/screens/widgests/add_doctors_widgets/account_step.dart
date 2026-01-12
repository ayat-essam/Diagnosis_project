import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_cubit.dart';
import 'package:diagnosis_project/Core/reusable_widgets/text_form_field_and_title.dart';
import 'package:diagnosis_project/Core/reusable_widgets/two_button_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AccountStep extends StatelessWidget {
  const AccountStep({
    super.key,
    required this.onNext,
    required this.onBack,
  });

  final VoidCallback onNext;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final cubit=context.read<AddDoctorCubit>();
    return Column(
      children: [
         TextformFieldAndTitle(
          title: "Password",
          initialValue: cubit.state.password,
           onChanged: (val) => cubit.onPasswordChanged(val),

        ),
        Gap(8.h),
         TextformFieldAndTitle(
          title: "Confirm Password",
         initialValue: cubit.state.confirmPassword ,
         onChanged: (val) => cubit.onConfirmPasswordChanged(val),
        ),
        Gap(15.h),
        TwoButtonRow(
          primaryText: 'Next',
          onPrimaryTap: onNext,
          secondaryText: 'Back',
          onSecondaryTap: onBack,
        ),
      ],
    );
  }
}