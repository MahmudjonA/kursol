import 'package:flutter/material.dart';
import 'package:lms_system/features/auth/presentation/pages/slpash/splash_page.dart';
import 'core/responsiveness/app_responsive.dart';
import 'core/route/rout_generator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return MaterialApp(
      navigatorKey: AppRoute.navigatorKey,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
