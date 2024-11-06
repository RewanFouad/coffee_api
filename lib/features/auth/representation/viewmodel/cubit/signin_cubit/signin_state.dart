abstract class SignInState {}

class InitialSignInState extends SignInState {}

class LoadingSignInState extends SignInState {}

class SuccessSignInState extends SignInState {}

class ErrorSignInState extends SignInState {
  String error;
  ErrorSignInState(this.error);
}
