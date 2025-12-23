import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/widgets/input_field.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/widgets/setting_card_item.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/widgets/switchtile_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../../Core/Theme App/colors.dart';

class AiDiagnosisSettingsCard extends StatefulWidget {
  const AiDiagnosisSettingsCard({super.key});

  @override
  State<AiDiagnosisSettingsCard> createState() => _AiDiagnosisSettingsCardState();
}

class _AiDiagnosisSettingsCardState extends State<AiDiagnosisSettingsCard> {
  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return SettingsCard(
      title: 'AI Diagnosis Settings',
      subTitle: 'Configure AI-powered diagnosis features',
      icon: SvgPicture.asset(
        'assets/image_SVG/AiIcon.svg',
        width: 30,
        height: 30,
        colorFilter: const ColorFilter.mode(
          AppColors.BluePrimary,
          BlendMode.srcIn,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchTile(
              title: 'Enable AI Diagnosis',
              subtitle: 'Allow AI system to assist with\n medical diagnoses',
              value: isEnabled,
              onChanged: (bool value) {
                setState(() {
                  isEnabled = value;
                });
              },
            ),
            Gap(16.h),
            const InputField(
              title: 'Maximum AI Requests per Day',
              subTitle:
              'Limit the number of AI diagnosis requests allowed per day',
              hint: '100',
              helper: 'Recommended: 100–500 requests per day',
            ),
          ],
        ),
      ),
    );
  }
}
