import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_entity.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/deactivate_doctor_bloc_lisener.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../../Core/reusable_widgets/two_button_row.dart';
import '../../../../../../Core/reusable_widgets/dialog_header.dart';

class DeactivateDialog extends StatelessWidget {
  const DeactivateDialog({super.key, required this.doctorEntity});
  final DoctorEntity doctorEntity;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.greyLight,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DialogHeader(title: 'Deactivate doctor?'),
              Text(
                """Are you sure you want to deactivate ${doctorEntity.fullName}? This will prevent them from accessing the system.""",
                style: StyleApp.font12BlackSemiBold
                    .copyWith(color: AppColors.grayDark),
              ),
              Gap(24.h),
              TwoButtonRow(
                primaryText: 'Deactivate',
                backgroundColor: AppColors.RedError,
                onPrimaryTap: () {
                  context
                      .read<DoctorsManagementCubit>()
                      .deaviteDoctor(doctorEntity.id);
                },
                secondaryText: 'Cancel',
                onSecondaryTap: () => Navigator.pop(context),
              ),
              const DeactivateDoctorBlocLisener(),
            ],
          ),
        ),
      ),
    );
  }
}
