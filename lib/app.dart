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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRoute(context: context).onGenerateRoute,
      // home: SplashPage(),
    );
  }
}
