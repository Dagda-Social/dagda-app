import 'package:dagda/widgets/dialogs/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void login(String email, String password, BuildContext context) async {
  try {
    loadingDialog(context);
    final credentials = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.pop(context);
    context.go('/');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Navigator.pop(context);
      infoDialog(context, AppLocalizations.of(context).attention,
          AppLocalizations.of(context).userNotFound);
    } else if (e.code == 'wrong-password') {
      Navigator.pop(context);
      infoDialog(context, AppLocalizations.of(context).attention,
          AppLocalizations.of(context).wrongPassword);
    }
  }
}
