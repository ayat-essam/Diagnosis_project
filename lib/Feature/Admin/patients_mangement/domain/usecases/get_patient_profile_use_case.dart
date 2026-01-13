import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_profile_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/repos/patient_mangement_repo.dart';

class GetPatientProfileUseCase {
  final PatientMangementRepo repository;

  GetPatientProfileUseCase(this.repository);

  Future<Either<ErrorModel, PatientProfileEntity>> call(
      {required int id}) async {
    return await repository.getPatientProfile(id: id);
  }
}
