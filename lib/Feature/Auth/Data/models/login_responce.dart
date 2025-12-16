class LoginResponse {
  bool? success;
  String? token;
  Null? errorMessage;
  String? expiresAt;

  LoginResponse({this.success, this.token, this.errorMessage, this.expiresAt});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    expiresAt = json['expiresAt'];
  }


}