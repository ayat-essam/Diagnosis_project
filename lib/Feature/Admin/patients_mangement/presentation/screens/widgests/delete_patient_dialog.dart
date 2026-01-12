import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/presentation/cubit/patients_mangement_cubit.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../../Core/reusable_widgets/two_button_row.dart';
import '../../../../../../Core/reusable_widgets/dialog_header.dart';

class DeletePatientDialog extends StatelessWidget {
  const DeletePatientDialog({super.key});

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
              const DialogHeader(title: 'Delete patient'),
              Text(
                """Are you sure you want to block John Smith? This will prevent them from accessing the system.""",
                style: StyleApp.font12BlackSemiBold
                    .copyWith(color: AppColors.grayDark),
              ),
              Gap(24.h),
              TwoButtonRow(
                primaryText: 'Delete',
                backgroundColor: AppColors.RedError,
                onPrimaryTap: () {
                  //context.read<PatientsMangementCubit>().deletePatient();
                },
                secondaryText: 'Cancel',
                onSecondaryTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
