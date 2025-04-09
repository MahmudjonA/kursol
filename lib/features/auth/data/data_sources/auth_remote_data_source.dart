import 'package:dio/dio.dart';

abstract class AuthRemoteDataSource {
  Future<void> registerUser({required String email, required String password});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSourceImpl({required this.dio}) {
    dio.options = BaseOptions(
      headers: {'Content-Type': 'application/json'},
      baseUrl: 'https://manuchehra.pythonanywhere.com/api/',
    );
  }

  @override
  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dio.post(
        '/register_user/register/',
        data: {'phone_or_email': email, 'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return;
      } else {
        throw Exception('Registration failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during user registration: $e');
      rethrow;
    }
  }
}
