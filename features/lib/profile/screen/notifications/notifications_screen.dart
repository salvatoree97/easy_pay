import 'package:common/common.dart';
import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: DefaultAppBar(title: S.of(context).notifications_title),
      body: Container(),
    );
  }
}
