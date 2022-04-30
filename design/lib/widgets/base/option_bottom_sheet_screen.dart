import 'package:design/theme/base_button/custom_button_theme.dart';
import 'package:design/theme/dimension/dimension.dart';
import 'package:design/utils/size_helper.dart';
import 'package:design/widgets/base/base_bottom_sheet_screen.dart';
import 'package:design/widgets/bottom_sheet/bottom_sheettable_widget.dart';
import 'package:design/widgets/button/buttons_stack_widget.dart';
import 'package:design/widgets/button/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class OptionBottomSheetParams {
  final String description;
  final String confirmButtonTitle;
  final String cancelButtonTitle;
  final Function()? onConfirmTapped;
  final Function()? onCancelTapped;
  final bool goBack;

  OptionBottomSheetParams({
    required this.description,
    required this.confirmButtonTitle,
    required this.cancelButtonTitle,
    this.onConfirmTapped,
    this.onCancelTapped,
    this.goBack = false,
  });
}

class OptionBottomSheetScreen extends StatefulWidget {
  final OptionBottomSheetParams params;

  const OptionBottomSheetScreen({
    Key? key,
    required this.params,
  }) : super(key: key);

  @override
  State<OptionBottomSheetScreen> createState() =>
      _OptionBottomSheetScreenState();
}

class _OptionBottomSheetScreenState extends State<OptionBottomSheetScreen> {
  late BottomSheetController sheetController;

  @override
  void initState() {
    super.initState();
    sheetController = BottomSheetController();
  }

  void _onConfirmTapped() {
    sheetController.close();
    widget.params.onConfirmTapped?.call();

    if (!widget.params.goBack) {
      Navigator.of(context).pop(true);
    }
  }

  void _onCancelTapped() {
    sheetController.close();
    widget.params.onCancelTapped?.call();

    if (!widget.params.goBack) {
      Navigator.of(context).pop(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheetScreen(
      sheetController: sheetController,
      goBack: widget.params.goBack,
      onBottomSheetSlideClosed: () => Navigator.of(context).pop(false),
      bottomSheetContent: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(widget.params.description),
          ButtonsStackWidget(
            buttons: [
              CustomElevatedButton(
                title: widget.params.confirmButtonTitle,
                onPressed: _onConfirmTapped,
                padding: const EdgeInsets.only(left: Dimension.defaultPadding),
                width: SizeHelper.wp(42),
              ),
              CustomElevatedButton(
                title: widget.params.cancelButtonTitle,
                onPressed: _onCancelTapped,
                padding: const EdgeInsets.only(right: Dimension.defaultPadding),
                width: SizeHelper.wp(42),
                style: CustomButtonTheme.secondaryElavatedButtonTheme.style,
              ),
            ],
          ),
          SizedBox(height: SizeHelper.screenBottomPadding),
        ],
      ),
    );
  }
}
