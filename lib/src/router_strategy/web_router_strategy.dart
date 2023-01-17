import 'package:dagda/src/screens/login/login.dart' deferred as login;
import 'package:dagda/src/screens/nav_screen/nav_screen.dart';
import 'package:dagda/src/screens/profile/profile.dart' deferred as profile;
import 'package:dagda/src/screens/register/register.dart' deferred as register;
import 'package:dagda/src/screens/base_page/base_page.dart' deferred as base;
import 'package:dagda/src/screens/not_found.dart' deferred as not_found;
import 'package:dagda/src/screens/screens.dart';
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
                  MetaSEO metaSEO = MetaSEO();

                  metaSEO.seoOGImage(
                      'https://dagda.social/assets/images/logo.png');
                  metaSEO.seoDescription(
                      '${AppLocalizations.of(context).buildingNextGeneration}, ${AppLocalizations.of(context).joinUs}');
                  metaSEO.seoOGTitle(
                      '${AppLocalizations.of(context).login} - ${AppLocalizations.of(context).dagdaSocial}');
                  metaSEO.seoKeywords(AppLocalizations.of(context).appKeywords);
                  metaSEO.seoTwitterTitle(
                      ' ${AppLocalizations.of(context).dagdaSocial}');
                  metaSEO.seoTwitterDescription(
                      '${AppLocalizations.of(context).buildingNextGeneration}, ${AppLocalizations.of(context).joinUs}');

                  return const MaterialPage(child: MyHomePage());
                }),
            GoRoute(
                path: '/search',
                redirect: (context, state) {
                  if (FirebaseAuth.instance.currentUser == null) {
                    return '/login';
                  }
                  return null;
                },
                pageBuilder: (context, state) =>
                    const MaterialPage<void>(child: SearchPage())),
            GoRoute(
                path: '/profile',
                redirect: (context, state) {
                  if (FirebaseAuth.instance.currentUser == null) {
                    return '/login';
                  }
                  return null;
                },
                pageBuilder: (context, state) => MaterialPage<void>(
                        child: FutureBuilder(
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return profile.Profile(
                            id: 'd4viddf',
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                      future: profile.loadLibrary(),
                    ))),
          ]),
      GoRoute(
        path: '/',
        redirect: (context, state) => '/home',
      ),
      GoRoute(
          path: '/register',
          redirect: (context, state) {
            if (FirebaseAuth.instance.currentUser != null) {
              return '/home';
            }
            return null;
          },
          pageBuilder: (context, state) {
            MetaSEO metaSEO = MetaSEO();

            metaSEO.seoOGImage('https://dagda.social/assets/images/logo.png');
            metaSEO.seoDescription(
                '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');
            metaSEO.seoOGTitle(
                '${AppLocalizations.of(context).appName} - ${AppLocalizations.of(context).register}');
            metaSEO.seoKeywords(
                "${AppLocalizations.of(context).appKeywords},${AppLocalizations.of(context).register}");
            metaSEO.seoTwitterTitle(
                '${AppLocalizations.of(context).appName} - ${AppLocalizations.of(context).register}');
            metaSEO.seoTwitterDescription(
                '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');

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
              return '/home';
            }
            return null;
          },
          pageBuilder: (context, state) {
            MetaSEO metaSEO = MetaSEO();

            metaSEO.seoOGImage('https://dagda.social/assets/images/logo.png');
            metaSEO.seoDescription(
                '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');
            metaSEO.seoOGTitle(
                '${AppLocalizations.of(context).appName} - ${AppLocalizations.of(context).login}');
            metaSEO.seoKeywords(
                "${AppLocalizations.of(context).appKeywords},${AppLocalizations.of(context).login}");
            metaSEO.seoTwitterTitle(
                '${AppLocalizations.of(context).appName} - ${AppLocalizations.of(context).login}');
            metaSEO.seoTwitterDescription(
                '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');
            metaSEO
                .seoTwitterImage('https://dagda.social/assets/images/logo.png');

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
            MetaSEO metaSEO = MetaSEO();

            metaSEO.seoOGTitle('${state.params['idProfile']} - dagda');
            metaSEO.seoKeywords(
                '${AppLocalizations.of(context).appKeywords}, ${state.params['idProfile'].toString()}');
            metaSEO.seoDescription(
                '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');
            metaSEO.seoOGImage('https://dagda.social/assets/images/logo.png');
            metaSEO
                .seoTwitterImage('https://dagda.social/assets/images/logo.png');
            metaSEO.seoTwitterTitle('${state.params['idProfile']} - dagda');
            metaSEO.seoTwitterDescription(
                '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');

            return MaterialPage(
              child: LayoutBuilder(builder: (buildContext, constraints) {
                if (constraints.minWidth > 600) {
                  return NavScreen(
                    child: Title(
                        title: '${state.params['idProfile']} - dagda',
                        color: Colors.black,
                        child: Profile(
                          id: state.params['idProfile'].toString(),
                        )),
                  );
                } else {
                  return Title(
                      title: '${state.params['idProfile']} - dagda',
                      color: Colors.black,
                      child: Profile(
                        id: state.params['idProfile'].toString(),
                      ));
                }
              }),
            );
          }),
      GoRoute(
        path: '/privacy-policy',
        pageBuilder: (context, state) {
          MetaSEO metaSEO = MetaSEO();

          metaSEO.seoDescription(
              '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');
          metaSEO.seoOGTitle(
              '${AppLocalizations.of(context).privacyPolicy} - ${AppLocalizations.of(context).appName}');
          metaSEO.seoKeywords(
              "${AppLocalizations.of(context).appKeywords},${AppLocalizations.of(context).privacyPolicy}");
          metaSEO.seoAuthor('dagda - Social Network');
          metaSEO.seoTwitterTitle(
              '${AppLocalizations.of(context).privacyPolicy} - ${AppLocalizations.of(context).appName}');
          metaSEO.seoTwitterDescription(
              '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');

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
            MetaSEO metaSEO = MetaSEO();

            metaSEO.seoAuthor('dagda - Social Network');
            metaSEO.seoTwitterTitle(
                '${AppLocalizations.of(context).appName} - ${AppLocalizations.of(context).termsOfService}');
            metaSEO.seoTwitterDescription(
                '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');
            metaSEO
                .seoTwitterImage('https://dagda.social/assets/images/logo.png');
            metaSEO.seoKeywords(
                "${AppLocalizations.of(context).appKeywords},${AppLocalizations.of(context).termsOfService}");
            metaSEO.seoOGDescription(
                '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');

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
          MetaSEO metaSEO = MetaSEO();

          metaSEO.seoAuthor('dagda - Social Network');
          metaSEO.seoTwitterTitle(
              '${AppLocalizations.of(context).appName} - ${AppLocalizations.of(context).about}');
          metaSEO.seoTwitterDescription(
              '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');
          metaSEO
              .seoTwitterImage('https://dagda.social/assets/images/logo.png');
          metaSEO.seoKeywords(
              "${AppLocalizations.of(context).appKeywords},${AppLocalizations.of(context).about}");
          metaSEO.seoOGDescription(
              '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');

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
      MetaSEO metaSEO = MetaSEO();
      metaSEO.seoOGTitle('404 - Not Found');
      metaSEO.seoOGDescription(
          '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');
      metaSEO.seoOGImage('https://dagda.social/assets/images/logo.png');
      metaSEO.seoKeywords("${AppLocalizations.of(context).appKeywords},404");
      metaSEO.seoAuthor('dagda - Social Network');
      metaSEO.seoTwitterTitle('404 - Not Found');
      metaSEO.seoTwitterDescription(
          '${AppLocalizations.of(context).buildingNextGeneration} ${AppLocalizations.of(context).joinUs}');
      metaSEO.seoTwitterImage('https://dagda.social/assets/images/logo.png');

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
