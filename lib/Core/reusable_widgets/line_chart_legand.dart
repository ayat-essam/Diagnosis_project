import 'package:flutter/cupertino.dart';

class LineChartLegand extends StatelessWidget {
  final Color color;
  final String text;

  const LineChartLegand({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: color),
        ),
      ],
    );
  }
}
