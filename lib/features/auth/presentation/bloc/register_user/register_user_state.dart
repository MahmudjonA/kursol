abstract class RegisterUserState {
  const RegisterUserState();
}

class RegisterUserInitial extends RegisterUserState {}

class RegisterUserLoading extends RegisterUserState {}

class RegisterUserSuccess extends RegisterUserState {
  const RegisterUserSuccess();
}

class RegisterUserError extends RegisterUserState {
  final String message;

  const RegisterUserError({required this.message});
}
