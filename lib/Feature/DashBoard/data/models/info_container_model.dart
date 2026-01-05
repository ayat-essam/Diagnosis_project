import 'package:flutter/material.dart';

class InfoContainerModel {
  final String title;
  final String subtitle;
  final String description;
  final String imgPath;
  final bool isSelected;

  InfoContainerModel(
      {required this.title,
      required this.subtitle,
      required this.description,
      required this.imgPath,
      required this.isSelected});
}
