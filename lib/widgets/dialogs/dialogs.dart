import 'package:dagda/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

loadingDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    content: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const CircularProgressIndicator(color: Colors.black,),
        const SizedBox(width: 10.0),
        Text(AppLocalizations.of(context).loading,
            style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold)),
      ],
    ),
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

infoDialog(BuildContext context, String title, String content) {
  AlertDialog alert = AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    title: Text(title,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
    content: Text(content,
        style: const TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold)),
    actions: <Widget>[
      DagdaOutlinedButton(
          colour: Colors.black,
          title: AppLocalizations.of(context).ok,
          onPressed: () => Navigator.pop(context),
          fontSize: 14,
          fontWeight: FontWeight.bold,
          borderRadius: 10,
          borderWidth: 2),
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
          colour: Colors.black,
          title: AppLocalizations.of(context).cancel,
          onPressed: () => Navigator.pop(context),
          fontSize: 14,
          fontWeight: FontWeight.bold,
          borderRadius: 10,
          borderWidth: 2),
      DagdaOutlinedButton(
          colour: Colors.black,
          title: action,
          onPressed: () => actionFunction(),
          fontSize: 14,
          fontWeight: FontWeight.bold,
          borderRadius: 10,
          borderWidth: 2)
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
