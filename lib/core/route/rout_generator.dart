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
import 'package:lms_system/features/course_details/presentation/pages/course_details/course_details_page.dart';
import 'package:lms_system/features/course_details/presentation/pages/mentor_profile/mentor_profile_page.dart';
import 'package:lms_system/features/home/presentation/pages/bookmark/bookmark_page.dart';
import 'package:lms_system/features/home/presentation/pages/courses/popular_courses.dart';
import 'package:lms_system/features/home/presentation/pages/home_page.dart';
import 'package:lms_system/features/main_page.dart';
import 'package:lms_system/features/home/presentation/pages/mentors/mentors_page.dart';
import 'package:lms_system/features/home/presentation/pages/notification/notification_page.dart';
import 'package:lms_system/features/home/presentation/pages/search/search_page.dart';
import '../../features/auth/presentation/pages/slpash/splash_page.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void close() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState!.pop();
    }
  }

  static void go(Widget page) {
    navigatorKey.currentState?.push(_createRoute(page));
  }

  static void open(Widget page) {
    navigatorKey.currentState?.pushAndRemoveUntil(
      _createRoute(page),
      (Route<dynamic> route) => false,
    );
  }

  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 200),
      reverseTransitionDuration: const Duration(milliseconds: 100),
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.ease,
        );
        return ScaleTransition(
          alignment: Alignment.center,
          scale: Tween<double>(begin: 0.950, end: 1).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  static Route onGenerateRoute(RouteSettings routeSettings) {
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
      case RouteNames.courseDetails:
        return MaterialPageRoute(builder: (_) => CourseDetailsPage());
      case RouteNames.mentorsProfile:
        return MaterialPageRoute(builder: (_) => MentorProfilePage());

      // case RouteNames.onboarding:
      //   int productId = routeSettings.arguments as int;
      //   return MaterialPageRoute(
      //     builder: (_) => SingleProductPage(productId: productId),
      //   );
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Page not found')),
          ),
    );
  }
}
