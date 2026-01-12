class DoctorEntity {
  final int id;
  final String fullName;
  final int experienceYears;
  final String? gender;
  final String? profileImageUrl;
  final int consultationsCount;
  final String? lastConsultationDate;
  final String status;

  DoctorEntity({
    required this.id,
    required this.fullName,
    required this.experienceYears,
    this.gender,
    this.profileImageUrl,
    required this.consultationsCount,
    this.lastConsultationDate,
    required this.status,
  });
  factory DoctorEntity.empty() {
    return DoctorEntity(
      id: 0,
      fullName: 'loading...',
      experienceYears: 0,
      gender: 'loading',
      consultationsCount: 0,
      lastConsultationDate: DateTime.now().toIso8601String(),
      status: 'loading..',
      profileImageUrl: 'assets/image/profile.png',
    );
  }
}
