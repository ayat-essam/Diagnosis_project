import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/entities/get_out_side_entity.dart';

class GetOutsideResponse extends GetOutSideEntity {
  GetOutsideResponse({
    required super.fullName,
    required super.email,
    required super.message,
    required super.status,
  });

  factory GetOutsideResponse.fromJson(Map<String, dynamic> json) {
    return GetOutsideResponse(
      fullName: json['fullName'],
      email: json['email'],
      message: json['message'],
      status: json['status'],
    );
  }
}
