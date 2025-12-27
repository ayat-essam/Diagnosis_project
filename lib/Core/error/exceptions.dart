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
  final data = e.response?.data;
  final message = extractMessage(data);

  final errorModel = ErrorModel(
    errorMessage: message,
  );
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      throw ServerException(
        errorModel: errorModel,
      );

    case DioExceptionType.badResponse:
      switch (e.response?.statusCode) {
        case 400:
        case 401:
        case 403:
        case 404:
        case 409:
        case 422:
        case 504:
        case 500:
          throw ServerException(
            errorModel: errorModel,
          );
      }
  }
}

String extractMessage(dynamic response) {
  if (response is Map) {
    if (response.containsKey('error')) {
      return response['error'] is Map
          ? response['error']['message'] ?? 'Unknown error'
          : response['error'].toString();
    }

    if (response.containsKey('message')) {
      return response['message'].toString();
    }

    if (response.containsKey('errors')) {
      final errors = response['errors'];

      if (errors is List && errors.isNotEmpty) {
        return errors.first.toString();
      } else if (errors is Map && errors.isNotEmpty) {
        final firstKey = errors.keys.first;
        final messages = errors[firstKey];
        if (messages is List && messages.isNotEmpty) {
          return messages.first.toString();
        }
      }
    }
  }

  if (response is String) {
    return response;
  }

  return 'Unknown error';
}
