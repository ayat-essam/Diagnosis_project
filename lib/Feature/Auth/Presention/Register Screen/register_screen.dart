import 'package:diagnosis_project/Core/Routing/routes.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/reusable_widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../core/Theme App/colors.dart';
import '../Login Screen/reusable_widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {

  const RegisterScreen({Key? key, }) : super(key: key);


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
                  const Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.medical_services,
                          color: Colors.blue,
                        ),
                      ),
                      Gap(8),
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

                  const Gap(40),

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
                                suffixIcon: const Icon(Icons.person),
                                keyboardType: TextInputType.emailAddress,
                                controller: email,
                                validator: (value) {
                                  if(value == null || value.isEmpty){
                                    return "Please enter Your e-mail";
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
                                suffixIcon: const Icon(Icons.person),
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
                                    Navigator.of(context).pushNamed(Routers.HomePage);
                                  }
                                },
                                text: "Sign Up",
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