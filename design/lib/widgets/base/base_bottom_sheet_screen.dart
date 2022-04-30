import 'package:design/theme/color/custom_colors.dart';
import 'package:design/utils/size_helper.dart';
import 'package:design/widgets/base/base_screen.dart';
import 'package:design/widgets/bottom_sheet/bottom_sheettable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class BaseBottomSheetScreen extends StatefulWidget {
  final BottomSheetController sheetController;
  final Widget? bottomSheetContent;
  final Widget Function(ScrollController)? bottomSheetContentBuilder;
  final double? maxHeight;
  final Function()? onBottomSheetSlideClosed;
  final bool goBack;
  final bool isDraggable;

  const BaseBottomSheetScreen({
    Key? key,
    required this.sheetController,
    this.bottomSheetContent,
    this.bottomSheetContentBuilder,
    this.maxHeight,
    this.onBottomSheetSlideClosed,
    this.goBack = true,
    this.isDraggable = true,
  }) : super(key: key);

  @override
  State<BaseBottomSheetScreen> createState() => _BaseBottomSheetScreenState();
}

class _BaseBottomSheetScreenState extends State<BaseBottomSheetScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      widget.sheetController.open();
    });
  }

  void _onBottomSheetSlideClosed() {
    widget.onBottomSheetSlideClosed?.call();
    if (widget.goBack) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      incudeTopSafeArea: false,
      useTransparentBackground: true,
      includeBottomSafeArea: false,
      body: BottomShettableWidget(
        backdropOpacity: 0.8,
        backdropColor: CustomColors.clear,
        controller: widget.sheetController,
        minHeight: 0.0,
        maxHeight: widget.maxHeight ?? SizeHelper.hp(50),
        onBottomSheetSlideClosed: _onBottomSheetSlideClosed,
        color: Theme.of(context).colorScheme.background,
        backdropEnabled: true,
        bottomSheet: widget.bottomSheetContent,
        bottomSheetBuilder: widget.bottomSheetContentBuilder,
        isDraggable: widget.isDraggable,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0),
        ),
        useBottomViewInsets: true,
      ),
    );
  }
}
