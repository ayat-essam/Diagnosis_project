import 'dart:ui';

import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class MenuItemDataAdmin extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color imageColor;
  final VoidCallback? onTap;
  MenuItemDataAdmin(
      {required this.imageColor,
      required this.title,
      required this.imagePath,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          SvgPicture.asset(
            imagePath,
            height: 24,
            width: 24,
            color: imageColor,
          ),
          Gap(8),
          Text(
            title,
            style: title == "LogOut"
                ? const TextStyle(color: AppColors.RedError)
                : const TextStyle(color: AppColors.gray),
          )
        ],
      ),
    );
  }
}
