import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashedLine extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  const DashedLine({
    super.key,
    required this.color,
    this.dashWidth = 6,
    this.dashSpace = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      child: SizedBox(
        height: 1,
        child: CustomPaint(
          painter: _DashedLinePainter(
            color: color,
            dashWidth: dashWidth,
            dashSpace: dashSpace,
          ),
        ),
      ),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;

  _DashedLinePainter({
    required this.color,
    required this.dashWidth,
    required this.dashSpace,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashWidth, 0),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
