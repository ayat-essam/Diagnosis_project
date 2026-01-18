import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/entities/doctor_profile_entity.dart';

class PatientProfileEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String? profileImageUrl;
  final List<ConsultationHistoryEntity> consultationHistory;

  const PatientProfileEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    this.profileImageUrl,
    required this.consultationHistory,
  });
  factory PatientProfileEntity.empty() => const PatientProfileEntity(
        id: 0,
        firstName: 'loading..',
        lastName: 'loading..',
        email: 'loading.....',
        gender: 'loading',
        profileImageUrl: '',
        consultationHistory: [],
      );
}

