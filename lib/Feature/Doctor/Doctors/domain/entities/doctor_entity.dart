class DoctorEntity {
  final String name;
  final String? specialization;
  final String? address;
  final String? profileImageUrl;
  final int experienceYears;
  final double? rating;

  DoctorEntity({
    required this.name,
    this.specialization,
    this.address,
    this.profileImageUrl,
    required this.experienceYears,
    this.rating,
  });
}
