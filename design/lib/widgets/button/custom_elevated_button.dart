import 'package:design/widgets/loader/circle_indicator.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  static const defaultPadding = EdgeInsets.symmetric(horizontal: 20);

  final String title;
  final Function() onPressed;
  final TextStyle? titleStyle;
  final bool enabled;
  final bool isLoading;
  final ButtonStyle? style;
  final double height;
  final double width;
  final EdgeInsets padding;

  const CustomElevatedButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.titleStyle,
    this.enabled = true,
    this.isLoading = false,
    this.style,
    this.height = 55,
    this.width = double.infinity,
    this.padding = defaultPadding,
  }) : super(key: key);

  Function()? get onTap {
    if (enabled) {
      return !isLoading
          ? () {
              onPressed();
              FocusManager.instance.primaryFocus?.unfocus();
            }
          : null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: SizedBox(
        width: width,
        height: height,
        child: ElevatedButton(
          child: !isLoading
              ? Text(title, style: titleStyle)
              : const CircleIndicator(),
          style: style ?? Theme.of(context).elevatedButtonTheme.style,
          onPressed: onTap,
        ),
      ),
    );
  }
}
