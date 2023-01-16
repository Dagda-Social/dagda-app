import 'package:flutter/material.dart';

actionDialog(BuildContext context, Widget child) {
  // Create dialog with title, content and a single button to close the dialog
  Dialog alert = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: SingleChildScrollView(child: child),
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
