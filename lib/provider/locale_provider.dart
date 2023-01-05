import 'package:universal_io/io.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../l10n/l10n.dart';

class LocaleProvider extends ChangeNotifier {
  Locale _locale = Locale.fromSubtags(languageCode: Platform.localeName);

  Locale get locale => _locale;

  void setLocale(Locale locale) {
    if (!L10n.all.contains(locale)) return;

    _locale = locale;
    notifyListeners();
    saveLanguage(locale);
  }

  void clearLocale() {
    _locale = Locale.fromSubtags(languageCode: Platform.localeName);
    notifyListeners();
  }

  void setLocaleInitial(Locale locale) {
    String language = 'en';
    Locale locale = Locale.fromSubtags(languageCode: language);
    for (var element in L10n.all) {
      if (locale.toString().contains(element.toString())) {
        locale = element;
      }
    }

    setLocale(locale);
    notifyListeners();
  }

  Future<void> saveLanguage(Locale locale) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('language', locale.toString());
    sharedPreferences.setBool('savedLanguage', true);
  }

  Future<String> getSavedLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String language = sharedPreferences.getString('language') ?? '';
    return language;
  }

  Future<bool> getIsLanguage() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool language = sharedPreferences.getBool('savedLanguage') ?? false;
    return language;
  }
}

Future<void> saveLanguage(Locale locale) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setString('language', locale.toString());
}

Future<String> getSavedLanguage() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String language = sharedPreferences.getString('language') ?? '';
  return language;
}