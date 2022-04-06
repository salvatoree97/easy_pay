import 'package:common/common.dart';
import 'package:features/home/routes/home_navigation_key.dart';
import 'package:features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

class HomeNavigator extends TabBarNavigator {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  GlobalKey<NavigatorState> get navigationKey => HomeNavigationKey.key;

  @override
  String get initialRoute => AppRoutes.homeScreen;

  @override
  RouteFactory get onGenerateRoute => (settings) {
        switch (settings.name) {
          case AppRoutes.homeScreen:
            return ScalePageRoute(
              type: ScaleType.fromSmallerToGreater,
              builder: (context) => const HomeScreen(),
            );
          default:
            return null;
        }
      };
}
