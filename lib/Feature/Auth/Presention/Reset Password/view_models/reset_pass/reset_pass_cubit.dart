import 'package:diagnosis_project/Feature/Auth/Presention/Reset%20Password/view_models/reset_pass/resete_pass_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/constants/api_constant.dart';
import '../../../../../../Core/api/api_consumer.dart';
import '../../../../../../Core/error/exceptions.dart';


class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.apiConsumer)
  
      : super(ResetPasswordInitial());

  final ApiConsumer apiConsumer;

  final TextEditingController passwordController =
      TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();



Future<void> resetPassword({
  required String token,
  required String email,
}) async {

 
    try {
      emit(ResetPasswordLoading());

      final response = await apiConsumer.post(
        ApiConstants.resetPasswordURL,
        data: {
          "password": passwordController.text.trim(),
          "passwordConfirmation":
              confirmPasswordController.text.trim(),
          "email": email,
          "token": token,
        },
      );

      emit(
        ResetPasswordSuccess(
          message: response["message"] ??
              "Password has been reset successfully",
        ),
      );
    } on ServerException catch (e) {
      emit(
        ResetPasswordFailure(
          errorMessage: e.errorModel.errorMessage ??
              "Invalid or expired token",
        ),
      );
    }
  }

  @override
  Future<void> close() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    return super.close();
  }
}
