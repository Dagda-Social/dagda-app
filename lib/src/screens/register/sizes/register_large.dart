import 'package:dagda/src/screens/register/logic/form.dart';
import 'package:dagda/src/screens/register/logic/register.dart';
import 'package:dagda/widgets/buttons/outlined_button.dart';
import 'package:dagda/widgets/textfield/obscured_text_field.dart';
import 'package:dagda/widgets/textfield/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class RegisterLarge extends StatefulWidget {
  const RegisterLarge({Key? key}) : super(key: key);

  @override
  State<RegisterLarge> createState() => _RegisterLargeState();
}

class _RegisterLargeState extends State<RegisterLarge> {
  final _formKey = GlobalKey<FormState>();
  // Controladores del TextField
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _pass2Controller = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _pass2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(AppLocalizations.of(context).appName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 72)),
                const SizedBox(
                  height: 50,
                ),
                Text(AppLocalizations.of(context).buildingNextGeneration,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
              ],
            ),
            const SizedBox(
              width: 200,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment
                      .center, //Center Column contents vertically,
                  crossAxisAlignment: CrossAxisAlignment
                      .center, //Center Column contents horizontally,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 6.0),
                      child: SizedBox(
                        width: 350,
                        child: Center(
                          child: DagdaTextField(
                            controller: _emailController,
                            content: AppLocalizations.of(context).email,
                            validator: (value) =>
                                checkMail(value.toString(), context),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                      child: SizedBox(
                        width: 350,
                        child: Center(
                          child: DagdaObscuredTextField(
                            content: AppLocalizations.of(context).password,
                            controller: _passController,
                            validator: (value) =>
                                checkPasswordWithSpecialCharacters(
                                    value.toString(), context),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                            width: 350,
                            child: Center(
                              child: DagdaObscuredTextField(
                                content: AppLocalizations.of(context)
                                    .confirmPassword,
                                controller: _pass2Controller,
                                validator: (value) => checkSamePassword(
                                    value.toString(),
                                    _passController.text,
                                    context),
                              ),
                            ))),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 350,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).byRegisteringYouAgreeTo,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    TextButton(
                        onPressed: () => context.go('/terms-of-service'),
                        child: Text(AppLocalizations.of(context).terms,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))),
                    Text(AppLocalizations.of(context).and,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    TextButton(
                        onPressed: () => context.go('/privacy-policy'),
                        child: Text(AppLocalizations.of(context).privacyPolicy,
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 12))),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DagdaOutlinedButton(
                  title: AppLocalizations.of(context).register,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      register(
                          _emailController.text, _passController.text, context);
                    }
                  }),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Text(AppLocalizations.of(context).alreadyHaveAnAccount,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  TextButton(
                      onPressed: () => context.go('/login'),
                      child: Text(AppLocalizations.of(context).login,
                          style: const TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 12)))
                ],
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
