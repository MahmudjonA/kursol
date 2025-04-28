import 'package:lms_system/features/auth/data/models/register_model.dart';
import 'package:lms_system/features/auth/domain/entities/auth_token.dart';
import 'package:lms_system/features/auth/domain/entities/reset_password.dart';
import 'package:lms_system/features/auth/domain/repositories/auth_repo.dart';
import '../data_sources/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<RegisterUserModel> registerUser({
    required String email,
    required String password,
  }) async {
    return authRemoteDataSource.registerUser(email: email, password: password);
  }

  @override
  Future<AuthToken> confirmEmail({
    required int userId,
    required int code,
    required bool isResetPassword,
  }) {
    return authRemoteDataSource.confirmEmail(
      userId: userId,
      code: code,
      isResetPassword: isResetPassword,
    );
  }

  @override
  Future<AuthToken> loginUser({
    required String email,
    required String password,
  }) {
    return authRemoteDataSource.loginUser(email: email, password: password);
  }

  @override
  Future<ResetPassword> resetPassword({required String emailOrPhone}) {
    return authRemoteDataSource.resetPassword(emailOrPhone: emailOrPhone);
  }

  @override
  Future<void> createNewPassword({
    required String newPassword,
    required String token,
  }) {
    return authRemoteDataSource.createNewPassword(
      newPassword: newPassword,
      token: token,
    );
  }

  @override
  Future<void> logoutUser({required String refreshToken}) {
    return authRemoteDataSource.logoutUser(refreshToken: refreshToken);
  }
}
