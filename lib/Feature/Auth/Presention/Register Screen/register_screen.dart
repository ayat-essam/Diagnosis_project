import 'package:diagnosis_project/Core/Routing/routes.dart';
import 'package:diagnosis_project/Feature/DashBoard/presention/dash_board.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../Core/Theme App/styleApp.dart';
import '../../../../core/Theme App/colors.dart';
import '../Login Screen/widgets/custom_button.dart';
import '../Login Screen/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({super.key, });


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  final formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();

  String? selectedGender;

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

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Text("Register",
                          style: StyleApp.font40whiteRegular,
                        )
                      ],
                    ),
                  ),

                  const Gap(78),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              CustomTextFormField(
                                hint: "First Name",
                                keyboardType: TextInputType.name,
                                controller: firstName,
                                filled: true,
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Please enter Your FirstName";
                                  }
                                  return null;
                                },
                                borderColor: AppColors.whiteBackground,
                                obscureText: false,
                          
                              ),
                              const Gap(20),
                              CustomTextFormField(
                                hint: "Last Name",
                                keyboardType: TextInputType.name,
                                controller: lastName,
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Please enter Your LastName";
                                  }
                                  return null;
                                },
                                filled: true,
                                borderColor: AppColors.whiteBackground,
                                obscureText: false,
                              ),
                              const Gap(20),
                              CustomTextFormField(
                                hint: "Enter Your e-mail ",
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Please enter Your e-mail";
                                  }if(!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)){
                                    return 'please enter email like *****@gmail.com';
                                  }
                                  return null;
                                },
                                borderColor: AppColors.whiteBackground,
                                filled: true,
                                obscureText: false,
                              ),
                              const Gap(20),
                              CustomTextFormField(
                                hint: "Enter Your Password",
                                keyboardType: TextInputType.visiblePassword,
                                controller: password ,
                                validator: (value) {
                                  if(value!.isEmpty || value == null){
                                    return "Please enter Your Password";
                                  }if(value.length > 8){
                                    return "please enter 8 numbers";
                                  }
                                  return null;
                                },
                                filled: true,
                                obscureText: true,
                          
                                borderColor: AppColors.whiteBackground,
                          
                              ),
                              const Gap(20),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: const Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: AppColors.whiteBackground
                                  ),
                                ),
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile<String>(
                                      title: const Text('Male',
                                          style: TextStyle(color: AppColors.whiteBackground)
                                      ),
                                      value: 'Male',
                                      groupValue: selectedGender,
                          
                                   activeColor: AppColors.whiteBackground,
                                    fillColor:  WidgetStateProperty.resolveWith((states) {
                                      if (states.contains(WidgetState.selected)) {
                                       return Colors.green;
                                          }
                                       return Colors.grey;
                                  }),
                                    onChanged: (value) {
                                     setState(() {
                                  selectedGender = value;
                                });
                                 },
                               ),
                                    ),
                                  Expanded(
                                    child: RadioListTile<String>(
                                      title:  Text('Female',
                                        textAlign: TextAlign.left,
                                        style: TextStyle(color: AppColors.whiteBackground,
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400
                          
                                        ),),
                                      value: 'Female',
                                      groupValue: selectedGender,
                                      activeColor: AppColors.whiteBackground,
                                      fillColor:  WidgetStateProperty.resolveWith((states) {
                                   if (states.contains(WidgetState.selected)) {
                                   return Colors.green;
                              }
                                 return Colors.grey;
                                      }),
                                      dense: true ,
                                      contentPadding: EdgeInsets.zero,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedGender = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(30),
                              CustomButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    if (selectedGender == null) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text("Please select your gender"),
                                        ),
                                      );
                                      return;
                                    }
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashBoard(),));
                                  }
                                },
                                text: "Register",
                              ),

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