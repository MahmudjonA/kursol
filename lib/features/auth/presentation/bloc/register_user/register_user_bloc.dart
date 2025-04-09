import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_system/features/auth/domain/use_cases/registration_use_case.dart';
import 'package:lms_system/features/auth/presentation/bloc/auth_event.dart';
import 'package:lms_system/features/auth/presentation/bloc/register_user/register_user_state.dart';

class RegisterUserBloc extends Bloc<AuthEvent, RegisterUserState> {
  final RegisterUserUseCase registerUserUseCase;

  RegisterUserBloc(this.registerUserUseCase) : super(RegisterUserInitial()) {
    on<RegisterUser>((event, emit) async {
      emit(RegisterUserLoading());
      try {
        final result = await registerUserUseCase(
          email: event.emailOrPhone,
          password: event.password,
        );
        emit(
          RegisterUserSuccess(),
        );
      } catch (e) {
        emit(RegisterUserError(message: e.toString()));
      }
    });
  }
}
