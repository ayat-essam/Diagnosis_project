import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EffectBar extends StatelessWidget {
  final String label;

  const EffectBar({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
                    const Icon(Icons.warning_amber, color: Colors.red, size: 18),
       
               const SizedBox(width: 6),

        Text(label),
         SizedBox(width: 30.w),
        Expanded(
          child: LinearProgressIndicator(
            value: 0.7,
            backgroundColor: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20),
            color: Colors.blue,
            minHeight: 6,
          ),
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
