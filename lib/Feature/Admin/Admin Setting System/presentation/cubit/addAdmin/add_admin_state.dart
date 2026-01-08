import 'package:diagnosis_project/Core/error/error_model.dart';

class AddAdminState {
  // Form Fields
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;

  // Status Fields
  final bool isLoading;
  final ErrorModel? errorModel;
  final String? successMessage;

  AddAdminState({
    this.userName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.phoneNumber = '',
    this.isLoading = false,
    this.errorModel,
    this.successMessage,
  });

  AddAdminState copyWith({
    String? userName,
    String? email,
    String? password,
    String? confirmPassword,
    String? phoneNumber,
    bool? isLoading,
    ErrorModel? errorModel,
    String? successMessage,
  }) {
    return AddAdminState(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isLoading: isLoading ?? this.isLoading,
      errorModel: errorModel,
      successMessage: successMessage,
    );
  }
}
