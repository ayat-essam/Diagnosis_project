import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Core/error/exceptions.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/data/datasource/patient_management_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_profile_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/repos/patient_mangement_repo.dart';

class PatientsManagementRepoImp extends PatientMangementRepo {
  PatientManagementRemoteDataSource dataSource;
  PatientsManagementRepoImp({required this.dataSource});

  @override
  Future<Either<ErrorModel, void>> deletPatient({required int id}) async {
    try {
      await dataSource.deletePatient(id: id);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, PatientProfileEntity>> getPatientProfile(
      {required int id}) async {
    try {
      final res = await dataSource.getPatientProfile(id: id);
      return Right(res);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }

  @override
  Future<Either<ErrorModel, List<PatientEntity>>> getPatients(
      {required String search, required bool isActive}) async {
    try {
      final res =
          await dataSource.getPatients(search: search, isActive: isActive);
      return Right(res);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
