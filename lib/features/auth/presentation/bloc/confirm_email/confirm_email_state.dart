import 'package:lms_system/features/auth/domain/entities/auth_token.dart';

abstract class ConfirmEmailState {
  const ConfirmEmailState();
}

class ConfirmEmailInitial extends ConfirmEmailState {}

class ConfirmEmailLoading extends ConfirmEmailState {}

class ConfirmEmailSuccess extends ConfirmEmailState {
  final AuthToken confirmEmail;
  const ConfirmEmailSuccess({required this.confirmEmail});
}

class ConfirmEmailError extends ConfirmEmailState {
  final String message;

  const ConfirmEmailError({required this.message});
}
