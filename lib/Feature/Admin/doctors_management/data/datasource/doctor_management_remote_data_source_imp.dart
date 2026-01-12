import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/constants/api_constant.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/datasource/doctor_management_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/add_doctor_request.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/doctor_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/doctor_profile_model.dart';

class DoctorManagementRemoteDataSourceImp
    extends DoctorManagementRemoteDataSource {
  ApiConsumer apiConsumer;

  DoctorManagementRemoteDataSourceImp(this.apiConsumer);
  @override
  Future<String> addDoctor({required AddDoctorRequest addDoctorRequest}) async {
    final response = await apiConsumer.post(ApiConstants.addDoctorEndPoint,
        data: addDoctorRequest.toJson());
    return response['message'];
  }

  @override
  Future<List<DoctorModel>> getDoctors(
      {required String search, required bool isActive}) async {
    final response = await apiConsumer.get(
      ApiConstants.getDoctorsEndPoint,
      queryParameters: {
        'search': search,
        'isActive': isActive,
      },
    );
    return List<DoctorModel>.from(
        (response as List).map((e) => DoctorModel.fromJson(e)));
  }

  @override
  Future<DoctorProfileModel> getDoctorProfile({required int id}) async {
    final response = await apiConsumer
        .get(ApiConstants.getDoctorProfileEndPoint + id.toString());
    return DoctorProfileModel.fromJson(response);
  }
}
