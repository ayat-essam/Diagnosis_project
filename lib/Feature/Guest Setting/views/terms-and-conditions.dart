import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/widgets/guest_app_Bar.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteBackground,
        body: Column(children: [
          guestAppBar(context, 'Terms and Conditions'),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 34,
                    ),
                    Text(
                      'By using the Diagnosis application, you agree to these Terms and Conditions. Diagnosis is a digital medical platform that facilitates communication between users and healthcare providers, manages medical records, and allows appointment booking. The app also offers intelligent AI-powered consultations to help users gain an initial understanding of their health and support medical decision-making. Users should use the provided information responsibly and consult qualified professionals when needed to ensure optimal healthcare. We are committed to protecting user privacy and handling all personal and medical data in accordance with our Privacy Policy. Diagnosis reserves the right to modify or update these Terms and Conditions at any time, and continued use of the application constitutes acceptance of any changes.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 30,
                      style: TextStyle(
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
