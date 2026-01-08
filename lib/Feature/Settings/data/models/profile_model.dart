import 'package:diagnosis_project/Feature/Settings/domain/entities/profle_entity.dart';

class ProfileModel extends ProfileEntity {
  ProfileModel(
      {required super.fullName,
      required super.email,
      required super.phoneNumber});
  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
  }
}
