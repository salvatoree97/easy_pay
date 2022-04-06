import 'package:flutter/widgets.dart';

enum ScaleType { fromSmallerToGreater, fromGreaterToSmaller }

extension ScaleTypeExtension on ScaleType {
  double? get begin {
    switch (this) {
      case ScaleType.fromGreaterToSmaller:
        return 1.1;
      case ScaleType.fromSmallerToGreater:
        return 0.9;
      default:
        return null;
    }
  }

  double? get end {
    switch (this) {
      case ScaleType.fromGreaterToSmaller:
        return 1.0;
      case ScaleType.fromSmallerToGreater:
        return 1.0;
      default:
        return null;
    }
  }
}

class ScalePageRoute<T> extends PageRoute<T> {
  final ScaleType type;
  ScalePageRoute({
    required this.builder,
    this.type = ScaleType.fromGreaterToSmaller,
    RouteSettings? settings,
  }) : super(settings: settings, fullscreenDialog: false);

  final WidgetBuilder builder;

  @override
  bool get opaque => false;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 600);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return ScaleTransition(
      scale: Tween<double>(
        begin: type.begin,
        end: type.end,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves.fastOutSlowIn,
        ),
      ),
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(animation),
        child: Semantics(
          scopesRoute: true,
          explicitChildNodes: true,
          child: result,
        ),
      ),
    );
  }
}
