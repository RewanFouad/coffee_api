import 'package:coffee_api/features/auth/representation/viewmodel/cubit/signin_cubit/signin_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(InitialSignInState());
  Future<void> signIn(String email, String password) async {
    emit(LoadingSignInState());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      emit(SuccessSignInState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(ErrorSignInState('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(ErrorSignInState('Wrong password provided for that user.'));
      }
    }
  }
}
