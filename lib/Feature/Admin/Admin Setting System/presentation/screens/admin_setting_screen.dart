import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_bar_widget.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_button.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/cubit/AI_Diagnosis_cubit/ai_diagnosis_settings_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/cubit/DoctorWork/doctor_work_cubit.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/widgets/add_admin_dialog.dart';
import 'package:diagnosis_project/Feature/Admin/presention/Widgets/slider_bar_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../../Core/Theme App/colors.dart';
import '../widgets/ai_diagnosis_setting_item.dart';
import '../widgets/doctor_work_setting_item.dart';
import '../widgets/important_note_item.dart';

class AdminSettingScreen extends StatefulWidget {
  const AdminSettingScreen({super.key});

  @override
  State<AdminSettingScreen> createState() => _AdminSettingScreenState();
}

bool isEnabled = true;

class _AdminSettingScreenState extends State<AdminSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<AiDiagnosisSettingsCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<DoctorWorkCubit>(),
        ),
      ],
      child: Scaffold(
          backgroundColor: AppColors.whiteBackground,
          drawer: const SliderBarAdmin(),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.h),
            child: const CustomAppBarWidget(),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'System Settings',
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    CustomAppButton(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AddAdminDialog(),
                        );
                      },
                      text: 'Add Admin',
                      width: 145.w,
                      prefixIcon: Icons.add,
                    )
                  ],
                ),
                Gap(4.h),
                Text(
                  'Configure system-wide rules and AI behavior',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                ),
                Gap(20.h),
                const AiDiagnosisSettingsCard(),
                Gap(16.h),
                const DoctorWorkSettingsCard(),
                Gap(16.h),
                const ImportantNoteCard(),
              ],
            ),
          )),
    );
  }
}
