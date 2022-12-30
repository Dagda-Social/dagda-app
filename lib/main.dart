import 'package:dagda/firebase_options.dart';
import 'package:dagda/l10n/l10n.dart';
import 'package:dagda/router_strategy/non_web_router_strategy.dart'
    if (dart.library.html) 'package:dagda/router_strategy/web_router_strategy.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './urlStrategy/nonweb_rul_strategy.dart'
    if (dart.library.html) './urlStrategy/web_url_strategy.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

Future<void> main() async {
  configureUrl();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'dagda',
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
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.black,
          selectionColor: Color.fromARGB(59, 0, 0, 0),
          selectionHandleColor: Colors.black,
        ),
      ),
      routerConfig: router,
    );
  }
}
