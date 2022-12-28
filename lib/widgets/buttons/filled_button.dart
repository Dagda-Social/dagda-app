import 'package:flutter/material.dart';

class DagdaButton extends StatelessWidget {
  const DagdaButton(
      {super.key,
      this.color = Colors.black,
      this.textColor = Colors.white,
      required this.title,
      required this.onPressed,
      this.fontSize = 14,
      this.fontWeight = FontWeight.bold,
      this.borderRadius = 10});

  final Color color;
  final Color textColor;
  final String title;
  final Function onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 100,
      height: 50,
      onPressed: onPressed as void Function()?,
      color: color,
      textColor: textColor,
      child: Text(
        title,
        style: TextStyle(
            color: textColor, fontSize: fontSize, fontWeight: fontWeight),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }
}
