import '../../domain/entities/doctor_entity.dart';

class DoctorModel extends DoctorEntity {
  DoctorModel({
    required super.name,
    super.specialization,
    super.address,
    super.profileImageUrl,
    required super.experienceYears,
    super.rating,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'] ?? '',
      specialization: json['specialization'],
      address: json['address'],
      profileImageUrl: json['profileImageUrl'],
      experienceYears: json['experienceYears'] ?? 0,
      rating: json['rating'] == null
          ? null
          : (json['rating'] as num).toDouble(),
    );
  }
}
