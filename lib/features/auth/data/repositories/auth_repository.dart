import 'package:lms_system/features/auth/domain/repositories/auth_repo.dart';

import '../data_sources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<void> registerUser({
    required String email,
    required String password,
  }) async {
    return await authRemoteDataSource.registerUser(
      email: email,
      password: password,
    );
  }
}
