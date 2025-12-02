
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/reusable_widgets/custom_button.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/reusable_widgets/custom_text_form_field.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Register%20Screen/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../Core/Routing/routes.dart';
import '../../../../Core/Theme App/Fonts.dart';
import '../../../../core/Theme App/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/image/doctor.png',
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
                  Container(
                    margin: EdgeInsets.all(70),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text("Log In",
                        style: StyleApp.font40whiteRegular,
                        )
                      ],
                    ),
                  ),

                  const Gap(24),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                      
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                hint: "Enter Your e-mail ",
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                filled: true,
                                obscureText: false,
                                validator: (value) {
                                  if((value == null || value.isEmpty)){
                                    return "Please enter Your e-mail";
                                  }if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                                    return 'please enter email like *****@gmail.com';
                                  }
                                  return null;
                                },
                          
                                borderColor: AppColors.whiteBackground,
                          
                              ),
                              const Gap(20),
                              CustomTextFormField(
                                hint: "Enter Your Password",
                                suffixIcon: const Icon(Icons.person),
                                keyboardType: TextInputType.visiblePassword,
                                controller: password ,
                                validator: (value) {
                                  if((value == null || value.isEmpty)){
                                    return "Please enter Your Password";
                                  }if(value.length > 8){
                                    return "please enter 8 numbers";
                                  }
                                  return null;
                                },
                                filled: true,
                                obscureText: true,
                          

                              ),
                              const Gap(10),
                             TextButton(
                                 onPressed: () =>
                                     Navigator.of(context).pushReplacementNamed(
                                         Routers.ResetPassword ),
                                 child: Text("Forget your Password"
                                 ,style: StyleApp.font16BlackRegular.copyWith(
                                       decoration: TextDecoration.underline),)),
                          
                              const Gap(60),
                              CustomButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    Navigator.of(context).pushNamed(Routers.HomePage);
                                  }
                                },
                                text: "Sign In",
                              ),
                              const Gap(8),
                          TextButton(
                              onPressed: () => Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => const RegisterScreen()),
                              ),
                              child: Text("Didn't Have an Account?",
                                style: StyleApp.font16BlackRegular.copyWith(
                                    decoration: TextDecoration.underline),)),
                            ],
                          ),
                        ),
                      ),
                    ),
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