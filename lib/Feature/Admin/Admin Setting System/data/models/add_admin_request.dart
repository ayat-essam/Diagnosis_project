class AddAdminRequest {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;

  AddAdminRequest({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'phoneNumber': phoneNumber,
    };
  }
}
