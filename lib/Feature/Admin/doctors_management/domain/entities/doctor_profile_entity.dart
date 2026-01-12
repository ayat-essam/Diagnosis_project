class DoctorProfileEntity {
  final int id;
  final String fullName;
  final String email;
  final String? phoneNumber;
  final String? gender;
  final String? nationalId;
  final String? profileImageUrl;
  final String? dateOfBirth;
  final String? address;
  final String? specialization;
  final bool isActive;
  final int consultationsCount;
  final int totalPatients;
  final int activePatients;
  final int totalConsultations;
  final List<ConsultationHistoryEntity> consultationHistory;

  DoctorProfileEntity({
    required this.id,
    required this.fullName,
    required this.email,
    this.phoneNumber,
    this.gender,
    this.nationalId,
    this.profileImageUrl,
    this.dateOfBirth,
    this.address,
    required this.specialization,
    required this.isActive,
    required this.consultationsCount,
    required this.totalPatients,
    required this.activePatients,
    required this.totalConsultations,
    required this.consultationHistory,
  });
  factory DoctorProfileEntity.empty() {
    return DoctorProfileEntity(
      id: 0,
      fullName: 'Loading Name',
      email: 'loading@email.com',
      gender: 'Loading',
      profileImageUrl: '',
      specialization: '',
      isActive: true,
      consultationsCount: 0,
      totalPatients: 0,
      activePatients: 0,
      totalConsultations: 0,
      consultationHistory: const [],
    );
  }
}

class ConsultationHistoryEntity {
  final int consultationId;
  final String doctorName;
  final String specialization;
  final String consultationType;
  final String consultationDate;

  ConsultationHistoryEntity({
    required this.consultationId,
    required this.doctorName,
    required this.specialization,
    required this.consultationType,
    required this.consultationDate,
  });
}
