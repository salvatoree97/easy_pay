import 'package:design/theme/dimension/dimension.dart';
import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final String badgeValue;
  final Color? backgroundColor;
  final TextStyle? style;

  const BadgeWidget({
    Key? key,
    required this.badgeValue,
    this.backgroundColor,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimension.pt10,
        vertical: Dimension.pt5,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(Dimension.pt20),
      ),
      child: Text(
        badgeValue,
        style: style ??
            Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: Theme.of(context).colorScheme.onPrimary),
      ),
    );
  }
}
