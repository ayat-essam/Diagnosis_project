// import 'package:diagnosis_project/Feature/Auth/Presention/cubit/auth_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
//
// import '../../data/models/login_request.dart';
// import '../../data/models/register_request.dart';
// import '../../Domain/UsesCase/login_use_case.dart';
// import '../../Domain/UsesCase/register_use_case.dart';
//
//   @singleton
//   class AuthCubit extends Cubit<AuthState> {
//   final LoginUseCase _loginUseCase;
//   final RegisterUseCase _registerUseCase;
//   AuthCubit(this._registerUseCase,
//   this._loginUseCase) :super (initialState());
//
//   Future<void> login(LoginRequest loginReq) async {
//   emit(LoadingLoginState());
//   final repo = await _loginUseCase(loginReq);
//   repo.fold(
//   (failure) => emit(FailureLoginState(failure.mess)),
//   (_) => emit(SuccessLoginState()));
//   }
//
//
//   Future<void> register(RegisterRequest registerReq) async {
//   emit(LoadingRegisterState());
//   final repo = await _registerUseCase(registerReq);
//   repo.fold(
//   (failure) => emit(FailureRegisterState(failure.mess)),
//   (_) => emit(SuccessRegisterState()));
//
//   }
//   }
