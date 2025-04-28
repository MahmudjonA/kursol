import 'package:lms_system/features/auth/domain/repositories/auth_repo.dart';

class LogOutUseCase {
  final AuthRepo authRepository;

  LogOutUseCase(this.authRepository);

  Future<void> call({required String refreshToken}) async {
    await authRepository.logoutUser(refreshToken: refreshToken);
  }
}
