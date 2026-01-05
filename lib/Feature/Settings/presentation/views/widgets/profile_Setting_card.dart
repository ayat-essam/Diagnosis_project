import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/custom_setting_button.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/edit_profile_dialog.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/gradient_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileSettingCard extends StatelessWidget {
  const ProfileSettingCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
        child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.asset(
                  'assets/image/profile.png',
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
              Gap(20.w),
              const Text(
                "Profile Settings",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff505050),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 14,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Personal Information",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff6B6B6B),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              const Text(
                "Update your name, email, and profile details",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff6B6B6B),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: CustomSettingButton(
                  buttonText: 'Edit Profile',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const EditProfileDialog(),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
