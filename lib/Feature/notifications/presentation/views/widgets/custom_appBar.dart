import 'package:diagnosis_project/core/Theme App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget {
  final bool showMenu;
  final VoidCallback? onMenuTap;
  final int notificationCount;

  const CustomAppBar({
    super.key,
    required this.showMenu,
    this.onMenuTap,
    required this.notificationCount,
    required bool showLogo,
    required String logoPath,
    required String appName,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.whiteBackground,
      elevation: 0,
      leading: showMenu
          ? IconButton(
              icon: const Icon(Icons.menu, color: Colors.black),
              onPressed: onMenuTap,
            )
          : null,
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Good Morning, Ahmed',
            style: TextStyle(
              color: Color(0xff404040),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Tuesday, November 18, 2025',
            style: TextStyle(
              color: Color(0xff505050),
              fontSize: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            SvgPicture.asset('assets/image_SVG/notification.svg'),
            if (notificationCount > 0)
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
                  child: Center(
                    child: Text(
                      notificationCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(width: 20),
        Container(
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.BluePrimary,
          ),
          child: const Center(
            child: Text(
              'A',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
