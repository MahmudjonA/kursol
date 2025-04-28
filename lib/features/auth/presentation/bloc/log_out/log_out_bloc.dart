import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_system/features/auth/domain/use_cases/log_out_use_case.dart';
import 'package:lms_system/features/auth/presentation/bloc/auth_event.dart';

import 'log_out_state.dart';

class LogoutUserBloc extends Bloc<AuthEvent, LogoutUserState> {
  final LogOutUseCase logoutUserUseCase;

  LogoutUserBloc(this.logoutUserUseCase) : super(LogoutUserInitial()) {
    on<LogoutUserEvent>((event, emit) async {
      emit(LogoutUserLoading());
      try {
        await logoutUserUseCase(refreshToken: event.refreshToken);
        emit(LogoutUserSuccess());
      } catch (e) {
        emit(LogoutUserError(message: e.toString()));
      }
    });
  }
}
