import 'package:flutter/widgets.dart';

class ClearPageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  ClearPageRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(
          settings: settings,
          fullscreenDialog: false,
        );

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 300);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Semantics(
      scopesRoute: true,
      explicitChildNodes: true,
      child: builder(context),
    );
  }
}
