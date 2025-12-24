import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:flutter/material.dart';

class LabTestItem extends StatelessWidget {
  final String date;

  const LabTestItem({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.BluePrimary,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/image/Document_Camera.png'),
              const SizedBox(width: 4),
              const Text(
                'CT Scan - Full Body',
                style: TextStyle(
                    fontSize: 8,
                    color: Color(0xff252525),
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            date,
            style: const TextStyle(
                fontSize: 8,
                color: Color(0xff252525),
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
