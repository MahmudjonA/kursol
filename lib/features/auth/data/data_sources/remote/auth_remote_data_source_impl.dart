import 'package:dio/dio.dart';
import '../../../../../core/common/api_urls.dart';
import '../../../../../core/network/dio_client.dart';
import '../../../../../core/network/dio_exception_handler.dart';
import '../../../../../core/utils/logger.dart';
import '../../models/auth_token_model.dart';
import '../../models/register_model.dart';
import '../../models/reset_password_model.dart';
import 'auth_remote_data_source.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<RegisterUserModel> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.register,
        data: {'phone_or_email': email, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Registration successful: ${response.data}');
        return RegisterUserModel.fromJson(response.data);
      } else {
        LoggerService.warning("Registration failed: ${response.statusCode}");
        throw Exception('Registration failed: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error during user registration: $e');
      rethrow;
    }
  }

  @override
  Future<AuthTokenModel> confirmEmail({
    required int userId,
    required int code,
    required bool isResetPassword,
  }) async {
    try {
      final response = await dioClient.post(
        isResetPassword ? ApiUrls.resetPasswordConfirm : ApiUrls.confirmEmail,
        data: {'user_id': userId, 'code': code},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Email confirmation successful: ${response.data}');
        dioClient.setToken(response.data['access']);
        LoggerService.info(
          'Token set successfully: ${response.data['access']}',
        );
        return AuthTokenModel.fromJson(response.data);
      } else {
        LoggerService.warning(
          "Email confirmation failed: ${response.statusCode}",
        );
        throw Exception('Email confirmation failed: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error during email confirmation: $e');
      rethrow;
    }
  }

  @override
  Future<AuthTokenModel> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.login,
        data: {'email': email, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Login successful: ${response.data}');
        dioClient.setToken(response.data['access']);
        LoggerService.info(
          'Token set successfully: ${response.data['access']}',
        );
        return AuthTokenModel.fromJson(response.data);
      } else {
        LoggerService.warning("Login failed: ${response.statusCode}");
        throw Exception('Login failed: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Unexpected error during user login: $e');
      rethrow;
    }
  }

  @override
  Future<ResetPasswordModel> resetPassword({
    required String emailOrPhone,
  }) async {
    try {
      final response = await dioClient.post(
        ApiUrls.resetPassword,
        data: {'phone_or_email': emailOrPhone},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Password reset successful: ${response.data}');
        return ResetPasswordModel.fromJson(response.data);
      } else {
        LoggerService.warning("Password reset failed: ${response.statusCode}");
        throw Exception('Password reset failed: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error during password reset: $e');
      rethrow;
    }
  }

  @override
  Future<void> createNewPassword({
    required String newPassword,
    required String token,
  }) async {
    try {
      dioClient.setToken(token);
      final response = await dioClient.post(
        ApiUrls.resetNewPassword,
        data: {'password_one': newPassword},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('New password created successfully');
      } else {
        LoggerService.warning(
          "Failed to create new password: ${response.statusCode}",
        );
        throw Exception(
          'Failed to create new password: ${response.statusCode}',
        );
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error during new password creation: $e');
      rethrow;
    }
  }

  @override
  Future<void> logoutUser({required String refreshToken}) async {
    try {
      final response = await dioClient.post(
        ApiUrls.logout,
        data: {'refresh_token': refreshToken},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Logout successful: ${response.data}');
      } else {
        LoggerService.warning("Logout failed: ${response.statusCode}");
        throw Exception('Logout failed: ${response.statusCode}');
      }
    } on DioException catch (dioError) {
      throw DioExceptionHandler.handle(dioError); // 🧠 используем утилиту
    } catch (e) {
      LoggerService.error('Error during new password creation: $e');
      rethrow;
    }
  }
}
