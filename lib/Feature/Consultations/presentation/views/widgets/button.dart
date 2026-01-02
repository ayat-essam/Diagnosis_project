import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
    this.title, {
    super.key,
    this.color,
    this.textColor,
  });
  final Color? color;
  final Color? textColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              side: const BorderSide(color: Color(0xff666666)),
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          padding: const WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal: 5, vertical: 20)),
          backgroundColor: WidgetStatePropertyAll(color ?? Colors.white)),
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          color: textColor ?? Color(0xff666666),
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
