import 'package:design/theme/dimension/dimension.dart';
import 'package:design/widgets/app_bar/app_bar_style.dart';
import 'package:design/widgets/icons/custom_rounded_icon.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackTapped;
  final AppBarStyle barStyle;

  const DefaultAppBar({
    Key? key,
    required this.title,
    this.onBackTapped,
    this.barStyle = AppBarStyle.back,
  }) : super(key: key);

  double? get _leadingWidth {
    if (barStyle == AppBarStyle.back) {
      return Dimension.toolbarItemSize + Dimension.defaultPadding;
    }
    return null;
  }

  Widget? _leading(BuildContext context) {
    if (barStyle == AppBarStyle.back) {
      return Padding(
        padding: const EdgeInsets.only(
          left: Dimension.defaultPadding,
          top: Dimension.pt5,
          bottom: Dimension.pt5,
        ),
        child: CustomRoundedIcon(
          onTap: () => _onBackTapped(context),
          size: Dimension.toolbarItemSize,
        ),
      );
    }
    return null;
  }

  void _onBackTapped(BuildContext context) {
    if (onBackTapped != null) {
      onBackTapped?.call();
      return;
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: Dimension.toolbarHeight,
      leadingWidth: _leadingWidth,
      leading: _leading(context),
      title: Text(title,
          textAlign: barStyle == AppBarStyle.textLeft
              ? TextAlign.left
              : TextAlign.center),
      centerTitle:
          barStyle == AppBarStyle.textCenter || barStyle == AppBarStyle.back,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(Dimension.toolbarHeight);
}
