import 'package:dagda/src/screens/nav_screen/nav_bar_item.dart';
import 'package:dagda/src/widgets/tabbar/custom_tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  State<NavScreen> createState() => _NavScreenState();
}

// Path: lib/screens/nav_screen/nav_screen.dart
class _NavScreenState extends State<NavScreen> {
  static const tabs = [
    ScaffoldWithNavBarTabItem(
        initialLocation: '/home',
        icon: Icon(Icons.home_rounded),
        label: 'Home'),
    ScaffoldWithNavBarTabItem(
        initialLocation: '/search',
        icon: Icon(Icons.search_rounded),
        label: 'Search'),
    ScaffoldWithNavBarTabItem(
        initialLocation: '/profile',
        icon: Icon(Icons.person_rounded),
        label: 'Profile'),
  ];
  static const railMedium = [
    ScaffoldWithNavBarTabItem(
        initialLocation: '/home',
        icon: Icon(Icons.home_rounded),
        label: 'Home'),
    ScaffoldWithNavBarTabItem(
        initialLocation: '/search',
        icon: Icon(Icons.search_rounded),
        label: 'Search'),
    ScaffoldWithNavBarTabItem(
        initialLocation: '/profile',
        icon: Icon(Icons.person_rounded),
        label: 'Profile'),
  ];

  static const railBig = [
    ScaffoldWithNavBarTabItem(
        initialLocation: '/home',
        icon: Icon(Icons.home_rounded),
        label: 'Home'),
    ScaffoldWithNavBarTabItem(
        initialLocation: '/search',
        icon: Icon(Icons.search_rounded),
        label: 'Search'),
    ScaffoldWithNavBarTabItem(
        initialLocation: '/profile',
        icon: Icon(Icons.person_rounded),
        label: 'Profile')
  ];
// check if the current page is a large screen page
  bool _isLargeScrenPage = false;

  int? get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);
// get the index of the tab based on the current location
  int? _locationToTabIndex(String location) {
    final index =
        tabs.indexWhere((t) => location.startsWith(t.initialLocation));
// if index not found (-1), set _isLargeScrenPage to true
    if (index < 0) {
      _isLargeScrenPage = true;
    } else {
      _isLargeScrenPage = false;
    }
    // if index not found (-1), return 0
    return index < 0 ? null : index;
  }

  // callback used to navigate to the desired tab
  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex || _isLargeScrenPage) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].initialLocation);
    }
  }

// build the scaffold based on the screen size
  @override
  Widget build(BuildContext context) {
    final double additionalBottomPadding =
        MediaQuery.of(context).padding.bottom;
    return LayoutBuilder(builder: (buildContext, boxConstraints) {
      if (boxConstraints.maxWidth < 600) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: widget.child,
          floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.black,
              onPressed: () {},
              tooltip: 'Add',
              elevation: 10,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: const Icon(Icons.add)),
          bottomNavigationBar: DefaultTabController(
            length: tabs.length,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight:
                      kBottomNavigationBarHeight + additionalBottomPadding),
              child: CustomTabBar(
                selectedIndex: _currentIndex ?? 0,
                onTap: (index) => _onItemTapped(context, index),
                tabs: tabs,
              ),
            ),
          ),
        );
      } else if (boxConstraints.maxWidth < 1200) {
        return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: Row(children: [
                SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: boxConstraints.maxHeight),
                    child: IntrinsicHeight(
                      child: NavigationRail(
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          labelType: NavigationRailLabelType.all,
                          elevation: 10,
                          leading: Column(
                            children: [
                              const SizedBox(height: 30),
                              FloatingActionButton(
                                  backgroundColor: Colors.black,
                                  onPressed: () {},
                                  tooltip: 'Add',
                                  elevation: 10,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: const Icon(Icons.add)),
                            ],
                          ),
                          useIndicator: true,
                          indicatorColor: Colors.black,
                          selectedLabelTextStyle: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                          unselectedLabelTextStyle: const TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.bold),
                          destinations: railMedium
                              .map((e) => NavigationRailDestination(
                                  icon: e.icon, label: Text(e.label!)))
                              .toList(),
                          selectedIndex: _currentIndex,
                          onDestinationSelected: (index) =>
                              _onItemTapped(context, index)),
                    ),
                  ),
                ),
                Expanded(child: widget.child)
              ]),
            ));
      } else {
        return Scaffold(
            body: Row(children: [
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: boxConstraints.maxHeight),
              child: IntrinsicHeight(
                child: NavigationRail(
                  backgroundColor: Colors.white,
                  extended: true,
                  elevation: 10,
                  leading: Text(
                    AppLocalizations.of(context).appName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 34),
                  ),
                  indicatorColor: Colors.black,
                  selectedIconTheme: const IconThemeData(color: Colors.white),
                  selectedLabelTextStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  unselectedLabelTextStyle: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                  destinations: railBig
                      .map((e) => NavigationRailDestination(
                          icon: e.icon,
                          label: Text(e.label!),
                          padding: const EdgeInsets.all(2.0)))
                      .toList(),
                  selectedIndex: _currentIndex,
                  onDestinationSelected: (index) =>
                      _onItemTapped(context, index),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: FloatingActionButton.extended(
                      onPressed: () {},
                      label: const Text('Add Dag'),
                      icon: const Icon(Icons.add),
                      backgroundColor: Colors.black,
                      elevation: 10,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: widget.child))
        ]));
      }
    });
  }
}
