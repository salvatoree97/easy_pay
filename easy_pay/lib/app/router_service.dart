import 'package:easy_pay/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouterService {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
    }
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
    );
  }
}
