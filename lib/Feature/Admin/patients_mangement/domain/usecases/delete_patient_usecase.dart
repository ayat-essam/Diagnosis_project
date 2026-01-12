import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/repos/patient_mangement_repo.dart';

class DeletePatientUsecase {
  final PatientMangementRepo repository;

  DeletePatientUsecase(this.repository);

  Future<Either<ErrorModel, void>> call(
      {required int id}) async {
    return await repository.deletPatient(id: id);
  }
}
