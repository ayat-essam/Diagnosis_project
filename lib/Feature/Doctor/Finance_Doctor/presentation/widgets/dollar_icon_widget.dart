import 'package:diagnosis_project/core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DollarIconWidget extends StatelessWidget {
  const DollarIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      right: 80,
      child: SizedBox(
        width: 44,
        height: 44,
        child: Stack(
          alignment: Alignment.center,
          children: [

            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    spreadRadius: -2,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
            ),
            ClipOval(
              child: Transform.scale(
                scale: 1.8,
                child: SvgPicture.asset(
                  'assets/image_SVG/dollarBg.svg',
                  width: 38,
                  height: 44,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Positioned(
              top: 8,
              child: SvgPicture.asset(
                'assets/image_SVG/dollar.svg',
                width: 26,
                height: 26,
                colorFilter: const ColorFilter.mode(
                  AppColors.BluePrimary,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
