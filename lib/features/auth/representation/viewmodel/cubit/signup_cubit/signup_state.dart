abstract class SignUpState {}

class InitialSignUpState extends SignUpState {}

class LoadingSignUpState extends SignUpState {}

class SuccessSignUpState extends SignUpState {}

class ErrorSignUpState extends SignUpState {
  String error;
  ErrorSignUpState(this.error);
}
