
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/reusable_widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/Theme App/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/doctor.png',
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo and Text Row
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.medical_services,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Diagnosis',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),

                  Spacer(),

                  Column(
                    children: [
                      CustomTextFormField(
                        hint: "Enter Your e-mail or Phone number",
                        suffixIcon: Icon(Icons.person),
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        filled: true,
                        borderColor: AppColors.whiteBackground,

                      ),
                      Gap(20),
                      CustomTextFormField(
                        hint: "Enter Your Password",
                        suffixIcon: Icon(Icons.person),
                        keyboardType: TextInputType.visiblePassword,
                        controller: password ,
                        filled: true,
                        borderColor: AppColors.whiteBackground,

                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}