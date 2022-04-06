import 'package:features/features.dart';
import 'package:flutter/material.dart';

class NavigationService implements NavigationServiceInterface {
  final GlobalKey<NavigatorState> navigatorKey;

  NavigationService._(this.navigatorKey);

  static final NavigationService instance =
      NavigationService._(GlobalKey<NavigatorState>());

  @override
  Future? handlePendingRoute;

  @override
  BuildContext? tabContext;

  @override
  void pop<T extends Object>({T? value}) {
    if (topContext == null) return;
    Navigator.of(topContext!).pop(value);
  }

  @override
  void popUntil(bool Function(Route p1) predicate) {
    if (topContext == null) return;
    Navigator.of(topContext!).popUntil(predicate);
  }

  @override
  Future<dynamic>? push(String routeName, {arguments}) {
    if (topContext == null) return null;
    return Navigator.of(topContext!).pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic>? pushAndRemoveUntil(
      String routeName, bool Function(Route p1) predicate,
      {arguments}) {
    if (topContext == null) return null;
    return Navigator.of(topContext!).pushNamedAndRemoveUntil(
      routeName,
      predicate,
      arguments: arguments,
    );
  }

  @override
  Future<dynamic>? pushAndReplace(String routeName, {arguments}) {
    return Navigator.of(topContext!).pushReplacementNamed(
      routeName,
      arguments: arguments,
    );
  }

  @override
  BuildContext? get topContext => navigatorKey.currentContext;
}
