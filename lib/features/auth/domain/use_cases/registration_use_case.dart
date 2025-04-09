import '../repositories/auth_repo.dart';

class RegisterUserUseCase {
  final AuthRepo authRepository;

  RegisterUserUseCase(this.authRepository);

  Future<void> call({required String email, required String password}) async {
    return await authRepository.registerUser(email: email, password: password);
  }
}
