import 'package:diagnosis_project/Feature/Settings/domain/entities/user_settings_entity.dart';

class UserSettingsModel extends UserSettingsEntity {
  UserSettingsModel({
    required super.receiveEmailNotifications,
    required super.twoFactorEnabled,
  });
  factory UserSettingsModel.fromJson(Map<String, dynamic> json) {
    return UserSettingsModel(
      receiveEmailNotifications: json['receiveEmailNotifications'],
      twoFactorEnabled: json['twoFactorEnabled'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "receiveEmailNotifications": receiveEmailNotifications,
      "twoFactorEnabled": twoFactorEnabled,
    };
  }
}
