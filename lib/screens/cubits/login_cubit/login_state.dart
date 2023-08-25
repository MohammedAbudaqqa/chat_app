part of 'login_cubit.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFaliuar extends LoginState {
  String errorMessage;
  LoginFaliuar({required this.errorMessage});
}

class LoginLoading extends LoginState {}
