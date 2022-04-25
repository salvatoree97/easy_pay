import 'package:design/design.dart';
import 'package:flutter/material.dart';

class ResultBaseScreen extends StatelessWidget {
  final String buttonTitle;
  final String description;
  final Function() onButtonTap;

  final double? circleSize;
  const ResultBaseScreen({
    Key? key,
    required this.buttonTitle,
    required this.description,
    required this.onButtonTap,
    this.circleSize,
  }) : super(key: key);

  double get _size {
    return circleSize ?? SizeHelper.wp(70);
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(height: SizeHelper.hp(10)),
          Container(
            height: _size,
            width: _size,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_size / 2),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Center(
              child: Icon(
                Icons.check,
                color: Theme.of(context).colorScheme.onPrimary,
                size: _size / 2,
              ),
            ),
          ),
          SizedBox(height: SizeHelper.hp(8)),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: Dimension.defaultPadding),
            child: Text(
              description,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(child: Container()),
          CustomElevatedButton(
            title: buttonTitle,
            onPressed: onButtonTap,
          )
        ],
      ),
    );
  }
}
