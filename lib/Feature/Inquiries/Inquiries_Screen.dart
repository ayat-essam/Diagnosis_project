import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'widgets/PrimaryButton.dart';
import 'widgets/SectionTitle.dart';
import 'widgets/StatusBadge.dart';
import 'widgets/_InquiryFormCard.dart';
import 'widgets/_StatusCard.dart';
import 'widgets/_SupportAppBar.dart';
import 'widgets/_TrackStatusSection.dart';
import 'widgets/_support_status_row.dart';

class InquiriesScreen extends StatelessWidget {
  const InquiriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F7FB),
      appBar: const SupportAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
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
        SectionTitle('Previous Replies'),
        SizedBox(height: 8),
        StatusCard(
          title: 'Long wait time at clinic',
          status: 'Replied',
          description:
              'We appreciate your understanding. As a gesture of goodwill, we\'d like to offer you priority scheduling for your next visit.',
          textButton: "View full conversation",
        ),
      ],
    );
  }
}
