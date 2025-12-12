import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBarServices extends StatelessWidget {
  const CustomAppBarServices({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/image/logo.png',
          height: 70,
          width: 170,
        ),
        const Spacer(),
        Stack(clipBehavior: Clip.none, children: [
          Positioned(
            bottom: 12,
            left: 9,
            child: Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: AppColors.BluePrimary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(
                child: Text(
                  '5',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          SvgPicture.asset(
            'assets/image SVG/notification.svg',
          ),
        ]),
        const SizedBox(
          width: 20,
        ),
        ClipOval(
          child: Image.asset(
            'assets/image/profile.png',
            width: 36,
            height: 36,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          width: 8,
        )
      ],
    );
  }
}
