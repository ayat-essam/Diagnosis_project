import 'package:diagnosis_project/Feature/Admin/patients_mangement/data/models/patient_model.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/data/models/patient_peofile_model.dart';

abstract class PatientManagementRemoteDataSource {
  
  Future<List<PatientModel>> getPatients({
    required String search,
    required String status,
  });
  Future<PatientProfileModel> getPatientProfile({
    required int id,
  });
  Future<void> deletePatient({required int id});
}
