import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_profile_entity.dart';

abstract class PatientsManagementState {}

class PatientsManagementInitial extends PatientsManagementState {}

class GetPatientsLoading extends PatientsManagementState {}

class GetPatientsSuccess extends PatientsManagementState {
  final List<PatientEntity> patients;
  GetPatientsSuccess(this.patients);
}

class GetPatientsError extends PatientsManagementState {
  final String message;
  GetPatientsError(this.message);
}

class GetPatientsProfileLoading extends PatientsManagementState {}

class GetPatientProfileSuccess extends PatientsManagementState {
  final PatientProfileEntity patientEntity;
  GetPatientProfileSuccess(this.patientEntity);
}

class GetPatientProfileError extends PatientsManagementState {
  final String message;
  GetPatientProfileError(this.message);
}

class DeletePatientsLoading extends PatientsManagementState {}

class DeletePatientSuccess extends PatientsManagementState {
  DeletePatientSuccess();
}

class DeletePatientError extends PatientsManagementState {
  final String message;
  DeletePatientError(this.message);
}
