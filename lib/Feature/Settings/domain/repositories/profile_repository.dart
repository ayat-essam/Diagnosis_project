import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Settings/data/models/profile_model.dart';
import 'package:diagnosis_project/Feature/Settings/domain/entities/profle_entity.dart';

abstract class ProfileRepository {
  Future<Either<ErrorModel, ProfileEntity>> getProfile();
  Future<Either<ErrorModel, void>> updateProfile({required ProfileModel updateProfileRequest});
}