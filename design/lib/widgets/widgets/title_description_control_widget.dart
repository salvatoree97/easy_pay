import 'package:design/theme/dimension/dimension.dart';
import 'package:design/theme/text_style/poppins_text_style.dart';
import 'package:design/utils/size_helper.dart';
import 'package:flutter/material.dart';

class TitleDescriptionControlWidget extends StatelessWidget {
  final String title;
  final String? description;
  final String value;
  final List<String> possibleValues;
  final ValueChanged<String> onChanged;
  final double height;
  final bool useCheckbox;
  final List<String>? allValues;
  final String? icon;

  const TitleDescriptionControlWidget({
    Key? key,
    required this.title,
    this.description,
    required this.value,
    required this.possibleValues,
    required this.onChanged,
    required this.height,
    this.useCheckbox = false,
    this.allValues,
    this.icon,
  }) : super(key: key);

  bool get boolValue {
    if (allValues == null) return possibleValues.contains(value);
    bool finalValue = true;
    allValues!.forEach((element) {
      if (!possibleValues.contains(element)) {
        finalValue = false;
        return;
      }
    });
    return finalValue;
  }

  String? get groupValue {
    if (allValues == null) return possibleValues.contains(value) ? value : null;
    String? finalValue = value;
    allValues!.forEach((element) {
      if (!possibleValues.contains(element)) {
        finalValue = null;
        return;
      }
    });
    return finalValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: Dimension.pt15),
        padding: const EdgeInsets.symmetric(horizontal: Dimension.pt15),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10),
        ),
        height: height,
        width: SizeHelper.screenWidth,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: description != null
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: PoppinstTextStyle.withBold(
                      newColor: Theme.of(context).colorScheme.primary,
                      fontDimension: Dimension.pt13,
                    ),
                  ),
                  description != null
                      ? Text(
                          description!,
                          style: PoppinstTextStyle(
                            newColor: Theme.of(context).colorScheme.primary,
                            fontDimension: Dimension.pt13,
                          ),
                        )
                      : Container(),
                ],
              ),
            ),
            Transform.scale(
              scale: 1.13,
              child: useCheckbox
                  ? Checkbox(
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: boolValue,
                      onChanged: (_) => onChanged(value),
                    )
                  : Radio(
                      activeColor: Theme.of(context).colorScheme.primary,
                      value: value,
                      toggleable: true,
                      groupValue: groupValue,
                      onChanged: (_) => onChanged(value),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
