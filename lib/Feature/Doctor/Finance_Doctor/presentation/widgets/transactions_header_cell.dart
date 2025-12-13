import 'package:flutter/material.dart';
import '../../../../../Core/Theme App/colors.dart';

class TransactionsTableHeaderCell extends StatelessWidget {
  final String text;

  const TransactionsTableHeaderCell({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: Text(
        text,
        style: const TextStyle(
          fontFamily: 'Poppins',
          color: AppColors.graySecondary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
