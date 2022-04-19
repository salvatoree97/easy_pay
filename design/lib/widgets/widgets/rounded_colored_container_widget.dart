import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/dimension/dimension.dart';
import 'package:design/theme/text_style/poppins_text_style.dart';
import 'package:design/utils/size_helper.dart';
import 'package:flutter/material.dart';

class RoundedColoredContainerWidget extends StatelessWidget {
  static const titleWidgetHeight = 90.0;
  final String title;
  final double opacity;
  final double containerOpacity;
  final Color? headerColor;
  final Color? headerTextColor;
  final BorderRadiusGeometry titleWidgetBorderRadius;
  final Widget? actionWidget;

  const RoundedColoredContainerWidget({
    Key? key,
    required this.title,
    required this.opacity,
    required this.containerOpacity,
    required this.titleWidgetBorderRadius,
    this.headerColor,
    this.headerTextColor,
    this.actionWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeHelper.screenWidth,
      height: titleWidgetHeight,
      decoration: BoxDecoration(
        color: headerColor != null
            ? headerColor!.withOpacity(containerOpacity)
            : CustomColors.secondaryGray.withOpacity(containerOpacity),
        borderRadius: titleWidgetBorderRadius,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Expanded(
              child: Opacity(
                opacity: opacity,
                child: Text(
                  title,
                  style: const PoppinstTextStyle.withBold(
                    newColor: CustomColors.black,
                    fontDimension: Dimension.pt24,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
            actionWidget != null
                ? Opacity(
                    opacity: opacity,
                    child: actionWidget!,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
