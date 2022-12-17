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
  final correoController = TextEditingController();
  final passController = TextEditingController();
  final pass2Controller = TextEditingController();
  // Mostrar / Ocultar contraseña
  bool _isObscure = true;
  bool _isObscure2 = true;

  @override
  void dispose() {
    correoController.dispose();
    passController.dispose();
    pass2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
      title: AppLocalizations.of(context).register + ' -  large',
      color: Colors.black,
      child: Scaffold(
        backgroundColor: Colors.white,
        body:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context).appName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 72)),
            ],
          ),
          const SizedBox(
            width: 200,
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Form(
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, //Center Column contents vertically,
                crossAxisAlignment: CrossAxisAlignment
                    .center, //Center Column contents horizontally,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6.0),
                    child: SizedBox(
                      height: 50,
                      width: 350,
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration(
                            errorBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.red, width: 1.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            border: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: AppLocalizations.of(context).email,
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0, bottom: 6.0),
                    child: SizedBox(
                      height: 50,
                      width: 350,
                      child: Center(
                        child: TextFormField(
                          obscureText: _isObscure,
                          enableSuggestions: false,
                          autocorrect: false,
                          controller: passController,
                          decoration: InputDecoration(
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
                              labelText: AppLocalizations.of(context).password,
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
                        ),
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: SizedBox(
                          height: 50,
                          width: 350,
                          child: Center(
                            child: TextFormField(
                              obscureText: _isObscure2,
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: pass2Controller,
                              decoration: InputDecoration(
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
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: <Widget>[
                  Text(AppLocalizations.of(context).byRegisteringYouAgreeTo,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 12)),
                  TextButton(
                      onPressed: () => context.go('/terms'),
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
                onPressed: () => context.go('/'),
                fontSize: 14,
                fontWeight: FontWeight.bold,
                borderRadius: 10,
                borderWidth: 2),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
    );
  }
}
