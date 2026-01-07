import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/constants/api_constant.dart';
import '../../../../../../Core/api/api_consumer.dart';
import '../../../../../../Core/error/exceptions.dart';
import 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this.apiConsumer)
      : super(ChangePasswordInitial());

  final ApiConsumer apiConsumer;

  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController =
      TextEditingController();
  final TextEditingController confirmNewPasswordController =
      TextEditingController();

  Future<void> changePassword() async {
    try {
      emit(ChangePasswordLoading());

      final response = await apiConsumer.post(
        ApiConstants.changePasswordURL,
        data: {
          "currentPassword": currentPasswordController.text.trim(),
          "newPassword": newPasswordController.text.trim(),
          "confirmNewPassword":
              confirmNewPasswordController.text.trim(),
        },
      );

      emit(
        ChangePasswordSuccess(
          message: response["message"] ??
              "Password changed successfully",
        ),
      );
    } on ServerException catch (e) {
      emit(
        ChangePasswordFailure(
          message: e.errorModel.errorMessage ??
              "Something went wrong",
        ),
      );
    }
  }

  @override
  Future<void> close() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmNewPasswordController.dispose();
    return super.close();
  }
}
