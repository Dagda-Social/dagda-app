import 'package:dagda/screens/nav_screen/nav_bar_item.dart';
import 'package:dagda/widgets/tabbar/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavScreen extends StatefulWidget {
  NavScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  static const tabs = [
    ScaffoldWithNavBarTabItem(
        initialLocation: '/home', icon: Icon(Icons.home_rounded), label: 'Home'),
    ScaffoldWithNavBarTabItem(
        initialLocation: '/search',
        icon: Icon(Icons.search_rounded),
        label: 'Search'),
    ScaffoldWithNavBarTabItem(
        initialLocation: '/profile',
        icon: Icon(Icons.person_rounded),
        label: 'Profile'),
  ];

  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    print('tabIndex: $tabIndex');
    print(tabs[tabIndex].initialLocation);
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    final double additionalBottomPadding =
        MediaQuery.of(context).padding.bottom;
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: DefaultTabController(
        length: tabs.length,
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight: kBottomNavigationBarHeight + additionalBottomPadding),
          child: CustomTabBar(
            selectedIndex: _currentIndex,
            onTap: (index) => _onItemTapped(context, index),
            tabs: tabs,
          ),
        ),
      ),
    );
  }
}
