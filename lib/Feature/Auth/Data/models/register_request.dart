class RegisterRequest {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;

  RegisterRequest(
      {required this.userName,
      required this.password,
      required this.confirmPassword,
      required this.email,
      required this.phoneNumber});

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "confirmPassword": confirmPassword,
        "email": email,
        "phoneNumber": phoneNumber
      };
}
