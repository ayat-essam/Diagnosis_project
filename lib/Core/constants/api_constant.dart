class ApiConstants {
  static const String baseURL = 'http://diagnosis.runasp.net';
  static const String consultationDetails =  '/Consultation/details/{consultationId}';
  static const String consultationAccept = '/Consultation/accept/{consultationId}';
  static const String consultationRejected = '/Consultation/reject/{consultationId}';
  static const String consultationModify = '/Consultation/modify/{consultationId}';


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

}
