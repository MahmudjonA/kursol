import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_system/features/auth/domain/use_cases/reset_new_password.dart';
import 'package:lms_system/features/auth/presentation/bloc/auth_event.dart';
import 'reset_new_password_state.dart';

class ResetNewPasswordBloc extends Bloc<AuthEvent, ResetNewPasswordState> {
  final ResetNewPasswordUseCase resetNewPasswordUseCase;

  ResetNewPasswordBloc(this.resetNewPasswordUseCase)
    : super(ResetNewPasswordInitial()) {
    on<ResetNewPasswordEvent>((event, emit) async {
      emit(ResetNewPasswordLoading());
      try {
        await resetNewPasswordUseCase(
          newPassword: event.newPassword,
          token: event.token,
        );
        emit(ResetNewPasswordSuccess());
      } catch (e) {
        emit(ResetNewPasswordError(message: e.toString()));
      }
    });
  }
}
