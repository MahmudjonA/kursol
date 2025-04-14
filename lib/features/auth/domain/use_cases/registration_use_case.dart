import 'package:lms_system/features/auth/data/models/auth_model.dart';

import '../../presentation/bloc/auth_event.dart';
import '../repositories/auth_repo.dart';

class RegisterUserUseCase {
  final AuthRepo authRepository;

  RegisterUserUseCase(this.authRepository);

  Future<RegisterUserModel> call({required String email, required String password}) async {
    return await authRepository.registerUser(email: email, password: password);
  }
}
