import 'package:dagda/screens/register/logic/form.dart';
import 'package:dagda/screens/register/logic/register.dart';
import 'package:dagda/widgets/buttons/outlined_button.dart';
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
  // Mostrar / Ocultar contraseña
  bool _isObscure = true;
  bool _isObscure2 = true;

  double _mailHeight = 50.0;
  double _passHeight = 50.0;
  double _pass2Height = 50.0;

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
                        height: _mailHeight,
                        width: 350,
                        child: Center(
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              errorMaxLines: 3,
                              errorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1.5),
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
                              labelText: AppLocalizations.of(context).email,
                              labelStyle: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            validator: (value) {
                              String? _value = checkMail(value.toString());
                              if (value == null) {
                                setState(() {
                                  _mailHeight = 50.0;
                                });
                              } else {
                                setState(() {
                                  _mailHeight = 70.0;
                                });
                              }
                              return _value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, bottom: 6.0),
                      child: SizedBox(
                        height: _passHeight,
                        width: 350,
                        child: Center(
                          child: TextFormField(
                            obscureText: _isObscure,
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _passController,
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
                            validator: (value) {
                              String? _value =
                                  checkPasswordWithSpecialCharacters(
                                      value.toString());
                              if (_value == null) {
                                setState(() {
                                  _passHeight = 50.0;
                                });
                              } else {
                                setState(() {
                                  _passHeight = 80.0;
                                });
                              }
                              return _value;
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: SizedBox(
                            height: _pass2Height,
                            width: 350,
                            child: Center(
                              child: TextFormField(
                                obscureText: _isObscure2,
                                enableSuggestions: false,
                                autocorrect: false,
                                controller: _pass2Controller,
                                decoration: InputDecoration(
                                    errorMaxLines: 3,
                                    errorBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.red, width: 1.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    border: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.black, width: 1.5),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    labelText: AppLocalizations.of(context)
                                        .confirmPassword,
                                    labelStyle: const TextStyle(
                                      color: Colors.black,
                                    ),
                                    suffixIcon: IconButton(
                                        icon: Icon(
                                          _isObscure2
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure2 = !_isObscure2;
                                          });
                                        })),
                                validator: (value) {
                                  String? _value = checkSamePassword(
                                      value.toString(), _passController.text);
                                  if (_value == null) {
                                    setState(() {
                                      _pass2Height = 50.0;
                                    });
                                  } else {
                                    setState(() {
                                      _pass2Height = 80.0;
                                    });
                                  }
                                  return _value;
                                },
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
                  colour: Colors.black,
                  title: AppLocalizations.of(context).register,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      register(
                        _emailController.text,
                        _passController.text,
                      );
                    }
                  },
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  borderRadius: 10,
                  borderWidth: 2),
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
