part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}
class TogglePasswordState extends RegisterState {
  final bool isSecured;
  TogglePasswordState(this.isSecured);

}

class RegisterInitial extends RegisterState {}
class RegisterLoadingState extends RegisterState {}
class RegisterSuccessState extends RegisterState {}
class RegisterErrorState extends RegisterState {
  final String error;
  RegisterErrorState(this.error);
}


