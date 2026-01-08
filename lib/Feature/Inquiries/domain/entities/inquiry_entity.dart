class InquiryEntity {
  final int inquiryId;
  final String? symptoms;
  final DateTime date;
  final String? status;

  InquiryEntity({
    required this.inquiryId,
    this.symptoms,
    required this.date,
    this.status,
  });

  factory InquiryEntity.fromJson(Map<String, dynamic> json) {
    return InquiryEntity(
      inquiryId: json['inquiryId'],
      symptoms: json['symptoms'],
      date: DateTime.parse(json['date']),
      status: json['status'],
    );
  }
}
