import 'dart:math';
import 'package:design/design.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  static const double tabHeight = 60;
  final int currentTab;
  final List<TabBarElement> tabs;
  final Function(int) onTap;
  const CustomTabBar({
    Key? key,
    required this.tabs,
    required this.currentTab,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const double defaultItemWidth = 75;
    const double itemsPadding = 10;
    final double width = MediaQuery.of(context).size.width;
    final double tabBarWidth = width - 16;
    final double _bottomPadding = MediaQuery.of(context).padding.bottom;
    final double maxItemWidth = (tabBarWidth / tabs.length);
    final double itemWidth = maxItemWidth - 2 * itemsPadding;

    return Container(
      height: tabHeight + _bottomPadding,
      width: width,
      padding: EdgeInsets.only(left: 8, right: 8, bottom: _bottomPadding),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: Theme.of(context).colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.onBackground.withOpacity(0.16),
            blurRadius: 6,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: tabs
            .map(
              (item) => buildTabBarItem(
                item: item,
                itemWidth: min(itemWidth, defaultItemWidth),
                context: context,
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildTabBarItem({
    required TabBarElement item,
    required double itemWidth,
    required BuildContext context,
  }) {
    final selectedColor = Theme.of(context).tabBarTheme.labelColor;
    final unselectedColor = Theme.of(context).tabBarTheme.unselectedLabelColor;

    final selectedLabelStyle = Theme.of(context)
        .tabBarTheme
        .labelStyle
        ?.copyWith(color: selectedColor);

    final unselectedLabelStyle = Theme.of(context)
        .tabBarTheme
        .unselectedLabelStyle
        ?.copyWith(color: unselectedColor);

    return GestureDetector(
      onTap: () => onTap(item.index),
      child: Column(
        children: [
          Container(
            color: CustomColors.clear,
            width: itemWidth,
            padding: const EdgeInsets.only(top: 6, bottom: 5),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: SizedBox(
              height: 25,
              child: Icon(
                item.icon,
                color: item.index == currentTab
                    ? Theme.of(context).tabBarTheme.labelColor
                    : Theme.of(context).tabBarTheme.unselectedLabelColor,
              ),
            ),
          ),
          Center(
            child: Text(
              item.tabName,
              style: item.index == currentTab
                  ? selectedLabelStyle
                  : unselectedLabelStyle,
            ),
          ),
        ],
      ),
    );
  }
}
