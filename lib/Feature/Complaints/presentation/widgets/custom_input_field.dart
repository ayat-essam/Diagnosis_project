import 'package:flutter/material.dart';
import '../../../../Core/Theme App/colors.dart';

class CustomInputField extends StatelessWidget {
  final int maxLines;

  const CustomInputField({super.key, this.maxLines = 1});

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.BluePrimary,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: AppColors.BluePrimary,
            width: 2,
          ),
        ),
      ),
    );
  }
}
