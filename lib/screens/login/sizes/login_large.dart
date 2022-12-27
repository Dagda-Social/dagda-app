import 'package:dagda/screens/login/logic/login.dart';
import 'package:dagda/widgets/dialogs/password_reset_dialog.dart';
import 'package:dagda/screens/register/logic/form.dart';
import 'package:dagda/widgets/buttons/outlined_button.dart';
import 'package:dagda/widgets/dialogs/dialogs.dart';
import 'package:dagda/widgets/textfield/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class LoginLarge extends StatefulWidget {
  const LoginLarge({Key? key}) : super(key: key);

  @override
  State<LoginLarge> createState() => _LoginLargeState();
}

class _LoginLargeState extends State<LoginLarge> {
  final _formKey = GlobalKey<FormState>();
  // Controladores del TextField
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  // Mostrar / Ocultar contraseña
  bool _isObscure = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
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
                          content: AppLocalizations.of(context).email,
                          controller: _emailController,
                          validator: (value) =>
                              checkMail(value.toString(), context),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                      child: SizedBox(
                        width: 350,
                        child: Center(
                          child: TextFormField(
                            obscureText: _isObscure,
                            textInputAction: TextInputAction.next,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            onFieldSubmitted: (value) {
                              FocusScope.of(context).nextFocus();
                            },
                            keyboardType: TextInputType.visiblePassword,
                            autocorrect: false,
                            controller: _passController,
                            maxLines: 1,
                            decoration: InputDecoration(
                                errorMaxLines: 3,
                                errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.red, width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 1.5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                labelText:
                                    AppLocalizations.of(context).password,
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      _isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: Colors.black,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    })),
                            validator: (value) =>
                                checkPasswordWithSpecialCharacters(
                                    value.toString(), context),
                          ),
                        ),
                      ),
                    ),
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
                  title: AppLocalizations.of(context).login,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      login(
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
                  TextButton(
                    onPressed: () {
                      passwordResetDialog(context);
                    },
                    child: Text(
                      AppLocalizations.of(context).forgotPassword,
                      style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 12),
                    ),
                  ),
                  Text(AppLocalizations.of(context).dontHaveAccount,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  TextButton(
                      onPressed: () => context.go('/register'),
                      child: Text(AppLocalizations.of(context).register,
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
