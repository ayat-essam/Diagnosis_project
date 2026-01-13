class UserSettingsEntity {
  final bool receiveEmailNotifications;
  final bool twoFactorEnabled;
  final String? profilePictureUrl;

  UserSettingsEntity({
    required this.receiveEmailNotifications,
    required this.twoFactorEnabled,
    this.profilePictureUrl,
  });
}
