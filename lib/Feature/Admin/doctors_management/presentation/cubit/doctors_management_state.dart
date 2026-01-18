import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_entity.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_profile_entity.dart';

abstract class DoctorsManagementState {}

class DoctorsManagementInitial extends DoctorsManagementState {}

class GetDoctorsLoading extends DoctorsManagementState {}

class GetDoctorsSuccess extends DoctorsManagementState {
  final List<DoctorEntity> doctors;
  GetDoctorsSuccess(this.doctors);
}

class GetDoctorsError extends DoctorsManagementState {
  final String message;
  GetDoctorsError(this.message);
}

class GetDoctorProfileLoading extends DoctorsManagementState {}

class GetDoctorProfileSuccess extends DoctorsManagementState {
  final DoctorProfileEntity doctorProfileEntity;
  GetDoctorProfileSuccess(this.doctorProfileEntity);
}

class GetDoctorProfileError extends DoctorsManagementState {
  final String message;
  GetDoctorProfileError(this.message);
}

class DeactivateDoctorLoading extends DoctorsManagementState {}

class DeactivateDoctorSuccess extends DoctorsManagementState {}

class DeactivateDoctorError extends DoctorsManagementState {
  final String message;
  DeactivateDoctorError(this.message);
}
