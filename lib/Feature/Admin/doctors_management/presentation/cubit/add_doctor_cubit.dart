import 'package:diagnosis_project/Feature/Admin/doctors_management/data/models/add_doctor_request.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/domain/usecases/add_doctor_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/doctors_management/presentation/cubit/add_doctor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDoctorCubit extends Cubit<AddDoctorState> {
  final AddDoctorUseCase addDoctorUseCase;
  AddDoctorCubit(this.addDoctorUseCase) : super(AddDoctorState());

  void onNameChanged(String val) => emit(state.copyWith(userName: val));
  void onFNameChanged(String val) => emit(state.copyWith(fName: val));
  void onLNameChanged(String val) => emit(state.copyWith(lName: val));
  void onEmailChanged(String val) => emit(state.copyWith(email: val));
  void onPasswordChanged(String val) => emit(state.copyWith(password: val));
  void onConfirmPasswordChanged(String val) =>
      emit(state.copyWith(confirmPassword: val));
  void onPhoneChanged(String val) => emit(state.copyWith(phoneNumber: val));
  void onAddressChanged(String val) => emit(state.copyWith(address: val));
  void onExperienceChanged(String val) =>
      emit(state.copyWith(experienceYears: val));
  void onNationalIdChanged(String val) => emit(state.copyWith(nationalId: val));
  void onBirthDateChanged(String val) => emit(state.copyWith(birthDate: val));
  void onGenderChanged(String gender) {
    emit(state.copyWith(gender: gender));
  }

  Future<void> addDoctor() async {
    emit(state.copyWith(isLoading: true));

    final request = AddDoctorRequest(
      userName: state.userName,
      fName: state.fName,
      lName: state.lName,
      email: state.email,
      password: state.password,
      confirmPassword: state.confirmPassword,
      phoneNumber: state.phoneNumber,
      address: state.address,
      experienceYears: int.tryParse(state.experienceYears),
      nationalId: state.nationalId,
      birthDate: state.birthDate,
      gender: state.gender,
      clientUri: "https://frontend-app.com/confirm-email",
    );

    final result = await addDoctorUseCase(addDoctorRequest: request);

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorModel: failure)),
      (successMsg) =>
          emit(state.copyWith(isLoading: false, successMessage: successMsg)),
    );
  }
}
