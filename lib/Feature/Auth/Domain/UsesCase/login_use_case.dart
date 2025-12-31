import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Auth/Data/models/login_request.dart';
import 'package:diagnosis_project/Feature/Auth/Domain/Entity/user_entity.dart';
import 'package:diagnosis_project/Feature/Auth/Domain/auth_repository/auth_repo.dart';

class LoginUseCase{
  final AuthRepo _authRepo;
  LoginUseCase(this._authRepo);

  // Future<Either<failure, UserEntity>> call(LoginRequest loginReq) => _authRepo.login(loginReq);
}