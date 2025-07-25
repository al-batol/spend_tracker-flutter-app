import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:spend_tracker/src/core/features/onboarding/views/onboarding_screen.dart';
import 'package:spend_tracker/src/core/features/onboarding/views/splash_screen.dart';
import 'package:spend_tracker/src/core/navigation/route_names.dart';

class AppRoutes {
  static Route<dynamic>? onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SplashScreen(),
        );
      case RouteNames.onboarding:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const OnboardingScreen(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
    }
  }
}
