part of 'login_cubit.dart';

abstract class LoginStates {}
@immutable
class TogglePasswordState extends LoginStates {
  final bool isSecured;
  TogglePasswordState(this.isSecured);

}
class LoginInitial extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuccessState extends LoginStates {
  final LoginModel loginModel;
  LoginSuccessState(this.loginModel);
}
class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

