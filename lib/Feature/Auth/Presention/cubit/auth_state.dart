abstract class AuthState{

}

class LoginLoading extends AuthState{}

class LoginSuccess extends AuthState{}

class LoginError extends AuthState{
  String errorMess;
  LoginError({required this.errorMess});
}

//register states

class RegisterLoading extends AuthState{

}
class RegisterSuccess extends AuthState{}

class RegisterError extends AuthState{

  String errorMess;
  RegisterError({required this.errorMess});
}

