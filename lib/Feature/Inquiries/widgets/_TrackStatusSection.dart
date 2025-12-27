// ---------------- Track Status ----------------
import 'package:diagnosis_project/Feature/Inquiries/widgets/SectionTitle.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/_StatusCard.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/dialogCard.dart';
import 'package:flutter/material.dart';

class TrackStatusSection extends StatelessWidget {
  const TrackStatusSection({
    super.key,
    required this.inquiryId,
    required this.patientId,
  });
  final int inquiryId;
  final int patientId;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle('Track Status'),
        SizedBox(height: 8),
        StatusCard(
          title: 'Knee pain after running',
          status: 'In progress',
          description: '# TKT-2024-1156',
          textButton: "View Details",
          onPressed: () async {
            //  dialogProgress(context);
            dialogProgress(
              context,
              patientId: 1,
              inquiryId: inquiryId,
            );
          },
        ),
      ],
    );
  }
}
