import 'package:flutter/material.dart';

loadingDialog(BuildContext context) {
  Dialog alert = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: SingleChildScrollView(
      child: SizedBox(
        width: 100,
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const <Widget>[
            SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 4,
              ),
            ),
          ],
        ),
      ),
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
