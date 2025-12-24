import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

class CustomSettingButton extends StatelessWidget {
  const CustomSettingButton(
      {super.key,
      this.onPressed,
      required this.buttonText,
      this.horizontalPadding,
      this.fontSize});
  final void Function()? onPressed;
  final String buttonText;
  final double? horizontalPadding;
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.BluePrimary,
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding ?? 27, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          )),
      child: Text(
        buttonText,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: fontSize ?? 16,
          fontWeight: FontWeight.w700,
          color: const Color(0xffFFFFFF),
        ),
      ),
    );
  }
}
