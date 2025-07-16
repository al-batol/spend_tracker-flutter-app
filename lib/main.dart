import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/common/themes/light_theme.dart';
import 'package:spend_tracker/src/core/navigation/app_routes.dart';
import 'package:spend_tracker/src/core/navigation/route_names.dart';
import 'package:spend_tracker/src/core/common/di/inection_container.dart';

void main() {
  setup();
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
