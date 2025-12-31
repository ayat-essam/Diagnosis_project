import 'package:diagnosis_project/Core/api/api_consumer.dart';
import 'package:diagnosis_project/Core/constants/api_constant.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/datasource/doctor_management_remote_data_source.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/add_doctor_request.dart';

class DoctorManagementRemoteDataSourceImp
    extends DoctorManagementRemoteDataSource {
  ApiConsumer apiConsumer;

  DoctorManagementRemoteDataSourceImp(this.apiConsumer);
  @override
  Future<String> addDoctor({required AddDoctorRequest addDoctorRequest}) async {
    final response = await apiConsumer.post(APIConstants.addDoctorEndPoint,
        data: addDoctorRequest.toJson());
    return response['message'];
  }
}
