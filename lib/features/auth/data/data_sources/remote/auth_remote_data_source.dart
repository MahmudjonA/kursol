import 'package:lms_system/features/auth/data/models/auth_token_model.dart';
import 'package:lms_system/features/auth/data/models/reset_password_model.dart';
import '../../models/register_model.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterUserModel> registerUser({
    required String email,
    required String password,
  });

  Future<AuthTokenModel> confirmEmail({
    required int userId,
    required int code,
    required bool isResetPassword,
  });

  Future<AuthTokenModel> loginUser({
    required String email,
    required String password,
  });

  Future<ResetPasswordModel> resetPassword({required String emailOrPhone});

  Future<void> createNewPassword({
    required String newPassword,
    required String token,
  });

  Future<void> logoutUser({required String refreshToken});
}
