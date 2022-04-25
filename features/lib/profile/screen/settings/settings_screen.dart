import 'package:common/common.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const DefaultAppBar(title: 'Impostazioni'),
      body: Container(),
    );
  }
}
