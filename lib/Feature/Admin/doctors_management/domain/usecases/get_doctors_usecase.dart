import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_entity.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/repos/doctors_mangement_repo.dart';

class GetDoctorsUseCase {
  final DoctorsManagementRepo repository;

  GetDoctorsUseCase(this.repository);

  Future<Either<ErrorModel, List<DoctorEntity>>> call({
    required String search,
    required bool isActive,
  }) async {
    return await repository.getDoctors(
      search: search,
      isActive: isActive,
    );
  }
}
