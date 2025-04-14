import 'package:lms_system/features/auth/data/models/auth_model.dart';
import 'package:lms_system/features/auth/domain/entities/register_response_user.dart';

import '../../presentation/bloc/auth_event.dart';

abstract class AuthRepo {
  Future<RegisterUserModel> registerUser({
    required String email,
    required String password,
  });
}
