import 'package:cached_network_image/cached_network_image.dart';
import 'package:design/theme/color/custom_colors.dart';
import 'package:flutter/material.dart';

class ContainerCachedImage extends StatelessWidget {
  final String defaultImage;
  final String? imageUrl;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final BoxFit? boxFit;
  final bool? useBlur;

  const ContainerCachedImage({
    Key? key,
    required this.defaultImage,
    this.imageUrl,
    this.width,
    this.height,
    this.backgroundColor,
    this.boxFit,
    this.useBlur,
  }) : super(key: key);

  Widget _getEmptyOrErrorWidget() {
    return Container(
      color: backgroundColor ?? CustomColors.clear,
      width: width ?? double.infinity,
      height: height ?? 120,
      child: Image.asset(
        defaultImage,
        fit: boxFit ?? BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return imageUrl == null || imageUrl == ''
        ? _getEmptyOrErrorWidget()
        : Image(
            image: CachedNetworkImageProvider(imageUrl!),
            width: width ?? double.infinity,
            height: height ?? 120,
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
          );
  }
}
