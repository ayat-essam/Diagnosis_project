import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Auth/data/models/login_request.dart';
import 'package:diagnosis_project/Feature/Auth/data/models/login_responce.dart';
import 'package:diagnosis_project/Feature/Auth/data/models/register_request.dart';
import 'package:diagnosis_project/Feature/Auth/data/models/register_response.dart';
import 'package:diagnosis_project/Feature/Auth/Domain/Entity/user_entity.dart';

abstract class AuthRemoteDataSource{

  Future<LoginResponse> login (LoginRequest loginReq);

  Future<RegisterResponse> register (RegisterRequest registerReq);

}