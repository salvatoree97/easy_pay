import 'package:cached_network_image/cached_network_image.dart';
import 'package:design/theme/color/custom_colors.dart';
import 'package:flutter/material.dart';

class ContainerCachedImage extends StatelessWidget {
  final IconData defaultImage;
  final String? imageUrl;
  final double? width;
  final Color? backgroundColor;
  final BoxFit? boxFit;
  final BorderRadius borderRadius;
  final String? heroTag;
  final Color? imageColor;
  final bool useBorders;
  final double height;

  const ContainerCachedImage({
    Key? key,
    required this.defaultImage,
    this.imageUrl,
    this.width,
    this.backgroundColor,
    this.boxFit,
    this.borderRadius = BorderRadius.zero,
    this.heroTag,
    this.imageColor,
    this.useBorders = false,
    this.height = 120,
  }) : super(key: key);

  Widget _getEmptyOrErrorWidget() {
    const double allBorders = 4;
    const double paddingFromBorders = 4;

    const sizeToRemoveWithBorders = allBorders * paddingFromBorders;
    final imageHight = useBorders ? height - sizeToRemoveWithBorders : height;

    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: useBorders ? BorderRadius.circular(height / 2) : null,
        color: backgroundColor ?? CustomColors.clear,
        border: useBorders
            ? Border.all(
                color: imageColor ?? CustomColors.white,
                width: 2,
              )
            : null,
      ),
      child: Padding(
        padding: useBorders
            ? const EdgeInsets.all(allBorders)
            : const EdgeInsets.all(0),
        child: Icon(
          defaultImage,
          size: imageHight,
          color: imageColor,
        ),
      ),
    );
  }

  Widget _getBody() {
    return ClipRRect(
      borderRadius: borderRadius,
      child: Container(
        color: CustomColors.clear,
        child: Image(
          image: CachedNetworkImageProvider(imageUrl!),
          width: width ?? double.infinity,
          height: height,
          fit: BoxFit.cover,
          gaplessPlayback: true,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) =>
              _getEmptyOrErrorWidget(),
        ),
      ),
    );
  }

  Widget _getWidget() {
    if (heroTag == null) {
      return _getBody();
    }
    return Hero(tag: heroTag!, child: _getBody());
  }

  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl == ''
        ? _getEmptyOrErrorWidget()
        : _getWidget();
  }
}
