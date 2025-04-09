import 'package:flutter/material.dart';
import 'package:lms_system/core/route/rout_names.dart';
import 'package:lms_system/features/auth/presentation/pages/auth_page.dart';
import 'package:lms_system/features/auth/presentation/pages/forget_reset_password/pages/create_new_password.dart';
import 'package:lms_system/features/auth/presentation/pages/forget_reset_password/pages/forgot_password.dart';
import 'package:lms_system/features/auth/presentation/pages/forget_reset_password/pages/send_code_forgot_password.dart';
import 'package:lms_system/features/auth/presentation/pages/onboarding/onboarding_page.dart';
import 'package:lms_system/features/auth/presentation/pages/profile/pages/create_new_pin.dart';
import 'package:lms_system/features/auth/presentation/pages/profile/pages/fill_your_profile.dart';
import 'package:lms_system/features/auth/presentation/pages/profile/pages/finger_print.dart';
import 'package:lms_system/features/auth/presentation/pages/sign_in/sign_in_page.dart';
import 'package:lms_system/features/auth/presentation/pages/sign_up/sign_up_page.dart';
import 'package:lms_system/features/home/presentation/pages/bookmark/bookmark_page.dart';
import 'package:lms_system/features/home/presentation/pages/courses/popular_courses.dart';
import 'package:lms_system/features/home/presentation/pages/home_page.dart';
import 'package:lms_system/features/home/presentation/pages/main_page.dart';
import 'package:lms_system/features/home/presentation/pages/mentors/mentors_page.dart';
import 'package:lms_system/features/home/presentation/pages/notification/notification_page.dart';
import 'package:lms_system/features/home/presentation/pages/search/search_page.dart';
import '../../features/auth/presentation/pages/slpash/splash_page.dart';

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case RouteNames.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingPage());
      case RouteNames.auth:
        return MaterialPageRoute(builder: (_) => const AuthPage());
      case RouteNames.signUp:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case RouteNames.signIn:
        return MaterialPageRoute(builder: (_) => const SignInPage());
      case RouteNames.forgotPassword:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case RouteNames.createNewPassword:
        return MaterialPageRoute(builder: (_) => const CreateNewPassword());
      case RouteNames.sendCode:
        return MaterialPageRoute(
          builder: (_) => const SendCodeForgotPassword(),
        );
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case RouteNames.main:
        return MaterialPageRoute(builder: (_) => MainPage());
      case RouteNames.createNewPin:
        return MaterialPageRoute(builder: (_) => CreateNewPin());
      case RouteNames.fillYourProfile:
        return MaterialPageRoute(builder: (_) => FillProfilePage());
      case RouteNames.fingerPrint:
        return MaterialPageRoute(builder: (_) => Fingerprint());
      case RouteNames.bookmark:
        return MaterialPageRoute(builder: (_) => BookmarkPage());
      case RouteNames.notification:
        return MaterialPageRoute(builder: (_) => NotificationPage());
      case RouteNames.search:
        return MaterialPageRoute(builder: (_) => SearchPage());
      case RouteNames.mentors:
        return MaterialPageRoute(builder: (_) => MentorsPage());
      case RouteNames.popularCourses:
        return MaterialPageRoute(builder: (_) => PopularCourses());

      // case RouteNames.onboarding:
      //   int productId = routeSettings.arguments as int;
      //   return MaterialPageRoute(
      //     builder: (_) => SingleProductPage(productId: productId),
      //   );
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Page not found')),
          ),
    );
  }
}
