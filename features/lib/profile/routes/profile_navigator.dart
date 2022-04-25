import 'package:common/common.dart';
import 'package:features/profile/routes/profile_navigation_key.dart';
import 'package:features/profile/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class ProfileNavigator extends TabBarNavigator {
  const ProfileNavigator({Key? key}) : super(key: key);

  @override
  GlobalKey<NavigatorState> get navigationKey => ProfileNavigationKey.key;

  @override
  String get initialRoute => AppRoutes.profileScreen;

  @override
  RouteFactory get onGenerateRoute => (settings) {
        switch (settings.name) {
          case AppRoutes.profileScreen:
            return ScalePageRoute(
              type: ScaleType.fromSmallerToGreater,
              builder: (context) => const ProfileScreen(),
            );
          default:
            return null;
        }
      };
}
