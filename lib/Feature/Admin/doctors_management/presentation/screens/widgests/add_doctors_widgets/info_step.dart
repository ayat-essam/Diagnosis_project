import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/add_doctors_widgets/text_form_field_and_title.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/two_button_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InfoStep extends StatelessWidget {
  const InfoStep({
    super.key,
    required this.onNext,
    required this.onCancel,
  });

  final VoidCallback onNext;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddDoctorCubit>();
    return Column(
      children: [
         TextformFieldAndTitle(
          title: "Name",
          initialValue: cubit.state.userName,
          onChanged: cubit.onNameChanged,
        ),
        Gap(8.h),
         TextformFieldAndTitle(
          title: "Email",
          initialValue: cubit.state.email,
      onChanged: (val) => cubit.onEmailChanged(val),
        ),
        Gap(8.h),
         TextformFieldAndTitle(
          title: "Phone Number",
          initialValue: cubit.state.phoneNumber,
          onChanged: cubit.onPhoneChanged,
        ),
        Gap(8.h),
         TextformFieldAndTitle(
          title: "Address",
          keyboardType: TextInputType.streetAddress,
          initialValue: cubit.state.address,
          onChanged: cubit.onAddressChanged,
        ),
        Gap(15.h),
        TwoButtonRow(
          primaryText: 'Next',
          onPrimaryTap: onNext,
          secondaryText: 'Cancel',
          onSecondaryTap: onCancel,
        ),
      ],
    );
  }
}