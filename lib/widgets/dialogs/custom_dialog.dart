import 'package:dagda/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

actionDialog(BuildContext context, String title, String content, String action,
    Function actionFunction) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    title: Text(title),
    content: Text(content),
    actions: <Widget>[
      DagdaOutlinedButton(
          title: AppLocalizations.of(context).cancel,
          onPressed: () => Navigator.pop(context),),
      DagdaOutlinedButton(
          title: action,
          onPressed: () => actionFunction(),)
    ],
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
