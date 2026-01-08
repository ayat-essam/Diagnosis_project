import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/entities/get_reply_entity.dart';

class GetReplyResponse extends GetReplyEntity {
  GetReplyResponse({
    required super.requestId,
    required super.reply,
    required super.status,
  });
  factory GetReplyResponse.fromJson(Map<String, dynamic> json) {
    return GetReplyResponse(
      requestId: json['requestId'],
      reply: json['reply'],
      status: json['status'],
    );
  }
}
