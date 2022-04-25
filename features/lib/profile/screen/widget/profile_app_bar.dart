import 'dart:math';
import 'package:common/common.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends SliverPersistentHeaderDelegate {
  static double headerTopPadding = 10;
  static const double navTitleAndIconsHeight = 20;
  static const double imageSize = 80;

  final double topPadding = SizeHelper.screenTopPadding;
  final double initialLeftPosition = SizeHelper.wp(50) - imageSize / 2;
  final double maxLeftPosition =
      SizeHelper.screenWidth - Dimension.defaultPadding - imageSize;

  late double imageContainerTopSpacing = expandedHeight - SizeHelper.hp(10);

  final double expandedHeight;

  ProfileAppBar({
    required this.expandedHeight,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final double leftPosition = max(
      min(
        initialLeftPosition + (shrinkOffset * 1.6),
        maxLeftPosition,
      ),
      initialLeftPosition,
    );

    final topPosition = min(
      imageContainerTopSpacing,
      max(
        imageContainerTopSpacing - shrinkOffset,
        topPadding - imageSize / 4,
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).primaryColor,
                Theme.of(context).primaryColorDark,
              ],
            ),
          ),
        ),
        Positioned(
          top: topPadding + headerTopPadding,
          left: 40,
          right: 40,
          child: Text(
            'Profile',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: CustomColors.white),
            textAlign: TextAlign.center,
          ),
        ),
        Positioned(
          top: topPosition,
          left: leftPosition,
          child: SizedBox(
            child: Transform.scale(
              scale: shrinkOffset == 0
                  ? 1
                  : max(
                      1 -
                          (1.7 * shrinkOffset) /
                              ((expandedHeight - topPadding)),
                      0.5),
              child: ContainerCachedImage(
                height: imageSize,
                width: imageSize,
                defaultImage: Icons.supervisor_account_rounded,
                borderRadius: const BorderRadius.all(
                  Radius.circular(imageSize / 2),
                ),
                imageColor: Theme.of(context).colorScheme.secondary,
                useBorders: true,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent =>
      headerTopPadding + topPadding + navTitleAndIconsHeight + 25;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
