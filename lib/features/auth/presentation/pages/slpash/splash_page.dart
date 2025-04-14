import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lms_system/core/route/rout_generator.dart';
import 'package:lms_system/features/auth/presentation/pages/onboarding/onboarding_page.dart';
import '../../../../../../core/common/colors/app_colors.dart';
import '../../../../../../core/responsiveness/app_responsive.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2), () {
        AppRoute.go(OnboardingPage());
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
