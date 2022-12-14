import 'package:dagda/l10n/l10n.dart';
import 'package:dagda/meta_strategy/non_web_meta_strategy.dart'
    if (dart.library.html) 'package:dagda/meta_strategy/web_meta_strategy.dart';
import 'package:dagda/provider/locale_provider.dart';
import 'package:dagda/router_strategy/non_web_router_strategy.dart' if (dart.library.html) 'package:dagda/router_strategy/web_router_strategy.dart';
import 'package:dagda/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:universal_io/io.dart';
import './urlStrategy/nonweb_rul_strategy.dart'
    if (dart.library.html) './urlStrategy/web_url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  configMeta(Locale.fromSubtags(languageCode: Platform.localeName));
  configureUrl();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Dagda',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: L10n.all,
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Colors.white, primary: Colors.white),
        scrollbarTheme: ScrollbarThemeData(
          thumbColor: MaterialStateProperty.all(Colors.black),
          radius: const Radius.circular(10),
          trackColor: MaterialStateProperty.all(Colors.grey),
          trackBorderColor: MaterialStateProperty.all(Colors.grey),
        ),
      ),
      routerConfig: router,
    );
  }
}

