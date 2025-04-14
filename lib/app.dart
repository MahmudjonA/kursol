import 'package:flutter/material.dart';
import 'core/responsiveness/app_responsive.dart';
import 'core/route/rout_generator.dart';
import 'core/route/rout_names.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppResponsive.init(context);
    return MaterialApp(
      navigatorKey: AppRoute.navigatorKey,
      debugShowCheckedModeBanner: false,
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRoute.onGenerateRoute,
      // home: SplashPage(),
    );
  }
}
