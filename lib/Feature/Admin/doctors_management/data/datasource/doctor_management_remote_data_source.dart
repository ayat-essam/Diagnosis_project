import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/add_doctor_request.dart';

abstract class DoctorManagementRemoteDataSource {
  Future<String> addDoctor({required AddDoctorRequest addDoctorRequest});
}
