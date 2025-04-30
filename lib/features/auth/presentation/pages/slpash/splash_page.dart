import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lms_system/core/di/service_locator.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:lms_system/features/main_page.dart';
import 'package:lms_system/features/auth/presentation/pages/onboarding/onboarding_page.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';
import '../../bloc/auth_event.dart';
import '../../bloc/log_in_user/log_in_user_bloc.dart';
import '../../bloc/log_in_user/log_in_user_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future<void> _checkRemembered(BuildContext context) async {
    final authLocal = sl<AuthLocalDataSource>();
    final data = await authLocal.getRemembered();

    final email = data['email'];
    final password = data['password'];

    if (email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      BlocProvider.of<LogInUserBloc>(
        context,
      ).add(LoginUser(email: email, password: password));
    } else {
      AppRoute.go(const OnboardingPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        _checkRemembered(context);
      });
    });

    return BlocListener<LogInUserBloc, LogInUserState>(
      listener: (context, state) async {
        if (state is LogInUserSuccess) {
          final authLocal = sl<AuthLocalDataSource>();
          await authLocal.saveAuthToken(state.user.refresh, state.user.access);
          AppRoute.go(const MainPage());
        } else if (state is LogInUserError) {
          AppRoute.go(const OnboardingPage());
        }
      },

      child: Scaffold(
        backgroundColor: AppColors.primary.blue500,
        body: Padding(
          padding: EdgeInsets.only(bottom: appH(100)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Image.asset("assets/icons/splash1.png")),
                SpinKitFadingCircle(color: AppColors.white, size: 60.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
