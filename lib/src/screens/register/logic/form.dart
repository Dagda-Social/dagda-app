import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

checkMail(String mail, BuildContext context) {
  if (mail.isEmpty) {
    return AppLocalizations.of(context).enterEmail;
  } else if (!mail.contains(RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$'))) {
    return AppLocalizations.of(context).errorEmail;
  } else {
    return null;
  }
}

checkEmptyPassword(String password, BuildContext context) {
  if (password.isEmpty) {
    return AppLocalizations.of(context).enterPassword;
  } else {
    return null;
  }
}

checkPasswordWithSpecialCharacters(String password, BuildContext context) {
  if (password.isEmpty) {
    return AppLocalizations.of(context).enterPassword;
  } else if (password.length < 8) {
    return AppLocalizations.of(context).errorPassword;
  } else if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return AppLocalizations.of(context).errorPasswordWithSpecialCharacters;
  } else {
    return null;
  }
}

checkSamePassword(
    String password, String passwordConfirm, BuildContext context) {
  if (passwordConfirm.isEmpty) {
    return AppLocalizations.of(context).enterConfirmPassword;
  } else if (checkPasswordWithSpecialCharacters(password, context) != null) {
    return checkPasswordWithSpecialCharacters(password, context);
  } else if (password != passwordConfirm) {
    return AppLocalizations.of(context).errorConfirmPassword;
  } else {
    return null;
  }
}
