import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/failure.dart';
import 'package:diagnosis_project/Feature/Auth/Data/models/register_request.dart';
import 'package:diagnosis_project/Feature/Auth/Domain/Entity/user_entity.dart';
import 'package:diagnosis_project/Feature/Auth/Domain/auth_repository/auth_repo.dart';

class RegisterUseCase{
  final AuthRepo _authRepo;
  RegisterUseCase(this._authRepo);

  // Future<Either<failure, UserEntity>> call(RegisterRequest registerReq) => _authRepo.register(registerReq);
}