import 'package:lms_system/features/auth/domain/entities/auth_token.dart';
import 'package:lms_system/features/auth/domain/repositories/auth_repo.dart';

class ConfirmUseCase {
  final AuthRepo authRepository;

  ConfirmUseCase(this.authRepository);

  Future<AuthToken> call({
    required int userId,
    required int code,
    required bool isResendPassword,
  }) async {
    return await authRepository.confirmEmail(
      userId: userId,
      code: code,
      isResetPassword: isResendPassword,
    );
  }
}
