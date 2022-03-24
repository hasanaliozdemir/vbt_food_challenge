part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {
  final bool isLoading;

  RegisterLoading({required this.isLoading});
}

class RegisterFailure extends RegisterState {
  final String error;

  RegisterFailure({required this.error});
}

class RegisterComplated extends RegisterState {
  final String message;

  RegisterComplated({required this.message});
}
