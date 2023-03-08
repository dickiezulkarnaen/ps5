

class LoginEvent {}

class OnLoginEvent extends LoginEvent{}

class OnInputEmailEvent extends LoginEvent{
  OnInputEmailEvent(this.email);
  String email;
}

class OnInputPasswordEvent extends LoginEvent{
  OnInputPasswordEvent(this.password);
  String password;
}