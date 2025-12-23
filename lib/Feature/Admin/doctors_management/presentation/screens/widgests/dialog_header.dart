import 'package:flutter/material.dart';

import '../../../../../../Core/Theme App/styleApp.dart';

class DialogHeader extends StatelessWidget {
  final String title;
  const DialogHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(title, style: StyleApp.font18GrayDarkBold),
    );
  }
}