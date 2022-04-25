import 'package:core/core.dart';
import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/dimension/dimension.dart';
import 'package:design/theme/text_style/poppins_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomFormTextField extends StatefulWidget with Validable<String?> {
  final String? title;
  final String placeholder;
  final String value;
  final FocusNode? focusNode;
  final bool obscureText;
  final bool readOnly;
  final bool isEnabled;
  final bool isMultiLine;
  final Widget? leftIcon;
  final String? rightImageAsset;
  final String? prefixText;
  final String? suffixText;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final Function()? onRightIconTapped;
  final Function()? onLeftIconTapped;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextCapitalization textCapitalization;
  final GlobalKey<FormState>? formKey;
  final EdgeInsets? margin;
  final TextEditingController? controller;
  final Widget? suffixWidget;
  final Function()? onTextFieldTap;
  final bool useRightIconOnlyOnFullText;

  @override
  final List<ValidationRule<String>> validationRules;

  CustomFormTextField({
    Key? key,
    required this.placeholder,
    required this.value,
    this.title,
    this.validationRules = const [],
    this.onChanged,
    this.readOnly = false,
    this.focusNode,
    this.obscureText = false,
    this.leftIcon,
    this.rightImageAsset,
    this.prefixText,
    this.suffixText,
    this.keyboardType,
    this.textInputAction = TextInputAction.done,
    this.inputFormatters,
    this.onRightIconTapped,
    this.onLeftIconTapped,
    this.onSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.isEnabled = true,
    this.isMultiLine = false,
    this.formKey,
    this.controller,
    this.margin,
    this.suffixWidget,
    this.onTextFieldTap,
    this.useRightIconOnlyOnFullText = true,
  }) : super(key: key);

  @override
  _CustomFormTextFieldState createState() => _CustomFormTextFieldState();
}

class _CustomFormTextFieldState extends State<CustomFormTextField> {
  late TextEditingController controller;
  late FocusNode focusNode;
  late Function()? rightIconClickFunction;
  late Function()? leftIconClickFunction;
  bool inError = false;

  @override
  void didChangeDependencies() {
    //controller.text = widget.value;
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    focusNode.addListener(_onOnFocusNodeEvent);
    //controller.text = widget.value;
    // controller.selection = TextSelection(
    //   baseOffset: widget.value.length,
    //   extentOffset: widget.value.length,
    // );
    if (widget.onRightIconTapped != null) {
      rightIconClickFunction = widget.onRightIconTapped;
    } else {
      rightIconClickFunction = () {};
    }

    if (widget.onLeftIconTapped != null) {
      leftIconClickFunction = widget.onLeftIconTapped;
    } else {
      leftIconClickFunction = () {};
    }
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
    controller.dispose();
  }

  _onOnFocusNodeEvent() {
    setState(() {});
  }

  Widget? _getSuffixWidget() {
    if (widget.rightImageAsset == null && widget.suffixWidget == null) {
      return null;
    }

    if (widget.useRightIconOnlyOnFullText && controller.text.isEmpty) {
      return null;
    }

    if (!widget.useRightIconOnlyOnFullText) {
      return widget.suffixWidget ??
          GestureDetector(
            onTap: () => rightIconClickFunction?.call(),
            child: Image.asset(
              widget.rightImageAsset!,
              color:
                  focusNode.hasFocus ? CustomColors.white : CustomColors.grey,
            ),
          );
    }

    if (widget.suffixWidget != null) {
      return widget.suffixWidget;
    }

    if (widget.rightImageAsset != null) {
      return GestureDetector(
        onTap: () => rightIconClickFunction?.call(),
        child: Image.asset(
          widget.rightImageAsset!,
          color: focusNode.hasFocus ? CustomColors.white : CustomColors.grey,
        ),
      );
    }

    return widget.isEnabled
        ? Container(
            color: CustomColors.grey,
          )
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ??
          const EdgeInsets.symmetric(horizontal: Dimension.pt20),
      child: Column(
        children: [
          widget.title != null
              ? Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.title!,
                      textAlign: TextAlign.left,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onBackground),
                    ),
                  ),
                )
              : Container(),
          TextFormField(
            onTap: widget.onTextFieldTap,
            textInputAction: widget.textInputAction,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            controller: controller,
            obscureText: widget.obscureText,
            focusNode: widget.readOnly ? null : focusNode,
            readOnly: widget.readOnly,
            enabled: widget.isEnabled,
            autocorrect: false,
            maxLines: widget.isMultiLine ? null : 1,
            style: PoppinstTextStyle(
                newColor: widget.readOnly || !widget.isEnabled
                    ? CustomColors.grey
                    : CustomColors.black,
                fontDimension: Dimension.pt15),
            decoration: InputDecoration(
                    hintText: widget.placeholder,
                    prefixIcon: widget.leftIcon != null
                        ? GestureDetector(
                            onTap: () => leftIconClickFunction?.call(),
                            child: widget.leftIcon,
                          )
                        : null,
                    suffixIconConstraints: widget.suffixWidget != null
                        ? BoxConstraints.loose(const Size(150, 25))
                        : null,
                    prefixText: widget.value != '' && widget.prefixText != null
                        ? widget.prefixText
                        : null,
                    suffixIcon: _getSuffixWidget())
                .applyDefaults(Theme.of(context).inputDecorationTheme),
            validator: (_) {
              String? validate = widget.validate(_);
              inError = validate?.isNotEmpty == true;
              return validate;
            },
            onChanged: widget.onChanged,
            onFieldSubmitted: widget.onSubmitted,
            inputFormatters: widget.inputFormatters,
            textCapitalization: widget.textCapitalization,
          ),
        ],
      ),
    );
  }
}
