import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/dimension/dimension.dart';
import 'package:design/widgets/app_bar/custom_space_bar/custom_space_bar.dart';
import 'package:design/widgets/widgets/container_cached_image.dart';
import 'package:design/widgets/widgets/rounded_colored_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StretchableAppBar extends StatelessWidget {
  static const titleWidgetHeight = 90.0;

  final double expandedHeight;
  final SystemUiOverlayStyle systemOverlayStyle;
  final double titleOpacity;
  final String title;
  final double containerOpacity;
  final double opacity;
  final String defaultImage;

  final String? heroTag;
  final Widget? leading;
  final Widget? trailing;
  final Widget? actionWidget;

  final String? imageLink;
  final Color? headerColor;
  final Color? headerTextColor;
  final Widget? backgroundWidget;
  final double? backgroundBottomPadding;

  final bool useCustomTitleWidget;
  final bool showBlurOnImage;
  final BorderRadiusGeometry titleWidgetBorderRadius;
  final double radius;

  const StretchableAppBar({
    Key? key,
    required this.expandedHeight,
    required this.systemOverlayStyle,
    required this.titleOpacity,
    required this.title,
    required this.containerOpacity,
    required this.opacity,
    required this.defaultImage,
    this.heroTag,
    this.leading,
    this.trailing,
    this.actionWidget,
    this.imageLink,
    this.headerColor,
    this.headerTextColor,
    this.backgroundWidget,
    this.backgroundBottomPadding,
    this.useCustomTitleWidget = false,
    this.showBlurOnImage = true,
    this.titleWidgetBorderRadius = const BorderRadius.only(
      topLeft: Radius.circular(10.0),
      topRight: Radius.circular(10.0),
    ),
    this.radius = 0.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      leading: leading,
      actions: trailing != null ? [trailing!] : [],
      toolbarHeight: Dimension.toolbarHeight,
      expandedHeight: expandedHeight,
      pinned: true,
      systemOverlayStyle: systemOverlayStyle,
      stretch: true,
      title: Opacity(
        opacity: titleOpacity,
        child: Text(title),
      ),
      backgroundColor: CustomColors.clear,
      flexibleSpace: CustomSpaceBar(
        backgroundBottomPadding: backgroundBottomPadding,
        collapseMode: CollapseMode.pin,
        titlePadding: const EdgeInsets.all(0.0),
        stretchModes: const [
          StretchMode.zoomBackground,
        ],
        background: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            ContainerCachedImage(
              defaultImage: defaultImage,
              imageUrl: imageLink,
              heroTag: heroTag,
              borderRadius: BorderRadius.only(
                bottomLeft: const Radius.circular(Dimension.pt10),
                bottomRight: const Radius.circular(Dimension.pt10),
                topLeft: Radius.circular(radius),
                topRight: Radius.circular(radius),
              ),
            ),
            showBlurOnImage
                ? DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: <Color>[
                          CustomColors.black.withOpacity(0.9),
                          CustomColors.black.withOpacity(0)
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
        title: useCustomTitleWidget
            ? RoundedColoredContainerWidget(
                title: title,
                opacity: opacity,
                containerOpacity: containerOpacity,
                titleWidgetBorderRadius: titleWidgetBorderRadius,
                headerColor: headerColor,
                actionWidget: actionWidget,
              )
            : null,
      ),
    );
  }
}
