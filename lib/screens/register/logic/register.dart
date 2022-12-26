import 'package:dagda/widgets/dialogs/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:universal_io/io.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void register(String email, String password, BuildContext context) async {
  try {
    loadingDialog(context);
    final credentials = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    await FirebaseAuth.instance
        .setLanguageCode(Platform.localeName.substring(0, 2));
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    Navigator.pop(context);
    context.go('/');
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Navigator.pop(context);
      infoDialog(context, AppLocalizations.of(context).attention,
          AppLocalizations.of(context).weakPassword);
    } else if (e.code == 'email-already-in-use') {
      Navigator.pop(context);
      infoDialog(context, AppLocalizations.of(context).attention,
          AppLocalizations.of(context).emailAlreadyInUse);
    }
  } catch (e) {
    Navigator.pop(context);
  }
}
