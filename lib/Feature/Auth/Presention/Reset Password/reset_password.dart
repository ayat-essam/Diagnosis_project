import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../Login Screen/reusable_widgets/custom_text_form_field.dart';

class ResetPassword extends StatelessWidget {
   ResetPassword({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();
 final TextEditingController CreatePassword = TextEditingController();
 final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
              child: Image.asset("assets/image/doctor.png",
              fit: BoxFit.cover,)
          ),
          Positioned.fill(
              child: Container(
                color: AppColors.blackSecondary.withOpacity(0.5),
              ),
          ),
          SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Reset Password",
                          style: StyleApp.font40whiteRegular,),

                        ],
                      ),
                    ),
                    Gap(58.h),
                    Expanded(
                        child: SingleChildScrollView(
                          child: Container(
                            padding:  EdgeInsets.all(20),
                            child: Form(
                              key: formKey,
                              child: CustomTextFormField(
                                filled: true,
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                hint: "Enter Your e-mail",
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return "please enter your e-mail";
                                  }if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                                    return 'please enter email like *****@gmail.com';
                                  }
                                  return null;
                                },
                                controller: email,
                              ),
                             Gap(20.h),
                              CustomTextFormField(
                                filled: true,
                                obscureText: false,
                                keyboardType: TextInputType.emailAddress,
                                hint: "Enter Your e-mail",
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return "please enter your e-mail";
                                  }if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                                    return 'please enter email like *****@gmail.com';
                                  }
                                  return null;
                                },
                                controller: email,
                              ),

                            ),

                          ),
                        ),
                    )
                  ],
                ),
              ),
          )


    ]
    ),
    );
  }
}
