import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.title, required this.color, required this.style, this.padding });
  final String title;
  final Color color;
  final TextStyle style;
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style:  ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(color),
          padding: WidgetStatePropertyAll(
              EdgeInsets.symmetric(horizontal:padding?? 40.w))),
      child:  Text(
        title,
        style: style,
      ),
    );
  }
}
//Colors.blue
// "View details"