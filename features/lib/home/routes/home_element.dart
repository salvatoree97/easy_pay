import 'package:common/common.dart';
import 'package:features/home/routes/home_navigator.dart';
import 'package:flutter/material.dart';

class HomeElement extends TabBarElement {
  HomeElement()
      : super(
          tabName: 'Home',
          icon: Icons.home_rounded,
          index: 0,
          navigator: const HomeNavigator(),
          controller: ScrollController(),
        );
}
