
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../../Core/constants/api_constant.dart';
import '../../../../../Core/error/exceptions.dart';
import '../../models/login_request.dart';
import '../../models/login_responce.dart';
import '../../models/register_request.dart';
import '../../models/register_response.dart';
import 'auth_remote_data_sourse.dart';



@Singleton(as: AuthRemoteDataSource)
class AuthApiRemoteDataSource extends AuthRemoteDataSource {
  final Dio dio;
  AuthApiRemoteDataSource(this.dio);
  @override
  Future<LoginResponse> login(LoginRequest loginReq) async {
    try {
      final response =
      await dio.post(ApiConstants.login,
          data: loginReq.toJson());
      print(response.data);

      return LoginResponse.fromJson(response.data);
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        message = exception.response?.data['message'];
      }
      throw RemoteException(message ?? "failed to login");
    }
  }


  @override
  Future<RegisterResponse> register(RegisterRequest registerReq) async {
    try {
      final response = await dio.post(ApiConstants.register,
          data: registerReq.toJson());
      print(response.data);
      return RegisterResponse.fromJson(response.data());
    } catch (exception) {
      String? message;
      if (exception is DioException) {
        exception.response?.data[message];
      }
      throw RemoteException(message ?? "Register is Failed");
    }
  }
}