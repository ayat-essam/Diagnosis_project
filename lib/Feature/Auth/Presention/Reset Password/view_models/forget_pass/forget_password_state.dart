abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final String message;
  ForgetPasswordSuccess({required this.message});
}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String error;
  ForgetPasswordFailure({required this.error});
}
