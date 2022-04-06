import 'package:design/widgets/tab_bar/tab_bar_navigator.dart';
import 'package:flutter/material.dart';

class TabBarElement {
  final String tabName;
  final IconData icon;
  final int index;
  final TabBarNavigator navigator;
  final ScrollController controller;

  TabBarElement({
    required this.tabName,
    required this.icon,
    required this.index,
    required this.navigator,
    required this.controller,
  });

  Widget navigationRootScreen(int currentTab) {
    return TickerMode(
      enabled: index == currentTab,
      child: Offstage(
        offstage: index != currentTab,
        child: navigator,
      ),
    );
  }
}
