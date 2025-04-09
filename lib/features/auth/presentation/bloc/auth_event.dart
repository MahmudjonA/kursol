abstract class AuthEvent {
  const AuthEvent();
}

class RegisterUser extends AuthEvent {
  final String emailOrPhone;
  final String password;

  const RegisterUser({
    required this.emailOrPhone,
    required this.password,
  });
}
