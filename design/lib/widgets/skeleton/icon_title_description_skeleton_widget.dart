import 'package:design/theme/dimension/dimension.dart';
import 'package:design/widgets/skeleton/image_skeleton_widget.dart';
import 'package:design/widgets/skeleton/text_skeleton_widget.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class IconTitleDescriptionSkeletonWidget extends StatelessWidget {
  const IconTitleDescriptionSkeletonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: Dimension.defaultPadding,
        right: Dimension.defaultPadding,
      ),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Shimmer.fromColors(
          baseColor: Theme.of(context).colorScheme.primary,
          highlightColor: Theme.of(context).colorScheme.tertiary,
          enabled: true,
          child: Container(
            padding: const EdgeInsets.all(Dimension.defaultPadding),
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const ImageSkeletonWidget(size: 80),
                const SizedBox(width: Dimension.defaultPadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      TextSkeletonWidget(),
                      SizedBox(height: 5),
                      TextSkeletonWidget(),
                    ],
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
