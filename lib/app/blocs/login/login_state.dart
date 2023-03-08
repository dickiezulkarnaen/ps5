
class LoginState {}

class SuccessLoginState extends LoginState {}

class ErrorLoginState extends LoginState {

  final String? message;

  ErrorLoginState(this.message);

}

class LoadingLoginState extends LoginState {}
class FinishLoadingLoginState extends LoginState {}