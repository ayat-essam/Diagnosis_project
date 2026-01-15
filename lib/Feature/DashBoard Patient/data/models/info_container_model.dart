import 'package:flutter/material.dart';

class InfoContainerModel {
  final String title;
  final String subtitle;
  final String description;
  final String imgPath;

  InfoContainerModel({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.imgPath,
  });

  InfoContainerModel copyWith({
    String? subtitle,
  }) {
    return InfoContainerModel(
      title: title,
      subtitle: subtitle ?? this.subtitle,
      description: description,
      imgPath: imgPath,
    );
  }
}
