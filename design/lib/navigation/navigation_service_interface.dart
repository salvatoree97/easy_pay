import 'package:flutter/material.dart';

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

  BuildContext? get topContext;

  Future<dynamic>? handlePendingRoute;
}
