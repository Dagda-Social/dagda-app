import 'package:flutter/material.dart';

class DagdaFollowCheck extends StatelessWidget {
  // Wether the user is following the user or not
  final Widget? title;
  // The value of the check
  final bool? value;
  // The function to call when the value changes
  final ValueChanged<bool?>? onChanged;

  const DagdaFollowCheck({Key? key, this.title, this.value, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 12.0, right: 12.0, top: 6.0, bottom: 6.0),
      child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20), bottom: Radius.circular(20)),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: Offset(0, 0),
                )
              ]),
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Expanded(child: title!),
              const Spacer(),
              Transform.scale(
                scale: 1.2,
                child: Checkbox(
                  value: value ?? false,
                  onChanged: (value) => onChanged!(value),
                  activeColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(2))),
                ),
              ),
            ],
          )),
    );
  }
}
