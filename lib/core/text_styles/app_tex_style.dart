import 'package:flutter/material.dart';
import 'package:lms_system/core/text_styles/urbanist_text_style.dart';

abstract class AppTextStyles {
  static final UrbanistTextStyles urbanist = UrbanistTextStyles();

  TextStyle bold({required Color color, required double fontSize});

  TextStyle semiBold({required Color color, required double fontSize});

  TextStyle medium({required Color color, required double fontSize});

  TextStyle regular({required Color color, required double fontSize});
}
