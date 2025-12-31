class AddDoctorRequest {
  final String userName;
  final String email;
  final String password;
  final String confirmPassword;
  final String? phoneNumber;
  final String? gender;
  final String? nationalId;
  final String birthDate;
  final String? address;
  final int? experienceYears;
  final String clientUri;

  AddDoctorRequest({
    required this.userName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.phoneNumber,
    this.gender,
    this.nationalId,
    required this.birthDate,
    this.address,
    this.experienceYears,
    required this.clientUri,
  });

  Map<String, dynamic> toJson() {
    return {
      "userName": userName,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
      "phoneNumber": phoneNumber,
      "gender": gender,
      "nationalId": nationalId,
      "birthDate": birthDate,
      "address": address,
      "experienceYears": experienceYears,
      "clientUri": clientUri,
    };
  }
}