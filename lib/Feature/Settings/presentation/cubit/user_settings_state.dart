import 'package:diagnosis_project/Core/error/error_model.dart';

class UserSettingsState {
  final bool receiveEmailNotifications;
  final bool twoFactorEnabled;

  final bool isLoading;
  final ErrorModel? errorModel;
  final bool isUpdated;

  const UserSettingsState({
    this.receiveEmailNotifications = false,
    this.twoFactorEnabled = false,
    this.isLoading = false,
    this.errorModel,
    this.isUpdated = false,
  });

  UserSettingsState copyWith({
    bool? receiveEmailNotifications,
    bool? twoFactorEnabled,
    bool? isLoading,
    ErrorModel? errorModel,
    bool? isUpdated,
  }) {
    return UserSettingsState(
      receiveEmailNotifications:
          receiveEmailNotifications ?? this.receiveEmailNotifications,
      twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
      isLoading: isLoading ?? this.isLoading,
      errorModel: errorModel ?? this.errorModel,
      isUpdated: isUpdated ?? this.isUpdated,
    );
  }
}
