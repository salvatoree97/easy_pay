import 'package:design/theme/dimension/dimension.dart';
import 'package:design/widgets/widgets/badge_widget.dart';
import 'package:design/widgets/widgets/container_cached_image.dart';
import 'package:flutter/material.dart';

class IconTitleDescriptionWidget extends StatelessWidget {
  final String title;
  final IconData placeholderImage;
  final String? description;
  final String? imageUrl;
  final String? badgeValue;
  final String? heroTag;
  final Function()? onTap;
  final Color? imageColor;
  final double imageSize;
  final EdgeInsets margin;
  final EdgeInsets imagePadding;
  final bool showArrow;

  const IconTitleDescriptionWidget({
    Key? key,
    required this.title,
    required this.placeholderImage,
    this.description,
    this.imageUrl,
    this.badgeValue,
    this.heroTag,
    this.onTap,
    this.imageColor,
    this.imageSize = 80,
    this.margin =
        const EdgeInsets.symmetric(horizontal: Dimension.defaultPadding),
    this.imagePadding = const EdgeInsets.only(
      left: Dimension.pt5,
      top: Dimension.pt5,
      bottom: Dimension.pt5,
      right: Dimension.defaultPadding,
    ),
    this.showArrow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: margin,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(Dimension.pt10),
        ),
        child: Stack(
          children: [
            Row(
              children: [
                Padding(
                  padding: imagePadding,
                  child: ContainerCachedImage(
                    defaultImage: placeholderImage,
                    imageUrl: imageUrl,
                    height: imageSize,
                    width: imageSize,
                    borderRadius: BorderRadius.circular(Dimension.pt10),
                    heroTag: heroTag,
                    imageColor: imageColor,
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding:
                        const EdgeInsets.only(right: Dimension.defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSecondary),
                        ),
                        description != null
                            ? Text(
                                description!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary),
                              )
                            : Container(),
                      ],
                    ),
                  ),
                ),
                showArrow
                    ? Padding(
                        padding: const EdgeInsets.only(
                            right: Dimension.defaultPadding),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      )
                    : Container(),
              ],
            ),
            badgeValue != null
                ? Positioned(
                    top: Dimension.pt5,
                    right: Dimension.pt10,
                    child: BadgeWidget(
                      badgeValue: badgeValue!,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
