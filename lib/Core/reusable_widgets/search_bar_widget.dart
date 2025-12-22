import 'package:flutter/material.dart';

import '../Theme App/colors.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.hintText});
final String hintText;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.BluePrimary),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(color: AppColors.grayE2),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.grayE2,

          ),
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 0,
          ),
        ),
      ),
    );
  }
}
