import 'package:design/design.dart';
import 'package:design/widgets/icons/custom_rounded_icon.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Function()? onBackTapped;
  final bool showBack;

  const DefaultAppBar({
    Key? key,
    required this.title,
    this.onBackTapped,
    this.showBack = true,
  }) : super(key: key);

  double? get _leadingWidth {
    if (showBack) {
      return Dimension.toolbarItemSize + Dimension.defaulPadding;
    }
    return null;
  }

  Widget? _leading(BuildContext context) {
    if (showBack) {
      return Padding(
        padding: const EdgeInsets.only(
          left: Dimension.defaulPadding,
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
      title: Text(title),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(Dimension.toolbarHeight);
}
