import 'package:design/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class ButtonsStackWidget extends StatelessWidget {
  final List<CustomElevatedButton> buttons;
  final ButtonsStackWidgetAlign align;

  const ButtonsStackWidget({
    Key? key,
    required this.buttons,
    this.align = ButtonsStackWidgetAlign.horizontal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: align == ButtonsStackWidgetAlign.horizontal
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: buttons,
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: buttons,
            ),
    );
  }
}

enum ButtonsStackWidgetAlign { horizontal, vertical }
