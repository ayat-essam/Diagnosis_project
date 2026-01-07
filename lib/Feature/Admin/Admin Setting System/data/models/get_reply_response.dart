class GetReplyResponse {
  final int requestId;
  final String reply;
  final int status;
  GetReplyResponse({
    required this.requestId,
    required this.reply,
    required this.status,
  });
  factory GetReplyResponse.fromJson(Map<String, dynamic> json) {
    return GetReplyResponse(
      requestId: json['requestId'],
      reply: json['reply'],
      status: json['status'],
    );
  }
}
