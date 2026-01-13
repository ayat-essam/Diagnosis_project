import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/Theme App/Fonts.dart';
import '../../../../Core/Theme App/colors.dart';

class MetricText extends StatelessWidget {
  final String title;
  final String value;
  final Color valueColor;
  final double? fontSize;

  const MetricText({
    super.key,
    required this.title,
    required this.value,
    required this.valueColor,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$title: ",
            style: TextStyle(
              fontSize: fontSize ?? 14.sp,
              fontWeight: Fonts.bold,
              color: AppColors.grayTextChart,
            ),
          ),
          TextSpan(
            text: value,
            style: TextStyle(
              fontSize: fontSize ?? 14.sp,
              fontWeight: Fonts.bold,
              color: valueColor,
            ),
          ),
        ],
      ),
    );
  }
}
