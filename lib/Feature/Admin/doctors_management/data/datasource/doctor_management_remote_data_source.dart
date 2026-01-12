import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/add_doctor_request.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/doctor_model.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/doctor_profile_model.dart';

abstract class DoctorManagementRemoteDataSource {
  Future<String> addDoctor({required AddDoctorRequest addDoctorRequest});
  Future<List<DoctorModel>> getDoctors({
    required String search,
    required bool isActive,
  });
  Future<DoctorProfileModel> getDoctorProfile({
    required int id,
  });
}
