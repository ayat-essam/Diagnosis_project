
// ---------------- Status Row ----------------
import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SupportStatusRow extends StatelessWidget {
  const SupportStatusRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset("assets/image_SVG/doctor_diagnosis.svg",color: AppColors.BluePrimary, width: 25),
            Text(
              "24/7 Medical-oriented",
              style: TextStyle(color: Color(0xff207EFF)),
            ),
          ],
        ),

        Row(
          children: [
            Icon(Icons.info_outline, color: Color(0xff207EFF)),
            Text(
              "Average Response:\n 24–48 hours",
              style: TextStyle(color: Color(0xff207EFF)),
            ),
          ],
        ),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String text;
  final IconData? icon;

  const _StatusChip({required this.text, this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xff207EFF)),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: Colors.blue),
            const SizedBox(width: 5),
          ],
          Text(
            text,
            maxLines: 2,
            softWrap: true,
            style: TextStyle(
              fontSize: icon != null ? 13.sp : 11.sp,
              color: Colors.blue,
              fontWeight: FontWeight.w400,
              overflow: TextOverflow.ellipsis,
              height: 2,
            ),
          ),
        ],
      ),
    );
  }
}
