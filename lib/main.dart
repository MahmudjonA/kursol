import 'package:flutter/material.dart';
import 'package:lms_system/bloc_provider.dart';
import 'app.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MyBlocProvider(child: MyApp()));
}
