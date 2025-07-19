import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/constants/colors.dart';
import 'package:spend_tracker/src/core/common/fonts/app_font_sizes.dart';

class AppFontStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: AppFontSizes.xlg,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle heading2 = TextStyle(
    fontSize: AppFontSizes.lg,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: AppFontSizes.sm,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle labelMedium = TextStyle(
    fontSize: AppFontSizes.sm,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle button = TextStyle(
    fontSize: AppFontSizes.sm,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );
  static const TextStyle caption = TextStyle(
    fontSize: AppFontSizes.xs,
    color: Colors.black87,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle displaySmall = TextStyle(
    fontSize: AppFontSizes.sm,
    color: AppColors.light20,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle titleMedium = TextStyle(
    fontSize: AppFontSizes.md,
    color: Colors.black87,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle display = TextStyle(
    fontSize: AppFontSizes.xxl,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
}
