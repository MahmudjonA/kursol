import 'package:lms_system/features/auth/domain/entities/reset_password.dart';
import 'package:lms_system/features/auth/domain/repositories/auth_repo.dart';

class ResetPasswordUseCase {
  final AuthRepo authRepository;

  ResetPasswordUseCase(this.authRepository);

  Future<ResetPassword> call({required String emailOrPhone}) async {
    return await authRepository.resetPassword(emailOrPhone: emailOrPhone);
  }
}
