import 'package:diagnosis_project/Core/DI/get_it.dart';
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/reusable_widgets/custom_app_bar_widget.dart';
import 'package:diagnosis_project/Feature/Doctor/Doctor_DashBoard/presentation/screens/widgets/slider_bar_doctor.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/cubit/user_settings_cubit.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/general_card.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/notification_card.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/profile_Setting_card.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/security_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SettingDoctorView extends StatelessWidget {
  const SettingDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<UserSettingsCubit>()..getUserSettings(),
      child: Scaffold(
        backgroundColor: AppColors.whiteBackground,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.h),
          child: const CustomAppBarWidget(),
        ),
        drawer: const SliderBarDoctor(),
        body: SingleChildScrollView(
            child: Column(
          children: [
            // Container(
            //   height: 3,
            //   color: Colors.grey[300],
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text(
                    "Settings",
                    style: StyleApp.font25blackbold
                        .copyWith(color: AppColors.grayDark),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                    "Manage your account preferences",
                    style: StyleApp.font16WhiteMedium
                        .copyWith(color: AppColors.gray6B),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ProfileSettingCard(),
                  const SizedBox(
                    height: 17,
                  ),
                  const SecurityCard(),
                  const SizedBox(
                    height: 17,
                  ),
                  const NotificationCard(),
                  const SizedBox(
                    height: 17,
                  ),
                  const GeneralCard()
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
