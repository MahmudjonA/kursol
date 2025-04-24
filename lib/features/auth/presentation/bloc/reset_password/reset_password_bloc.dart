import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_system/features/auth/domain/use_cases/reset_password_use_case.dart';
import 'package:lms_system/features/auth/presentation/bloc/auth_event.dart';
import 'package:lms_system/features/auth/presentation/bloc/reset_password/reset_password_state.dart';

class ResetPasswordBloc extends Bloc<AuthEvent, ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;

  ResetPasswordBloc(this.resetPasswordUseCase) : super(ResetPasswordInitial()) {
    on<ResetPasswordEvent>(onResetPasswordEvent);
  }

  Future<void> onResetPasswordEvent(event, emit) async {
    emit(ResetPasswordLoading());
    try {
      final result = await resetPasswordUseCase(
        emailOrPhone: event.emailOrPhone,
      );
      emit(ResetPasswordSuccess(response: result));
    } catch (e) {
      emit(ResetPasswordError(message: e.toString()));
    }
  }
}
