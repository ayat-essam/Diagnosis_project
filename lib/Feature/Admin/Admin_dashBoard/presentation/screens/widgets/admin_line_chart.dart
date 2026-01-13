import 'package:diagnosis_project/Core/reusable_widgets/line_chart_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../domain/entities/admin_dashboard_entity.dart';

// class AdminLineChart extends StatelessWidget {
//   const AdminLineChart({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return LineChartWidget(
//       lineBarsData: [
//         LineChartBarData(
//             spots: const [
//               FlSpot(0, 18),
//               FlSpot(1, 17.5),
//               FlSpot(2, 17),
//               FlSpot(3, 16.5),
//               FlSpot(4, 16),
//               FlSpot(5, 15.8),
//             ],
//             isCurved: true,
//             color: Colors.blue,
//             barWidth: 3,
//             isStrokeCapRound: true),
//         LineChartBarData(
//           spots: const [
//             FlSpot(0, 17),
//             FlSpot(1, 16.5),
//             FlSpot(2, 16),
//             FlSpot(3, 15.5),
//             FlSpot(4, 15),
//             FlSpot(5, 14.8),
//           ],
//           isCurved: true,
//           color: Colors.green,
//           barWidth: 3,
//         ),
//       ],
//       legendItems: const [
//         {'color': Colors.green, 'text': 'Doctor Diagnosis'},
//         {'color': Colors.blue, 'text': 'Ai Diagnosis'},
//       ],
//     );
//   }
// }

class AdminLineChart extends StatelessWidget {
  final List<DiagnosesOverTime> diagnosesOverTime;

  const AdminLineChart({super.key, required this.diagnosesOverTime});

  @override
  Widget build(BuildContext context) {
    return LineChartWidget(
      lineBarsData: [
        LineChartBarData(
          spots: List.generate(diagnosesOverTime.length, (i) {
            return FlSpot(
              i.toDouble(),
              diagnosesOverTime[i].doctorDiagnoses.toDouble(),
            );
          }),
          color: Colors.green,
          isCurved: true,
        ),
        LineChartBarData(
          spots: List.generate(diagnosesOverTime.length, (i) {
            return FlSpot(
              i.toDouble(),
              diagnosesOverTime[i].aiDiagnoses.toDouble(),
            );
          }),
          color: Colors.blue,
          isCurved: true,
        ),
      ],
      legendItems: const [
        {'color': Colors.green, 'text': 'Doctor Diagnosis'},
        {'color': Colors.blue, 'text': 'AI Diagnosis'},
      ],
    );
  }
}
