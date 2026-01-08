import 'package:diagnosis_project/Core/api/api_interceptors.dart';
import 'package:diagnosis_project/Core/constants/api_constant.dart';
import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../error/exceptions.dart';

@LazySingleton(as: ApiConsumer)
class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiConstants.baseURL;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
  @override
  Future delete(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false,
      Options? options}) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future get(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false,
      Options? options}) async {
    try {
      final response = await dio.get(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future put(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false,
      Options? options}) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future post(String path,
      {dynamic data,
      Map<String, dynamic>? queryParameters,
      bool isFormData = false,
      Options? options}) async {
    try {
      final response = await dio.post(
        path,
        // FIX: Check if data is already FormData before trying to convert it
        data: (isFormData && data is! FormData) ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }
}
