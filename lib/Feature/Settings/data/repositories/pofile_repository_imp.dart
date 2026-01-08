import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Core/error/exceptions.dart';
import 'package:diagnosis_project/Feature/Settings/data/datasource/profile_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Settings/data/models/profile_model.dart';
import 'package:diagnosis_project/Feature/Settings/domain/entities/profle_entity.dart';
import 'package:diagnosis_project/Feature/Settings/domain/repositories/profile_repository.dart';

class PofileRepositoryImp extends ProfileRepository {
  final ProfileRemoteDataSource profileRemoteDataSource;
  PofileRepositoryImp({required this.profileRemoteDataSource});
  @override
  Future<Either<ErrorModel, ProfileEntity>> getProfile() async {
    try {
      final profileModel = await profileRemoteDataSource.getProfile();
      return Right(profileModel);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, void>> updateProfile(
      {required ProfileModel updateProfileRequest}) async {
    try {
      await profileRemoteDataSource.updateProfile(
          profileModel: updateProfileRequest);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
