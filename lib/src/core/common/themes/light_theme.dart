import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/constants/colors.dart';
import 'package:spend_tracker/src/core/common/fonts/app_font_styles.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.bgColor,
    primaryColor: AppColors.primaryColor,
    fontFamily: 'Inter',
    useMaterial3: true,
    disabledColor: AppColors.light20,
    textTheme: TextTheme(
      displayLarge: AppFontStyles.display,
      headlineMedium: AppFontStyles.heading,
      titleMedium: AppFontStyles.subtitle,
      bodyLarge: AppFontStyles.body,
      bodySmall: AppFontStyles.caption,
      bodyMedium: AppFontStyles.button,
    ),
  );
}
