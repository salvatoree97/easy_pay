import 'package:design/theme/color/custom_colors.dart';
import 'package:flutter/material.dart';

class TextSkeletonWidget extends StatelessWidget {
  final double width;

  const TextSkeletonWidget({
    Key? key,
    this.width = double.infinity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15,
      width: width,
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
