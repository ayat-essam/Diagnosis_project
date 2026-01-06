import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/dialog_header.dart';
import 'package:diagnosis_project/Core/reusable_widgets/error_dialog.dart';
import 'package:diagnosis_project/Core/reusable_widgets/text_form_field_and_title.dart';
import 'package:diagnosis_project/Core/reusable_widgets/two_button_row.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/cubit/profile_cubit.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class EditProfileDialog extends StatelessWidget {
  const EditProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<ProfileCubit>()..getProfile(),
        child: BlocConsumer<ProfileCubit, ProfileState>(
          builder: (context, state) {
            final cubit = context.read<ProfileCubit>();
            if (state.isLoading && state.fullName.isEmpty) {
              return const Center(
                  child: CircularProgressIndicator(
                color: AppColors.BluePrimary,
              ));
            }
            return Dialog(
                backgroundColor: AppColors.greyLight,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(20.h),
                        const DialogHeader(title: "Edit Profile"),
                        Gap(15.h),
                        TextformFieldAndTitle(
                          title: "Full Name",
                          initialValue: state.fullName,
                          onChanged: cubit.onFullNameChanged,
                        ),
                        Gap(8.h),
                        TextformFieldAndTitle(
                          title: "Email Address",
                          initialValue: state.email,
                          onChanged: cubit.onEmailChanged,
                        ),
                        Gap(8.h),
                        TextformFieldAndTitle(
                          title: "Phone Number",
                          initialValue: cubit.state.phoneNumber,
                          onChanged: cubit.onPhoneChanged,
                        ),
                        Gap(20.h),
                        TwoButtonRow(
                          primaryText: 'Save Changes',
                          onPrimaryTap: () {
                            cubit.updateProfile();
                          },
                          secondaryText: 'Cancel',
                          onSecondaryTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ));
          },
          listener: (context, state) {
            if (state.isLoading) {
              showDialog(
                  context: context,
                  builder: (context) => const Center(
                          child: CircularProgressIndicator(
                        color: AppColors.BluePrimary,
                      )));
            }

            if (state.isUpdated) {
              Navigator.pop(context); //for close circle progress dialog
              Navigator.pop(context); //for  close edit profile dialog
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('profile updated successfully'),
                    backgroundColor: AppColors.green),
              );
            }
            if (state.errorModel != null) {
              showErrorDialog(context, state.errorModel!);
            }
          },
        ));
  }
}
