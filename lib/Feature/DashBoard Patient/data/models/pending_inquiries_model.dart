class PendingInquiriesModel {
  int? pendingInquiriesCount;

  PendingInquiriesModel({this.pendingInquiriesCount});

  factory PendingInquiriesModel.fromJson(Map<String, dynamic> json) {
    return PendingInquiriesModel(
      pendingInquiriesCount: json['pendingInquiriesCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'pendingInquiriesCount': pendingInquiriesCount,
      };
}
