import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      // TODO: implement event handler
      // يعني الكود الي بدك اياه يتنفد
      if (event is LoginEvent) {
        emit(LoginLoading());
        try {
          UserCredential user = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: event.email, password: event.password);

          emit(LoginSuccess());
        } on FirebaseAuthException catch (e) {
          if (e.code == 'user-not-found') {
            emit(LoginFaliuar(errorMessage: "User Not Found"));
          } else if (e.code == 'wrong-password') {
            emit(LoginFaliuar(errorMessage: "Wrong Password"));
          }
        } catch (e) {
          print("wwwwwwwww===================");
          print(e);
          emit(LoginFaliuar(errorMessage: "e.toString()"));
        }
      }
    });
  }
  @override
  void onTransition(Transition<AuthEvent, AuthState> transition) {
    // TODO: implement onTransition

    super.onTransition(transition);
    print(transition);
  }
}
