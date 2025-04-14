import 'package:lms_system/core/utils/logger.dart';
import '../../../../core/network/dio_client.dart';
import '../models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterUserModel> registerUser({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient = DioClient();

  @override
  Future<RegisterUserModel> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        'auth/register/',
        data: {'phone_or_email': email, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoggerService.info('Registration successful: ${response.data}');
        return RegisterUserModel.fromJson(response.data);
      } else {
        LoggerService.warning("Registration failed: ${response.statusCode}");
        throw Exception('Registration failed: ${response.statusCode}');
      }
    } catch (e) {
      LoggerService.error('Error during user registration: $e');
      rethrow;
    }
  }
}
