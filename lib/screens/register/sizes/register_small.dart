import 'package:dagda/widgets/buttons/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class RegisterSmall extends StatefulWidget {
  const RegisterSmall({Key? key}) : super(key: key);

  @override
  State<RegisterSmall> createState() => _RegisterSmallState();
}

class _RegisterSmallState extends State<RegisterSmall> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: AppLocalizations.of(context).register + ' -  small',
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(AppLocalizations.of(context).appName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 72)),
                const SizedBox(
                  height: 50,
                ),
                DagdaOutlinedButton(
                    colour: Colors.black,
                    title: AppLocalizations.of(context).register,
                    onPressed: () => context.go('/'),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    borderRadius: 10,
                    borderWidth: 2),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).alreadyHaveAnAccount,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 14)),
                    TextButton(
                        onPressed: () => context.go('/login'),
                        child: Text(AppLocalizations.of(context).login,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)))
                  ],
                )
              ]),
        ),
      ),
    );
  }
}
