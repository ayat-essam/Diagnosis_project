import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/add_doctor_request.dart';

abstract class DoctorsManagementRepo {
  Future<Either<ErrorModel, String>> addDoctor({required AddDoctorRequest addDoctorRequest});
}
