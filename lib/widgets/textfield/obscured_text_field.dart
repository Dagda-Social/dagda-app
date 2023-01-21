import 'package:flutter/material.dart';

class DagdaObscuredTextField extends StatefulWidget {
  const DagdaObscuredTextField(
      {Key? key,
      required this.controller,
      required this.content,
      required this.validator})
      : super(key: key);

  final String content;
  final TextEditingController controller;
  final Function validator;

  @override
  State<DagdaObscuredTextField> createState() => _DagdaObscuredTextFieldState();
}

class _DagdaObscuredTextFieldState extends State<DagdaObscuredTextField> {
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.visiblePassword,
      obscureText: isObscure,
      maxLines: 1,
      decoration: InputDecoration(
          errorMaxLines: 3,
          errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.5),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          labelText: widget.content,
          labelStyle: const TextStyle(
            color: Colors.black,
          ),
          suffixIcon: IconButton(
              icon: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              })),
      validator: (value) => widget.validator(value.toString()),
    );
  }
}
