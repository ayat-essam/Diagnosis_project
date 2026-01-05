import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/gradient_border.dart';
import 'package:diagnosis_project/Feature/Settings/presentation/views/widgets/switch_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
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
              SvgPicture.asset(
                'assets/image_SVG/notification.svg',
                color: AppColors.BluePrimary,
                height: 27,
                width: 20,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "Notifications",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff505050),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          ListTile(
            contentPadding: EdgeInsets.only(left: 0, right: 8, bottom: 10),
            title: const Text(
              "Email Notifications",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff6B6B6B),
              ),
            ),
            subtitle: const Text(
              "Receive notifications via email",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xff6B6B6B),
              ),
            ),
            trailing: SwitchIcon(),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          ListTile(
            contentPadding:
                EdgeInsets.only(left: 0, right: 8, bottom: 42, top: 20),
            title: const Text(
              "SMS Notifications",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xff6B6B6B),
              ),
            ),
            subtitle: const Text(
              "Receive notifications via SMS",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 13,
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
