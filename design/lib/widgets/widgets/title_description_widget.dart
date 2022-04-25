import 'package:design/design.dart';
import 'package:flutter/material.dart';

class TitleDescriptionWidget extends StatelessWidget {
  final String title;
  final String? description;

  final double spacing;
  final TextStyle? titleTextStyle;
  final TextStyle? descriptionTextStyle;

  const TitleDescriptionWidget({
    Key? key,
    required this.title,
    this.description,
    this.spacing = Dimension.pt8,
    this.titleTextStyle,
    this.descriptionTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimension.defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: titleTextStyle ??
                Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
          ),
          description != null
              ? Padding(
                  padding: EdgeInsets.only(top: spacing),
                  child: Text(
                    description!,
                    style: descriptionTextStyle ??
                        Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
