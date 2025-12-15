class loginResponse {
  bool? success;
  String? token;
  Null? errorMessage;
  String? expiresAt;

  loginResponse({this.success, this.token, this.errorMessage, this.expiresAt});

  loginResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    token = json['token'];
    errorMessage = json['errorMessage'];
    expiresAt = json['expiresAt'];
  }


}