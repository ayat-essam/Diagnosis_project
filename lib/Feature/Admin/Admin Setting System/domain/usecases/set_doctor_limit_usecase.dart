import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/repositories/system_settings_repository.dart';

class SetDoctorRateLimitUseCase {
  final SystemSettingsRepository repository;

  SetDoctorRateLimitUseCase({required this.repository});

  Future<Either<ErrorModel, String>> call(
      {required int maxRequestsPerDay}) async {
    return await repository.setDoctorRateLimit(
        maxRequestsPerDay: maxRequestsPerDay);
  }
}
