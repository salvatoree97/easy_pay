import 'dart:io' show Platform;
import 'package:design/theme/color/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CircleIndicator extends StatelessWidget {
  final Duration duration;
  final Color? color;
  final double lineWidth;
  final double height;
  final double width;

  const CircleIndicator({
    Key? key,
    this.duration = const Duration(milliseconds: 400),
    this.color,
    this.lineWidth = 2.0,
    this.height = 20.0,
    this.width = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Theme(
            data: ThemeData(
              cupertinoOverrideTheme:
                  const CupertinoThemeData(brightness: Brightness.dark),
            ),
            child: const CupertinoActivityIndicator(),
          )
        : SizedBox(
            height: height,
            width: width,
            child: Platform.isIOS
                ? const CupertinoActivityIndicator()
                : SpinKitRing(
                    color: color ?? CustomColors.white,
                    duration: duration,
                    lineWidth: lineWidth,
                  ),
          );
  }
}
