import 'package:lms_system/features/auth/data/models/register_model.dart';
import 'package:lms_system/features/auth/domain/entities/auth_token.dart';
import 'package:lms_system/features/auth/domain/entities/register_response_user.dart';
import 'package:lms_system/features/auth/domain/entities/reset_password.dart';

abstract class AuthRepo {
  Future<RegisterResponseUser> registerUser({
    required String email,
    required String password,
  });

  Future<AuthToken> confirmEmail({
    required int userId,
    required int code,
    required bool isResetPassword,
  });

  Future<AuthToken> loginUser({
    required String email,
    required String password,
  });

  Future<ResetPassword> resetPassword({required String emailOrPhone});

  Future<void> createNewPassword({
    required String newPassword,
    required String token,
  });
  // Future<UserAccount> fillProfile({
  //   required String image,
  //   required String fullName,
  //   required String userName,
  //   required String email,
  //   required String phone,
  //   required String address,
  // });
}
