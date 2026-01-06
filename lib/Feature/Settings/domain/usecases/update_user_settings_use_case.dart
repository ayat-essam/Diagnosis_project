import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Settings/data/models/user_settings_model.dart';
import 'package:diagnosis_project/Feature/Settings/domain/repositories/user_settings_repository.dart';

class UpdateUserSettingsUseCase {
  final UserSettingsRepository userSettingsRepository;

  UpdateUserSettingsUseCase({required this.userSettingsRepository});

  Future<Either<ErrorModel, void>> call(
      {required UserSettingsModel userSettingsModel}) async {
    return await userSettingsRepository.updateUserSetting(
        userSettingsModel: userSettingsModel);
  }
}
