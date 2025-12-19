import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Feature/Guest%20Setting/views/widgets/guest_app_Bar.dart';
import 'package:flutter/material.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteBackground,
        body: Column(children: [
          guestAppBar(context, 'Diagnosis'),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 34,
                    ),
                    Text(
                      'Diagnosis is a smart medical application created to simplify and enhance the healthcare experience for both patients and doctors. The app provides a secure and user-friendly platform that allows users to connect with qualified healthcare professionals, manage medical records, book appointments, and receive timely medical updates. Diagnosis also offers AI-powered medical consultation, helping users understand their symptoms at an initial level and guiding them toward the appropriate medical steps. By combining advanced technology with a user-centered design, Diagnosis aims to improve communication, support accurate diagnosis, and make healthcare services more accessible and efficient. Our mission is to deliver a reliable digital healthcare solution that contributes to better medical outcomes and a healthier community.',
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
