import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_cubit.dart';
import 'package:diagnosis_project/Core/reusable_widgets/text_form_field_and_title.dart';
import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../../Core/reusable_widgets/two_button_row.dart';
import '../../../../../../Core/reusable_widgets/dialog_header.dart';

class RestPasswordDailog extends StatelessWidget {
  const RestPasswordDailog({super.key});

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
              const DialogHeader(title: 'Reste Password'),
              Gap(15.h),
               TextformFieldAndTitle(
                title: "Current Password",
                initialValue:'' ,
                 onChanged: (value){

                },
              ),
              Gap(8.h),
               TextformFieldAndTitle(
                title: "New Password",
                initialValue:'' ,
                onChanged: (value){

                },
              ),
              Gap(8.h),
               TextformFieldAndTitle(
                title: "Confirm Password",
                initialValue:'' ,
                onChanged: (value){

                },
              ),
              Gap(24.h),
              TwoButtonRow(
                primaryText: 'save',
                onPrimaryTap: () {},
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
