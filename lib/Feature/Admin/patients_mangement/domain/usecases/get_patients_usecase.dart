import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/repos/patient_mangement_repo.dart';

class GetPatientsUsecase {
  final PatientMangementRepo repository;

  GetPatientsUsecase(this.repository);

  Future<Either<ErrorModel, List<PatientEntity>>> call({
    required String search,
    required String status,
  }) async {
    return await repository.getPatients(
      search: search,
      status: status,
    );
  }
}
