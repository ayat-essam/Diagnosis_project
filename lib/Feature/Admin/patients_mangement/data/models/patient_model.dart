import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_entity.dart';

class PatientModel extends PatientEntity {
  const PatientModel({
    required super.id,
    required super.fullName,
    required super.birthDate,
    required super.gender,
    super.profileImageUrl,
    required super.diagnosesCount,
    super.lastDiagnosisDate,
    required super.status,
  });

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return PatientModel(
      id: json['id'],
      fullName: json['fullName'],
      birthDate: json['birthDate'],
      gender: json['gender'],
      profileImageUrl: json['profileImageUrl'],
      diagnosesCount: json['diagnosesCount'],
      lastDiagnosisDate: json['lastDiagnosisDate'],
      status: json['status'],
    );
  }
}
