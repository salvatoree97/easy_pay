import 'package:flutter/material.dart';

class CustomFormWidget extends StatelessWidget {
  final Key formState;
  final List<Widget> children;
  final AutovalidateMode? autovalidateMode;
  final ScrollController? scrollController;

  const CustomFormWidget({
    Key? key,
    required this.formState,
    required List<Widget> this.children,
    this.scrollController,
    this.autovalidateMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) => SingleChildScrollView(
        controller: scrollController,
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: constraints.maxWidth,
            minHeight: constraints.maxHeight,
          ),
          child: IntrinsicHeight(
            child: Form(
              key: formState,
              autovalidateMode: autovalidateMode,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
