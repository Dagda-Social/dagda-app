import 'package:dagda/screens/register/sizes/register_large.dart';
import 'package:dagda/screens/register/sizes/register_medium.dart';
import 'package:dagda/screens/register/sizes/register_small.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: '${AppLocalizations.of(context).register} - ${AppLocalizations.of(context).appName}',
      color: Colors.black,
      child: Scaffold(body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // If the screen is smaller than 600px wide, we'll use the small
            // layout. If it's wider than 600px, we'll use the medium layout.
            // If it's wider than 1200px, we'll use the large layout.
        if (constraints.maxWidth < 600) {
          return const RegisterSmall();
        } else if (constraints.maxWidth < 1200) {
          return const RegisterMedium();
        } else {
          return const RegisterLarge();
        }
      })),
    );
  }
}
