import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../../helper/show_snack_bar.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(LoginSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFaliuar(errorMessage: "User Not Found"));
      } else if (e.code == 'wrong-password') {
        emit(LoginFaliuar(errorMessage: "Wrong Password"));
      }
    } catch (e) {
      print(e);
      emit(LoginFaliuar(errorMessage: "e.toString()"));
    }
  }
}
