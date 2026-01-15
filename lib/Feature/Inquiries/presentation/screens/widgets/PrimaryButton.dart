import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isOutlined;
  final VoidCallback onPressed;

  const PrimaryButton({
    required this.text,
    required this.onPressed,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 150.w,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isOutlined ? Colors.white : Colors.blue,
            foregroundColor: isOutlined ? Colors.blue : Colors.white,
            elevation: 0,
            side: isOutlined ? const BorderSide(color: Colors.blue) : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          onPressed: () {
            onPressed();
          },
          child: Text(text),
        ),
      ),
    );
  }
}
