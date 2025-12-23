import 'package:flutter/material.dart';

class DiagnosisTemplatesModel {
  final String title;
  final Color backgroundImageColor;
 final Function() onTap;
  final String imgPath;

  DiagnosisTemplatesModel({
    required this.title,
    required this.backgroundImageColor,
    required this.onTap,
    required this.imgPath,
  });
}
