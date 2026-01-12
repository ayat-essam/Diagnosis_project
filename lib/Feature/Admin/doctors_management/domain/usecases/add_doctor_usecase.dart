import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/add_doctor_request.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/repos/doctors_mangement_repo.dart';

class AddDoctorUseCase {
  final DoctorsManagementRepo repository;

  AddDoctorUseCase(this.repository);

  Future<Either<ErrorModel, String>> call(
      {required AddDoctorRequest addDoctorRequest}) async {
    return await repository.addDoctor(addDoctorRequest: addDoctorRequest);
  }
}
