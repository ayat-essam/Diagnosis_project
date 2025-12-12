import 'package:diagnosis_project/Feature/Reports/presentation/views/widgets/report_item.dart';
import 'package:flutter/material.dart';

class ReportsGridView extends StatelessWidget {
  const ReportsGridView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 8,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
        crossAxisCount: 2,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return const ReportItem();
      },
    );
  }
}
