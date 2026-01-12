import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/constants/api_constant.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/data/datasource/patient_management_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/data/models/patient_model.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/data/models/patient_peofile_model.dart';
import 'package:dio/dio.dart';

class PatientManagementRemoteDataSourceImp
    extends PatientManagementRemoteDataSource {
  ApiConsumer apiConsumer;

  PatientManagementRemoteDataSourceImp(this.apiConsumer);

  @override
  Future<void> deletePatient({required int id}) async {
    await apiConsumer
        .delete(ApiConstants.deletePatientEndPoint + id.toString());
  }

  @override
  Future<PatientProfileModel> getPatientProfile({required int id}) async {
    final response = await apiConsumer
        .get(ApiConstants.getPatientProfileEndPoint + id.toString());
    return PatientProfileModel.fromJson(response);
  }

  @override
  Future<List<PatientModel>> getPatients(
      {required String search, required String status}) async {
    final response = await apiConsumer.get(
      ApiConstants.getPatientsEndPoint,
      queryParameters: {
        'search': search,
        'status': status,
      },
    );
    return List<PatientModel>.from(
        (response as List).map((e) => PatientModel.fromJson(e)));
  }
}
