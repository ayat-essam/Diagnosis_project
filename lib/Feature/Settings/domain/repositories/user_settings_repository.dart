import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Settings/data/models/user_settings_model.dart';
import 'package:diagnosis_project/Feature/Settings/domain/entities/user_settings_entity.dart';

abstract class UserSettingsRepository {
  Future<Either<ErrorModel, UserSettingsEntity>> getUserSetting();
  Future<Either<ErrorModel, void>> updateUserSetting(
      {required UserSettingsModel userSettingsModel});
}
