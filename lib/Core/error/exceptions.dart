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

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
    case DioExceptionType.badCertificate:
    case DioExceptionType.cancel:
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      throw ServerException(
        errorModel: ErrorModel.fromJson(data ?? {}),
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
          throw ServerException(
            errorModel: ErrorModel.fromJson(data ?? {}),
          );
      }
  }
}
