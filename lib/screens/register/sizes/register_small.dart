import 'package:dagda/screens/register/logic/form.dart';
import 'package:dagda/screens/register/logic/register.dart';
import 'package:dagda/widgets/buttons/outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class RegisterSmall extends StatefulWidget {
  const RegisterSmall({Key? key}) : super(key: key);

  @override
  State<RegisterSmall> createState() => _RegisterSmallState();
}

class _RegisterSmallState extends State<RegisterSmall> {
  final _formKey = GlobalKey<FormState>();
  // Controladores del TextField
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _pass2Controller = TextEditingController();
  // Mostrar / Ocultar contraseña
  bool _isObscure = true;
  bool _isObscure2 = true;

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
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(AppLocalizations.of(context).appName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 72)),
                const SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment
                        .center, //Center Column contents vertically,
                    crossAxisAlignment: CrossAxisAlignment
                        .center, //Center Column contents horizontally,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          width: 350,
                          child: Center(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: _emailController,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
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
                                labelText: AppLocalizations.of(context).email,
                                labelStyle: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              validator: (value) =>
                                  checkMail(value.toString(), context),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SizedBox(
                          width: 350,
                          child: Center(
                            child: TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              obscureText: _isObscure,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.visiblePassword,
                              autocorrect: false,
                              controller: _passController,
                              maxLines: 1,
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
                      Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: SizedBox(
                              width: 350,
                              child: Center(
                                child: TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  obscureText: _isObscure2,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.visiblePassword,
                                  autocorrect: false,
                                  controller: _pass2Controller,
                                  maxLines: 1,
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
                                  validator: (value) => checkSamePassword(
                                      value.toString(),
                                      _passController.text,
                                      context),
                                ),
                              ))),
                    ],
                  ),
                ),
                SizedBox(
                  width: 350,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Text(
                            AppLocalizations.of(context)
                                .byRegisteringYouAgreeTo,
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
                            child: Text(
                                AppLocalizations.of(context).privacyPolicy,
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12))),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                DagdaOutlinedButton(
                    title: AppLocalizations.of(context).register,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        register(_emailController.text, _passController.text,
                            context);
                      }
                    }),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: <Widget>[
                          Text(
                              AppLocalizations.of(context).alreadyHaveAnAccount,
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
                    )),
              ]),
        ),
      ),
    );
  }
}
