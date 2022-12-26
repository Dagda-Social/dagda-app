import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'sizes/login_large.dart';
import 'sizes/login_medium.dart';
import 'sizes/login_small.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title:
          '${AppLocalizations.of(context).login} - ${AppLocalizations.of(context).appName}',
      color: Colors.black,
      child: Scaffold(body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        // If the screen is smaller than 600px wide, we'll use the small
        // layout. If it's wider than 600px, we'll use the medium layout.
        // If it's wider than 1200px, we'll use the large layout.
        if (constraints.maxWidth < 600) {
          return const LoginSmall();
        } else if (constraints.maxWidth < 1200) {
          return const LoginMedium();
        } else {
          return const LoginLarge();
        }
      })),
    );
  }
}
