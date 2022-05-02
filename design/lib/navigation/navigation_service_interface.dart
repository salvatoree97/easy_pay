import 'package:flutter/material.dart';

import '../widgets/snack_bar/custom_snack_bar.dart';

abstract class NavigationServiceInterface {
  ///Use [pendingRoute] to store a route that will be called in particular cases.
  ///Ex: this is setted when push notification was received when app was completely close;
  //RouteInterface handlePending;

  ///[NavigateTo] functions
  Future<dynamic>? push(String routeName, {dynamic arguments});
  Future<dynamic>? pushAndReplace(String routeName, {dynamic arguments});
  Future<dynamic>? pushAndRemoveUntil(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    dynamic arguments,
  });

  ///[GoBack] functions
  void pop<T extends Object>({T value});
  void popUntil(bool Function(Route<dynamic>) predicate);
  void showSnackBar({
    BuildContext? context,
    required String message,
    SnackBarStyle style = SnackBarStyle.error,
  });

  BuildContext? get topContext;

  BuildContext? get tabContext;

  Future<dynamic>? handlePendingRoute;
}
