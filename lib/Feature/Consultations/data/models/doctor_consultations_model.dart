import 'package:diagnosis_project/Feature/Consultations/domain/entity/doctor_consultations_entity%20.dart';

class DoctorConsultationsModel extends DoctorConsultationsEntity {
  final int? id;
  final String? patientName;
  final String? patientGender;
  final String? patientBirthDate;
  final String? type;
  final String? symptoms;
  final dynamic response;
  final String? status;
  final String? requestDate;
  final bool? success;
  final dynamic errorMessage;

  const DoctorConsultationsModel({
    this.id,
    this.patientName,
    this.patientGender,
    this.patientBirthDate,
    this.type,
    this.symptoms,
    this.response,
    this.status,
    this.requestDate,
    this.success,
    this.errorMessage,
  });

  factory DoctorConsultationsModel.fromJson(Map<String, dynamic> json) {
    return DoctorConsultationsModel(
      id: json['id'] as int?,
      patientName: json['patientName'] as String?,
      patientGender: json['patientGender'] as String?,
      patientBirthDate: json['patientBirthDate'] as String?,
      type: json['type'] as String?,
      symptoms: json['symptoms'] as String?,
      response: json['response'] as dynamic,
      status: json['status'] as String?,
      requestDate: json['requestDate'] as String?,
      success: json['success'] as bool?,
      errorMessage: json['errorMessage'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'patientName': patientName,
        'patientGender': patientGender,
        'patientBirthDate': patientBirthDate,
        'type': type,
        'symptoms': symptoms,
        'response': response,
        'status': status,
        'requestDate': requestDate,
        'success': success,
        'errorMessage': errorMessage,
      };
}
