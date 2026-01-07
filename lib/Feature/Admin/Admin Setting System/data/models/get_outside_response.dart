class GetOutsideResponse {
final String fullName;
  final String email;
  final String message;
  final String status;
  GetOutsideResponse({
    required this.fullName,
    required this.email,
    required this.message,
    required this.status,
  });
  factory GetOutsideResponse.fromJson(Map<String, dynamic> json) {
    return GetOutsideResponse(
      fullName: json['fullName'],
      email: json['email'],
      message: json['message'],
      status: json['status'],
    );
  }
}