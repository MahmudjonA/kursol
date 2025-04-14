import 'package:lms_system/features/auth/data/models/auth_model.dart';
import 'package:lms_system/features/auth/domain/repositories/auth_repo.dart';

import '../data_sources/auth_remote_data_source.dart';

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
}
