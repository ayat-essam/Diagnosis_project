import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  const DetailsRow({super.key, required this.icon, required this.title});
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColors.grayE2,
          child:  Icon(
            icon,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 8),
         Text(title,style: StyleApp.font18WhiteMedium.copyWith(color: AppColors.blackSecondary),), // placeholder
      ],
    );
  }
}