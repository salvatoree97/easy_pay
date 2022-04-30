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
        final bool goToLogin = settings.arguments as bool? ?? false;
        return MaterialPageRoute(
          builder: (_) => InitialScreen(
            goToLogin: goToLogin,
          ),
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

      case AppRoutes.retailDetailScreen:
        final retailModel = settings.arguments as RetailModel;
        return FadePageRoute(
          builder: (_) => RetailDetailScreen(retailModel: retailModel),
        );
      case AppRoutes.personalDataScreen:
        return MaterialPageRoute(
          builder: (_) => const PersonalDataScreen(),
        );
      case AppRoutes.themeScreen:
        return MaterialPageRoute(
          builder: (_) => const ThemeScreen(),
        );
      case AppRoutes.notificationsScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationsScreen(),
        );
      case AppRoutes.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      case AppRoutes.optionSheet:
        final params = settings.arguments as OptionBottomSheetParams;
        return ClearPageRoute(
          builder: (_) => OptionBottomSheetScreen(params: params),
        );
      case AppRoutes.biometricsPasswordScreen:
        return ClearPageRoute(
          builder: (_) => const BiometricsPasswordScreen(),
        );
    }
    return MaterialPageRoute(
      builder: (_) => const SplashScreen(),
    );
  }
}
