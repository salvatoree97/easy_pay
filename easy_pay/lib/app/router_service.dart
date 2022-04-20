import 'package:easy_pay/splash/splash_screen.dart';
import 'package:easy_pay/tab_bar/tab_bar_provider.dart';
import 'package:easy_pay/tab_bar/tab_screen.dart';
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

      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case AppRoutes.registrationFirstStepScreen:
        return MaterialPageRoute(
          builder: (_) => const RegistrationFirstStepScreen(),
        );
      case AppRoutes.registrationSecondStepScreen:
        final json = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => RegistrationSecondStepScreen(
            name: json.getRequiredKey('name'),
            lastname: json.getRequiredKey('lastname'),
            fiscalCode: json.getRequiredKey('fiscalCode'),
          ),
        );
      case AppRoutes.registrationThirdStepScreen:
        return MaterialPageRoute(
          builder: (_) => const RegistrationThirdStepScreen(),
          fullscreenDialog: true,
        );
      case AppRoutes.tabScreen:
        return ScalePageRoute(
          type: ScaleType.fromSmallerToGreater,
          builder: (ctx) => ChangeNotifierProvider(
            create: (_) => TabBarProvider(
              tabs: [
                HomeElement(),
                ProfileElement(),
              ],
            ),
            child: const TabScreen(),
          ),
        );
      case AppRoutes.homeScreen:
        return ScalePageRoute(
          type: ScaleType.fromSmallerToGreater,
          builder: (ctx) => ChangeNotifierProvider(
            create: (_) => TabBarProvider(
              tabs: [
                HomeElement(),
                ProfileElement(),
              ],
            ),
            child: const TabScreen(),
          ),
        );
      case AppRoutes.profileScreen:
        return ScalePageRoute(
          type: ScaleType.fromSmallerToGreater,
          builder: (ctx) => ChangeNotifierProvider(
            create: (_) => TabBarProvider(
              tabs: [
                HomeElement(),
                ProfileElement(),
              ],
            ),
            child: const TabScreen(),
          ),
        );
      case AppRoutes.retailDetailScreen:
        final retailModel = settings.arguments as RetailModel;
        return FadePageRoute(
          builder: (_) => RetailDetailScreen(retailModel: retailModel),
        );
    }
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
    );
  }
}
