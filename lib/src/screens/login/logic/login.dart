// ignore_for_file: use_build_context_synchronously

import 'package:dagda/src/widgets/dialogs/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

login(String email, String password, BuildContext context) async {
  try {
    loadingDialog(context);
    await FirebaseAuth.instance
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

senPasswordResetEmail(String email, BuildContext context) async {
  try {
    loadingDialog(context);
    await FirebaseAuth.instance
        .setLanguageCode(Platform.localeName.substring(0, 2));
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    Navigator.pop(context);
    Navigator.pop(context);
    infoDialog(context, AppLocalizations.of(context).attention,
        AppLocalizations.of(context).forgotPasswordEmailSent);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Navigator.pop(context);
      infoDialog(context, AppLocalizations.of(context).attention,
          AppLocalizations.of(context).userNotFound);
    }
  }
}
