import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/add_admin_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/repositories/system_settings_repository.dart';

class AddAdminUseCase {
  final SystemSettingsRepository repository;

  AddAdminUseCase({required this.repository});

  Future<Either<ErrorModel, String>> call(
      {required AddAdminRequest addAdminRequest}) async {
    return await repository.addAdmin(addAdminRequest: addAdminRequest);
  }
}
