import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:dio/dio.dart';

abstract class AppException implements Exception {
  final String message;

  const AppException(this.message);
}

class RemoteException extends AppException {
  const RemoteException(super.message);
}

class LocalException extends AppException {
  const LocalException(super.message);
}

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});
}

void handelDioException(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ServerException(
        errorModel: ErrorModel(errorMessage: 'connection Timeout'),
      );
    case DioExceptionType.sendTimeout:
      throw ServerException(
        errorModel: ErrorModel(errorMessage: 'send Timeout'),
      );
    case DioExceptionType.receiveTimeout:
      throw ServerException(
        errorModel: ErrorModel(errorMessage: 'receiveTimeout Timeout'),
      );
    case DioExceptionType.badCertificate:
      throw ServerException(
        errorModel: ErrorModel(errorMessage: 'badCertificate'),
      );
    case DioExceptionType.cancel:
      throw ServerException(
        errorModel: ErrorModel(errorMessage: 'request to server cancele'),
      );

    case DioExceptionType.connectionError:
      throw ServerException(
        errorModel: ErrorModel(errorMessage: 'no internet connection'),
      );
    case DioExceptionType.unknown:
      throw ServerException(
        errorModel: ErrorModel(errorMessage: 'something went wrong'),
      );

    case DioExceptionType.badResponse:
      throw ServerException(
        errorModel: _handelError(e.response),
      );
  }
}

ErrorModel _handelError(dynamic response) {
  if (response == null) {
    return ErrorModel(errorMessage: "No response from server");
  }

  final statusCode = response.statusCode ?? 0;
  final data = response.data;

  String message = "Unknown error occurred";

  if (data != null && data is Map<String, dynamic> && data['message'] != null) {
    message = data['message'];
  } else {
    switch (statusCode) {
      case 400:
        message = "Bad Request";
        break;
      case 401:
        message = "Unauthorized, please login again";
        break;
      case 403:
        message = "Forbidden";
        break;
      case 404:
        message = "Not Found";
        break;
      case 500:
        message = "Internal Server Error";
        break;
      default:
        message = "Received invalid status code: $statusCode";
    }
  }

  return ErrorModel(
    errorMessage: message,
    errors: data is Map<String, dynamic> ? data['errors'] : null,
  );
}
