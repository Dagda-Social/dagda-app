import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('es'),
    const Locale('gl'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'es':
        return 'Español';
      case 'gl':
        return 'Galego';
      case 'en':
      default:
        return 'English';
    }
  }
}
