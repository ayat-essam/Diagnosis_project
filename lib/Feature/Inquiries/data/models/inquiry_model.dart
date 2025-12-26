import 'package:diagnosis_project/Feature/Inquiries/domain/entities/inquiry_entity.dart';
class InquiryModel extends InquiryEntity {
  InquiryModel({
    required super.inquiryId,
    super.symptoms,
    required super.date,
    super.status,
  });

  factory InquiryModel.fromJson(Map<String, dynamic> json) {
    return InquiryModel(
      inquiryId: json['inquiryId'],
      symptoms: json['symptoms'],
      date: DateTime.parse(json['date']),
      status: json['status'],
    );
  }
}