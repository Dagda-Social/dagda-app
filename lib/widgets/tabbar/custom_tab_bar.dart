import 'package:dagda/screens/nav_screen/nav_bar_item.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  final List<ScaffoldWithNavBarTabItem> tabs;
  final int selectedIndex;
  final Function(int) onTap;
  const CustomTabBar(
      {super.key,
      required this.tabs,
      required this.selectedIndex,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: tabs,
      onTap: onTap,
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).bottomAppBarColor,
      selectedItemColor: Colors.black,
      unselectedItemColor: Theme.of(context).disabledColor,
      selectedFontSize: 14,
      iconSize: 26,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      enableFeedback: true,
    );
  }
}
