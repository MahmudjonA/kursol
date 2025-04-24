import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lms_system/features/auth/domain/use_cases/confirm_use_case.dart';
import 'package:lms_system/features/auth/presentation/bloc/auth_event.dart';
import 'package:lms_system/features/auth/presentation/bloc/confirm_email/confirm_email_state.dart';

class ConfirmEmailBloc extends Bloc<AuthEvent, ConfirmEmailState> {
  final ConfirmUseCase confirmEmail;

  ConfirmEmailBloc(this.confirmEmail) : super(ConfirmEmailInitial()) {
    on<ConfirmEmail>((event, emit) async {
      emit(ConfirmEmailLoading());
      try {
        final result = await confirmEmail(
          userId: event.userId,
          code: event.code,
          isResendPassword: event.isResetPassword,
        );
        emit(ConfirmEmailSuccess(confirmEmail: result));
      } catch (e) {
        emit(ConfirmEmailError(message: e.toString()));
      }
    });
  }
}
