import 'package:lms_system/features/auth/data/models/register_model.dart';
import '../entities/register_response_user.dart';
import '../repositories/auth_repo.dart';

class RegisterUserUseCase {
  final AuthRepo authRepository;

  RegisterUserUseCase(this.authRepository);

  Future<RegisterResponseUser> call({
    required String email,
    required String password,
  }) async {
    return await authRepository.registerUser(email: email, password: password);
  }
}
