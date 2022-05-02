import 'package:design/theme/base_button/custom_button_theme.dart';
import 'package:design/theme/dimension/dimension.dart';
import 'package:design/utils/size_helper.dart';
import 'package:design/widgets/base/base_bottom_sheet_screen.dart';
import 'package:design/widgets/bottom_sheet/bottom_sheettable_widget.dart';
import 'package:design/widgets/button/buttons_stack_widget.dart';
import 'package:design/widgets/button/custom_elevated_button.dart';
import 'package:design/widgets/widgets/title_description_widget.dart';
import 'package:flutter/material.dart';
import 'package:core/core.dart';

class OptionBottomSheetParams {
  final String title;
  final String description;
  final Function()? onConfirmTapped;
  final Function()? onCancelTapped;
  final String? confirmButtonTitle;
  final String? cancelButtonTitle;
  final bool goBack;

  OptionBottomSheetParams({
    required this.title,
    required this.description,
    this.onConfirmTapped,
    this.onCancelTapped,
    this.confirmButtonTitle,
    this.cancelButtonTitle,
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
      bottomSheetContent: LayoutBuilder(
        builder: (context, constraints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: constraints.maxWidth,
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: TitleDescriptionWidget(
                      title: widget.params.title,
                      description: widget.params.description,
                      titleTextStyle: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                      descriptionTextStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(
                              color:
                                  Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                  const Expanded(child: SizedBox(height: 40)),
                  ButtonsStackWidget(
                    buttons: [
                      CustomElevatedButton(
                        title: widget.params.cancelButtonTitle ??
                            S.of(context).cancel_button_text,
                        onPressed: _onCancelTapped,
                        padding: const EdgeInsets.only(
                            left: Dimension.defaultPadding),
                        width: SizeHelper.wp(42),
                        style: CustomButtonTheme
                            .secondaryElavatedButtonTheme.style,
                      ),
                      CustomElevatedButton(
                        title: widget.params.confirmButtonTitle ??
                            S.of(context).continue_button_text,
                        onPressed: _onConfirmTapped,
                        padding: const EdgeInsets.only(
                            right: Dimension.defaultPadding),
                        width: SizeHelper.wp(42),
                      ),
                    ],
                  ),
                  SizedBox(height: SizeHelper.screenBottomPadding),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
