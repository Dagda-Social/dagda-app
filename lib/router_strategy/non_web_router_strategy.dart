import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../screens/screens.dart';

GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            return MaterialPage(
              child: Title(
                  title: AppLocalizations.of(context).dagdaSocial,
                  color: Colors.black,
                  child: const MyHomePage()),
            );
          }),
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
          return const MaterialPage<void>(
            child: PrivacyPolicy(),
          );
        },
      ),
      GoRoute(
        path: '/terms-of-service',
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            child: TermsOfService(),
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
