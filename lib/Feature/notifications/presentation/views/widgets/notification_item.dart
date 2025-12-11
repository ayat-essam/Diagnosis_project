import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/notifications/data/model/noitification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({
    super.key,
    required this.noitificationModel,
  });
  final NoitificationModel noitificationModel;
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
        decoration: BoxDecoration(
          color: const Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Color(0xff207EFF),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(noitificationModel.image1),
            const SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    noitificationModel.title,
                    style: StyleApp.font20BlackMedium,
                  ),
                  Text(noitificationModel.subtitle,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 12,
                          color: AppColors.blackSecondary,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            SvgPicture.asset(noitificationModel.image2),
          ],
        ));
  }
}

class GradientBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    final gradient = LinearGradient(
      colors: [Colors.blue, Colors.purple],
    );

    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2; // سمك الحد

    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(12));
    canvas.drawRRect(rrect, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
