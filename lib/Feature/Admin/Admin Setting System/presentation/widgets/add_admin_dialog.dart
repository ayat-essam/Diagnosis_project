import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/reusable_widgets/dialog_header.dart';
import 'package:diagnosis_project/Core/reusable_widgets/text_form_field_and_title.dart';
import 'package:diagnosis_project/Core/reusable_widgets/two_button_row.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/cubit/add_admin_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/widgets/add_admin_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AddAdminDialog extends StatelessWidget {
  const AddAdminDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<AddAdminCubit>(),
        child: Builder(
          builder: (context) {
            final cubit = context.read<AddAdminCubit>();
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
                        const DialogHeader(title: "add Admin"),
                        Gap(15.h),
                        TextformFieldAndTitle(
                          title: "Username",
                          onChanged: cubit.onNameChanged,
                        ),
                        Gap(8.h),
                        TextformFieldAndTitle(
                          title: "Email",
                          onChanged: cubit.onEmailChanged,
                        ),
                        Gap(8.h),
                        TextformFieldAndTitle(
                          title: "Password",
                          onChanged: cubit.onPasswordChanged,
                        ),
                        Gap(8.h),
                        TextformFieldAndTitle(
                          title: "Confirm Password",
                          onChanged: cubit.onConfirmPasswordChanged,
                        ),
                        // Gap(8.h),
                        // TextformFieldAndTitle(
                        //   title: "phone Number",
                        //   onChanged: cubit.onConfirmPasswordChanged,
                        // ),
                        Gap(20.h),
                        TwoButtonRow(
                          primaryText: 'Save Changes',
                          onPrimaryTap: () {
                            cubit.addAdmin();
                          },
                          secondaryText: 'Cancel',
                          onSecondaryTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const AddAdminBlocListener()
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}
