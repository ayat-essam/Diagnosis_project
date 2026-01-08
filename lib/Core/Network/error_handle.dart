
import 'package:dio/dio.dart';

class ErrorHandler {
  final String message;
  final int statusCode;
  final dynamic data;

  const ErrorHandler({
    required this.message,
    required this.statusCode,
    this.data,
  });

  factory ErrorHandler.fromDioException(DioException e) {
    final statusCode = e.response?.statusCode ?? 500;
    String errorMessage;

    if (e.response?.data != null) {
      if (e.response!.data is Map && e.response!.data.containsKey('errorMessage')) {
        errorMessage = e.response!.data['errorMessage'] as String;
      } else if (e.response!.data is String) {
        errorMessage = e.response!.data as String;
      } else {
        errorMessage = e.message ?? 'Network error occurred';
      }
    } else {
      errorMessage = e.message ?? 'Network error occurred';
    }

    return ErrorHandler(
      message: errorMessage,
      statusCode: statusCode,
      data: e.response?.data,
    );
  }

  factory ErrorHandler.fromMessage(String message, {int statusCode = 500}) {
    return ErrorHandler(
      message: message,
      statusCode: statusCode,
    );
  }

  @override
  String toString() {
    return 'ErrorHandler(message: $message, statusCode: $statusCode)';
  }
}