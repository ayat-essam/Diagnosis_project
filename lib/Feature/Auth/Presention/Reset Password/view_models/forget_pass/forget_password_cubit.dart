import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/constants/api_constant.dart';
import '../../../../../../Core/api/api_consumer.dart';
import '../../../../../../Core/error/exceptions.dart';
import 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(this.apiConsumer) : super(ForgetPasswordInitial());

  final ApiConsumer apiConsumer;

  final TextEditingController emailController = TextEditingController();

  Future<void> forgetPassword() async {
    try {
      emit(ForgetPasswordLoading());

      final response = await apiConsumer.post(
        ApiConstants.forgetPasswordURL,
        data: {
          "email": emailController.text.trim(),
          "clientUri": "https://diagnosisapp.com/reset-password",
        },
      );

      emit(
        ForgetPasswordSuccess(
          message: response["message"] ??
              "Password reset link has been sent to your email",
        ),
      );
    } on ServerException catch (e) {
      emit(
        ForgetPasswordFailure(
          error: e.errorModel.errorMessage ?? "Email not found",
        ),
      );
    }
  }

  @override
  Future<void> close() {
   // emailController.dispose();
    return super.close();
  }
}
