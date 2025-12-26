import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/api_constant.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => Dio(BaseOptions(
      baseUrl: APIConstants.baseURL, receiveDataWhenStatusError: true));

  @preResolve
  Future<SharedPreferences> getShardPref() => SharedPreferences.getInstance();
}
