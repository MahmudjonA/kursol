import 'package:lms_system/features/auth/domain/entities/auth_token.dart';
import 'package:lms_system/features/auth/domain/repositories/auth_repo.dart';

class LogInUserUseCase {
  final AuthRepo authRepository;

  LogInUserUseCase(this.authRepository);

  Future<AuthToken> call({required String email,required String password}) async {
    return await authRepository.loginUser(email: email, password: password);
  }
}
