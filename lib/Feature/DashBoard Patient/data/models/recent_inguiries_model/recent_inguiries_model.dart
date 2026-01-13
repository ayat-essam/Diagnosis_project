class RecentInguiriesModel {
  int? id;
  String? doctorName;
  dynamic subject;
  DateTime? date;
  DateTime? time;
  String? status;

  RecentInguiriesModel({
    this.id,
    this.doctorName,
    this.subject,
    this.date,
    this.time,
    this.status,
  });

  factory RecentInguiriesModel.fromJson(Map<String, dynamic> json) {
    return RecentInguiriesModel(
      id: json['id'] as int?,
      doctorName: json['doctorName'] as String?,
      subject: json['subject'] as dynamic,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      status: json['status'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'doctorName': doctorName,
        'subject': subject,
        'date': date?.toIso8601String(),
        'time': time?.toIso8601String(),
        'status': status,
      };
}
