import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/constants/colors.dart';
import 'package:spend_tracker/src/core/common/themes/light_theme.dart';
import 'package:spend_tracker/src/core/features/onboarding/views/splash_screen.dart';
import 'package:spend_tracker/src/core/navigation/app_routes.dart';
import 'package:spend_tracker/src/core/navigation/route_names.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spend Tracker',
      theme: LightTheme.lightTheme,
      initialRoute: RouteNames.splash,
      onGenerateRoute: AppRoutes.onGeneratedRoute,
    );
  }
}
