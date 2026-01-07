import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/data/models/add_admin_request.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/domain/usecases/add_admin_usecase.dart';
import 'package:diagnosis_project/Feature/Admin/Admin%20Setting%20System/presentation/cubit/add_admin_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  final AddAdminUseCase addAdminUseCase;
  AddAdminCubit(this.addAdminUseCase) : super(AddAdminState());

  void onNameChanged(String val) => emit(state.copyWith(userName: val));
  void onEmailChanged(String val) => emit(state.copyWith(email: val));
  void onPasswordChanged(String val) => emit(state.copyWith(password: val));
  void onConfirmPasswordChanged(String val) =>
      emit(state.copyWith(confirmPassword: val));
  void onPhoneChanged(String val) => emit(state.copyWith(phoneNumber: val));

  Future<void> addAdmin() async {
    emit(state.copyWith(isLoading: true));

    final request = AddAdminRequest(
      userName: state.userName,
      email: state.email,
      password: state.password,
      confirmPassword: state.confirmPassword,
      phoneNumber: "01120989899",
      //phoneNumber: state.phoneNumber,
    );

    final result = await addAdminUseCase(addAdminRequest: request);

    result.fold(
      (failure) => emit(state.copyWith(isLoading: false, errorModel: failure)),
      (successMsg) =>
          emit(state.copyWith(isLoading: false, successMessage: successMsg)),
    );
  }
}
