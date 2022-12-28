import 'package:flutter/material.dart';

class DagdaTextField extends StatelessWidget {
  const DagdaTextField(
      {Key? key,
      required this.controller,
      required this.content,
      required this.validator})
      : super(key: key);

  final String content;

  final TextEditingController controller;

  final Function validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
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
        labelText: content,
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
      validator: (value) => validator(value.toString()),
    );
  }
}
