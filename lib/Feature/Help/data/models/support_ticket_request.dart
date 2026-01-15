class SupportTicketRequest {
  final String subject;
  final String details;

  SupportTicketRequest({
    required this.subject,
    required this.details,
  });

  Map<String, dynamic> toJson() => {
    "subject": subject,
    "details": details,
  };
}
