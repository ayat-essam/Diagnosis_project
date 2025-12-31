import 'package:flutter/material.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/_support_status_row.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/_InquiryFormCard.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/_SupportAppBar.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/_TrackStatusSection.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/SubmitFunction.dart';
import 'package:diagnosis_project/Feature/Inquiries/widgets/_StatusCard.dart';

class InquiriesScreen extends StatelessWidget {
  const InquiriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF6F7FB),
      appBar: SupportAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SupportStatusRow(),
            SizedBox(height: 16),
            InquiryFormCard(),
            SizedBox(height: 24),
            TrackStatusSection(),
            SizedBox(height: 16),
            _PreviousRepliesSection(),
          ],
        ),
      ),
    );
  }
}

class _PreviousRepliesSection extends StatelessWidget {
  const _PreviousRepliesSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatusCard(
          title: 'Persistent wrist pain',
          status: 'Replied',
          description: '# TKT-2024-1156',
          textButton: "View details",
          onPressed: () {
            submitDialog(context);
          },
        ),
      ],
    );
  }
}
