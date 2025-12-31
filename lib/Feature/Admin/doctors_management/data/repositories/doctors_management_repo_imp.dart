import 'package:dartz/dartz.dart';
import 'package:diagnosis_project/Core/error/error_model.dart';
import 'package:diagnosis_project/Core/error/exceptions.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/datasource/doctor_management_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/add_doctor_request.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/doctors_mangement_repo.dart';

class DoctorsManagementRepoImp extends DoctorsManagementRepo {
  DoctorManagementRemoteDataSource dataSource;
  DoctorsManagementRepoImp({required this.dataSource});
  @override
  Future<Either<ErrorModel, String>> addDoctor(
      {required AddDoctorRequest addDoctorRequest}) async {
    try {
      final res =
          await dataSource.addDoctor(addDoctorRequest: addDoctorRequest);
      return Right(res);
    } on ServerException catch (e) {
      return Left(e.errorModel);
    }
  }
}
