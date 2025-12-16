class RegisterResponse {
  bool? success;
  Null? errorMessage;

  RegisterResponse({this.success, this.errorMessage});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    errorMessage = json['errorMessage'];
  }
  // RegisterResponse copyWith({
  //   String? message,
  //   UserModel? user,
  //   String? token,
  // }) {
  //   return RegisterResponse(
  //     message: message ?? this.message,
  //     user: user ?? this.user,
  //     token: token ?? this.token,
  //   );
  // }


}