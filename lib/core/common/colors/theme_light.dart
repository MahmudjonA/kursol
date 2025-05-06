import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.greyScale.grey50,
  primaryColor: AppColors.primary(),
  colorScheme: ColorScheme.light(
    primary: AppColors.primary(),
    secondary: AppColors.secondary,
    background: AppColors.greyScale.grey100,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black),
  ),
);
