import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class ModalTransparentPageRoute<T> extends PageRoute<T> {
  final WidgetBuilder builder;

  ModalTransparentPageRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(
          settings: settings,
          fullscreenDialog: true,
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
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: Semantics(
        scopesRoute: true,
        explicitChildNodes: true,
        child: result,
      ),
    );
  }
}
