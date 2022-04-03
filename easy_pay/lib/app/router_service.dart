import 'package:easy_pay/splash/splash_screen.dart';
import 'package:features/features.dart';
import 'package:flutter/material.dart';
import 'package:common/common.dart';

class RouterService {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.initialScreen:
        return MaterialPageRoute(
          builder: (_) => const InitialScreen(),
        );
      case AppRoutes.registrationFirstStepScreen:
        return MaterialPageRoute(
          builder: (_) => const RegistrationFirstStepScreen(),
        );
    }
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
    );
  }
}
