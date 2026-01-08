class SendReplyRequest {
  final int requestId;
  final String reply;

  SendReplyRequest({
    required this.requestId,
    required this.reply,
  });

  Map<String, dynamic> toJson() {
    return {
      'requestId': requestId,
      'replyMessage': reply,
    };
  }
}