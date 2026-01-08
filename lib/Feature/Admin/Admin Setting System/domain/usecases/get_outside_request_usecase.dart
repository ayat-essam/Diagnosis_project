import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/entities/get_out_side_entity.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/repositories/system_settings_repository.dart';

class GetOutsideRequestUseCase {
  final SystemSettingsRepository repository;

  GetOutsideRequestUseCase({required this.repository});

  Future<Either<ErrorModel, List<GetOutSideEntity>>> call() async {
    return await repository.getOutsideRequests();
  }
}
