import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_profile_entity.dart';
import 'package:diagnosis_project/Feature/Admin/patients_mangement/domain/entities/patient_profile_entity.dart';

class PatientProfileModel extends PatientProfileEntity {
  const PatientProfileModel({
    required super.id,
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.gender,
    super.profileImageUrl,
    required super.consultationHistory,
  });

  factory PatientProfileModel.fromJson(Map<String, dynamic> json) {
    return PatientProfileModel(
      id: json['id'],
      firstName: json['fName'],
      lastName: json['lName'],
      email: json['email'],
      gender: json['gender'],
      profileImageUrl: json['profileImageUrl'],
      consultationHistory: (json['consultationHistory'] as List)
          .map(
            (e) => ConsultationHistoryEntity(
              consultationId: e['consultationId'],
              doctorName: e['doctorName'],
              specialization: e['specialization'],
              consultationType: e['consultationType'],
              consultationDate: e['consultationDate'],
            ),
          )
          .toList(),
    );
  }
}
