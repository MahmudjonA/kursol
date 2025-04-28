abstract class LogoutUserState {
  const LogoutUserState();
}

class LogoutUserInitial extends LogoutUserState {}

class LogoutUserLoading extends LogoutUserState {}

class LogoutUserSuccess extends LogoutUserState {}

class LogoutUserError extends LogoutUserState {
  final String message;

  const LogoutUserError({required this.message});
}
