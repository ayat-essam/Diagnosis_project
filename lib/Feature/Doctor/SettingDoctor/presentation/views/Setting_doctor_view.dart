import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Doctor/SettingDoctor/presentation/views/widgets/custom_appBar_setting.dart';
import 'package:diagnosis_project/Feature/Doctor/SettingDoctor/presentation/views/widgets/general_card.dart';
import 'package:diagnosis_project/Feature/Doctor/SettingDoctor/presentation/views/widgets/notification_card.dart';
import 'package:diagnosis_project/Feature/Doctor/SettingDoctor/presentation/views/widgets/profile_Setting_card.dart';
import 'package:diagnosis_project/Feature/Doctor/SettingDoctor/presentation/views/widgets/security_card.dart';
import 'package:flutter/material.dart';

class SettingDoctorView extends StatelessWidget {
  const SettingDoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(65), child: CustomAppBarSetting()),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 3,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 19,
                  ),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff252525),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Manage your account preferences",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff6B6B6B),
                    ),
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
