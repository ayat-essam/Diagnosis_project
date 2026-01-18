import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/repos/doctors_mangement_repo.dart';

class DeactivateDoctorUsecase {
  final DoctorsManagementRepo repository;

  DeactivateDoctorUsecase(this.repository);

  Future<Either<ErrorModel, void>> call(
      {required int id}) async {
    return await repository.deactivateDoctor(id: id);
  }
}
