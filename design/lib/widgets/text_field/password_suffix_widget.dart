import 'package:flutter/material.dart';

class PasswordSuffixWidget extends StatefulWidget {
  final Function(bool) onTap;
  final bool isHidden;

  const PasswordSuffixWidget({
    Key? key,
    required this.onTap,
    this.isHidden = true,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PasswordSuffixWidgetState();
}

class _PasswordSuffixWidgetState extends State<PasswordSuffixWidget> {
  late bool isHidden;

  @override
  void initState() {
    super.initState();
    isHidden = widget.isHidden;
  }

  void _onIconTapped() {
    setState(() {
      isHidden = !isHidden;
      widget.onTap(isHidden);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Icon(
          isHidden ? Icons.visibility_rounded : Icons.visibility_off_rounded,
          color: Theme.of(context).colorScheme.onSecondary,
          size: 30,
        ),
      ),
      onTap: _onIconTapped,
    );
  }
}
