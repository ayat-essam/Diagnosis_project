import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/cupertino.dart';

class BarChartLegand extends StatelessWidget {
  const BarChartLegand({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        BarLegendItem(
          color: AppColors.BluePrimary,
          text: 'symptomSeverity',
        ),
      ],
    );
  }
}

class BarLegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const BarLegendItem({super.key, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(fontSize: 10, color: color),
        ),
      ],
    );
  }
}
