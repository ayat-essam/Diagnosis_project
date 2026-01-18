import 'package:diagnosis_project/Core/error/error_model.dart';

class AddDoctorState {
  // Form Fields
  final String userName;
  final String fName;
  final String lName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phoneNumber;
  final String address;
  final String experienceYears;
  final String nationalId;
  final String gender;
  final String birthDate;

  // Status Fields
  final bool isLoading;
  final ErrorModel? errorModel;
  final String? successMessage;

  AddDoctorState({
    this.userName = '',
    this.fName = '',
    this.lName = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.phoneNumber = '',
    this.address = '',
    this.experienceYears = '',
    this.nationalId = '',
    this.birthDate = '',
    this.gender = 'Male',
    this.isLoading = false,
    this.errorModel,
    this.successMessage,
  });

  AddDoctorState copyWith({
    String? userName,
    String? fName,
    String? lName,
    String? email,
    String? password,
    String? confirmPassword,
    String? phoneNumber,
    String? address,
    String? experienceYears,
    String? nationalId,
    String? birthDate,
    String? gender,
    bool? isLoading,
    ErrorModel? errorModel,
    String? successMessage,
  }) {
    return AddDoctorState(
      userName: userName ?? this.userName,
      fName: fName ?? this.fName,
      lName: lName ?? this.lName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      address: address ?? this.address,
      experienceYears: experienceYears ?? this.experienceYears,
      nationalId: nationalId ?? this.nationalId,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
      isLoading: isLoading ?? this.isLoading,
      errorModel: errorModel,
      successMessage: successMessage,
    );
  }
}
