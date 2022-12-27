import 'package:dagda/screens/login/logic/login.dart';
import 'package:dagda/screens/register/logic/form.dart';
import 'package:dagda/widgets/buttons/filled_button.dart';
import 'package:dagda/widgets/buttons/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

passwordResetDialog(BuildContext context) {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  Dialog alert = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: SingleChildScrollView(
      child: SizedBox(
        height: 360,
        width: 400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20.0),
            Text(AppLocalizations.of(context).appName,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 30.0),
            Text(
              AppLocalizations.of(context).forgotPassword,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                AppLocalizations.of(context).enterYourEmailForPasswordReset,
                style: const TextStyle(color: Colors.black, fontSize: 14),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  width: 350,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    decoration: InputDecoration(
                      errorMaxLines: 3,
                      errorBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      border: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 1.5),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      labelText: AppLocalizations.of(context).email,
                      labelStyle: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) => checkMail(value.toString(), context),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DagdaOutlinedButton(
                      title: AppLocalizations.of(context).cancel,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(width: 10.0),
                  DagdaButton(
                      title: AppLocalizations.of(context).send,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          senPasswordResetEmail(emailController.text, context);
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
