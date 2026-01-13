import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  DoctorModel({
    required super.id,
    required super.fullName,
    required super.experienceYears,
    super.gender,
    super.profileImageUrl,
    required super.consultationsCount,
    super.lastConsultationDate,
    required super.status,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      id: json['id'],
      fullName: json['fullName'] ?? '',
      experienceYears: json['experienceYears'],
      gender: json['gender'],
      profileImageUrl: json['profileImageUrl'],
      consultationsCount: json['consultationsCount'],
      lastConsultationDate: json['lastConsultationDate'],
      status: json['status'],
    );
  }
}
