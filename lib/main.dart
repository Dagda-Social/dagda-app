import 'package:dagda/screens/screens.dart';
import 'package:flutter/material.dart';
import './urlStrategy/nonweb_rul_strategy.dart'
    if (dart.library.html) './urlStrategy/web_url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_seo/meta_seo.dart';

void main() {
  configureUrl();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'dagda - Social Network',
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
      routerConfig: _router,
    );
  }
}

final _router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            MetaSEO metaSEO = MetaSEO(
              ogTitle: 'dagda - Social Network',
              description:
                  'Building the next generation of Social Network. Join us now!',
              ogImage: 'https://dagda.social/assets/images/logo.png',
              keywords:
                  'dagda, social network, social media, social, network, dagda social network',
            );

            metaSEO.seoOGImage();
            metaSEO.seoDescription();
            metaSEO.seoOGTitle();
            metaSEO.seoKeywords();

            return const MaterialPage(
              child: MyHomePage(),
            );
          }),
      GoRoute(
          path: '/register',
          pageBuilder: (context, state) {
            MetaSEO metaSEO = MetaSEO(
              ogTitle: 'dagda - Register',
              description:
                  'Building the next generation of Social Network. Join us now!',
              ogImage: 'https://dagda.social/assets/images/logo.png',
              keywords:
                  'dagda, social network, social media, social, network, dagda social network, register',
            );

            metaSEO.seoOGImage();
            metaSEO.seoDescription();
            metaSEO.seoOGTitle();
            metaSEO.seoKeywords();

            return const MaterialPage<void>(
              child: Register(),
            );
          }),
      GoRoute(
          path: '/login',
          pageBuilder: (context, state) {
            MetaSEO metaSEO = MetaSEO(
              ogTitle: 'dagda - Login',
              description:
                  'Building the next generation of Social Network. Join us now!',
              ogImage: 'https://dagda.social/assets/images/logo.png',
              keywords:
                  'dagda, social network, social media, social, network, dagda social network, login',
            );

            metaSEO.seoOGImage();
            metaSEO.seoDescription();
            metaSEO.seoOGTitle();
            metaSEO.seoKeywords();

            return const MaterialPage<void>(
              child: Login(),
            );
          }),
      GoRoute(
          name: 'profile',
          path: '/@:idProfile',
          pageBuilder: (context, state) {
            MetaSEO metaSEO = MetaSEO(
              ogTitle: state.params['idProfile'].toString(),
              keywords:
                  'dagda, social network, social media, social, network, dagda social network, ${state.params['idProfile'].toString()}',
            );
            return MaterialPage<void>(
              child: Title(
                  title: state.params['idProfile'].toString(),
                  color: Colors.black,
                  child: Profile(id: state.params['idProfile'].toString())),
            );
          }),
      GoRoute(
        path: '/privacy-policy',
        pageBuilder: (context, state) {
          MetaSEO metaSEO = MetaSEO(
            ogTitle: 'dagda - Privacy Policy',
            description:
                'Building the next generation of Social Network. Join us now!',
            ogImage: 'https://dagda.social/assets/images/logo.png',
            keywords:
                'dagda, social network, social media, social, network, dagda social network, privacy policy, privacy, policy',
          );

          metaSEO.seoOGImage();
          metaSEO.seoDescription();
          metaSEO.seoOGTitle();
          metaSEO.seoKeywords();

          return const MaterialPage<void>(
            child: PrivacyPolicy(),
          );
        },
      ),
    ],
    errorBuilder: (context, state) {
      return Title(
          title: '404 - Not Found',
          color: Colors.black,
          child: const NotFound());
    },
    initialLocation: '/');

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: <Widget>[
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Text('dagda',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 72)),
            ],
          ),
        ),
        Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  height: 200,
                ),
                Text(
                  'Building the next generation of Social Network',
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
              ]),
        ),
      ]),
    );
  }
}
