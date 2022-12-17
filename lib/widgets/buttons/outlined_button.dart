import 'package:flutter/material.dart';

class DagdaOutlinedButton extends StatelessWidget {
  const DagdaOutlinedButton(
      {super.key,
      required this.colour,
      required this.title,
      required this.onPressed,
      required this.fontSize,
      required this.fontWeight,
      required this.borderRadius,
      required this.borderWidth});

  final Color colour;
  final String title;
  final Function onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed as void Function()?,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: colour, width: borderWidth),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: Text(
          title,
          style: TextStyle(
              color: colour, fontSize: fontSize, fontWeight: fontWeight),
        ),
      ),
    );
  }
}
