import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/repositories/system_settings_repository.dart';

class SetDoctorWorkHourUseCase {
  final SystemSettingsRepository repository;

  SetDoctorWorkHourUseCase({required this.repository});

  Future<Either<ErrorModel, String>> call({required int hours}) async {
    return await repository.setDoctorWorkHour(hours: hours);
  }
}