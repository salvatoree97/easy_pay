import 'package:flutter/material.dart';

abstract class TabBarNavigator extends Navigator {
  const TabBarNavigator({Key? key}) : super(key: key);

  GlobalKey<NavigatorState> get navigationKey;

  @override
  Key get key => navigationKey;
}
