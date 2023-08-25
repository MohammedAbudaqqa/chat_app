part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterSuccess extends RegisterState {}

class RegisterFaliuar extends RegisterState {
  String errorMessage;
  RegisterFaliuar({required this.errorMessage});
}

class RegisterLoading extends RegisterState {}
