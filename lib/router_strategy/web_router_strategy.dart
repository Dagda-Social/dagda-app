import 'package:dagda/screens/home/home_screen.dart' deferred as home;
import 'package:dagda/screens/login/login.dart' deferred as login;
import 'package:dagda/screens/nav_screen/nav_screen.dart';
import 'package:dagda/screens/profile/profile.dart' deferred as profile;
import 'package:dagda/screens/register/register.dart' deferred as register;
import 'package:dagda/screens/base_page/base_page.dart' deferred as base;
import 'package:dagda/screens/not_found.dart' deferred as not_found;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:meta_seo/meta_seo.dart';

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
                        child: FutureBuilder(
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return home.MyHomePage();
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                          future: home.loadLibrary(),
                        )),
                  );
                }),
            GoRoute(
                path: '/search',
                pageBuilder: (context, state) =>
                    const MaterialPage<void>(child: Scaffold())),
            GoRoute(
                path: '/profile',
                pageBuilder: (context, state) =>
                    const MaterialPage<void>(child: Scaffold())),
          ]),
      GoRoute(
        path: '/',
        redirect: (context, state) => '/home',
      ),
      GoRoute(
          path: '/register',
          redirect: (context, state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return '/@${FirebaseAuth.instance.currentUser!.displayName}';
            }
            return null;
          },
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
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return register.Register();
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                    future: register.loadLibrary(),
                  )),
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
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return login.Login();
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                    future: login.loadLibrary(),
                  )),
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
                  child: FutureBuilder(
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return profile.Profile(
                          id: state.params['idProfile'].toString(),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                    future: profile.loadLibrary(),
                  )),
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

          return MaterialPage<void>(
              child: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return base.BasePage(contentType: 'privacy-policy');
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
            future: base.loadLibrary(),
          ));
        },
      ),
      GoRoute(
          path: '/terms-of-service',
          pageBuilder: (context, state) {
            MetaSEO metaSEO = MetaSEO(
              ogTitle:
                  '${AppLocalizations.of(context).appName} - ${AppLocalizations.of(context).termsOfService}',
              description:
                  '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}',
              ogImage: 'https://dagda.social/assets/images/logo.png',
              keywords:
                  "${AppLocalizations.of(context).appKeywords},${AppLocalizations.of(context).termsOfService}",
            );

            metaSEO.seoOGImage();
            metaSEO.seoDescription();
            metaSEO.seoOGTitle();
            metaSEO.seoKeywords();

            return MaterialPage<void>(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return base.BasePage(contentType: 'terms-of-service');
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
                future: base.loadLibrary(),
              ),
            );
          }),
      GoRoute(
          path: '/logout',
          redirect: (context, state) {
            FirebaseAuth.instance.signOut();
            return '/';
          }),
      GoRoute(
        path: '/about',
        pageBuilder: (context, state) {
          MetaSEO metaSEO = MetaSEO(
            ogTitle:
                '${AppLocalizations.of(context).appName} - ${AppLocalizations.of(context).about}',
            description:
                '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}',
            ogImage: 'https://dagda.social/assets/images/logo.png',
            keywords:
                "${AppLocalizations.of(context).appKeywords},${AppLocalizations.of(context).about}",
          );

          metaSEO.seoOGImage();
          metaSEO.seoDescription();
          metaSEO.seoOGTitle();
          metaSEO.seoKeywords();

          return MaterialPage<void>(
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return base.BasePage(contentType: 'about');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
              future: base.loadLibrary(),
            ),
          );
        },
      ),
      GoRoute(
          path: '/profile-info',
          pageBuilder: (context, state) {
            return MaterialPage<void>(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (FirebaseAuth.instance.currentUser != null) {
                      return base.BasePage(contentType: 'profile-info');
                    }
                    return base.BasePage(contentType: 'info');
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
                future: base.loadLibrary(),
              ),
            );
          }),
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
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return not_found.NotFound();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
          future: not_found.loadLibrary(),
        ),
      );
    },
    initialLocation: '/');
