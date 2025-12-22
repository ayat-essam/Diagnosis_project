import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/widgets/custom_button.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Reset%20Password/reset_password.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../Core/api/dio_consumer.dart';
import '../Login Screen/widgets/custom_text_form_field.dart';
import 'view_models/forget_pass/forget_password_cubit.dart';
import 'view_models/forget_pass/forget_password_state.dart';

class ForgetPasswordPage extends StatelessWidget {
  const ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ApiConsumer>(
      create: (_) => DioConsumer(dio: Dio()),
      child: BlocProvider(
        create: (context) => ForgetPasswordCubit(
          context.read<ApiConsumer>(),
        ),
        child:  ForgetPassword(),
      ),
    );
  }
}




class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final formKey = GlobalKey<FormState>();

  final TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => ForgetPasswordCubit(context.read<ApiConsumer>()),
        child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
            listener: (context, state) {
          if (state is ForgetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Check your email to reset password"),
              ),
            );
          }

          if (state is ForgetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        }, builder: (context, state) {
          final cubit = context.read<ForgetPasswordCubit>();
          return Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/image/doctor.png",
                    fit: BoxFit.cover,
                  ),
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
                          margin: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Reset Password",
                                style: StyleApp.font40whiteRegular,
                              ),
                            ],
                          ),
                        ),
                        Gap(58.h),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Container(
                              padding: const EdgeInsets.all(20),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    CustomTextFormField(
                                        filled: true,
                                        obscureText: false,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        hint: "Enter Your e-mail",
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return "please enter your e-mail";
                                          }
                                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                              .hasMatch(value)) {
                                            return 'please enter email like *****@gmail.com';
                                          }
                                          return null;
                                        },
                                        controller: cubit.emailController),
                                    Gap(20.h),
                                    CustomButton(
                                      text: state is ForgetPasswordLoading
                                          ? "Loading..."
                                          : "Send Reset Link",
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.forgetPassword();
                                          // Navigator.pushReplacement(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //     builder: (context) =>
                                          //         ResetPasswordPage(
                                                
                                          //     ),
                                          //   ),
                                          // );
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
