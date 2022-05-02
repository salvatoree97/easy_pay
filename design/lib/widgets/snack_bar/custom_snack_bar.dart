import 'dart:math';
import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/text_style/poppins_text_style.dart';
import 'package:flutter/material.dart';

enum SnackBarStyle { error, info, success }

/// Popup widget that you can use by default to show some information
class CustomSnackBar extends StatefulWidget {
  static const iconSize = 90.0;
  static const snackHeght = 60.0;

  static const defaultTextStyle = PoppinstTextStyle(
    fontDimension: 16,
    newColor: Colors.white,
  );

  static const defaultIconRotationAngle = 32;

  final String message;
  final Widget icon;
  final Color backgroundColor;
  final TextStyle textStyle;
  final int iconRotationAngle;

  const CustomSnackBar.success({
    Key? key,
    required this.message,
    this.icon = const Icon(
      Icons.sentiment_very_satisfied,
      color: Color(0x15000000),
      size: CustomSnackBar.iconSize,
    ),
    this.textStyle = CustomSnackBar.defaultTextStyle,
    this.iconRotationAngle = 32,
    this.backgroundColor = const Color(0xff00E676),
  }) : super(key: key);

  const CustomSnackBar.info({
    Key? key,
    required this.message,
    this.icon = const Icon(
      Icons.sentiment_neutral,
      color: Color(0x15000000),
      size: CustomSnackBar.iconSize,
    ),
    this.textStyle = CustomSnackBar.defaultTextStyle,
    this.iconRotationAngle = CustomSnackBar.defaultIconRotationAngle,
    this.backgroundColor = const Color(0xff2196F3),
  }) : super(key: key);

  const CustomSnackBar.error({
    Key? key,
    required this.message,
    this.icon = const Icon(
      Icons.sentiment_dissatisfied_outlined,
      color: CustomColors.red,
      size: CustomSnackBar.iconSize,
    ),
    this.textStyle = CustomSnackBar.defaultTextStyle,
    this.iconRotationAngle = 32,
    this.backgroundColor = const Color(0xffff5252),
  }) : super(key: key);

  @override
  _CustomSnackBarState createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      constraints: const BoxConstraints(minHeight: CustomSnackBar.snackHeght),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 8.0),
            spreadRadius: 1,
            blurRadius: 30,
          ),
        ],
      ),
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -10,
            left: -5,
            child: ClipRRect(
              child: SizedBox(
                height: 75,
                child: Transform.rotate(
                  angle: widget.iconRotationAngle * pi / 180,
                  child: widget.icon,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(
              widget.message,
              style: theme.textTheme.bodyMedium?.merge(
                widget.textStyle,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
