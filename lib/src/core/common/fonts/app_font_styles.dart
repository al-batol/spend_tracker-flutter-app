import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/fonts/app_font_sizes.dart';

class AppFontStyles {
  static const TextStyle heading = TextStyle(
    fontSize: AppFontSizes.md,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: AppFontSizes.sm,
    fontWeight: FontWeight.w600,
    color: Colors.black87,
  );

  static const TextStyle body = TextStyle(
    fontSize: AppFontSizes.sm,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
  );

  static const TextStyle caption = TextStyle(
    fontSize: AppFontSizes.xs,
    color: Colors.grey,
  );

  static const TextStyle display = TextStyle(
    fontSize: AppFontSizes.xxl,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );
}
