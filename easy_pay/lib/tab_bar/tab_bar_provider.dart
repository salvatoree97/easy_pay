import 'package:flutter/material.dart';
import 'package:common/common.dart';

class TabBarProvider extends ChangeNotifier {
  static const home = 0;
  static const profile = 1;

  /// Shortcut method for getting [NavigationProvider].
  static TabBarProvider of(BuildContext context) =>
      Provider.of<TabBarProvider>(context, listen: false);

  final List<TabBarElement> tabs;
  TabBarProvider({required this.tabs});

  int _currentTab = home;

  int get currentTab => _currentTab;

  List<TabBarNavigator> get navigators =>
      tabs.map((tab) => tab.navigator).toList();

  TabBarNavigator get currentNavigator => navigators[_currentTab];

  void setCurrentTab(int newTab) {
    if (newTab == _currentTab &&
        currentNavigator.navigationKey.currentState != null) {
      if (currentNavigator.navigationKey.currentState!.canPop()) {
        currentNavigator.navigationKey.currentState!
            .popUntil((route) => route.isFirst);
      } else {
        scrollToTop();
      }
    } else {
      _currentTab = newTab;
      notifyListeners();
    }
  }

  void clear() {
    navigators[profile].navigationKey.currentState?.pushNamedAndRemoveUntil(
          AppRoutes.profileScreen,
          (route) => false,
        );
    _currentTab = home;
  }

  void scrollToTop() {
    if (tabs[_currentTab].controller.hasClients) {
      tabs[_currentTab].controller.animateTo(
            0,
            duration: const Duration(milliseconds: 200),
            curve: Curves.fastOutSlowIn,
          );
    }
  }

  ScrollController getScrollController(int tab) => tabs[tab].controller;

  List<Widget> get pages =>
      tabs.map((e) => e.navigationRootScreen(currentTab)).toList();

  /// Provide this to [WillPopScope] callback.
  Future<bool> onWillPop(BuildContext context) async {
    final currentNavigatorState = currentNavigator.navigationKey.currentState;

    if (currentNavigatorState == null) return false;

    if (currentNavigatorState.canPop()) {
      currentNavigatorState.pop();
      return false;
    } else {
      if (currentTab != home) {
        setCurrentTab(home);
        return false;
      } else {
        return await showDialog(
          context: context,
          builder: (context) => Container(),
        );
      }
    }
  }
}
