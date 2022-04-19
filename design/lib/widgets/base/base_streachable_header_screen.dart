import 'dart:math';
import 'package:design/theme/dimension/dimension.dart';
import 'package:design/utils/size_helper.dart';
import 'package:design/widgets/app_bar/stretchable_app_bar.dart';
import 'package:design/widgets/base/base_screen.dart';
import 'package:design/widgets/icons/custom_rounded_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BaseStreachableHeaderScreen extends StatefulWidget {
  final String title;
  final Widget bodyWidget;
  final String defaultImage;

  final String? heroTag;
  final Widget? floatingWidget;
  final String? rightButtonTitle;
  final String? rightIcon;
  final Function()? onRightButtonTapped;
  final Color? headerColor;
  final String? imageUrl;
  final Widget? backgroundWidget;
  final double? backgroundBottomPadding;
  final bool showClose;
  final bool showBack;
  final bool showBlurOnImage;
  final BorderRadiusGeometry titleWidgetBorderRadius;

  const BaseStreachableHeaderScreen({
    Key? key,
    required this.title,
    required this.bodyWidget,
    required this.defaultImage,
    this.heroTag,
    this.floatingWidget,
    this.rightButtonTitle,
    this.rightIcon,
    this.onRightButtonTapped,
    this.headerColor,
    this.imageUrl,
    this.backgroundBottomPadding,
    this.backgroundWidget,
    this.showBlurOnImage = true,
    this.showBack = false,
    this.showClose = true,
    this.titleWidgetBorderRadius = const BorderRadius.only(
      topLeft: Radius.circular(10.0),
      topRight: Radius.circular(10.0),
    ),
  }) : super(key: key);

  @override
  BaseStreachableHeaderScreenState createState() =>
      BaseStreachableHeaderScreenState();
}

class BaseStreachableHeaderScreenState
    extends State<BaseStreachableHeaderScreen> {
  final double _expadedHeight = SizeHelper.hp(35);
  final double _usefullSpacingForOpacity = 20.0;
  final double _maximumContainerOpacity = 0.8;
  final double _maximumOpacity = 1.0;
  bool _isCollapsed = false;

  late ScrollController _scrollController;
  late double _containerOpacity = 0.8;
  late double _opacity = 1.0;
  late String? _imageUrl;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListner);
    _containerOpacity = _maximumContainerOpacity;
    _opacity = _maximumOpacity;
    _imageUrl = widget.imageUrl;
  }

  void _scrollListner() {
    final double offset =
        max(0.0, _scrollController.offset) / (_expadedHeight - kToolbarHeight);
    final double newOpacity =
        _maximumContainerOpacity - min(_maximumContainerOpacity, offset);
    final double newLeftWidgetOpacity =
        _maximumOpacity - min(_maximumOpacity, offset);

    if (newOpacity != _containerOpacity) {
      setState(() => _containerOpacity = newOpacity);
    }
    if (newLeftWidgetOpacity != _opacity) {
      setState(() => _opacity = newLeftWidgetOpacity);
    }

    final double availableSpace =
        _expadedHeight - kToolbarHeight - _usefullSpacingForOpacity;

    if (_scrollController.offset >= availableSpace && !_isCollapsed) {
      setState(() => _isCollapsed = true);
    } else if (_scrollController.offset < availableSpace && _isCollapsed) {
      setState(() => _isCollapsed = false);
    }
  }

  SystemUiOverlayStyle get _systemOverlayStyle =>
      _isCollapsed ? SystemUiOverlayStyle.dark : SystemUiOverlayStyle.light;

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      incudeTopSafeArea: false,
      includeBottomSafeArea: false,
      primaryColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        slivers: [
          StretchableAppBar(
            leading: widget.showBack
                ? Padding(
                    padding: const EdgeInsets.only(
                      left: Dimension.defaultPadding,
                      top: Dimension.pt5,
                      bottom: Dimension.pt5,
                    ),
                    child: CustomRoundedIcon(
                      onTap: () => Navigator.of(context).pop(),
                      size: Dimension.toolbarItemSize,
                    ),
                  )
                : Container(),
            trailing: widget.showClose
                ? Container(
                    padding: const EdgeInsets.only(
                      right: Dimension.defaultPadding,
                      top: Dimension.pt5,
                      bottom: Dimension.pt5,
                    ),
                    child: CustomRoundedIcon(
                      onTap: () => Navigator.of(context).pop(),
                      size: Dimension.toolbarItemSize,
                      icon: Icons.close_rounded,
                    ),
                  )
                : Container(),
            expandedHeight: _expadedHeight,
            systemOverlayStyle: _systemOverlayStyle,
            titleOpacity: _isCollapsed ? 1.0 : 0.0,
            title: widget.title,
            imageLink: _imageUrl,
            opacity: _opacity,
            containerOpacity: _containerOpacity,
            headerColor: widget.headerColor,
            defaultImage: widget.defaultImage,
            showBlurOnImage: widget.showBlurOnImage,
            backgroundWidget: widget.backgroundWidget,
            backgroundBottomPadding: widget.backgroundBottomPadding,
            titleWidgetBorderRadius: widget.titleWidgetBorderRadius,
            heroTag: widget.heroTag,
          ),
          widget.bodyWidget,
        ],
      ),
      floatingWidget: widget.floatingWidget,
    );
  }
}
