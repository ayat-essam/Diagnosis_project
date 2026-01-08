import 'package:diagnosis_project/Feature/Inquiries/domain/entities/inquiry_details_entity.dart';

class InquiryDetailsModel extends InquiryDetailsEntity {
  InquiryDetailsModel({
    required super.doctorId,
    super.symptoms,
    super.notes,
    super.status,
    required super.date,
    super.files,
    super.description,
    super.rejectReason,
    super.rejectNotes,
  });

  factory InquiryDetailsModel.fromJson(Map<String, dynamic> json) {
    return InquiryDetailsModel(
      doctorId: json['doctorId'],
      symptoms: json['symptoms'],
      notes: json['notes'],
      status: json['status'],
      date: DateTime.parse(json['date']),
      files: json['files']?.cast<String>(),
      description: json['description'],
      rejectReason: json['rejectReason'],
      rejectNotes: json['rejectNotes'],
    );
  }
}
