import 'package:dagda/screens/nav_screen/nav_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../screens/screens.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();
GoRouter router = GoRouter(
    routes: [
      ShellRoute(
          navigatorKey: _shellNavigatorKey,
          builder: (context, state, child) {
            return Scaffold(
              body: NavScreen(child: child),
            );
          },
          routes: [
            GoRoute(
                path: '/home',
                redirect: (context, state) {
                  if (FirebaseAuth.instance.currentUser == null) {
                    return '/login';
                  }
                  return null;
                },
                pageBuilder: (context, state) {
                  return MaterialPage(
                    child: Title(
                        title: AppLocalizations.of(context).dagdaSocial,
                        color: Colors.black,
                        child: const MyHomePage()),
                  );
                }),
            GoRoute(
                path: '/search',
                pageBuilder: (context, state) =>
                    const MaterialPage<void>(child: SearchPage())),
            GoRoute(
                path: '/profile',
                pageBuilder: (context, state) =>
                    const MaterialPage<void>(child: Scaffold())),
          ]),
      GoRoute(
          path: '/register',
          redirect: (context, state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return '/@${FirebaseAuth.instance.currentUser!.displayName}';
            }
            return null;
          },
          pageBuilder: (context, state) {
            return MaterialPage<void>(
              child: Title(
                  title: '${AppLocalizations.of(context).register} - dagda',
                  color: Colors.black,
                  child: const Register()),
            );
          }),
      GoRoute(
        path: '/',
        redirect: (context, state) => '/home',
      ),
      GoRoute(
          path: '/login',
          redirect: (context, state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return '/@${FirebaseAuth.instance.currentUser!.displayName}';
            }
            return null;
          },
          pageBuilder: (context, state) {
            return MaterialPage<void>(
              child: Title(
                  title: '${AppLocalizations.of(context).login} - dagda',
                  color: Colors.black,
                  child: const Login()),
            );
          }),
      GoRoute(
          name: 'profile',
          path: '/@:idProfile',
          pageBuilder: (context, state) {
            return MaterialPage<void>(
              child: Title(
                  title: '${state.params['idProfile']} - dagda',
                  color: Colors.black,
                  child: Profile(id: state.params['idProfile'].toString())),
            );
          }),
      GoRoute(
        path: '/privacy-policy',
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            child: BasePage(
              contentType: 'privacy-policy',
            ),
          );
        },
      ),
      GoRoute(
        path: '/terms-of-service',
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            child: BasePage(
              contentType: "terms-of-service",
            ),
          );
        },
      ),
      GoRoute(
        path: '/about',
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            child: BasePage(
              contentType: "about",
            ),
          );
        },
      ),
      GoRoute(
        path: '/logout',
        redirect: (context, state) {
          FirebaseAuth.instance.signOut();
          return '/';
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
