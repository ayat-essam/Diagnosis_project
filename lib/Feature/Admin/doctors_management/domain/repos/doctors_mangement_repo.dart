import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/add_doctor_request.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_entity.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_profile_entity.dart';

abstract class DoctorsManagementRepo {
  Future<Either<ErrorModel, String>> addDoctor(
      {required AddDoctorRequest addDoctorRequest});
  Future<Either<ErrorModel, List<DoctorEntity>>> getDoctors({
    required String search,
    required bool isActive,
  });
  Future<Either<ErrorModel, DoctorProfileEntity>> getDoctorProfile({
    required int id,
  });
  Future<Either<ErrorModel, void>> deactivateDoctor({
    required int id,
  });
}
