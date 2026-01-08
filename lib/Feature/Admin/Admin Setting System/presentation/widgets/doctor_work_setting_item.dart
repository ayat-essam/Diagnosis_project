import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/cubit/DoctorWork/doctor_work_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/widgets/input_field.dart'
    show InputField;
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/widgets/setting_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import '../../../../../Core/Theme App/Fonts.dart';
import '../../../../../Core/Theme App/colors.dart';
import '../../../../../Core/reusable_widgets/custom_text.dart';

class DoctorWorkSettingsCard extends StatelessWidget {
  const DoctorWorkSettingsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => sl<DoctorWorkCubit>(),
        child: Builder(builder: (context) {
          final cubit = context.read<DoctorWorkCubit>();

          return SettingsCard(
            title: 'Doctor Work Settings',
            icon: SvgPicture.asset(
              'assets/image_SVG/doctorBagIcon.svg',
              width: 25,
              height: 25,
              colorFilter: const ColorFilter.mode(
                  AppColors.BluePrimary, BlendMode.srcIn),
            ),
            subTitle: 'Configure doctor workload and availability',
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InputField(
                    title: 'Maximum Diagnoses\n per Doctor per Day',
                    subTitle: 'Set workload limits to prevent doctor burnout',
                    hint: '30',
                    helper: 'Recommended: 100–500 requests per day',
                    controller: cubit.controller1,
                  ),
                  Gap(16.h),
                  CustomText(
                      text: 'Doctor Working Hours',
                      fontSize: 16.sp,
                      color: AppColors.grayDark,
                      fontWeight: Fonts.bold),
                  CustomText(
                      text:
                          'Set standard working hours for doctor availability',
                      fontSize: 12.sp,
                      color: AppColors.gratext,
                      fontWeight: Fonts.medium),
                  const Gap(15),
                  InputField(
                    title: 'Total Hours',
                    hint: '2 h',
                    controller: cubit.controller2,
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
