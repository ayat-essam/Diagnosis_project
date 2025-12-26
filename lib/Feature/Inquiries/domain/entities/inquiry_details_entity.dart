class InquiryDetailsEntity {
  final int doctorId;
  final String? symptoms;
  final String? notes;
  final String? status;
  final DateTime date;
  final List<String>? files;
  final String? description;
  final String? rejectReason;
  final String? rejectNotes;

  InquiryDetailsEntity({
    required this.doctorId,
    this.symptoms,
    this.notes,
    this.status,
    required this.date,
    this.files,
    this.description,
    this.rejectReason,
    this.rejectNotes,
  });

  factory InquiryDetailsEntity.fromJson(Map<String, dynamic> json) {
    return InquiryDetailsEntity(
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
