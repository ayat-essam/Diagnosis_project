import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Settings/domain/entities/user_settings_entity.dart';
import 'package:diagnosis_project/Feature/Settings/domain/repositories/user_settings_repository.dart';

class GetUserSettingsUseCase {
  final UserSettingsRepository userSettingsRepository;

  GetUserSettingsUseCase({required this.userSettingsRepository});

  Future<Either<ErrorModel, UserSettingsEntity>> call() async {
    return await userSettingsRepository.getUserSetting();
  }
}
