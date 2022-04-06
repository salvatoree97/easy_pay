import 'package:flutter/material.dart';

class CustomRoundedIcon extends StatelessWidget {
  final Function()? onTap;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;
  const CustomRoundedIcon({
    Key? key,
    this.onTap,
    this.size = 30,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
        ),
        child: Icon(
          Icons.arrow_back,
          color: iconColor ?? Theme.of(context).colorScheme.onSecondary,
        ),
      ),
    );
  }
}
