import 'package:lms_system/features/auth/domain/entities/register_response_user.dart';

abstract class RegisterUserState {
  const RegisterUserState();
}

class RegisterUserInitial extends RegisterUserState {}

class RegisterUserLoading extends RegisterUserState {}

class RegisterUserSuccess extends RegisterUserState {
  final RegisterResponseUser registerUser;
  const RegisterUserSuccess({required this.registerUser});
}

class RegisterUserError extends RegisterUserState {
  final String message;

  const RegisterUserError({required this.message});
}
