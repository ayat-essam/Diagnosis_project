
import 'package:diagnosis_project/Core/Routing/routes.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/reusable_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../core/Theme App/colors.dart';
import '../Login Screen/reusable_widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

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
                        hint: "First Name",
                        keyboardType: TextInputType.name,
                        controller: firstName,
                        filled: true,

                        borderColor: AppColors.whiteBackground,

                      ),
                      Gap(20),
                      CustomTextFormField(
                        hint: "Last Name",
                        keyboardType: TextInputType.name,
                        controller: lastName ,

                        filled: true,
                        borderColor: AppColors.whiteBackground,

                      ),
                      Gap(10),
                      CustomTextFormField(
                        hint: "Enter Your e-mail or Phone number",
                        suffixIcon: Icon(Icons.person),
                        keyboardType: TextInputType.emailAddress,
                        controller: email,
                        borderColor: AppColors.whiteBackground, filled: true,

                      ),
                      Gap(10),
                      CustomTextFormField(
                        hint: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        controller: password,
                        filled: true,
                        borderColor: AppColors.whiteBackground,

                      ),
                      Gap(10),
                      CustomTextFormField(
                        hint: "Confirm Password",
                        keyboardType: TextInputType.visiblePassword,
                        controller: confirmPassword,
                        filled: true,
                        borderColor: AppColors.whiteBackground,

                      ),
                      Gap(10),
                      CustomTextFormField(
                        hint: "Phone number",
                        keyboardType: TextInputType.phone,
                        controller: phone,
                        filled: true,
                        borderColor: AppColors.whiteBackground,

                      ),
                      Gap(43),
                      CustomButton(
                          onTap: () => Navigator.of(context).pushNamed(
                               Routers.HomePage,)
                          , text: "Sign Up"),
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