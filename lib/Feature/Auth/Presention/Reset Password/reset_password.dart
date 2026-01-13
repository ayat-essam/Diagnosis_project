import 'package:diagnosis_project/Core/Theme%20App/colors.dart';
import 'package:diagnosis_project/Core/Theme%20App/styleApp.dart';
import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Feature/Auth/Presention/Login%20Screen/widgets/custom_button.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import '../../../../Core/api/dio_consumer.dart';
import '../Login Screen/widgets/custom_text_form_field.dart';
import 'cheack_password.dart';
import 'view_models/reset_pass/reset_pass_cubit.dart';
import 'view_models/reset_pass/resete_pass_state.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ApiConsumer>(
      create: (_) => DioConsumer(dio: Dio()),
      child: BlocProvider(
        create: (context) => ResetPasswordCubit(
          context.read<ApiConsumer>(),
        ),
        child: ResetPassword(),
      ),
    );
  }
}

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final formKey = GlobalKey<FormState>();

//  final TextEditingController email = TextEditingController();
  final TextEditingController createPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final uri = Uri.base;
    final token = uri.queryParameters['token'] ?? '';
    final email = uri.queryParameters['email'] ?? '';

    return BlocProvider(
        create: (_) => ResetPasswordCubit(context.read<ApiConsumer>()),
        child: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
            listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const CheckPassword(),
              ),
            );
          }

          if (state is ResetPasswordFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        }, builder: (context, state) {
          final cubit = context.read<ResetPasswordCubit>();
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
// <<<<<<< HEAD
// =======
                              Gap(20.h),
                              CustomTextFormField(
                                filled: true,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                hint: "Create A new Password",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please Create A new Password";
                                  }
                                  if (value.length > 8) {
                                    return 'please enter 8 numbers';
                                  }
                                  return null;
                                },
                                controller: createPassword,
                              ),
                              const Gap(20),
                              CustomTextFormField(
                                filled: true,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                hint: "confirm Password",
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please Write confirm Password";
                                  }
                                  if (value.length > 8) {
                                    return 'please enter 8 numbers';
                                  }
                                  if (createPassword.text !=
                                      confirmPassword.text) {
                                    return "sorry, passwords don't match ";
                                  }
                                  return null;
                                },
                                controller: confirmPassword,
                              ),
                              Gap(43.h),
                              CustomButton(
                                text: "Confirm",
                                onTap: () {
                                  if (formKey.currentState!.validate()) {}
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              CheckPassword()));
                                },
                              ),
// >>>>>>> Consultations-features
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
                                    // CustomTextFormField(
                                    //   filled: true,
                                    //   obscureText: false,
                                    //   keyboardType: TextInputType.emailAddress,
                                    //   hint: "Enter Your e-mail",
                                    //   validator: (value) {
                                    //     if (value == null || value.isEmpty) {
                                    //       return "please enter your e-mail";
                                    //     }
                                    //     if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                    //         .hasMatch(value)) {
                                    //       return 'please enter email like *****@gmail.com';
                                    //     }
                                    //     return null;
                                    //   },
                                    //   controller: email,
                                    // ),
                                    // Gap(20.h),
                                    CustomTextFormField(
                                      filled: true,
                                      obscureText: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      hint: "Create A new Password",
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "please Create A new Password";
                                        }
                                        if (value.length > 8) {
                                          return 'please enter 8 numbers';
                                        }
                                        return null;
                                      },
                                      controller: createPassword,
                                    ),
                                    const Gap(20),
                                    CustomTextFormField(
                                      filled: true,
                                      obscureText: true,
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      hint: "confirm Password",
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "please Write confirm Password";
                                        }
                                        if (value.length > 8) {
                                          return 'please enter 8 numbers';
                                        }
                                        if (createPassword.text !=
                                            confirmPassword.text) {
                                          return "sorry, passwords don't match ";
                                        }
                                        return null;
                                      },
                                      controller: confirmPassword,
                                    ),
                                    Gap(43.h),
                                    CustomButton(
                                      text: state is ResetPasswordLoading
                                          ? "Loading..."
                                          : "Confirm",
                                      onTap: () {
                                        if (formKey.currentState!.validate()) {
                                          cubit.passwordController.text =
                                              createPassword.text;
                                          cubit.confirmPasswordController.text =
                                              confirmPassword.text;

                                          cubit.resetPassword(
                                            token: token,
                                            email: email,
                                          );
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
