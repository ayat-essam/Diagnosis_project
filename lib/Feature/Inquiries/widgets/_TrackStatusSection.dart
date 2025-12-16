

// ---------------- Track Status ----------------
import 'package:diagnosis_project/Feature/Inquiries/widgets/SectionTitle.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/_StatusCard.dart';
import 'package:flutter/material.dart';

class TrackStatusSection extends StatelessWidget {
  const TrackStatusSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Track Status'),
        SizedBox(height: 8),
        StatusCard(
          title: 'Appointment was cancelled without notice',
          status: 'In progress',
          description: '# TKT-2024-1156',
          textButton: "View Details",
        ),
      ],
    );
  }
}