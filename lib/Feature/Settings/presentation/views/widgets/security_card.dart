import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/change_password_dialog.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/custom_setting_button.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/gradient_border.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/switch_icon.dart';
import 'package:flutter/material.dart';

class SecurityCard extends StatelessWidget {
  const SecurityCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GradientBorder(
        child: Container(
      padding: const EdgeInsets.only(top: 14, left: 23),
      decoration: BoxDecoration(
        color: const Color(0xffF7F7F7),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(
                'assets/image/securityIcon.png',
              ),
              const SizedBox(
                width: 16,
              ),
              const Text(
                "Security ",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff505050),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Password",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff6B6B6B),
                  ),
                ),
                CustomSettingButton(
                  buttonText: 'Change Password',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => const ChangePasswordDialog(),
                    );
                  },
                  fontSize: 12,
                  horizontalPadding: 8,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          const Text(
            "Change your account password",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff6B6B6B),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0, right: 8, bottom: 29),
            title: const Text(
              "Two-Factor Authentication",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xff6B6B6B),
              ),
            ),
            subtitle: const Text(
              "Add an extra layer of security to your account",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color(0xff6B6B6B),
              ),
            ),
            trailing: SwitchIcon(),
          )
        ],
      ),
    ));
  }
}
