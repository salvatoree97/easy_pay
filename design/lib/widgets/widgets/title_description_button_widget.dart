import 'package:design/design.dart';
import 'package:flutter/material.dart';

class TitleDescriptionButtonWidget extends StatelessWidget {
  final String title;
  final String buttonTitle;
  final Function() onTap;

  final String? description;

  final double spacing;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;
  final Color backgroundColor;
  final double borderRadius;
  final EdgeInsets margin;
  final EdgeInsets padding;

  const TitleDescriptionButtonWidget({
    Key? key,
    required this.title,
    required this.buttonTitle,
    required this.onTap,
    this.description,
    this.spacing = Dimension.pt8,
    this.titleTextStyle,
    this.descriptionTextStyle,
    this.backgroundColor = CustomColors.clear,
    this.borderRadius = 0,
    this.margin =
        const EdgeInsets.symmetric(horizontal: Dimension.defaultPadding),
    this.padding =
        const EdgeInsets.symmetric(horizontal: Dimension.defaultPadding),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style:
                      titleTextStyle ?? Theme.of(context).textTheme.bodySmall,
                ),
                description != null
                    ? Padding(
                        padding: EdgeInsets.only(top: spacing),
                        child: Text(
                          description!,
                          style: descriptionTextStyle ??
                              Theme.of(context).textTheme.titleSmall,
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
          TextButtonWidget(
            title: buttonTitle,
            onTap: onTap,
            showLine: true,
          ),
        ],
      ),
    );
  }
}
