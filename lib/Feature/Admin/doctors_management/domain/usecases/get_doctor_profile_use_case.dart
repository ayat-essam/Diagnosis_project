import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_profile_entity.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/repos/doctors_mangement_repo.dart';

class GetDoctorProfileUseCase {
  final DoctorsManagementRepo repository;

  GetDoctorProfileUseCase(this.repository);

  Future<Either<ErrorModel, DoctorProfileEntity>> call(
      {required int id}) async {
    return await repository.getDoctorProfile(id: id);
  }
}
