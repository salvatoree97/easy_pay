import 'package:design/theme/color/custom_colors.dart';
import 'package:flutter/material.dart';

class ImageSkeletonWidget extends StatelessWidget {
  final double size;
  final double radius;
  const ImageSkeletonWidget({
    Key? key,
    this.size = 40,
    this.radius = 8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
