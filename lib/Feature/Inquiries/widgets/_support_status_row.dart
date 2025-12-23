
// ---------------- Status Row ----------------
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SupportStatusRow extends StatelessWidget {
  const SupportStatusRow();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: const [
        _StatusChip(text: '24/7 Support Available'),
        SizedBox(width: 8),
        _StatusChip(
            text: 'Average Response: 24–48 hours', icon: Icons.info_outline),
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
                height: 2),
          ),
        ],
      ),
    );
  }
}
