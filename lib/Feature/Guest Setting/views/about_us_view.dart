import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/widgets/guest_app_Bar.dart';
import 'package:diagnosis_project/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteBackground,
        body: Column(children: [
          guestAppBar(context, S.of(context).aboutUs),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 34,
                    ),
                    Text(
                      S.of(context).aboutUs_content,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 30,
                      style: const TextStyle(
                          fontFamily: 'Poppins',
                          letterSpacing: 0.1,
                          fontSize: 16,
                          color: Color(0xff646464),
                          height: 1.5,
                          fontWeight: FontWeight.w400),
                    ),
                  ]))
        ]));
  }
}
