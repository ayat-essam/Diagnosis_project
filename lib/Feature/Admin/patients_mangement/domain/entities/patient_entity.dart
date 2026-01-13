class PatientEntity {
  final int id;
  final String fullName;
  final String birthDate;
  final String gender;
  final String? profileImageUrl;
  final int diagnosesCount;
  final String? lastDiagnosisDate;
  final String status;

  const PatientEntity({
    required this.id,
    required this.fullName,
    required this.birthDate,
    required this.gender,
    this.profileImageUrl,
    required this.diagnosesCount,
    this.lastDiagnosisDate,
    required this.status,
  });
  factory PatientEntity.empty() {
    return const PatientEntity(
        id: 0,
        fullName: 'fullName',
        birthDate: 'birthDate',
        gender: 'gender',
        diagnosesCount: 0,
        status: 'status');
  }
}
