import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/dimension/dimension.dart';
import 'package:design/theme/text_style/poppins_text_style.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final bool showLine;

  const TextButtonWidget({
    Key? key,
    required this.title,
    required this.onTap,
    this.textStyle,
    this.showLine = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomColors.clear,
      child: InkWell(
        onTap: onTap,
        child: Ink(
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: textStyle ??
                      PoppinstTextStyle.withMedium(
                        fontDimension: Dimension.pt16,
                        newColor: Theme.of(context).colorScheme.primary,
                      ),
                ),
                if (showLine)
                  Container(
                    height: 2,
                    color: Theme.of(context).colorScheme.primary,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
