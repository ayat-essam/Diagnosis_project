import 'package:diagnosis_project/Core/constants/api_constant.dart';
import 'package:dio/dio.dart';

class ApiServices {
  final _baseUrl = ApiConstants.baseURL;
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> post(
      {required String endPoint, data, token}) async {
    final response = await _dio.post(
      '$_baseUrl$endPoint',
      data: data,
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> get({required String endPoint, token}) async {
    final response = await _dio.get(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ),
    );

    return response.data;
  }
}
