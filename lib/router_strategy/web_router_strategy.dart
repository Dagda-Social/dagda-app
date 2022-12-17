import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meta_seo/meta_seo.dart';

import '../screens/screens.dart';

GoRouter router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          pageBuilder: (context, state) {
            MetaSEO metaSEO = MetaSEO(
                ogTitle: AppLocalizations.of(context).dagdaSocial,
                description:
                    '${AppLocalizations.of(context).buildingNextGeneration}, ${AppLocalizations.of(context).joinUs}',
                ogImage: 'https://dagda.social/assets/images/logo.png',
                keywords: AppLocalizations.of(context).appKeywords);

            metaSEO.seoOGImage();
            metaSEO.seoDescription();
            metaSEO.seoOGTitle();
            metaSEO.seoKeywords();

            return MaterialPage(
              child: Title(
                  title: AppLocalizations.of(context).dagdaSocial,
                  color: Colors.black,
                  child: const MyHomePage()),
            );
          }),
      GoRoute(
          path: '/register',
          pageBuilder: (context, state) {
            MetaSEO metaSEO = MetaSEO(
                ogTitle:
                    '${AppLocalizations.of(context).appName} - ${AppLocalizations.of(context).register}',
                description:
                    '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}',
                ogImage: 'https://dagda.social/assets/images/logo.png',
                keywords:
                    "${AppLocalizations.of(context).appKeywords},${AppLocalizations.of(context).register}");

            metaSEO.seoOGImage();
            metaSEO.seoDescription();
            metaSEO.seoOGTitle();
            metaSEO.seoKeywords();

            return MaterialPage<void>(
              child: Title(
                  title: '${AppLocalizations.of(context).register} - dagda',
                  color: Colors.black,
                  child: const Register()),
            );
          }),
      GoRoute(
          path: '/login',
          pageBuilder: (context, state) {
            MetaSEO metaSEO = MetaSEO(
                ogTitle:
                    '${AppLocalizations.of(context).appName} - ${AppLocalizations.of(context).login}',
                description:
                    '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}',
                ogImage: 'https://dagda.social/assets/images/logo.png',
                keywords:
                    "${AppLocalizations.of(context).appKeywords},${AppLocalizations.of(context).login}");

            metaSEO.seoOGImage();
            metaSEO.seoDescription();
            metaSEO.seoOGTitle();
            metaSEO.seoKeywords();

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
            MetaSEO metaSEO = MetaSEO(
              ogTitle: '${state.params['idProfile']} - dagda',
              description:
                  '${state.params['idProfile']} ${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}',
              keywords:
                  '${AppLocalizations.of(context).appKeywords}, ${state.params['idProfile'].toString()}',
            );

            metaSEO.seoOGTitle();
            metaSEO.seoKeywords();

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
          MetaSEO metaSEO = MetaSEO(
            ogTitle:
                '${AppLocalizations.of(context).appName} - ${AppLocalizations.of(context).privacyPolicy}',
            description:
                '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}',
            ogImage: 'https://dagda.social/assets/images/logo.png',
            keywords:
                "${AppLocalizations.of(context).appKeywords},${AppLocalizations.of(context).privacyPolicy}",
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
      MetaSEO metaSEO = MetaSEO(
        ogTitle: '404 - Not Found',
        description:
            '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}',
        ogImage: 'https://dagda.social/assets/images/logo.png',
        keywords: "${AppLocalizations.of(context).appKeywords},404",
      );
      metaSEO.seoOGImage();
      metaSEO.seoDescription();
      metaSEO.seoOGTitle();
      metaSEO.seoKeywords();

      return Title(
          title: '404 - Not Found',
          color: Colors.black,
          child: const NotFound());
    },
    initialLocation: '/');
