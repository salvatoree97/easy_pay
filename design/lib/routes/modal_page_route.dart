import 'package:flutter/cupertino.dart';

class ModalPageRoute<T> extends CupertinoPageRoute<T> {
  ModalPageRoute({
    required builder,
    RouteSettings? settings,
    bool fullscreenDialog = true,
  }) : super(
          builder: builder,
          settings: settings,
          fullscreenDialog: fullscreenDialog,
        );

  @override
  bool get opaque => true;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    final result = builder(context);
    return result;
  }
}
