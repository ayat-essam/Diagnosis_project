import 'package:flutter/material.dart';
import '../../../../../Core/Theme App/colors.dart';

class TransactionsTableDataCell extends StatelessWidget {
  final String text;

  const TransactionsTableDataCell({
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
          color: AppColors.black,
        ),
      ),
    );
  }
}
