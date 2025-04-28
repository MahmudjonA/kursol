import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lms_system/core/di/service_locator.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:lms_system/features/main_page.dart';
import 'package:lms_system/features/auth/presentation/pages/onboarding/onboarding_page.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future<void> _checkRemembered() async {
    final authLocal = sl<AuthLocalDataSource>();
    final data = await authLocal.getRemembered();

    final email = data['email'];
    final password = data['password'];

    if (email != null &&
        email.isNotEmpty &&
        password != null &&
        password.isNotEmpty) {
      AppRoute.go(const MainPage());
    } else {
      AppRoute.go(const OnboardingPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        _checkRemembered();
      });
    });

    return Scaffold(
      backgroundColor: AppColors.primary.blue500,
      body: Padding(
        padding: EdgeInsets.only(bottom: appH(100)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image(image: AssetImage("assets/icons/splash1.png")),
              ),
              SpinKitFadingCircle(color: AppColors.white, size: 60.0),
            ],
          ),
        ),
      ),
    );
  }
}
