import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/repositories/system_settings_repository.dart';

class SetAiRateLimitUseCase {
  final SystemSettingsRepository repository;

  SetAiRateLimitUseCase({required this.repository});

  Future<Either<ErrorModel, String>> call(
      {required int maxRequestsPerDay}) async {
    return await repository.setAiRateLimit(
        maxRequestsPerDay: maxRequestsPerDay);
  }
}
