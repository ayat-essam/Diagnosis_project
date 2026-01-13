class SupportReplyRequest {
  final int ticketId;
  final String reply;

  SupportReplyRequest({
    required this.ticketId,
    required this.reply,
  });

  Map<String, dynamic> toJson() => {
    "ticketId": ticketId,
    "reply": reply,
  };
}
