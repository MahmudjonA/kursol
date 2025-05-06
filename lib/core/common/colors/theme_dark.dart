import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.background.dark,
  primaryColor: AppColors.primary(),
  colorScheme: ColorScheme.dark(
    primary: AppColors.primary(),
    secondary: AppColors.secondary,
    background: AppColors.background.dark2,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.white),
  ),
);
