import 'package:coffee_api/features/auth/representation/viewmodel/cubit/signup_cubit/signup_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(InitialSignUpState());
  Future<void> signUp(String email, String password) async {
    try {
      emit(LoadingSignUpState());
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SuccessSignUpState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(ErrorSignUpState('The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        emit(ErrorSignUpState('The account already exists for that email.'));
      }
    } catch (e) {
      print(e);
    }
  }
}
