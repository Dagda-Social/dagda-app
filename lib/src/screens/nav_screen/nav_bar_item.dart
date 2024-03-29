import 'package:flutter/material.dart';

class ScaffoldWithNavBarTabItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarTabItem(
      {required this.initialLocation,
      required Widget icon,
      required String label})
      : super(icon: icon, label: label);

  /// The initial location/path
  final String initialLocation;

  toNavigationRailDestination() {}
}
