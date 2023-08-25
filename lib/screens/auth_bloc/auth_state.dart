part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class LoginInitial extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFaliuar extends AuthState {
  String errorMessage;
  LoginFaliuar({required this.errorMessage});
}

class LoginLoading extends AuthState {}

class RegisterInitial extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFaliuar extends AuthState {
  String errorMessage;
  RegisterFaliuar({required this.errorMessage});
}

class RegisterLoading extends AuthState {}
