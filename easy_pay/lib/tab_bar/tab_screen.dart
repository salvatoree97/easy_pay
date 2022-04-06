import 'package:easy_pay/app/navigation_service.dart';
import 'package:easy_pay/tab_bar/tab_bar_provider.dart';
import 'package:flutter/material.dart';
import 'package:common/common.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  void initState() {
    NavigationService.instance.tabContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TabBarProvider>(
      builder: (context, provider, child) {
        // Create bottom navigation bar items from screens.
        return WillPopScope(
          onWillPop: () async => provider.onWillPop(context),
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: IndexedStack(
              children: provider.pages,
              index: provider.currentTab,
            ),
            bottomNavigationBar: CustomTabBar(
              tabs: provider.tabs,
              currentTab: provider.currentTab,
              onTap: provider.setCurrentTab,
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
