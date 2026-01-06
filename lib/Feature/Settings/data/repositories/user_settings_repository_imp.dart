import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Core/error/exceptions.dart';
import 'package:diagnosis_project/Feature/Settings/data/datasource/user_settings_data_source.dart';
import 'package:diagnosis_project/Feature/Settings/data/models/user_settings_model.dart';
import 'package:diagnosis_project/Feature/Settings/domain/entities/user_settings_entity.dart';
import 'package:diagnosis_project/Feature/Settings/domain/repositories/user_settings_repository.dart';

class UserSettingsRepositoryImp extends UserSettingsRepository {
  final UserSettingsDataSource userSettingsDataSource;
  UserSettingsRepositoryImp({required this.userSettingsDataSource});

  @override
  Future<Either<ErrorModel, UserSettingsEntity>> getUserSetting() async {
    try {
      final userSettings = await userSettingsDataSource.getUserSettings();
      return Right(userSettings);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, void>> updateUserSetting(
      {required UserSettingsModel userSettingsModel}) async {
    try {
      await userSettingsDataSource.updateUserSettings(
          userSettingsModel: userSettingsModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
