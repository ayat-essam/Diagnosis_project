abstract class AuthState {}

class initialState extends AuthState {}

class SuccessLoginState extends AuthState {}

class FailureLoginState extends AuthState {
  final String message;
  FailureLoginState(this.message);
}

class LoadingLoginState extends AuthState {}

class SuccessRegisterState extends AuthState {}

class FailureRegisterState extends AuthState {
  final String message;
  FailureRegisterState(this.message);
}

class LoadingRegisterState extends AuthState {}
