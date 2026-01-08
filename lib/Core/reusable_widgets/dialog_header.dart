import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

import '../Theme App/styleApp.dart';

class DialogHeader extends StatelessWidget {
  final String title;
  const DialogHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title,
          style: StyleApp.font24BlackBold.copyWith(color: AppColors.grayDark)),
    );
  }
}
