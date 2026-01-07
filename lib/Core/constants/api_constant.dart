class ApiConstants {
  static const String baseURL = 'http://diagnosis.runasp.net';

  static String resetPasswordURL = '$baseURL/Auth/change-password';
  static String forgetPasswordURL = '$baseURL/Auth/forget-password';
  static String changePasswordURL = '$baseURL/Auth/change-password';
  static const String login = '/Auth/Login';
  static const String register = 'Auth/register';
  static const String addDoctorEndPoint = '/DoctorManagement/add-doctor';
  static const String systemSettingsBase = '/SystemSettings';
  static const String addAdmin = '$systemSettingsBase/add-admin';
  static const String aiRateLimit = '$systemSettingsBase/ai/rate-limit';
  static const String doctorRateLimit = '$systemSettingsBase/doctor/rate-limit';
  static const String doctorWorkHours = '$systemSettingsBase//doctor/work-hours';
  static const String aiToggle = '$systemSettingsBase/ai/toggle';
  static const String sendMessage = '$systemSettingsBase/send-message';
  static const String outsideRequests = '$systemSettingsBase/outside-requests';
  static const String sendReply = '$systemSettingsBase/send-reply';
  static String getReply(int requestId) =>
      '$systemSettingsBase/$requestId/reply';
}
