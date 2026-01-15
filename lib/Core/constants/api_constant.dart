class ApiConstants {
  static String baseURL = 'http://diagnosis.runasp.net';
  
  static String resetPasswordURL = '$baseURL/Auth/change-password';
  static String forgetPasswordURL = '$baseURL/Auth/forget-password';
  static String changePasswordURL = '$baseURL/Auth/change-password';
  static const String login = '/Auth/Login';
  static const String register = 'Auth/register';
  static const String addDoctorEndPoint = '/DoctorManagement/add-doctor';
  static const String getDoctorsEndPoint = '/DoctorManagement';
  static const String getDoctorProfileEndPoint = '/DoctorManagement/';
  static const String deactivateDoctorEndPoint = '/DoctorManagement//status/';
  static const String getPatientsEndPoint = '/PatientManagement';
  static const String getPatientProfileEndPoint = '/PatientManagement/';
  static const String deletePatientEndPoint = '/PatientManagement//status/';
  static const String systemSettingsBase = '/SystemSettings';
  static const String addAdmin = '$systemSettingsBase/add-admin';
  static const String aiRateLimit = '$systemSettingsBase/ai/rate-limit';
  static const String doctorRateLimit = '$systemSettingsBase/doctor/rate-limit';
  static const String doctorWorkHours =
      '$systemSettingsBase//doctor/work-hours';
  static const String aiToggle = '$systemSettingsBase/ai/toggle';
  static const String sendMessage = '$systemSettingsBase/send-message';
  static const String outsideRequests = '$systemSettingsBase/outside-requests';
  static const String sendReply = '$systemSettingsBase/send-reply';
  static String getReply(int requestId) =>
      '$systemSettingsBase/$requestId/reply';

  static const String consultationDetails =
      '/Consultation/details/{consultationId}';
  static const String consultationAccept =
      '/Consultation/accept/{consultationId}';
  static const String consultationRejected =
      '/Consultation/reject/{consultationId}';
  static const String consultationModify =
      '/Consultation/modify/{consultationId}';
}

class CacheConstants {
  static const String tokenKey = 'token';
}

class ApiErrors {
  static const String badRequestError = "badRequestError";
  static const String noContent = "noContent";
  static const String forbiddenError = "forbiddenError";
  static const String unauthorizedError = "unauthorizedError";
  static const String notFoundError = "notFoundError";
  static const String conflictError = "conflictError";
  static const String internalServerError = "internalServerError";
  static const String unknownError = "unknownError";
  static const String timeoutError = "timeoutError";
  static const String defaultError = "defaultError";
  static const String cacheError = "cacheError";
  static const String noInternetError = "noInternetError";
  static const String loadingMessage = "loading_message";
  static const String retryAgainMessage = "retry_again_message";
  static const String ok = "Ok";

  // static String resetPasswordURL = '$baseURL/Auth/change-password';
  // static String forgetPasswordURL = '$baseURL/Auth/forget-password';
  // static String changePasswordURL = '$baseURL/Auth/change-password';
  static const String login = '/Auth/Login';
  static const String register = 'Auth/register';
}
