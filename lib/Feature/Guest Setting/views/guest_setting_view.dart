import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Consultations/presentation/views/widgets/custom_appBar_Consultations.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/about_us_view.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/terms-and-conditions.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/widgets/setting_card.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/widgets/setting_item.dart';
import 'package:diagnosis_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class GuestSettingView extends StatelessWidget {
  const GuestSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteBackground,
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(65),
          child: CustomAppBarConsultations()),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              height: 3,
              color: Colors.grey[300],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 27,
                  ),
                  SettingText(
                    text: S.of(context).My_settings,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const SettingsCard(),
                  const SizedBox(
                    height: 24,
                  ),
                  SettingText(
                    text: S.of(context).Policies,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SettingItem(
                    image: 'assets/image/terms.png',
                    title: S.of(context).terms_and_conditions,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TermsAndConditionsView()),
                      );
                    },
                    size: 16,
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SettingText(
                    text: S.of(context).aboutUs,
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  SettingItem(
                    image: 'assets/image/about.png',
                    title: S.of(context).aboutUs,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AboutUsView()),
                      );
                    },
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class SettingText extends StatelessWidget {
  const SettingText({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: AppColors.BluePrimary,
      ),
    );
  }
}
