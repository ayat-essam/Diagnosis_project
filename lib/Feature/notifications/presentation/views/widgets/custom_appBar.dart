import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteBackground,
      foregroundColor: Colors.black,
      elevation: 0,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning, Ahmed',
            style: TextStyle(
                color: Color(0xff404040),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          Text(
            'Tuesday, November 18, 2025',
            style: TextStyle(
                color: Color(0xff505050),
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
      actions: [
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
          SvgPicture.asset('assets/image SVG/notification.svg'),
        ]),
        const SizedBox(
          width: 20,
        ),
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
              shape: BoxShape.circle, color: AppColors.BluePrimary),
          child: const Center(
            child: Text(
              'A',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
