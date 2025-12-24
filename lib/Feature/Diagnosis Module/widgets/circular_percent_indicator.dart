import 'package:flutter/material.dart';

class CircularPercentIndicator extends StatelessWidget {
  final double percent;

  const CircularPercentIndicator({super.key, required this.percent});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 44,
      height: 44,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircularProgressIndicator(
            value: percent,
            strokeWidth: 5,
            backgroundColor: Colors.grey.shade300,
            color: const Color(0xff4C84F7),
          ),
          Text(
            '${(percent * 100).round()} %',
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
