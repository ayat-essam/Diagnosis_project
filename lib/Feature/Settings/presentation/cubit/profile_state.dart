import 'package:diagnosis_project/Core/error/error_model.dart';

class ProfileState {
  final String fullName;
  final String email;
  final String phoneNumber;

  final bool isLoading;
  final ErrorModel? errorModel;
  final bool isUpdated;

  ProfileState({
    this.fullName = '',
    this.email = '',
    this.phoneNumber = '',
    this.isLoading = false,
    this.errorModel,
    this.isUpdated = false,
  });

  ProfileState copyWith({
    String? fullName,
    String? email,
    String? phoneNumber,
    bool? isLoading,
    ErrorModel? errorModel,
    bool? isUpdated,
  }) {
    return ProfileState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isLoading: isLoading ?? this.isLoading,
      errorModel: errorModel,
      isUpdated: isUpdated ?? false,
    );
  }
}
