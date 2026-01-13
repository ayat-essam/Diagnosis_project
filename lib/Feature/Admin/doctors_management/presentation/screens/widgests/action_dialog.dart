import 'package:diagnosis_project/Feature/Admin/Admin_doctor_profile/presentation/views/admin_doctor-profile.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_entity.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/doctors_mangement_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/action_option.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/deactivate_dialog.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/screens/widgests/reset_password_dailog.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ActionDialog extends StatelessWidget {
  const ActionDialog({super.key, required this.doctorEntity});
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
              ActionOption(
                title: 'view profile',
                image: 'assets/image/Eye.png',
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AdminDoctorProfile(id: doctorEntity.id);
                  }));
                },
              ),
              Gap(5.h),
              ActionOption(
                title: 'Deactivate doctor',
                image: 'assets/image/deactivate.png',
                onTap: () {
                  Navigator.pop(context); // Close Action Dialog first
                  final cubit = context.read<
                      DoctorsManagementCubit>(); // get cubit from parent context

                  showDialog(
                    context: context,
                    builder: (_) => BlocProvider.value(
                      value: cubit,
                      child: DeactivateDialog(doctorEntity: doctorEntity),
                    ),
                  );
                },
              ),
              Gap(5.h),
              ActionOption(
                title: 'Rest Password',
                image: 'assets/image/reset_password.png',
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => const RestPasswordDailog());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
