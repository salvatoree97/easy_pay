import 'package:features/features.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: const DefaultAppBar(
        title: 'Profile',
        barStyle: AppBarStyle.textCenter,
      ),
      body: Container(),
    );
  }
}
