import 'package:design/theme/color/custom_colors.dart';
import 'package:design/widgets/base/keyboard_dismisser.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseScreen extends StatelessWidget {
  final Color primaryColor;
  final Color? secondaryColor;
  final PreferredSizeWidget? appBar;
  final Widget body;
  final bool includeBottomSafeArea;
  final bool incudeTopSafeArea;
  final Widget? bottomWidget;
  final bool resizeToAvoidBottomInset;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final SystemUiOverlayStyle statusBarStyle;
  final bool useTransparentBackground;
  final Widget? floatingWidget;
  final double radius;

  const BaseScreen({
    Key? key,
    required this.body,
    this.primaryColor = Colors.transparent,
    this.secondaryColor,
    this.appBar,
    this.incudeTopSafeArea = true,
    this.includeBottomSafeArea = true,
    this.bottomWidget,
    this.resizeToAvoidBottomInset = true,
    this.scaffoldKey,
    this.statusBarStyle = SystemUiOverlayStyle.light,
    this.useTransparentBackground = false,
    this.floatingWidget,
    this.radius = 0.0,
  }) : super(key: key);

  BoxDecoration _decoration(BuildContext context) {
    if (secondaryColor != null) {
      return BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryColor,
            secondaryColor!,
          ],
        ),
      );
    }

    if (useTransparentBackground) {
      return BoxDecoration(
        color: CustomColors.clear,
        borderRadius: BorderRadius.circular(radius),
      );
    }

    if (primaryColor != Colors.transparent) {
      return BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(radius),
      );
    }

    return BoxDecoration(
      color: Theme.of(context).colorScheme.background,
      borderRadius: BorderRadius.circular(radius),
    );
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      AnnotatedRegion<SystemUiOverlayStyle>(
        // Use [SystemUiOverlayStyle.light] for white status bar
        // or [SystemUiOverlayStyle.dark] for black status bar
        // https://stackoverflow.com/a/58132007/1321917
        value: statusBarStyle,
        child: Container(
          decoration: _decoration(context),
          child: Scaffold(
            resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            key: scaffoldKey,
            backgroundColor: Colors.transparent,
            appBar: appBar,
            body: SafeArea(
              top: incudeTopSafeArea,
              bottom: includeBottomSafeArea,
              child: Builder(
                builder: (context) => body,
              ),
            ),
            bottomNavigationBar: bottomWidget,
            floatingActionButton: floatingWidget,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          ),
        ),
      ),
    );
  }
}
