import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_profile_entity.dart';

abstract class PatientMangementRepo {
  Future<Either<ErrorModel, List<PatientEntity>>> getPatients({
    required String search,
    required String status,
  });
  Future<Either<ErrorModel, PatientProfileEntity>> getPatientProfile({
    required int id,
  });
  Future<Either<ErrorModel, void>> deletPatient({required int id});
}
