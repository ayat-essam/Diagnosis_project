import 'package:flutter/material.dart';

class GradientBorder extends StatelessWidget {
  const GradientBorder({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    LinearGradient gradient = LinearGradient(
      colors: [
        Color(0xffC6D8FD),
        Color(0xff207EFF),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(1.7),
        child: child);
  }
}
