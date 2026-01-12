import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_profile_entity.dart';

class DoctorProfileModel extends DoctorProfileEntity {
  DoctorProfileModel({
    required super.id,
    required super.fullName,
    required super.email,
    super.phoneNumber,
    super.gender,
    super.nationalId,
    super.profileImageUrl,
    super.dateOfBirth,
    super.address,
    super.specialization,
    required super.isActive,
    required super.consultationsCount,
    required super.totalPatients,
    required super.activePatients,
    required super.totalConsultations,
    required super.consultationHistory,
  });

  factory DoctorProfileModel.fromJson(Map<String, dynamic> json) {
    return DoctorProfileModel(
      id: json['id'],
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      gender: json['gender'],
      nationalId: json['nationalId'],
      profileImageUrl: json['profileImageUrl'],
      dateOfBirth: json['dateOfBirth'],
      address: json['address'],
      specialization: json['specialization'],
      isActive: json['isActive'],
      consultationsCount: json['consultationsCount'],
      totalPatients: json['totalPatients'],
      activePatients: json['activePatients'],
      totalConsultations: json['totalConsultations'],
      consultationHistory: (json['consultationHistory'] as List)
          .map((e) => ConsultationHistoryEntity(
                consultationId: e['consultationId'],
                doctorName: e['doctorName'],
                specialization: e['specialization'],
                consultationType: e['consultationType'],
                consultationDate: e['consultationDate'],
              ))
          .toList(),
    );
  }
}
