import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_system/features/auth/domain/use_cases/log_in_user_use_case.dart';
import 'package:lms_system/features/auth/presentation/bloc/auth_event.dart';
import 'log_in_user_state.dart';

class LogInUserBloc extends Bloc<AuthEvent, LogInUserState> {
  final LogInUserUseCase logInUseCase;

  LogInUserBloc(this.logInUseCase) : super(LogInUserInitial()) {
    on<LoginUser>(onLogInUser);
  }

  Future<void> onLogInUser(event, emit) async {
    emit(LogInUserLoading());
    try {
      final result = await logInUseCase(
        email: event.email,
        password: event.password,
      );
      emit(LogInUserSuccess(user: result));
    } catch (e) {
      emit(LogInUserError(message: e.toString()));
    }
  }
}
